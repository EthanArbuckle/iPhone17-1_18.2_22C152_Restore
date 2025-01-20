@interface TUIPreferencesController
+ (id)sharedPreferencesController;
- (id)suggestedDictationModesForKeyboardLanguages:(id)a3;
@end

@implementation TUIPreferencesController

- (id)suggestedDictationModesForKeyboardLanguages:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v60 = [MEMORY[0x1E4F1CA70] orderedSet];
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [MEMORY[0x1E4F1CA80] set];
  v7 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  v55 = [v7 updateEnabledDictationLanguages:0];

  v8 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v3;
  v59 = v8;
  id v62 = (id)[obj countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v62)
  {
    uint64_t v58 = *(void *)v78;
    do
    {
      for (i = 0; i != v62; i = (char *)i + 1)
      {
        if (*(void *)v78 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v77 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v11 = [v8 defaultDictationLanguagesForKeyboardLanguage:v10];
        }
        else
        {
          v11 = 0;
        }
        if ([v11 count])
        {
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v73 objects:v89 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v74;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v74 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v4 setObject:v10 forKey:*(void *)(*((void *)&v73 + 1) + 8 * j)];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v73 objects:v89 count:16];
            }
            while (v14);
          }

          [v60 addObjectsFromArray:v12];
        }
        else
        {
          [v60 addObject:v10];
        }
        if ([v11 count])
        {
          id v17 = v11;
        }
        else
        {
          uint64_t v88 = v10;
          id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
        }
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v87 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v70;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v70 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = MEMORY[0x192FA0730](*(void *)(*((void *)&v69 + 1) + 8 * k));
              if ([v5 containsObject:v23]) {
                v24 = v6;
              }
              else {
                v24 = v5;
              }
              [v24 addObject:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v69 objects:v87 count:16];
          }
          while (v20);
        }

        v8 = v59;
      }
      id v62 = (id)[obj countByEnumeratingWithState:&v77 objects:v90 count:16];
    }
    while (v62);
  }

  [v60 array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v63 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v63 countByEnumeratingWithState:&v65 objects:v86 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v66;
    uint64_t v53 = *(void *)v66;
    do
    {
      uint64_t v28 = 0;
      uint64_t v54 = v26;
      do
      {
        if (*(void *)v66 != v27) {
          objc_enumerationMutation(v63);
        }
        v29 = *(void **)(*((void *)&v65 + 1) + 8 * v28);
        uint64_t v82 = 0;
        v83 = &v82;
        uint64_t v84 = 0x2050000000;
        v30 = (void *)getAFDictationConnectionClass_softClass;
        uint64_t v85 = getAFDictationConnectionClass_softClass;
        if (!getAFDictationConnectionClass_softClass)
        {
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __getAFDictationConnectionClass_block_invoke;
          v81[3] = &unk_1E5593F18;
          v81[4] = &v82;
          __getAFDictationConnectionClass_block_invoke((uint64_t)v81);
          v30 = (void *)v83[3];
        }
        id v31 = v30;
        _Block_object_dispose(&v82, 8);
        id v64 = 0;
        int v32 = [v31 dictationIsSupportedForLanguageCode:v29 error:&v64];
        id v33 = v64;
        if (v32)
        {
          v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v35 = [v34 localizedStringForKey:v29 value:&stru_1EDC653C0 table:@"Dictation"];

          if ([v35 length])
          {
            uint64_t v36 = [v4 objectForKey:v29];
            v37 = (void *)v36;
            if (!v36) {
              uint64_t v36 = (uint64_t)v29;
            }
            v38 = MEMORY[0x192FA0730](v36);
            int v39 = [v6 containsObject:v38];

            if (v39)
            {
              v40 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v29];
              v41 = [v40 countryCode];

              v61 = v41;
              if ([v41 length])
              {
                v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                v43 = [v29 stringByAppendingString:@"_long"];
                v52 = [v42 localizedStringForKey:v43 value:&stru_1EDC653C0 table:@"Dictation"];

                v44 = NSString;
                v45 = [MEMORY[0x1E4F1CA20] currentLocale];
                v46 = [v45 localizedStringForCountryCode:v61];
                uint64_t v51 = objc_msgSend(v44, "localizedStringWithFormat:", v52, v46);

                v35 = (void *)v51;
              }
              uint64_t v27 = v53;
              uint64_t v26 = v54;
            }
            else
            {
              uint64_t v27 = v53;
              uint64_t v26 = v54;
            }
          }
          if (![v35 length] || objc_msgSend(v35, "hasPrefix:", v29))
          {
            uint64_t v47 = TUIKeyboardDisplayNameFromIdentifierForContext(v29, 3);

            v35 = (void *)v47;
          }
          v48 = objc_alloc_init(TUISuggestedInputMode);
          [(TUISuggestedInputMode *)v48 setDisplayName:v35];
          [(TUISuggestedInputMode *)v48 setIdentifier:v29];
          v49 = [v55 objectForKey:v29];
          -[TUISuggestedInputMode setEnabled:](v48, "setEnabled:", [v49 BOOLValue]);

          [v56 addObject:v48];
        }

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v63 countByEnumeratingWithState:&v65 objects:v86 count:16];
    }
    while (v26);
  }

  return v56;
}

+ (id)sharedPreferencesController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TUIPreferencesController_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_token != -1) {
    dispatch_once(&sharedPreferencesController_token, block);
  }
  v2 = (void *)sharedPreferencesController_sharedPreferencesController;
  return v2;
}

uint64_t __55__TUIPreferencesController_sharedPreferencesController__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedPreferencesController_sharedPreferencesController;
  sharedPreferencesController_sharedPreferencesController = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end