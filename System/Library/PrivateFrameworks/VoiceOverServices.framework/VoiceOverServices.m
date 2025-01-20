void sub_21C404570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C40484C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C405128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21C406298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C4064F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id VOSVoiceOverBundle()
{
  v0 = (void *)VOSVoiceOverBundle__votBundle;
  if (!VOSVoiceOverBundle__votBundle)
  {
    v1 = [&stru_26CC86DC0 stringByAppendingString:@"/System/Library/CoreServices/VoiceOverTouch.app"];
    uint64_t v2 = [MEMORY[0x263F086E0] bundleWithPath:v1];
    v3 = (void *)VOSVoiceOverBundle__votBundle;
    VOSVoiceOverBundle__votBundle = v2;

    v0 = (void *)VOSVoiceOverBundle__votBundle;
  }

  return v0;
}

id _AXUISettingsAccessibilityBundle()
{
  v0 = (void *)MEMORY[0x263F086E0];
  v1 = AXSystemRootDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"/System/Library/PreferenceBundles/AccessibilitySettings.bundle"];
  v3 = [v0 bundleWithPath:v2];

  return v3;
}

id AXVoiceOverSettingsTypingFeedbackLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _AXUISettingsAccessibilityBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"VoiceOverTypingFeedback"];

  return v3;
}

id AXSettingsLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _AXUISettingsAccessibilityBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Accessibility"];

  return v3;
}

id AXVoiceOverSettingsLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _AXUISettingsAccessibilityBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"VoiceOverSettings"];

  return v3;
}

id AXVoiceOverBrailleOptionsLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _AXUISettingsAccessibilityBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"VoiceOverBrailleOptions"];

  return v3;
}

id AXVoiceOverLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = VOSVoiceOverBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"VOTLocalizedStrings"];

  return v3;
}

uint64_t VOSProcessAllowsScreenRecognition(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (VOSProcessAllowsScreenRecognition_onceToken != -1)
  {
    dispatch_once(&VOSProcessAllowsScreenRecognition_onceToken, &__block_literal_global_4);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  if (!v1) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = [(id)VOSProcessAllowsScreenRecognition_UnsupportedApps containsObject:v2] ^ 1;
LABEL_6:

  return v3;
}

void __VOSProcessAllowsScreenRecognition_block_invoke()
{
  v6[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F227C8];
  v6[0] = *MEMORY[0x263F227D8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x263F22648];
  v6[2] = *MEMORY[0x263F227D0];
  v6[3] = v2;
  v6[4] = *MEMORY[0x263F22758];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)VOSProcessAllowsScreenRecognition_UnsupportedApps;
  VOSProcessAllowsScreenRecognition_UnsupportedApps = v4;
}

id VOSVoiceOverServicesBundle()
{
  if (VOSVoiceOverServicesBundle_onceToken != -1) {
    dispatch_once(&VOSVoiceOverServicesBundle_onceToken, &__block_literal_global_293);
  }
  v0 = (void *)VOSVoiceOverServicesBundle__Bundle;

  return v0;
}

uint64_t __VOSVoiceOverServicesBundle_block_invoke()
{
  VOSVoiceOverServicesBundle__Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

uint64_t VOSCustomBrailleEnabled()
{
  return _os_feature_enabled_impl();
}

id VOSBrailleTableForRotorItem(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F228D0];
  id v2 = a1;
  uint64_t v3 = [v1 sharedInstance];
  uint64_t v4 = [v3 userLocale];

  v5 = [v2 objectForKeyedSubscript:@"Default"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [v2 objectForKeyedSubscript:@"LanguageDefaults"];

    v8 = [v4 localeIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    id v2 = v7;
  }
  else
  {
    uint64_t v9 = [v2 objectForKeyedSubscript:@"RotorItem"];
  }

  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F2BAB8] defaultTableForLocale:v4];
  }
  v11 = (void *)v10;

  return v11;
}

id VOSDefaultBrailleTable()
{
  v0 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v1 = [v0 voiceOverBrailleLanguageRotorItems];

  if ([v1 count])
  {
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = [v1 objectAtIndex:v2];
      uint64_t v4 = [v3 objectForKeyedSubscript:@"Default"];
      int v5 = [v4 BOOLValue];

      if (v5) {
        break;
      }

      if (++v2 >= (unint64_t)[v1 count]) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = VOSBrailleTableForRotorItem(v3);
  }
  else
  {
LABEL_5:
    int v6 = [MEMORY[0x263F228D0] sharedInstance];
    uint64_t v3 = [v6 userLocale];

    uint64_t v7 = [MEMORY[0x263F2BAB8] defaultTableForLocale:v3];
  }
  v8 = (void *)v7;

  return v8;
}

void VOSRepairBrailleTableSettings()
{
  v0 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v1 = [v0 voiceOverTouchBrailleDisplayOutputTableIdentifier];
  char v2 = [v1 hasPrefix:@"com."];

  if ((v2 & 1) == 0)
  {
    uint64_t v3 = VOSDefaultBrailleTable();
    uint64_t v4 = [v3 identifier];
    int v5 = [MEMORY[0x263F22938] sharedInstance];
    [v5 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v4];
  }
  int v6 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v7 = [v6 voiceOverTouchBrailleDisplayInputTableIdentifier];
  char v8 = [v7 hasPrefix:@"com."];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = VOSDefaultBrailleTable();
    uint64_t v10 = [v9 identifier];
    v11 = [MEMORY[0x263F22938] sharedInstance];
    [v11 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v10];
  }
  v12 = [MEMORY[0x263F22938] sharedInstance];
  v13 = [v12 voiceOverTouchBrailleGesturesInputTableIdentifier];
  char v14 = [v13 hasPrefix:@"com."];

  if ((v14 & 1) == 0)
  {
    VOSFirstGesturesCompatibleBrailleTable();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v15 = [v17 identifier];
    v16 = [MEMORY[0x263F22938] sharedInstance];
    [v16 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v15];
  }
}

id VOSFirstGesturesCompatibleBrailleTable()
{
  v0 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v1 = [v0 voiceOverBrailleLanguageRotorItems];

  char v2 = objc_msgSend(v1, "ax_filteredArrayUsingBlock:", &__block_literal_global_315);

  if ([v2 count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = [v2 objectAtIndex:v3];
      int v5 = VOSBrailleTableForRotorItem(v4);

      if (!_os_feature_enabled_impl() || AXDeviceIsPad()) {
        break;
      }
      int v6 = [v5 supportsTranslationMode8Dot];

      if (!v6) {
        goto LABEL_9;
      }
      if (++v3 >= (unint64_t)[v2 count]) {
        goto LABEL_7;
      }
    }

LABEL_9:
    char v8 = [v2 objectAtIndex:v3];
    uint64_t v7 = VOSBrailleTableForRotorItem(v8);
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }

  return v7;
}

BOOL __VOSFirstGesturesCompatibleBrailleTable_block_invoke(uint64_t a1, void *a2)
{
  char v2 = VOSBrailleTableForRotorItem(a2);
  uint64_t v3 = [v2 replacements];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

id _VOSCrystalReplacementForTableIdentifier(void *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (v3)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:v3];
    int v5 = [v4 replacements];
    if ([v5 count])
    {
      if ((unint64_t)(a2 - 1) > 2) {
        int v6 = (void *)MEMORY[0x263EFFA68];
      }
      else {
        int v6 = *(&off_2643FD860 + a2 - 1);
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v5;
      uint64_t v19 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v19)
      {
        uint64_t v10 = *(void *)v25;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v9);
            }
            v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            uint64_t v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16, v18);
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v21;
              while (2)
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v21 != v15) {
                    objc_enumerationMutation(v6);
                  }
                  if ([v12 hasSuffix:*(void *)(*((void *)&v20 + 1) + 8 * j)])
                  {
                    id v7 = v12;

                    goto LABEL_26;
                  }
                }
                uint64_t v14 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }
            uint64_t v10 = v18;
          }
          uint64_t v19 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v19);
      }

      id v8 = [v9 firstObject];
    }
    else
    {
      id v8 = v3;
    }
    id v7 = v8;
LABEL_26:
  }
  else
  {
    BOOL v4 = VOSDefaultBrailleTable();
    id v7 = [v4 identifier];
  }

  return v7;
}

uint64_t _VOSHasReplaceableTableInRotorItems()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v1 = [v0 voiceOverBrailleLanguageRotorItems];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = VOSBrailleTableForRotorItem(*(void **)(*((void *)&v10 + 1) + 8 * i));
        id v7 = objc_msgSend(v6, "replacements", (void)v10);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

void VOSCrystalMigrateBrailleTableReplacements()
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v1 = [v0 objectForKey:@"_AccessibilityMigration__BrailleTableReplacements_18"];
    int v2 = [v1 BOOLValue];

    int v3 = _VOSHasReplaceableTableInRotorItems();
    if (!v2 || v3 != 0)
    {
      int v5 = [MEMORY[0x263F22938] sharedInstance];
      uint64_t v6 = [v5 voiceOverBrailleTableIdentifier];

      if (!v6)
      {
        id v7 = VOSDefaultBrailleTable();
        uint64_t v6 = [v7 identifier];
      }
      uint64_t v8 = objc_msgSend(MEMORY[0x263F228D0], "sharedInstance", v6);
      id v9 = [v8 userLocale];

      long long v10 = [MEMORY[0x263F22938] sharedInstance];
      long long v11 = [v10 voiceOverBrailleLanguageRotorItems];

      long long v12 = objc_opt_new();
      long long v13 = objc_opt_new();
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      obuint64_t j = v11;
      uint64_t v81 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
      if (v81)
      {
        uint64_t v80 = *(void *)v89;
        v76 = v9;
        do
        {
          for (uint64_t i = 0; i != v81; ++i)
          {
            if (*(void *)v89 != v80) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            v16 = [v15 objectForKeyedSubscript:@"Default"];
            int v17 = [v16 BOOLValue];

            if (v17)
            {
              uint64_t v18 = [v15 objectForKeyedSubscript:@"LanguageDefaults"];
              uint64_t v19 = [v9 localeIdentifier];
              uint64_t v20 = [v18 objectForKeyedSubscript:v19];

              v78 = (void *)v20;
              if (v20)
              {
                long long v21 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:v20];
              }
              else
              {
                long long v21 = [MEMORY[0x263F2BAB8] defaultTableForLocale:v9];
              }
              v33 = v21;
              uint64_t v83 = i;
              v34 = [v21 replacements];
              uint64_t v35 = [v34 count];

              if (v35)
              {
                v36 = [v33 replacements];
                v37 = [v36 firstObject];

                [v13 addObject:v37];
                v38 = (void *)[v15 mutableCopy];
                v39 = [v9 localeIdentifier];
                v99 = v39;
                v100 = v37;
                [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                v41 = v40 = v33;
                [v38 setObject:v41 forKeyedSubscript:@"LanguageDefaults"];

                [v12 addObject:v38];
                v42 = [v40 replacements];
                unint64_t v43 = [v42 count];

                if (v43 >= 2)
                {
                  unint64_t v44 = 1;
                  do
                  {
                    v45 = [v40 replacements];
                    v46 = [v45 objectAtIndex:v44];

                    if (([v13 containsObject:v46] & 1) == 0)
                    {
                      v97[0] = @"Enabled";
                      v97[1] = @"RotorItem";
                      v98[0] = MEMORY[0x263EFFA88];
                      v98[1] = v46;
                      v47 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
                      [v12 addObject:v47];

                      [v13 addObject:v46];
                    }

                    ++v44;
                    v48 = [v40 replacements];
                    unint64_t v49 = [v48 count];
                  }
                  while (v44 < v49);
                }

                uint64_t i = v83;
                id v9 = v76;
                long long v24 = v40;
LABEL_39:
              }
              else
              {
                v95[0] = @"Default";
                v95[1] = @"Enabled";
                v96[0] = MEMORY[0x263EFFA88];
                v96[1] = MEMORY[0x263EFFA88];
                v95[2] = @"LanguageDefaults";
                v52 = [v9 localeIdentifier];
                v93 = v52;
                [v33 identifier];
                v54 = v53 = v9;
                v94 = v54;
                v55 = v33;
                v56 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
                v96[2] = v56;
                v57 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:3];
                [v12 addObject:v57];

                long long v24 = v55;
                id v9 = v53;

                uint64_t i = v83;
                if (v24)
                {
                  v37 = [v24 identifier];
                  [v13 addObject:v37];
                  goto LABEL_39;
                }
              }

              goto LABEL_41;
            }
            id v22 = objc_alloc(MEMORY[0x263F2BAA8]);
            long long v23 = [v15 objectForKeyedSubscript:@"RotorItem"];
            long long v24 = (void *)[v22 initWithIdentifier:v23];

            long long v25 = [v24 replacements];
            uint64_t v26 = [v25 count];

            if (v26)
            {
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              uint64_t v18 = [v24 replacements];
              uint64_t v27 = [v18 countByEnumeratingWithState:&v84 objects:v92 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                v79 = v24;
                uint64_t v82 = i;
                uint64_t v29 = *(void *)v85;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v85 != v29) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v31 = *(void *)(*((void *)&v84 + 1) + 8 * j);
                    if (([v13 containsObject:v31] & 1) == 0)
                    {
                      v32 = (void *)[v15 mutableCopy];
                      [v32 setObject:v31 forKeyedSubscript:@"RotorItem"];
                      [v12 addObject:v32];
                      [v13 addObject:v31];
                    }
                  }
                  uint64_t v28 = [v18 countByEnumeratingWithState:&v84 objects:v92 count:16];
                }
                while (v28);
                id v9 = v76;
                uint64_t i = v82;
                long long v24 = v79;
              }
            }
            else
            {
              v50 = [v24 identifier];
              uint64_t v51 = [v13 containsObject:v50];

              if (v51) {
                goto LABEL_42;
              }
              [v12 addObject:v15];
              uint64_t v18 = [v24 identifier];
              [v13 addObject:v18];
            }
LABEL_41:

LABEL_42:
          }
          uint64_t v81 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
        }
        while (v81);
      }
      v58 = v9;

      v59 = [MEMORY[0x263F22938] sharedInstance];
      [v59 setVoiceOverBrailleLanguageRotorItems:v12];

      v60 = [MEMORY[0x263F22938] sharedInstance];
      v61 = v75;
      v62 = _VOSCrystalReplacementForTableIdentifier(v75, [v60 voiceOverTouchBrailleDisplayOutputMode]);

      v63 = [MEMORY[0x263F22938] sharedInstance];
      v64 = _VOSCrystalReplacementForTableIdentifier(v75, [v63 voiceOverTouchBrailleDisplayInputMode]);

      v65 = [MEMORY[0x263F22938] sharedInstance];
      v66 = _VOSCrystalReplacementForTableIdentifier(v75, [v65 voiceOverTouchBrailleGesturesInputMode]);

      v67 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:v66];
      v68 = [MEMORY[0x263F22938] sharedInstance];
      [v68 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v62];

      v69 = [MEMORY[0x263F22938] sharedInstance];
      [v69 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v64];

      v70 = [MEMORY[0x263F22938] sharedInstance];
      [v70 setVoiceOverTouchBrailleDisplaySyncInputOutputTables:0];

      if ([v67 supportsTranslationMode8Dot] && (AXDeviceIsPad() & 1) == 0)
      {
        v71 = VOSFirstGesturesCompatibleBrailleTable();
        v72 = [v71 identifier];
        v73 = [MEMORY[0x263F22938] sharedInstance];
        [v73 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v72];

        v61 = v75;
      }
      else
      {
        v71 = [MEMORY[0x263F22938] sharedInstance];
        [v71 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v66];
      }

      v74 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v74 setObject:MEMORY[0x263EFFA88] forKey:@"_AccessibilityMigration__BrailleTableReplacements_18"];
    }
  }
}

id VOSLocString(void *a1)
{
  id v1 = a1;
  int v2 = VOSVoiceOverServicesBundle();
  int v3 = [v2 localizedStringForKey:v1 value:0 table:@"VoiceOverServices"];

  return v3;
}

id soft_AXUILocalizedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v2 = (void (*)(id))getAXUILocalizedStringForKeySymbolLoc_ptr;
  long long v10 = getAXUILocalizedStringForKeySymbolLoc_ptr;
  if (!getAXUILocalizedStringForKeySymbolLoc_ptr)
  {
    int v3 = (void *)AccessibilityUIUtilitiesLibrary();
    v8[3] = (uint64_t)dlsym(v3, "AXUILocalizedStringForKey");
    getAXUILocalizedStringForKeySymbolLoc_ptr = (_UNKNOWN *)v8[3];
    int v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    uint64_t v6 = (_Unwind_Exception *)soft_AXUILocalizedStringForKey_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(v1);

  return v4;
}

void *__getAXUILocalizedStringForKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AccessibilityUIUtilitiesLibrary();
  result = dlsym(v2, "AXUILocalizedStringForKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUILocalizedStringForKeySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUIUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AccessibilityUIUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2643FD9E0;
    uint64_t v5 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUIUtilitiesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AccessibilityUIUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXLocalizedTimeSummarySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)AccessibilityUIUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXLocalizedTimeSummary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXLocalizedTimeSummarySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21C425148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUIAlertControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UIAlertController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIAlertControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIAlertControllerClass_block_invoke_cold_1();
    UIKitLibrary();
  }
}

void UIKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __UIKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2643FDB70;
    uint64_t v3 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

VOSOutputEventDispatcher *__getUIAlertActionClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  uint64_t result = (VOSOutputEventDispatcher *)objc_getClass("UIAlertAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIAlertActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getUIAlertActionClass_block_invoke_cold_1();
    return +[VOSOutputEventDispatcher sharedInstance];
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21C42AC88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id getUIAlertActionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUIAlertActionClass_softClass_0;
  uint64_t v7 = getUIAlertActionClass_softClass_0;
  if (!getUIAlertActionClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUIAlertActionClass_block_invoke_0;
    v3[3] = &unk_2643FD9C0;
    v3[4] = &v4;
    __getUIAlertActionClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_21C42AF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIDeviceClass_block_invoke(uint64_t a1)
{
  UIKitLibrary_0();
  Class result = objc_getClass("UIDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIDeviceClass_block_invoke_cold_1();
  }
  getUIDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void UIKitLibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __UIKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2643FDCD8;
    uint64_t v3 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __UIKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

VOSOutputEventCategory *__getUIAlertControllerClass_block_invoke_0(uint64_t a1)
{
  UIKitLibrary_0();
  uint64_t result = (VOSOutputEventCategory *)objc_getClass("UIAlertController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIAlertControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUIAlertControllerClass_block_invoke_cold_1();
    return __getUIAlertActionClass_block_invoke_0(v3);
  }
  return result;
}

VOSOutputEventCategory *__getUIAlertActionClass_block_invoke_0(uint64_t a1)
{
  UIKitLibrary_0();
  uint64_t result = (VOSOutputEventCategory *)objc_getClass("UIAlertAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIAlertActionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getUIAlertActionClass_block_invoke_cold_1();
    return +[VOSOutputEventCategory interaction];
  }
  return result;
}

uint64_t soft_AXUILocalizedStringForKey_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getUIAlertControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getUIAlertControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getUIAlertActionClass_block_invoke_cold_1(v0);
}

uint64_t __getUIAlertActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __38__VOSOutputEventDispatcher_sendEvent___block_invoke_cold_1(v0);
}

void __getUIDeviceClass_block_invoke_cold_1()
{
}

uint64_t AXAppNameForBundleId()
{
  return MEMORY[0x270F09EE8]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09F38]();
}

uint64_t AXDeviceHasForcePress3dTouch()
{
  return MEMORY[0x270F09FA0]();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x270F09FD0]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

uint64_t AXDeviceIsTV()
{
  return MEMORY[0x270F0A008]();
}

uint64_t AXDeviceIsWatch()
{
  return MEMORY[0x270F0A018]();
}

uint64_t AXDeviceSupportsBackTap()
{
  return MEMORY[0x270F0A028]();
}

uint64_t AXDeviceSupportsManyTouches()
{
  return MEMORY[0x270F0A070]();
}

uint64_t AXDeviceSupportsQuickNote()
{
  return MEMORY[0x270F0A088]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F0A158]();
}

uint64_t AXLogBrailleHW()
{
  return MEMORY[0x270F0A1C0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F0A230]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x270F0A238]();
}

uint64_t AXParameterizedLocalizedString()
{
  return MEMORY[0x270F0A240]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return MEMORY[0x270F0A2F8]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x270F0A328]();
}

uint64_t AXVoiceOverRotorLocString()
{
  return MEMORY[0x270F0A340]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x270F4AB98]();
}

uint64_t BTDeviceGetSupportedServices()
{
  return MEMORY[0x270F4ABE0]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t VOTLogBraille()
{
  return MEMORY[0x270F0A3D0]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x270F0A3D8]();
}

uint64_t _AXSVibrationDisabled()
{
  return MEMORY[0x270F90B50]();
}

uint64_t _AXSVoiceOverTouchCopyBrailleLanguageRotorItems()
{
  return MEMORY[0x270F90B68]();
}

uint64_t _AXSVoiceOverTouchCopyTactileGraphicsDisplay()
{
  return MEMORY[0x270F90B70]();
}

uint64_t _AXSVoiceOverTouchSetTactileGraphicsDisplay()
{
  return MEMORY[0x270F90B98]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F0A410]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}