# ProGuard / R8 Configuration for OpenBridge

# Preserve required attributes for Kotlin, Coroutines, and Serialization reflection/metadata
-keepattributes *Annotation*,InnerClasses,Signature,EnclosingMethod

# Kotlinx Serialization: preserve @Serializable models and companion serializers
-keepclassmembers class * {
    @kotlinx.serialization.SerialName <fields>;
}
-keepclassmembers class * {
    *** Companion;
}
-keepclassmembers class * implements kotlinx.serialization.KSerializer {
    static ** INSTANCE;
}
-keepclassmembers class * {
    kotlinx.serialization.KSerializer serializer(...);
}

# Explicit preservation for project data models
-keep,allowobfuscation class com.openbridge.x.data.RecentFile {
    <fields>;
    <init>(...);
}
-keep,allowobfuscation class com.openbridge.x.data.RecentFile$$serializer {
    <fields>;
    <methods>;
}

# Android BroadcastReceivers instantiated dynamically by the system
-keep class com.openbridge.x.widget.FolderWidgetProvider {
    public <init>();
    public void onUpdate(android.content.Context, android.appwidget.AppWidgetManager, int[]);
    public void onReceive(android.content.Context, android.content.Intent);
}

-keep class com.openbridge.x.routing.ChooserResultReceiver {
    public <init>();
    public void onReceive(android.content.Context, android.content.Intent);
}
