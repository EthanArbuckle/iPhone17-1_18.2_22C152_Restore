id _MSS_valueForRequirementKey_specifier(void *a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;
  void *v14;
  uint64_t vars8;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = [v5 valueForMusicCapability:v6];
  if (!v8)
  {
    v10 = [v5 allSpecifiers];
    v11 = [v10 specifierForID:v6];

    if (!v11
      || (objc_msgSend(v11, "music_getValue"), v8 = objc_claimAutoreleasedReturnValue(), v11, !v8))
    {
      v12 = NSSelectorFromString(v6);
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (MusicSettingsPerformSelector2((uint64_t)v12, v5, v7, 0),
            (v8 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v13 = [MEMORY[0x263F08690] currentHandler];
        v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id _MSS_valueForRequirementKey_specifier(__strong id<MusicSettingsSupportController>, NSString *__strong, PSSpecifier *__strong)");
        [v13 handleFailureInFunction:v14, @"MusicSettingsSupportController.m", 291, @"No matching capability: %@", v6 file lineNumber description];

        v8 = 0;
      }
    }
  }

  return v8;
}

id _MSS_resolvedSpecifiers(void *a1)
{
  v95[9] = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = (void *)MEMORY[0x263EFF980];
  v3 = [v1 allSpecifiers];
  v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v5 = [v1 allSpecifiers];
  uint64_t v56 = [v5 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v56)
  {
    v48 = v78;
    uint64_t v55 = *(void *)v86;
    uint64_t v64 = *MEMORY[0x263F60210];
    uint64_t v51 = *MEMORY[0x263F602F8];
    uint64_t v52 = *MEMORY[0x263F602F0];
    v49 = v5;
    v50 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v86 != v55) {
          objc_enumerationMutation(v5);
        }
        uint64_t v57 = v6;
        v7 = *(void **)(*((void *)&v85 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "properties", v48);
        int hasMusicRequiredCapabilities_specifier = _MSS_hasMusicRequiredCapabilities_specifier(v1, v8, v7);

        if (hasMusicRequiredCapabilities_specifier)
        {
          v10 = objc_msgSend(v7, "music_copy");
          [v4 addObject:v10];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v95[0] = @"musicDynamicFooterText";
          v95[1] = @"musicDynamicIconImage";
          v95[2] = @"musicDynamicLabel";
          v95[3] = @"musicDynamicFooterHyperlinkViewText";
          v95[4] = @"musicDynamicFooterHyperlinkViewLinkAction";
          v95[5] = @"musicDynamicFooterHyperlinkViewLinkText";
          v95[6] = @"musicDynamicEnabled";
          v95[7] = @"musicFooterHyperlinkViewText";
          v95[8] = @"musicFooterHyperlinkViewLinkText";
          v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:9];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v81 objects:v93 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v82;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v82 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                v17 = [v10 objectForKeyedSubscript:v16];
                if (v17) {
                  _MSS_setValue_forSpecifier_key(v1, v17, v10, v16);
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v81 objects:v93 count:16];
            }
            while (v13);
          }

          v18 = [v10 propertyForKey:@"musicOverrides"];
          if (v18)
          {
            if (_NSIsNSDictionary())
            {
              v77[0] = MEMORY[0x263EF8330];
              v77[1] = 3221225472;
              v78[0] = ___MSS_resolvedSpecifiers_block_invoke;
              v78[1] = &unk_264CBF708;
              id v79 = v1;
              id v80 = v10;
              [v18 enumerateKeysAndObjectsUsingBlock:v77];

              v19 = v79;
              goto LABEL_44;
            }
            if (_NSIsNSArray())
            {
              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              obuint64_t j = v18;
              uint64_t v60 = [obj countByEnumeratingWithState:&v73 objects:v92 count:16];
              if (!v60) {
                goto LABEL_43;
              }
              v53 = v18;
              uint64_t v59 = *(void *)v74;
              while (1)
              {
                uint64_t v20 = 0;
                do
                {
                  if (*(void *)v74 != v59) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v62 = v20;
                  v21 = *(void **)(*((void *)&v73 + 1) + 8 * v20);
                  v22 = [v21 objectForKeyedSubscript:@"property"];
                  v23 = [v21 objectForKeyedSubscript:@"values"];
                  if (!v23)
                  {
                    v91 = v21;
                    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
                  }
                  long long v71 = 0u;
                  long long v72 = 0u;
                  long long v69 = 0u;
                  long long v70 = 0u;
                  id v24 = v23;
                  uint64_t v25 = [v24 countByEnumeratingWithState:&v69 objects:v90 count:16];
                  if (v25)
                  {
                    uint64_t v26 = v25;
                    uint64_t v27 = *(void *)v70;
                    do
                    {
                      for (uint64_t j = 0; j != v26; ++j)
                      {
                        if (*(void *)v70 != v27) {
                          objc_enumerationMutation(v24);
                        }
                        v29 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                        v30 = [v29 objectForKeyedSubscript:@"value"];
                        v31 = [v29 objectForKeyedSubscript:@"requirements"];
                        v32 = [v31 objectForKeyedSubscript:v64];
                        int v33 = _MSS_hasMusicRequiredCapabilities_specifier(v1, v31, v10);
                        if (!v32)
                        {
                          if (!v33) {
                            goto LABEL_38;
                          }
LABEL_37:
                          _MSS_setValue_forSpecifier_key(v1, v30, v10, v22);
                          goto LABEL_38;
                        }
                        if (v33 && (SystemHasCapabilities() & 1) != 0) {
                          goto LABEL_37;
                        }
LABEL_38:
                      }
                      uint64_t v26 = [v24 countByEnumeratingWithState:&v69 objects:v90 count:16];
                    }
                    while (v26);
                  }

                  uint64_t v20 = v62 + 1;
                }
                while (v62 + 1 != v60);
                uint64_t v60 = [obj countByEnumeratingWithState:&v73 objects:v92 count:16];
                if (!v60)
                {
                  v5 = v49;
                  v4 = v50;
                  v18 = v53;
LABEL_43:
                  v19 = obj;
LABEL_44:

                  break;
                }
              }
            }
            v34 = [v10 propertyForKey:v52];
            uint64_t v35 = [v10 propertyForKey:v51];
            v36 = (void *)v35;
            if (v34 && v35)
            {
              v61 = (void *)v35;
              v54 = v18;
              v37 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v34, "count"));
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              long long v68 = 0u;
              v63 = v34;
              id v38 = v34;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v65 objects:v89 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v66;
                do
                {
                  for (uint64_t k = 0; k != v40; ++k)
                  {
                    if (*(void *)v66 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    uint64_t v43 = *(void *)(*((void *)&v65 + 1) + 8 * k);
                    v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    v45 = [v1 stringsTable];
                    v46 = [v44 localizedStringForKey:v43 value:&stru_26E9F45B8 table:v45];
                    [v37 addObject:v46];
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v65 objects:v89 count:16];
                }
                while (v40);
              }

              v36 = v61;
              [v10 setValues:v61 titles:v37];

              v5 = v49;
              v4 = v50;
              v18 = v54;
              v34 = v63;
            }
          }
        }
        uint64_t v6 = v57 + 1;
      }
      while (v57 + 1 != v56);
      uint64_t v56 = [v5 countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v56);
  }

  return v4;
}

void sub_236CCA014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MSS_setValue_forSpecifier_key(void *a1, void *a2, void *a3, void *a4)
{
  id v43 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:*MEMORY[0x263F602D0]])
  {
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v43 stringsTable];
    uint64_t v12 = [(__CFString *)v10 localizedStringForKey:v7 value:&stru_26E9F45B8 table:v11];
    [v8 setName:v12];
    goto LABEL_3;
  }
  uint64_t v13 = *MEMORY[0x263F600F8];
  if ([v9 isEqualToString:*MEMORY[0x263F600F8]])
  {
    uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v43 stringsTable];
    v10 = [v14 localizedStringForKey:v7 value:&stru_26E9F45B8 table:v15];

    v16 = v10;
LABEL_12:
    if (![(__CFString *)v16 length])
    {

      v10 = @" ";
    }
    uint64_t v20 = v8;
    v21 = v10;
    uint64_t v22 = v13;
    goto LABEL_15;
  }
  uint64_t v17 = *MEMORY[0x263F600A8];
  if ([v9 isEqualToString:*MEMORY[0x263F600A8]])
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "BOOLValue"));
    [v8 setObject:v18 forKeyedSubscript:v17];
LABEL_9:

    goto LABEL_17;
  }
  if ([v9 isEqualToString:@"musicDynamicFooterText"])
  {
    SEL v19 = NSSelectorFromString((NSString *)v7);
    MusicSettingsPerformSelector2((uint64_t)v19, v43, v8, 0);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    goto LABEL_12;
  }
  if ([v9 isEqualToString:@"musicDynamicIconImage"])
  {
    SEL v23 = NSSelectorFromString((NSString *)v7);
    MusicSettingsPerformSelector2((uint64_t)v23, v43, v8, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = *MEMORY[0x263F60140];
    if (v10)
    {
      uint64_t v20 = v8;
      v21 = v10;
LABEL_15:
      [v20 setObject:v21 forKeyedSubscript:v22];
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if ([v9 isEqualToString:@"musicDynamicLabel"])
  {
    SEL v24 = NSSelectorFromString((NSString *)v7);
    MusicSettingsPerformSelector2((uint64_t)v24, v43, v8, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v8 setName:v10];
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"musicDynamicFooterHyperlinkViewText"])
  {
    SEL v25 = NSSelectorFromString((NSString *)v7);
    MusicSettingsPerformSelector2((uint64_t)v25, v43, v8, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = *MEMORY[0x263F600E8];
    if (!v10)
    {
LABEL_28:
      uint64_t v26 = v8;
LABEL_29:
      uint64_t v27 = v22;
      goto LABEL_30;
    }
    uint64_t v26 = v8;
LABEL_33:
    [v26 setProperty:v10 forKey:v22];
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"musicFooterHyperlinkViewText"])
  {
    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v29 = [v43 stringsTable];
    v10 = [v28 localizedStringForKey:v7 value:&stru_26E9F45B8 table:v29];

    uint64_t v22 = *MEMORY[0x263F600E8];
    uint64_t v26 = v8;
    if (!v10) {
      goto LABEL_29;
    }
    goto LABEL_33;
  }
  if ([v9 isEqualToString:@"musicDynamicFooterHyperlinkViewLinkText"])
  {
    SEL v30 = NSSelectorFromString((NSString *)v7);
    MusicSettingsPerformSelector2((uint64_t)v30, v43, v8, 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if ([v9 isEqualToString:@"musicFooterHyperlinkViewLinkText"])
  {
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = [v43 stringsTable];
    v10 = [v31 localizedStringForKey:v7 value:&stru_26E9F45B8 table:v32];

LABEL_38:
    int v33 = [v8 objectForKeyedSubscript:*MEMORY[0x263F600E8]];
    v11 = v33;
    if (!v10 || !v33)
    {
      [v8 removePropertyForKey:*MEMORY[0x263F600D0]];
      goto LABEL_4;
    }
    v45.location = [v33 rangeOfString:v10];
    uint64_t v12 = NSStringFromRange(v45);
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600D0]];
LABEL_3:

LABEL_4:
LABEL_16:

    goto LABEL_17;
  }
  if ([v9 isEqualToString:@"musicDynamicFooterHyperlinkViewLinkAction"])
  {
    SEL v34 = NSSelectorFromString((NSString *)v7);
    MusicSettingsPerformSelector2((uint64_t)v34, v43, v8, 0);
    uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v35;
    if (v35)
    {
      v36 = (void *)MEMORY[0x263F08D40];
      v37 = [(__CFString *)v35 target];
      id v38 = [v36 valueWithNonretainedObject:v37];
      [v8 setObject:v38 forKeyedSubscript:*MEMORY[0x263F600E0]];

      v11 = [(__CFString *)v10 selectorString];
      [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600C8]];
      goto LABEL_4;
    }
    [v8 removePropertyForKey:*MEMORY[0x263F600E0]];
    uint64_t v27 = *MEMORY[0x263F600C8];
    uint64_t v26 = v8;
LABEL_30:
    [v26 removePropertyForKey:v27];
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"musicDynamicEnabled"])
  {
    SEL v39 = NSSelectorFromString((NSString *)v7);
    v18 = MusicSettingsPerformSelector2((uint64_t)v39, v43, v8, 0);
    uint64_t v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v18, "BOOLValue"));
    [v8 setObject:v40 forKeyedSubscript:v17];
LABEL_49:

    goto LABEL_9;
  }
  uint64_t v41 = *MEMORY[0x263F60280];
  if ([v9 isEqualToString:*MEMORY[0x263F60280]])
  {
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v40 = [v43 stringsTable];
    v42 = [v18 localizedStringForKey:v7 value:&stru_26E9F45B8 table:v40];
    [v8 setObject:v42 forKeyedSubscript:v41];

    goto LABEL_49;
  }
  [v8 setObject:v7 forKeyedSubscript:v9];
LABEL_17:
}

id MusicSettingsPerformSelector2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = (void (*)(id, uint64_t, id, id))[v7 methodForSelector:a1];
    id v11 = [v7 methodSignatureForSelector:a1];
    int v12 = *(unsigned __int8 *)[v11 methodReturnType];

    if (v9)
    {
      if (v12 == 64)
      {
        uint64_t v13 = v10(v7, a1, v8, v9);
LABEL_14:
        v15 = (void *)v13;
LABEL_16:
        if (v12 == 64) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        id v14 = v16;

        goto LABEL_20;
      }
      v10(v7, a1, v8, v9);
    }
    else if (v8)
    {
      if (v12 == 64)
      {
        uint64_t v13 = ((void (*)(id, uint64_t, id))v10)(v7, a1, v8);
        goto LABEL_14;
      }
      ((void (*)(id, uint64_t, id))v10)(v7, a1, v8);
    }
    else
    {
      if (v12 == 64)
      {
        uint64_t v13 = ((void (*)(id, uint64_t))v10)(v7, a1);
        goto LABEL_14;
      }
      ((void (*)(id, uint64_t))v10)(v7, a1);
    }
    v15 = 0;
    goto LABEL_16;
  }
  id v14 = 0;
LABEL_20:

  return v14;
}

id MusicSettingsPerformSelector(uint64_t a1, void *a2, void *a3)
{
  return MusicSettingsPerformSelector2(a1, a2, a3, 0);
}

uint64_t _MSS_hasMusicRequiredCapabilities_specifier(void *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v6 objectForKey:@"musicRequiredCapabilities"];
  if (v8) {
    BOOL hasMusicRequiredCapabilities_specifier = _MSS__hasMusicRequiredCapabilities_specifier(v5, v8, v7);
  }
  else {
    BOOL hasMusicRequiredCapabilities_specifier = 1;
  }
  v10 = [v6 objectForKey:@"musicRequiredCapabilitiesNot"];
  id v11 = v10;
  if (v10) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = hasMusicRequiredCapabilities_specifier;
  }
  if (v10 && hasMusicRequiredCapabilities_specifier) {
    uint64_t v12 = !_MSS__hasMusicRequiredCapabilities_specifier(v5, v10, v7);
  }
  uint64_t v13 = [v6 objectForKey:@"musicRequiredCapabilitiesOr"];
  id v14 = v13;
  v29 = v11;
  if (v13)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      LOBYTE(v17) = 0;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v14);
          }
          BOOL v17 = v17 || _MSS__hasMusicRequiredCapabilities_specifier(v5, *(void **)(*((void *)&v34 + 1) + 8 * i), v7);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v16);
    }
    else
    {
      BOOL v17 = 0;
    }
    uint64_t v12 = v12 & v17;
  }
  uint64_t v20 = [v6 objectForKey:@"musicRequiredCapabilitiesNotOr"];
  v21 = v20;
  if (v20)
  {
    v28 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      LOBYTE(v24) = 0;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v21);
          }
          BOOL v24 = v24 || _MSS__hasMusicRequiredCapabilities_specifier(v5, *(void **)(*((void *)&v30 + 1) + 8 * j), v7);
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }
    else
    {
      BOOL v24 = 0;
    }
    uint64_t v12 = v12 & !v24;
    id v8 = v28;
  }

  return v12;
}

void sub_236CCC7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
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

BOOL _MSS__hasMusicRequiredCapabilities_specifier(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = v28;
          if (*((unsigned char *)v28 + 24))
          {
            char hasMusicRequiredCapabilities_specifier = _MSS__hasMusicRequiredCapabilities_specifier(v5, *(void *)(*((void *)&v23 + 1) + 8 * i), v7);
            uint64_t v12 = v28;
          }
          else
          {
            char hasMusicRequiredCapabilities_specifier = 0;
          }
          *((unsigned char *)v12 + 24) = hasMusicRequiredCapabilities_specifier;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v9);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = ___MSS__hasMusicRequiredCapabilities_specifier_block_invoke;
      v19[3] = &unk_264CBF798;
      id v20 = v5;
      id v21 = v7;
      uint64_t v22 = &v27;
      [v6 enumerateKeysAndObjectsUsingBlock:v19];

      id v8 = v20;
    }
    else
    {
      id v14 = _MSS_valueForRequirementKey_specifier(v5, v6, v7);
      id v8 = v14;
      uint64_t v15 = v28;
      if (*((unsigned char *)v28 + 24))
      {
        char v16 = [v14 isEqual:MEMORY[0x263EFFA88]];
        uint64_t v15 = v28;
      }
      else
      {
        char v16 = 0;
      }
      *((unsigned char *)v15 + 24) = v16;
    }
  }

  BOOL v17 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);

  return v17;
}

void sub_236CCCB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SystemHasCapabilities()
{
  return MEMORY[0x270F553A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x270EE57B0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x270EE57C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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