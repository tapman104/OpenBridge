package com.openbridge.x

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.getValue
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.openbridge.x.data.PrefsManager
import com.openbridge.x.feature.settings.SettingsScreen
import com.openbridge.x.ui.OpenBridgeTheme
import com.openbridge.x.ui.ThemePreference

class SettingsActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        val prefs = PrefsManager(this)

        setContent {
            val themePref by prefs.themePreference.collectAsStateWithLifecycle(ThemePreference.SYSTEM_DEFAULT)
            
            OpenBridgeTheme(themePreference = themePref) {
                SettingsScreen(
                    prefsManager = prefs,
                    onBackClick = { finish() }
                )
            }
        }
    }
}
