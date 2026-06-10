package com.example.myapp;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        TextView textView = new TextView(this);
        textView.setText("🔥 X-FCOLS APK BUILDER 🔥\n\nAPK Build by @Emakloewe\nPowered by GitHub Actions");
        textView.setTextSize(18);
        textView.setPadding(50, 50, 50, 50);
        
        setContentView(textView);
    }
}
