@interface VSAMSIdentityProviderResponseDictionaryValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)createProviderAppArtworkFromAttributes:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSAMSIdentityProviderResponseDictionaryValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)createProviderAppArtworkFromAttributes:(id)a3
{
  v3 = objc_msgSend(a3, "vs_dictionaryForKey:", *MEMORY[0x263F1E388]);
  v4 = [MEMORY[0x263F1E1F0] currentDevice];
  v5 = [v4 stringForAMSPlatformAttributes];
  v6 = objc_msgSend(v3, "vs_dictionaryForKey:", v5);

  if (!v6)
  {
    v7 = [v4 bincompatOS];
    if (v7)
    {
      v6 = objc_msgSend(v3, "vs_dictionaryForKey:", v7);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)transformedValue:(id)a3
{
  uint64_t v179 = *MEMORY[0x263EF8340];
  v3 = a3;
  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v173 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Handling response %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v115 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v104 = *MEMORY[0x263F1E3B0];
    v6 = -[NSObject vs_arrayForKey:](v3, "vs_arrayForKey:");
    v103 = v6;
    if (v6)
    {
      v7 = v6;
      if ([v7 count])
      {
        long long v169 = 0u;
        long long v170 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        obj = v7;
        uint64_t v8 = [obj countByEnumeratingWithState:&v167 objects:v178 count:16];
        if (!v8) {
          goto LABEL_98;
        }
        uint64_t v9 = v8;
        v102 = v3;
        uint64_t v10 = *(void *)v168;
        uint64_t v120 = *MEMORY[0x263EFF4A0];
        uint64_t v136 = *MEMORY[0x263F1E380];
        uint64_t v135 = *MEMORY[0x263F1E350];
        uint64_t v130 = *MEMORY[0x263F1E368];
        uint64_t v128 = *MEMORY[0x263F1E3A8];
        uint64_t v129 = *MEMORY[0x263F1E348];
        uint64_t v127 = *MEMORY[0x263F1E3E8];
        uint64_t v126 = *MEMORY[0x263F1E370];
        uint64_t v125 = *MEMORY[0x263F1E378];
        uint64_t v124 = *MEMORY[0x263F1E360];
        uint64_t v123 = *MEMORY[0x263F1E358];
        uint64_t v112 = *MEMORY[0x263F1E398];
        uint64_t v111 = *MEMORY[0x263F1E3A0];
        uint64_t v110 = *MEMORY[0x263F1E390];
        uint64_t v109 = *MEMORY[0x263F1E3C0];
        uint64_t v108 = *MEMORY[0x263F1E3C8];
        uint64_t v107 = *MEMORY[0x263F1E3D0];
        uint64_t v106 = *MEMORY[0x263F1E3B8];
        uint64_t v105 = *MEMORY[0x263F1E340];
        uint64_t v134 = *MEMORY[0x263F1E318];
        uint64_t v132 = *MEMORY[0x263F1E308];
        uint64_t v133 = *MEMORY[0x263F1E310];
        v113 = v5;
        v101 = v7;
        uint64_t v122 = *(void *)v168;
        while (1)
        {
          uint64_t v11 = 0;
          uint64_t v131 = v9;
          do
          {
            if (*(void *)v168 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(NSObject **)(*((void *)&v167 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v13 = (void *)MEMORY[0x263EFF940];
                v14 = (objc_class *)objc_opt_class();
                v15 = NSStringFromClass(v14);
                [v13 raise:v120, @"Unexpectedly, providerObject was %@, instead of NSDictionary.", v15 format];
              }
              uint64_t v155 = v11;
              v16 = v12;
              v17 = [v16 vs_stringForKey:v136];
              v18 = [v16 vs_dictionaryForKey:v135];
              v156 = v16;
              v154 = v18;
              if (v18)
              {
                v19 = v18;
                uint64_t v20 = [v19 vs_stringForKey:v130];
                v140 = (void *)v20;
                if (v20)
                {
                  uint64_t v21 = [NSURL URLWithString:v20];
                }
                else
                {
                  uint64_t v21 = 0;
                }
                uint64_t v23 = [v19 vs_stringForKey:v129];
                v139 = (void *)v23;
                if (v23)
                {
                  v146 = [NSURL URLWithString:v23];
                }
                else
                {
                  v146 = 0;
                }
                id v24 = [v19 vs_stringForKey:v128];
                if (!v24) {
                  id v24 = v17;
                }
                v145 = v24;
                v25 = [v19 vs_dictionaryForKey:v127];
                id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
                v165[0] = MEMORY[0x263EF8330];
                v165[1] = 3221225472;
                v165[2] = __76__VSAMSIdentityProviderResponseDictionaryValueTransformer_transformedValue___block_invoke;
                v165[3] = &unk_2650776E0;
                id v27 = v26;
                id v166 = v27;
                v141 = v25;
                [v25 enumerateKeysAndObjectsUsingBlock:v165];
                v152 = [v19 vs_stringForKey:v126];
                v138 = [v19 vs_numberForKey:v125];
                int v28 = [v138 BOOLValue] ^ 1;
                v148 = (void *)v21;
                if (v21) {
                  int v29 = v28;
                }
                else {
                  int v29 = 1;
                }
                v144 = [v19 vs_arrayOfStringsForKey:v124];
                v143 = [v19 vs_arrayOfStringsForKey:v123];
                uint64_t v142 = [v19 vs_stringForKey:@"minimumOSVersion"];
                if (!v17)
                {
                  v30 = VSDefaultLogObject();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v173 = v156;
                    _os_log_impl(&dword_23F9AB000, v30, OS_LOG_TYPE_DEFAULT, "No unique ID for provider: %@", buf, 0xCu);
                  }
                  v22 = 0;
                  v34 = v138;
                  v32 = (void *)v142;
                  goto LABEL_65;
                }
                unsigned int v121 = v29;
                v30 = v17;
                if ([v30 length])
                {
                  id v31 = v27;
                  if ([v152 length])
                  {
                    v32 = (void *)v142;
                    BOOL v33 = ([v115 containsObject:v30] & 1) == 0
                       && [v141 count] != 0;
LABEL_43:
                    v150 = v17;
                    if (![v32 length])
                    {
                      if (v33) {
                        goto LABEL_49;
                      }
                      goto LABEL_61;
                    }
                    v35 = [MEMORY[0x263F1E1F0] currentDevice];
                    v36 = [v35 productVersion];

                    if (v36)
                    {
                      BOOL v37 = [v32 compare:v36 options:64] != 1 && v33;

                      if (v37) {
                        goto LABEL_49;
                      }
LABEL_61:
                      id v27 = v31;
                      v38 = VSDefaultLogObject();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412802;
                        v173 = v152;
                        __int16 v174 = 2112;
                        v175 = v30;
                        __int16 v176 = 2112;
                        v177 = v156;
                        _os_log_impl(&dword_23F9AB000, v38, OS_LOG_TYPE_DEFAULT, "Excluding provider %@ (%@): %@", buf, 0x20u);
                      }
                      v22 = 0;
                      uint64_t v9 = v131;
                      v17 = v150;
                    }
                    else
                    {
                      v72 = VSErrorLogObject();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
                        [(VSAMSIdentityProviderResponseDictionaryValueTransformer *)&v163 transformedValue:v72];
                      }

                      if (!v33) {
                        goto LABEL_61;
                      }
LABEL_49:
                      [v115 addObject:v30];
                      v38 = objc_alloc_init(MEMORY[0x263F1E218]);
                      v39 = (void *)MEMORY[0x263F1E250];
                      id v40 = [v30 copy];
                      v41 = [v39 optionalWithObject:v40];
                      [v38 setUniqueID:v41];

                      v42 = (void *)MEMORY[0x263F1E250];
                      v43 = (void *)[v145 copy];
                      v44 = [v42 optionalWithObject:v43];
                      [v38 setProviderID:v44];

                      v45 = (void *)MEMORY[0x263F1E250];
                      id v46 = [v156 copy];
                      v47 = [v45 optionalWithObject:v46];
                      [v38 setProviderInfo:v47];

                      [v38 setNameForSorting:v152];
                      [v38 setAuthenticationURL:v148];
                      [v38 setRequireAuthenticationURLSystemTrust:1];
                      [v38 setRequireXHRRequestSystemTrust:1];
                      v119 = [v19 vs_dictionaryForKey:v112];
                      v118 = objc_msgSend(v119, "vs_stringForKey:", v111);
                      -[NSObject setProviderArtworkTemplateURL:](v38, "setProviderArtworkTemplateURL:");
                      v117 = [(VSAMSIdentityProviderResponseDictionaryValueTransformer *)self createProviderAppArtworkFromAttributes:v19];
                      v116 = objc_msgSend(v117, "vs_stringForKey:", v110);
                      -[NSObject setProviderAppArtworkTemplateURL:](v38, "setProviderAppArtworkTemplateURL:");
                      v48 = [v19 vs_numberForKey:v109];
                      v49 = v48;
                      if (v48) {
                        -[NSObject setIsSetTopBoxSupported:](v38, "setIsSetTopBoxSupported:", [v48 BOOLValue]);
                      }
                      v50 = [v19 vs_numberForKey:v108];
                      v51 = v50;
                      if (v50) {
                        -[NSObject setShouldShowChannelApps:](v38, "setShouldShowChannelApps:", [v50 BOOLValue]);
                      }
                      v52 = [v19 vs_numberForKey:v107];
                      v53 = v52;
                      if (v52) {
                        -[NSObject setShouldShowSubscriptionApps:](v38, "setShouldShowSubscriptionApps:", [v52 BOOLValue]);
                      }
                      v54 = [v19 vs_numberForKey:v106];
                      v55 = v54;
                      if (v54) {
                        -[NSObject setIsSTBOptOutAllowed:](v38, "setIsSTBOptOutAllowed:", [v54 BOOLValue]);
                      }
                      v56 = [v19 vs_numberForKey:v105];
                      if (v56) {
                        [v38 setAppPlacementPosition:v56];
                      }
                      id v27 = v31;
                      [v38 setStorefronts:v31];
                      [v38 setAppStoreRoomURL:v146];
                      [v38 setSupportedTemplates:v144];
                      [v38 setSupportedAuthenticationSchemes:v143];
                      [v38 setProhibitedByStore:v121];
                      [v113 addObject:v38];

                      v22 = v38;
                      uint64_t v10 = v122;
                      uint64_t v9 = v131;
                      v17 = v150;
                      v32 = (void *)v142;
                    }

                    v34 = v138;
LABEL_65:

                    v16 = v156;
LABEL_66:

                    v57 = [v16 vs_dictionaryForKey:v134];
                    v58 = objc_msgSend(v57, "vs_dictionaryForKey:", v133);
                    v59 = objc_msgSend(v58, "vs_arrayOfDictionariesForKey:", v132);
                    v60 = v59;
                    if (v59 && [v59 count])
                    {
                      v147 = v58;
                      v149 = v57;
                      v151 = v17;
                      v153 = v22;
                      id v61 = v60;
                      id v62 = objc_alloc_init(MEMORY[0x263EFF980]);
                      v63 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSAMSAppsValueTransformer"];
                      long long v157 = 0u;
                      long long v158 = 0u;
                      long long v159 = 0u;
                      long long v160 = 0u;
                      id v64 = v61;
                      uint64_t v65 = [v64 countByEnumeratingWithState:&v157 objects:v171 count:16];
                      if (v65)
                      {
                        uint64_t v66 = v65;
                        uint64_t v67 = *(void *)v158;
                        do
                        {
                          for (uint64_t i = 0; i != v66; ++i)
                          {
                            if (*(void *)v158 != v67) {
                              objc_enumerationMutation(v64);
                            }
                            v69 = *(NSObject **)(*((void *)&v157 + 1) + 8 * i);
                            v70 = [v63 transformedValue:v69];
                            if (v70)
                            {
                              [v62 addObject:v70];
                            }
                            else
                            {
                              v71 = VSErrorLogObject();
                              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)buf = 138412290;
                                v173 = v69;
                                _os_log_error_impl(&dword_23F9AB000, v71, OS_LOG_TYPE_ERROR, "App dictionary contained data but no attributes: %@", buf, 0xCu);
                              }
                            }
                          }
                          uint64_t v66 = [v64 countByEnumeratingWithState:&v157 objects:v171 count:16];
                        }
                        while (v66);
                      }

                      v22 = v153;
                      if (v153) {
                        [v153 setNonChannelAppDescriptions:v62];
                      }

                      uint64_t v10 = v122;
                      uint64_t v9 = v131;
                      v16 = v156;
                      v57 = v149;
                      v17 = v151;
                      v58 = v147;
                    }

                    uint64_t v11 = v155;
                    goto LABEL_84;
                  }
                  BOOL v33 = 0;
                }
                else
                {
                  BOOL v33 = 0;
                  id v31 = v27;
                }
                v32 = (void *)v142;
                goto LABEL_43;
              }
              v19 = VSErrorLogObject();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                [(VSAMSIdentityProviderResponseDictionaryValueTransformer *)&v161 transformedValue:v19];
              }
              v22 = 0;
              goto LABEL_66;
            }
            v16 = VSErrorLogObject();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v173 = v104;
              __int16 v174 = 2112;
              v175 = v12;
              _os_log_error_impl(&dword_23F9AB000, v16, OS_LOG_TYPE_ERROR, "Unexpected value as item in %@ array: %@", buf, 0x16u);
            }
LABEL_84:

            ++v11;
          }
          while (v11 != v9);
          uint64_t v73 = [obj countByEnumeratingWithState:&v167 objects:v178 count:16];
          uint64_t v9 = v73;
          if (!v73)
          {
            v7 = v101;
            v3 = v102;
            id v5 = v113;
            goto LABEL_98;
          }
        }
      }
      obj = VSErrorLogObject();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:](obj, v81, v82, v83, v84, v85, v86, v87);
      }
LABEL_98:
    }
    else
    {
      v7 = VSErrorLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:](v7, v74, v75, v76, v77, v78, v79, v80);
      }
    }
  }
  else
  {
    v115 = VSErrorLogObject();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:].cold.6((uint64_t)v3, v115);
    }
  }

  if ([v5 count])
  {
    v88 = (void *)MEMORY[0x263F1E208];
    v89 = (void *)[v5 copy];
    uint64_t v90 = [v88 failableWithObject:v89];
  }
  else
  {
    v91 = VSErrorLogObject();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      -[VSAMSIdentityProviderResponseDictionaryValueTransformer transformedValue:](v91, v92, v93, v94, v95, v96, v97, v98);
    }

    v89 = VSPublicError();
    uint64_t v90 = [MEMORY[0x263F1E208] failableWithError:v89];
  }
  v99 = (void *)v90;

  return v99;
}

void __76__VSAMSIdentityProviderResponseDictionaryValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a3;
  id v5 = [a2 lowercaseString];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x263EFF940];
      uint64_t v7 = *MEMORY[0x263EFF4A0];
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v6 raise:v7, @"Unexpectedly, value was %@, instead of NSDictionary.", v9 format];
    }
    uint64_t v10 = *MEMORY[0x263F1E3D8];
    id v11 = v16;
    v12 = objc_msgSend(v11, "vs_numberForKey:", v10);
    uint64_t v13 = [v12 BOOLValue];

    v14 = objc_msgSend(v11, "vs_numberForKey:", *MEMORY[0x263F1E3E0]);

    id v15 = objc_alloc_init(MEMORY[0x263F1E228]);
    [v15 setStorefrontTwoCharCode:v5];
    [v15 setIsFeatured:v13];
    [v15 setSortOrdinal:v14];
    [*(id *)(a1 + 32) addObject:v15];
  }
}

- (void)transformedValue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transformedValue:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transformedValue:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transformedValue:(os_log_t)log .cold.4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "No attributes dictionary for provider", buf, 2u);
}

- (void)transformedValue:(os_log_t)log .cold.5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_23F9AB000, log, OS_LOG_TYPE_FAULT, "Failed to get current version. Skipping TV Provider minimumOSVersion check.", buf, 2u);
}

- (void)transformedValue:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Response was not a dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end