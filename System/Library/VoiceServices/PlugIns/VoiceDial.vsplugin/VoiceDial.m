uint64_t _ResultHandlerAddressBookCallback(void *a1, void *a2, const void *a3, ABMultiValueIdentifier a4, ABPropertyID a5, int a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  CFTypeRef v19;
  const void *v20;
  CFIndex IndexForIdentifier;
  CFIndex v22;
  CFStringRef v23;
  CFStringRef v24;
  void *v25;
  void *v26;
  CFStringRef v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char v40;
  void *v41;
  char v42;
  int v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  __CFString *v53;
  CFStringRef v54;
  CFStringRef v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  int v77;
  id v78;
  id v79;
  int v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  int v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i;
  void *v95;
  void *v96;
  int v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  void *v103;
  void *v104;
  int v105;
  id v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  ABMultiValueRef multiValue;
  id v129;
  void *v130;
  ABPropertyID v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  CFIndex v136;
  void *v137;
  CFIndex v138;
  CFStringRef cf;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  uint64_t v153;

  v13 = a1;
  v14 = a2;
  v15 = a7;
  v16 = v15;
  v153 = 0;
  if (a3)
  {
    v17 = [v15 nameToMatch];

    if (v17)
    {
      v18 = [v16 nameToMatch];
      a6 = objc_msgSend(v13, "matchingNameType:fromTypes:forPerson:", v18, objc_msgSend(v13, "nameTypes") & 0xFFFFFFFFFFFFFFF7, a3);
    }
    if (a6 != -1
      && ([v16 requiredNameMatchType] == -1
       || [v16 requiredNameMatchType] == a6))
    {
      v19 = ABRecordCopyValue(a3, a5);
      if (v19)
      {
        v20 = v19;
        IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v19, a4);
        if (IndexForIdentifier == -1
          || (v22 = IndexForIdentifier,
              (v23 = (const __CFString *)ABMultiValueCopyValueAtIndex(v20, IndexForIdentifier)) == 0))
        {
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
LABEL_59:
          CFRelease(v20);

          goto LABEL_60;
        }
        v24 = v23;
        cf = v23;
        if (CFStringGetLength(v23) < 1) {
          goto LABEL_21;
        }
        v131 = a5;
        if (([v16 allowFirstFT] & 1) == 0)
        {
          v25 = IMCleanupPhoneNumber();
          [MEMORY[0x263F4A590] sharedInstance];
          v26 = v136 = v22;
          [MEMORY[0x263F4A610] facetimeService];
          v134 = v14;
          v28 = v27 = v24;
          v29 = [v26 statusForID:v25 onService:v28];

          v24 = v27;
          v14 = v134;

          v22 = v136;
          v30 = v29 == 1;
          a5 = v131;
          if (!v30)
          {
LABEL_21:
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v137 = 0;
            v33 = 0;
            v140 = 0;
            v31 = 0;
LABEL_58:
            CFRelease(cf);

            v34 = v137;
            v32 = v140;
            goto LABEL_59;
          }
        }
        if ([v16 contactInfo])
        {
          [v16 setResultStatus:1];
          v126 = *MEMORY[0x263F24570];
          if (*MEMORY[0x263F24570] == a5 && ![v16 matchedLabelType]
            || *MEMORY[0x263F243C8] == a5 && [v16 matchedLabelType] == 1)
          {
            [v16 setMatchedLabelType:2];
          }
        }
        else
        {
          [v16 setResultStatus:2];
          v126 = *MEMORY[0x263F24570];
          [v16 setMatchedLabelType:*MEMORY[0x263F24570] == a5];
          [v16 setResultPerson:a3];
          CFRetain(a3);
          [v16 setContactInfo:CFRetain(v24)];
        }
        multiValue = v20;
        if (a6 == 3) {
          objc_msgSend(v16, "setNicknameMatchCount:", objc_msgSend(v16, "nicknameMatchCount") + 1);
        }
        v153 = [v13 indexOfMainNameOfType:2];
        v39 = [v13 personNameCount];
        v40 = [v13 nameTypes];
        if (v153 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v132 = 0;
          v133 = 0;
          v140 = 0;
          v33 = 0;
          v41 = 0;
          v129 = 0;
          v130 = 0;
          v135 = 0;
LABEL_37:
          v137 = v41;
          v52 = (__CFString *)ABMultiValueCopyLabelAtIndex(v20, v22);
          if (v52)
          {
            v53 = v52;
            v54 = (const __CFString *)VoiceDialCopySpokenLocalizedLabel(v52);
            if (v54)
            {
              v55 = v54;
              if (v126 == v131)
              {
                v56 = [v16 unlocalizedPhoneLabels];

                if (!v56)
                {
                  v57 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                  [v16 setUnlocalizedPhoneLabels:v57];
                }
                if (CFStringGetLength(v55))
                {
                  v58 = [v16 localizedPhoneLabels];

                  if (!v58)
                  {
                    v59 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                    [v16 setLocalizedPhoneLabels:v59];
                  }
                  v60 = [v16 localizedPhoneLabels];
                  [v60 addObject:v55];
                }
                v61 = [v16 unlocalizedPhoneLabels];
                [v61 addObject:v53];
              }
              if (*MEMORY[0x263F243C8] == v131)
              {
                v62 = [v16 unlocalizedEmailLabels];

                if (!v62)
                {
                  v63 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                  [v16 setUnlocalizedEmailLabels:v63];
                }
                if (CFStringGetLength(v55))
                {
                  v64 = [v16 localizedEmailLabels];

                  if (!v64)
                  {
                    v65 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                    [v16 setLocalizedEmailLabels:v65];
                  }
                  v66 = [v16 localizedEmailLabels];
                  [v66 addObject:v55];
                }
                v67 = [v16 unlocalizedEmailLabels];
                [v67 addObject:v53];
              }
              CFRelease(v55);
            }
            CFRelease(v53);
          }
          v31 = v132;
          v35 = v133;
          v36 = v135;
          v38 = v129;
          v37 = v130;
          goto LABEL_58;
        }
        v42 = v40;
        v138 = v22;
        v151 = 0;
        v152 = 0;
        v43 = [v13 getNth:0 name:&v152 phoneticName:&v151 ofType:2 nameIndex:&v153 forPerson:a3];
        v44 = v152;
        v140 = v151;
        v132 = v44;
        if (!v43 || ![v44 length])
        {
          v33 = 0;
          v41 = 0;
          v129 = 0;
          v130 = 0;
          v133 = 0;
          v135 = 0;
          goto LABEL_36;
        }
        v45 = [v16 compositeNames];

        v127 = v39;
        if (!v45)
        {
          v46 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          [v16 setCompositeNames:v46];

          v47 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          [v16 setTopLevelNonNickNames:v47];

          v48 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          [v16 setSpokenCompositeNames:v48];

          v49 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [v16 setPhoneticNamesByName:v49];
        }
        v50 = [v13 matchingNameType:v14 fromTypes:3 forPerson:a3];
        if (v50 != -1
          && ((v51 = v50, [v16 lastNameMatchType] == -1)
           || [v16 lastNameMatchType] == v51))
        {
          [v16 setLastNameMatchType:v51];
        }
        else
        {
          [v16 setAllNamesMatchedType:0];
        }
        v69 = [v16 compositeNames];
        [v69 addObject:v44];

        v70 = [v16 spokenCompositeNames];
        if ([v140 length]) {
          v71 = v140;
        }
        else {
          v71 = v44;
        }
        [v70 addObject:v71];

        if (v140 && v44 && [v140 caseInsensitiveCompare:v44])
        {
          v72 = [v16 phoneticNamesByName];
          [v72 setObject:v140 forKey:v44];
        }
        v73 = [v13 indexOfMainNameOfType:0];
        v74 = [v13 indexOfMainNameOfType:1];
        v123 = v73;
        v125 = v74;
        if (v73 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v75 = 0;
          v76 = 0;
        }
        else
        {
          v149 = 0;
          v150 = 0;
          v77 = [v13 getName:&v150 phoneticName:&v149 atIndex:v73 forPerson:a3];
          v75 = v150;
          v76 = v149;
          if (v77 && [v75 length])
          {
            if (v42)
            {
              v108 = [v16 lastNamesByFirstNames];
              v109 = [v108 objectForKey:v75];

              v135 = (void *)v109;
              if (!v109)
              {
                v110 = [v16 lastNamesByFirstNames];

                if (!v110)
                {
                  v111 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                  [v16 setLastNamesByFirstNames:v111];
                }
                v112 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                v113 = [v16 lastNamesByFirstNames];
                v135 = v112;
                [v113 setObject:v112 forKey:v75];
              }
            }
            else
            {
              v135 = 0;
            }
            v114 = [v16 topLevelNonNickNames];
            [v114 addObject:v75];

            if (v76 && v75 && [v76 caseInsensitiveCompare:v75])
            {
              v115 = [v16 phoneticNamesByName];
              [v115 setObject:v76 forKey:v75];
            }
            v75 = v75;
            v129 = v75;
            v74 = v125;
LABEL_76:
            if (v74 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v78 = 0;
              v133 = 0;
              v79 = v76;
            }
            else
            {
              v147 = v76;
              v148 = v75;
              v80 = [v13 getName:&v148 phoneticName:&v147 atIndex:v74 forPerson:a3];
              v81 = v148;

              v79 = v147;
              if (v80)
              {
                v82 = v127;
                if ([v81 length])
                {
                  if ((v42 & 2) != 0)
                  {
                    v116 = [v16 firstNamesByLastNames];
                    v83 = [v116 objectForKey:v81];

                    v84 = v123;
                    if (!v83)
                    {
                      v117 = [v16 firstNamesByLastNames];

                      if (!v117)
                      {
                        v118 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                        [v16 setFirstNamesByLastNames:v118];
                      }
                      v83 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                      v119 = [v16 firstNamesByLastNames];
                      [v119 setObject:v83 forKey:v81];
                    }
                  }
                  else
                  {
                    v83 = 0;
                    v84 = v123;
                  }
                  v133 = v83;
                  v120 = [v16 topLevelNonNickNames];
                  [v120 addObject:v81];

                  if (v79 && v81 && [v79 caseInsensitiveCompare:v81])
                  {
                    v121 = [v16 phoneticNamesByName];
                    [v121 setObject:v79 forKey:v81];
                  }
                  v75 = v81;
                  v78 = v75;
                  v82 = v127;
                  goto LABEL_85;
                }
                v78 = 0;
                v133 = 0;
                v75 = v81;
LABEL_84:
                v84 = v123;
LABEL_85:
                v130 = v78;
                if (v82)
                {
                  v85 = 0;
                  while (1)
                  {
                    if (v85 == v153)
                    {
                      v86 = [v16 topLevelNonNickNames];
                      v33 = v132;
                      [v86 addObject:v132];

                      v82 = v127;
                      [v135 addObject:v132];
                    }
                    else
                    {
                      if (v84 == v85) {
                        goto LABEL_90;
                      }
                      if (v125 == v85) {
                        goto LABEL_90;
                      }
                      v88 = [v13 typeOfNameAtIndex:v85];
                      if (v88 == 3) {
                        goto LABEL_90;
                      }
                      v122 = v88;
                      v146 = v75;
                      v145 = v79;
                      v124 = [v13 getName:&v146 phoneticName:&v145 atIndex:v85 forPerson:a3];
                      v33 = v146;

                      v89 = v145;
                      if (!v124 || ![v33 length])
                      {
                        v79 = v89;
                        v84 = v123;
                        goto LABEL_91;
                      }
                      v90 = [v16 topLevelNonNickNames];
                      [v90 addObject:v33];

                      v79 = v89;
                      if (v89 && v33 && [v89 caseInsensitiveCompare:v33])
                      {
                        v91 = [v16 phoneticNamesByName];
                        [v91 setObject:v89 forKey:v33];
                      }
                      v84 = v123;
                      if (v122)
                      {
                        [v135 addObject:v33];
                        v75 = v33;
                        if (v122 == 1) {
                          goto LABEL_91;
                        }
                      }
                      else
                      {
                        v75 = v33;
                      }
                    }
                    [v133 addObject:v33];
LABEL_90:
                    v33 = v75;
LABEL_91:
                    ++v85;
                    v87 = v79;
                    v75 = v33;
                    if (v82 == v85) {
                      goto LABEL_108;
                    }
                  }
                }
                v33 = v75;
                v87 = v79;
LABEL_108:
                if (v133)
                {
                  v41 = v87;
                  if (v129)
                  {
                    objc_msgSend(v133, "addObject:");
                  }
                  else
                  {
                    v92 = objc_msgSend(v13, "countOfNamesOfType:");
                    if (v92)
                    {
                      v93 = v92;
                      for (i = 0; i != v93; ++i)
                      {
                        v95 = v33;
                        v96 = v41;
                        v143 = v41;
                        v144 = v33;
                        v97 = [v13 getNth:i name:&v144 phoneticName:&v143 ofType:0 nameIndex:0 forPerson:a3];
                        v33 = v144;

                        v98 = v143;
                        if (v97)
                        {
                          if ([v33 length])
                          {
                            [v133 addObject:v33];
                            if (v98)
                            {
                              if (v33 && [v98 caseInsensitiveCompare:v33])
                              {
                                v99 = [v16 phoneticNamesByName];
                                [v99 setObject:v98 forKey:v33];
                              }
                            }
                          }
                        }
                        v41 = v98;
                      }
                    }
                  }
                }
                else
                {
                  v41 = v87;
                }
                if (v135)
                {
                  v20 = multiValue;
                  v22 = v138;
                  if (v130)
                  {
                    objc_msgSend(v135, "addObject:");
                    goto LABEL_37;
                  }
                  v100 = [v13 countOfNamesOfType:1];
                  if (!v100)
                  {
                    v130 = 0;
                    goto LABEL_37;
                  }
                  v101 = v100;
                  for (j = 0; j != v101; ++j)
                  {
                    v103 = v33;
                    v104 = v41;
                    v141 = v41;
                    v142 = v33;
                    v105 = [v13 getNth:j name:&v142 phoneticName:&v141 ofType:1 nameIndex:0 forPerson:a3];
                    v33 = v142;

                    v106 = v141;
                    if (v105)
                    {
                      if ([v33 length])
                      {
                        [v135 addObject:v33];
                        if (v106)
                        {
                          if (v33 && [v106 caseInsensitiveCompare:v33])
                          {
                            v107 = [v16 phoneticNamesByName];
                            [v107 setObject:v106 forKey:v33];
                          }
                        }
                      }
                    }
                    v41 = v106;
                  }
                  v130 = 0;
                }
                else
                {
                  v135 = 0;
                }
LABEL_36:
                v20 = multiValue;
                v22 = v138;
                goto LABEL_37;
              }
              v78 = 0;
              v133 = 0;
              v75 = v81;
            }
            v82 = v127;
            goto LABEL_84;
          }
        }
        v129 = 0;
        v135 = 0;
        goto LABEL_76;
      }
    }
  }
LABEL_60:

  return 1;
}

id _CommaSeparatedStringFromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = (void *)[v1 mutableCopy];
    [v4 sortUsingSelector:sel_caseInsensitiveCompare_];
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    v6 = 0;
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (i)
      {
        if (v3 - 1 == i) {
          v8 = @"MULTIPLE_ITEM_SEPARATOR_WORD";
        }
        else {
          v8 = @"MULTIPLE_ITEM_SEPARATOR_CHAR";
        }
        v9 = VoiceDialSpokenLocalizedString(v8);
        [v5 appendString:v9];

        [v4 objectAtIndex:i];
        v6 = v10 = v6;
      }
      else
      {
        v10 = [v4 objectAtIndex:0];
        uint64_t v11 = [v10 capitalizedString];

        v6 = (void *)v11;
      }

      [v5 appendString:v6];
    }
  }
  else
  {
    id v5 = 0;
    v4 = 0;
    v6 = 0;
  }
  id v12 = v5;

  return v12;
}

id PHDefaultLog()
{
  if (PHDefaultLog_onceToken != -1) {
    dispatch_once(&PHDefaultLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)PHDefaultLog_PHDefaultLog;

  return v0;
}

uint64_t __PHDefaultLog_block_invoke()
{
  PHDefaultLog_PHDefaultLog = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  return MEMORY[0x270F9A758]();
}

id PHOversizedLog()
{
  if (PHOversizedLog_onceToken != -1) {
    dispatch_once(&PHOversizedLog_onceToken, &__block_literal_global_44);
  }
  v0 = (void *)PHOversizedLog_PHOversizedLog;

  return v0;
}

uint64_t __PHOversizedLog_block_invoke()
{
  PHOversizedLog_PHOversizedLog = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  return MEMORY[0x270F9A758]();
}

id PHOversizedLogQueue()
{
  if (PHOversizedLogQueue_onceToken != -1) {
    dispatch_once(&PHOversizedLogQueue_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)PHOversizedLogQueue_PHOversizedLogQueue;

  return v0;
}

void __PHOversizedLogQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v2);
  id v1 = (void *)PHOversizedLogQueue_PHOversizedLogQueue;
  PHOversizedLogQueue_PHOversizedLogQueue = (uint64_t)v0;
}

void DigitDialPhoneNumberFromResult(void *a1, void *a2, void *a3)
{
  id v68 = a1;
  uint64_t v5 = [v68 elementCount];
  uint64_t v6 = v5;
  v65 = a3;
  if (a3 && v5 >= 1)
  {
    v7 = VoiceDialBundle();
    v8 = (void *)VSRecognitionModelCopyLanguageResourceURL();

    if (v8) {
      v64 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v8];
    }
    else {
      v64 = 0;
    }
  }
  else
  {
    v8 = 0;
    v61 = 0;
    v64 = 0;
    id v67 = 0;
    v69 = 0;
    v9 = 0;
    v10 = 0;
    v58 = 0;
    v60 = 0;
    uint64_t v11 = 0;
    id v12 = 0;
    v13 = 0;
    id v14 = 0;
    if (v5 < 1)
    {
      if (!a2) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  v56 = v8;
  v57 = a2;
  id v14 = 0;
  v60 = 0;
  v61 = 0;
  v58 = 0;
  v13 = 0;
  id v12 = 0;
  uint64_t v11 = 0;
  v10 = 0;
  v9 = 0;
  v69 = 0;
  uint64_t v15 = 0;
  id v67 = 0;
  v16 = &v72;
  if (!v65) {
    v16 = 0;
  }
  v54 = v16;
  uint64_t v55 = v6 - 1;
  do
  {
    uint64_t v17 = v6;
    v18 = v9;

    v76 = v9;
    v77[0] = v69;
    int v19 = [v68 getElementClassIdentifier:v77 value:&v76 atIndex:v15];
    id v20 = v77[0];

    v9 = v76;
    v69 = v20;
    if (!v19)
    {
      v10 = 0;
      id v12 = 0;
      v13 = 0;
      goto LABEL_30;
    }
    if ([v20 isEqualToString:@"plus"])
    {
      VoiceDialSpokenLocalizedString(@"SPOKEN_PLUS_AT_BEGINNING_OF_PHONE_NUMBER");

LABEL_23:
      id v12 = _SpokenValueFromElementValue(v64, v9);
LABEL_24:
      uint64_t v21 = [v14 count];
      v13 = 0;
      v66 = v11;
      v22 = v9;
      uint64_t v23 = v15;
      v24 = v65;
      goto LABEL_25;
    }
    if (([v20 isEqualToString:@"digit"] & 1) != 0
      || ([v20 isEqualToString:@"nonzero-digit"] & 1) != 0
      || ([v20 isEqualToString:@"teens"] & 1) != 0
      || ([v20 isEqualToString:@"one-digit"] & 1) != 0)
    {
      goto LABEL_23;
    }
    if (![v20 isEqualToString:@"tens"])
    {
      if ([v20 isEqualToString:@"hundred"])
      {
        id v12 = _SpokenValueFromElementValue(v64, v9);

        v9 = @"00";
      }
      else
      {
        if (![v20 isEqualToString:@"thousand"])
        {
          v10 = 0;
          id v12 = 0;
          v13 = 0;
          goto LABEL_30;
        }
        id v12 = _SpokenValueFromElementValue(v64, v9);

        v9 = @"000";
      }
      goto LABEL_24;
    }
    if (v15 >= v55)
    {
      id v12 = 0;
      goto LABEL_24;
    }
    id v74 = v11;
    v75 = v60;
    uint64_t v53 = v15 + 1;
    int v28 = objc_msgSend(v68, "getElementClassIdentifier:value:atIndex:", &v75, &v74);
    v29 = v75;

    id v30 = v74;
    if (!v28)
    {
      id v12 = 0;
      v60 = v29;
LABEL_50:
      uint64_t v11 = v30;
      goto LABEL_24;
    }
    if ([(__CFString *)v29 isEqualToString:@"digit"]
      && ([(__CFString *)v29 isEqualToString:@"0"] & 1) == 0)
    {

      v31 = @"nonzero-digit";
    }
    else
    {
      v31 = v29;
    }
    v60 = v31;
    if (![(__CFString *)v31 isEqualToString:@"nonzero-digit"])
    {
      id v12 = 0;
      goto LABEL_50;
    }
    v66 = v30;
    v10 = [(__CFString *)v9 stringByAppendingString:v30];
    v32 = NSString;
    uint64_t v33 = [(__CFString *)v9 length];
    if (v33)
    {
      [(__CFString *)v9 substringToIndex:1];
      v51 = v34 = v64;
      uint64_t v35 = _SpokenValueFromElementValue(v64, v51);
      v50 = (void *)v35;
      v36 = v52;
    }
    else
    {
      v34 = v64;
      uint64_t v35 = _SpokenValueFromElementValue(v64, @"0");
      v36 = (void *)v35;
    }
    v37 = _SpokenValueFromElementValue(v34, v66);
    v13 = [v32 stringWithFormat:@"%@ 0 %@", v35, v37];

    v38 = v36;
    v39 = v36;
    if (v33)
    {

      v38 = v51;
    }

    objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v66, "intValue") + -[__CFString intValue](v9, "intValue"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v40 = [v14 count];
    uint64_t v21 = v40;
    v41 = v61;
    v52 = v39;
    if (v10)
    {
      if (v40)
      {
        uint64_t v42 = 0;
        uint64_t v43 = (uint64_t)v58;
        do
        {
          v62 = v41;
          v59 = (void *)v43;
          v44 = [v14 objectAtIndex:v42];
          uint64_t v45 = [v44 mutableCopy];

          uint64_t v63 = v45;
          [v14 addObject:v45];
          v46 = [v67 objectAtIndex:v42];
          uint64_t v43 = [v46 mutableCopy];

          if (v43) {
            [v67 addObject:v43];
          }
          ++v42;
          v47 = (void *)v63;
          v41 = (void *)v63;
        }
        while (v21 != v42);
      }
      else
      {
        v47 = v61;
        uint64_t v43 = (uint64_t)v58;
      }
      v58 = (void *)v43;
      id v73 = v14;
      if (v65) {
        id v72 = v67;
      }
      _AppendValueToPhoneNumbersInRange(&v73, v54, v10, v13, v21, v21);
      id v48 = v73;

      uint64_t v6 = v17;
      if (!v65)
      {
        v25 = 0;
        id v12 = 0;
        id v71 = v48;
        id v14 = v48;
        v61 = v47;
        v24 = 0;
        uint64_t v23 = v53;
        goto LABEL_27;
      }
      id v49 = v72;

      id v12 = 0;
      id v71 = v48;
      id v14 = v48;
      v61 = v47;
      id v67 = v49;
      v24 = v65;
      uint64_t v23 = v53;
LABEL_26:
      id v70 = v67;
      v25 = &v70;
      goto LABEL_27;
    }
    id v12 = 0;
    v24 = v65;
    uint64_t v23 = v53;
LABEL_25:
    v10 = 0;
    v25 = 0;
    id v71 = v14;
    if (v24) {
      goto LABEL_26;
    }
LABEL_27:
    v26 = v14;
    _AppendValueToPhoneNumbersInRange(&v71, v25, v22, v12, 0, v21);
    id v14 = v71;

    if (v24)
    {
      id v27 = v70;

      id v67 = v27;
    }
    uint64_t v15 = v23;
    v9 = v22;
    uint64_t v11 = v66;
LABEL_30:
    ++v15;
  }
  while (v15 < v6);
  v8 = v56;
  a2 = v57;
  if (v57) {
LABEL_7:
  }
    *a2 = v14;
LABEL_8:
  if (v65) {
    void *v65 = v67;
  }
}

id _SpokenValueFromElementValue(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 objectForKey:v3];
  if (!v4) {
    id v4 = v3;
  }

  return v4;
}

void _AppendValueToPhoneNumbersInRange(id *a1, id *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v19 = a3;
  id v11 = a4;
  if (a6)
  {
    id v12 = 0;
    id v13 = 0;
  }
  else
  {
    if (!*a1) {
      *a1 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
    [*a1 addObject:v12];
    if (a2)
    {
      if (!*a2) {
        *a2 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
      [*a2 addObject:v13];
    }
    else
    {
      id v13 = 0;
    }
    a5 = [*a1 count] - 1;
    a6 = 1;
  }
  uint64_t v14 = a5 - 1;
  v18 = v11;
  if (v11) {
    id v15 = v11;
  }
  else {
    id v15 = v19;
  }
  do
  {
    v16 = v12;
    objc_msgSend(*a1, "objectAtIndex:", v14 + a6, v18);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [v12 appendString:v19];
    if (a2)
    {
      uint64_t v17 = [*a2 objectAtIndex:v14 + a6];

      [v17 appendString:v15];
      [v17 appendString:@" "];
      id v13 = v17;
    }
    --a6;
  }
  while (a6);
}

void _CreateNameDataSourceMap()
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  dispatch_queue_t v0 = [v3 pathForResource:@"VoiceDialNameDataSources" ofType:@"plist"];
  if (v0)
  {
    uint64_t v1 = [NSDictionary dictionaryWithContentsOfFile:v0];
    uint64_t v2 = (void *)__nameSourceMap;
    __nameSourceMap = v1;
  }
}

CFStringRef VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(const __CFString *a1)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v54 = 0u;
  CFIndex Length = CFStringGetLength(a1);
  if (Length < 1)
  {
    CFStringRef v27 = 0;
    id v8 = 0;
    id v7 = 0;
    goto LABEL_69;
  }
  CFIndex v3 = Length;
  CFIndex v51 = Length - 1;
  CFStringRef theString = a1;
  uint64_t v64 = 0;
  CFIndex v65 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v62 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v6 = 0;
  id v7 = 0;
  id v8 = 0;
  int64_t v9 = 0;
  uint64_t v10 = 0;
  int64_t v66 = 0;
  int64_t v67 = 0;
  uint64_t v63 = CStringPtr;
  int v11 = 1;
  uint64_t v12 = 64;
  do
  {
    if ((unint64_t)v9 >= 4) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = v9;
    }
    CFIndex v14 = v65;
    if (v65 <= v9) {
      goto LABEL_29;
    }
    if (v62)
    {
      UniChar v15 = v62[v9 + v64];
    }
    else if (v63)
    {
      UniChar v15 = v63[v64 + v9];
    }
    else
    {
      int64_t v16 = v66;
      if (v67 <= v9 || v66 > v9)
      {
        uint64_t v18 = -v13;
        uint64_t v19 = v13 + v6;
        uint64_t v20 = v12 - v13;
        int64_t v21 = v9 + v18;
        CFIndex v22 = v21 + 64;
        if (v21 + 64 >= v65) {
          CFIndex v22 = v65;
        }
        int64_t v66 = v21;
        int64_t v67 = v22;
        if (v65 >= v20) {
          CFIndex v14 = v20;
        }
        v75.length = v14 + v19;
        v75.location = v21 + v64;
        CFStringGetCharacters(theString, v75, buffer);
        int64_t v16 = v66;
      }
      UniChar v15 = buffer[v9 - v16];
    }
    if (v15 == 32)
    {
      if (!v11)
      {
        if (!v8) {
          id v8 = objc_alloc_init(MEMORY[0x263F089C8]);
        }
        [v8 addIndex:v9 - 1];
      }
      int v23 = 0;
      int v11 = 1;
    }
    else
    {
LABEL_29:
      if (v11 == 1)
      {
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
        }
        [v7 addIndex:v9];
        int v11 = 0;
        ++v10;
      }
      else
      {
        int v11 = 0;
      }
      int v23 = 1;
    }
    ++v9;
    --v6;
    ++v12;
  }
  while (v3 != v9);
  if (v23) {
    [v8 addIndex:v51];
  }
  if (v10 < 2) {
    goto LABEL_41;
  }
  CFIndex v24 = [v7 firstIndex];
  CFIndex v26 = v24;
  if (v10 == 2)
  {
    if (_IsNamePrefixString(a1, v24) != -1)
    {
LABEL_41:
      CFStringRef v27 = 0;
      goto LABEL_69;
    }
    uint64_t v45 = [v8 indexGreaterThanOrEqualToIndex:v26];
    CFAllocatorRef v44 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
LABEL_68:
    v77.length = v45 - v26 + 1;
    v77.location = v26;
    CFStringRef v27 = CFStringCreateWithSubstring(v44, a1, v77);
    goto LABEL_69;
  }
  int v28 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_66;
  }
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v52 = 0;
  *(void *)&long long v25 = 138412802;
  long long v47 = v25;
  CFIndex v29 = v24;
  CFIndex range = v24;
  range_8 = v8;
  do
  {
    uint64_t v30 = objc_msgSend(v8, "indexGreaterThanOrEqualToIndex:", v29, v47);
    uint64_t IsNamePrefixString = _IsNamePrefixString(a1, v29);
    ++v52;
    if (IsNamePrefixString == -1)
    {
      CFStringRef v27 = 0;
    }
    else
    {
      if (v29 == v26)
      {
        uint64_t v30 = objc_msgSend(v8, "indexGreaterThanOrEqualToIndex:", objc_msgSend(v7, "indexGreaterThanIndex:", IsNamePrefixString - 1));
        uint64_t v32 = v30 - v26;
        v33.location = v26;
      }
      else
      {
        CFIndex v34 = CFStringGetLength(a1);
        uint64_t v35 = PHDefaultLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v47;
          CFStringRef v69 = a1;
          __int16 v70 = 2048;
          CFIndex v71 = v29;
          __int16 v72 = 2048;
          CFIndex v73 = v34;
          _os_log_impl(&dword_22A5EB000, v35, OS_LOG_TYPE_DEFAULT, "_IsNameJoinerString name: %@ searchIndex: %lld wordLen: %lld", buf, 0x20u);
        }

        unint64_t v36 = 0;
        uint64_t v37 = -1;
        do
        {
          CFStringRef v38 = __SingleNameJoiners[v36];
          CFIndex v39 = CFStringGetLength(v38);
          uint64_t v40 = v39 + v29;
          if (v39 + v29 <= v34)
          {
            v76.length = v39;
            v76.location = v29;
            CFComparisonResult v42 = CFStringCompareWithOptions(a1, v38, v76, 1uLL);
            BOOL v41 = v42 == kCFCompareEqualTo;
            if (v42 == kCFCompareEqualTo) {
              uint64_t v37 = v40;
            }
          }
          else
          {
            BOOL v41 = 0;
          }
          if (v36 > 1) {
            break;
          }
          ++v36;
        }
        while (!v41);
        if (v37 == -1 || (unint64_t)(v10 - v52) < 2)
        {
          id v8 = range_8;
          uint64_t v30 = [range_8 indexLessThanIndex:v29];
          CFIndex v26 = range;
          uint64_t v32 = v30 - range;
          v33.location = range;
        }
        else
        {
          id v8 = range_8;
          uint64_t v32 = objc_msgSend(range_8, "indexGreaterThanOrEqualToIndex:", objc_msgSend(v7, "indexGreaterThanIndex:", v37 - 1));
          v33.location = 0;
          uint64_t v30 = v32;
          CFIndex v26 = range;
        }
      }
      v33.length = v32 + 1;
      CFStringRef v27 = CFStringCreateWithSubstring(alloc, a1, v33);
    }
    uint64_t v43 = [v7 indexGreaterThanIndex:v30];
    if (v43 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    CFIndex v29 = v43;
  }
  while (!v27);
  int v28 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  if (!v27)
  {
LABEL_66:
    CFAllocatorRef v44 = *v28;
    uint64_t v45 = [v8 indexGreaterThanOrEqualToIndex:v26];
    goto LABEL_68;
  }
LABEL_69:

  return v27;
}

uint64_t _IsNamePrefixString(const __CFString *a1, CFIndex a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    CFStringRef v14 = a1;
    __int16 v15 = 2048;
    CFIndex v16 = a2;
    __int16 v17 = 2048;
    CFIndex v18 = Length;
    _os_log_impl(&dword_22A5EB000, v5, OS_LOG_TYPE_DEFAULT, "_IsNamePrefixString name: %@ searchIndex: %lld wordLen: %lld", (uint8_t *)&v13, 0x20u);
  }

  unint64_t v6 = 0;
  uint64_t v7 = -1;
  while (1)
  {
    CFStringRef v8 = __SingleNamePrefixes[v6];
    CFIndex v9 = CFStringGetLength(v8);
    CFIndex v10 = v9 + a2;
    if (v9 + a2 <= Length)
    {
      v20.length = v9;
      v20.location = a2;
      if (CFStringCompareWithOptions(a1, v8, v20, 1uLL) == kCFCompareEqualTo) {
        break;
      }
    }
    if (v6++ >= 4) {
      return v7;
    }
  }
  return v10;
}

void VoiceDialCopyNameLabelAndTypeFromRecognitionResult(void *a1, void *a2, void *a3, void *a4, id *a5)
{
  id v9 = a1;
  CFIndex v10 = v9;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (v9)
  {
    uint64_t v22 = [v9 elementCount];
    if (v22 >= 1)
    {
      id v11 = 0;
      id v12 = 0;
      for (uint64_t i = 0; i != v22; ++i)
      {
        CFStringRef v14 = v12;
        __int16 v15 = v11;
        if ((!a2 || *a2) && (!a3 || *a3))
        {
          if (a4)
          {
            if (!a5 && *a4) {
              break;
            }
          }
          else if (!a5)
          {
            break;
          }
        }
        id v23 = v11;
        id v24 = v12;
        [v10 getElementClassIdentifier:&v24 value:&v23 atIndex:i];
        id v12 = v24;

        id v11 = v23;
        if (v11 && v12)
        {
          if (a2)
          {
            if (!*a2)
            {
              char v16 = [v12 isEqualToString:@"name"];
              __int16 v17 = v11;
              CFIndex v18 = a2;
              if (v16) {
                goto LABEL_34;
              }
            }
          }
          if (a3 && !*a3 && [v12 isEqualToString:@"label"]) {
            *a3 = v11;
          }
          if (a4)
          {
            if (!*a4)
            {
              char v19 = [v12 isEqualToString:@"labeltype-phone"];
              __int16 v17 = v12;
              CFIndex v18 = a4;
              if ((v19 & 1) != 0
                || (v20 = [v12 isEqualToString:@"labeltype-email"], __int16 v17 = v12, v18 = a4, v20))
              {
LABEL_34:
                void *v18 = v17;
              }
            }
          }
        }
        if (a5 && v11)
        {
          if (*a5)
          {
            [*a5 appendString:@" "];
            id v21 = *a5;
          }
          else
          {
            id v21 = objc_alloc_init(MEMORY[0x263F089D8]);
            *a5 = v21;
          }
          [v21 appendString:v11];
        }
      }
    }
  }
}

void VoiceDialCopyNamesLabelAndTypeFromRecognitionResults(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a1;
  CFStringRef v8 = v7;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v19 = a2;
    id v11 = 0;
    id v12 = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v22;
    while (1)
    {
      uint64_t v15 = 0;
      char v16 = v13;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v21 + 1) + 8 * v15);

        id v20 = 0;
        if (a3)
        {
          if (*a3) {
            __int16 v17 = 0;
          }
          else {
            __int16 v17 = a3;
          }
          if (!a4)
          {
LABEL_19:
            CFIndex v18 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          __int16 v17 = 0;
          if (!a4) {
            goto LABEL_19;
          }
        }
        if (*a4) {
          CFIndex v18 = 0;
        }
        else {
          CFIndex v18 = a4;
        }
LABEL_20:
        VoiceDialCopyNameLabelAndTypeFromRecognitionResult(v13, &v20, v17, v18, 0);
        id v12 = v20;
        if (v12)
        {
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          objc_msgSend(v11, "addObject:", v12, v19);
        }
        ++v15;
        char v16 = v13;
      }
      while (v10 != v15);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v10)
      {

        a2 = v19;
        if (v19) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
  }
  id v11 = 0;
  id v12 = 0;
  if (a2) {
LABEL_27:
  }
    *a2 = v11;
LABEL_28:
}

void VoiceDialSendNameAndExtendedLabelMatches(const void *a1, void *a2, int a3, int a4, void *a5, void *a6, void *a7, uint64_t (*a8)(id, __CFString *, const void *, uint64_t, void, void, uint64_t), uint64_t a9)
{
  id v59 = a2;
  long long v60 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v56 = v15;
  uint64_t v17 = [v15 length];
  if (v16)
  {
    int v51 = [v16 isEqualToString:@"labeltype-phone"];
    int v50 = [v16 isEqualToString:@"labeltype-email"];
    if (!a1) {
      goto LABEL_55;
    }
  }
  else
  {
    int v50 = 1;
    int v51 = 1;
    if (!a1) {
      goto LABEL_55;
    }
  }
  if (!v60) {
    goto LABEL_55;
  }
  CFArrayRef v18 = ABAddressBookCopyPeopleWithName(a1, v60);
  CFArrayRef v19 = v18;
  id v47 = v16;
  if (v18) {
    CFIndex Count = CFArrayGetCount(v18);
  }
  else {
    CFIndex Count = 0;
  }
  uint64_t v21 = [v59 nameTypes];
  uint64_t v22 = v21 | 3;
  if (!a3) {
    uint64_t v22 = v21;
  }
  uint64_t v23 = 8;
  if (!a4) {
    uint64_t v23 = 0;
  }
  if (Count >= 1)
  {
    CFTypeRef v24 = 0;
    CFTypeRef v25 = 0;
    CFIndex v26 = 0;
    unint64_t v52 = v22 & 0xFFFFFFFFFFFFFFF7 | v23;
    unsigned int property = *MEMORY[0x263F24570];
    unsigned int v54 = *MEMORY[0x263F243C8];
    CFIndex v48 = Count;
    CFArrayRef v49 = v19;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v19, v26);
      unsigned int v58 = [v59 matchingNameType:v60 fromTypes:v52 forPerson:ValueAtIndex];
      if (v58 == -1)
      {
        int v31 = 1;
        goto LABEL_51;
      }
      if (v51) {
        CFTypeRef v25 = ABRecordCopyValue(ValueAtIndex, property);
      }
      if (v50) {
        CFTypeRef v24 = ABRecordCopyValue(ValueAtIndex, v54);
      }
      CFIndex v53 = v26;
      if (v25)
      {
        CFIndex v28 = ABMultiValueGetCount(v25);
        if (v28 >= 1)
        {
          CFIndex v29 = v28;
          CFIndex v30 = 0;
          int v31 = 1;
          while (v17)
          {
            uint64_t v32 = (__CFString *)ABMultiValueCopyLabelAtIndex(v25, v30);
            if (v32)
            {
              CFRange v33 = v32;
              CFIndex v34 = VoiceDialCopySpokenLocalizedLabel(v32);
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = [v56 caseInsensitiveCompare:v34];
                CFRelease(v35);
                CFRelease(v33);
                if (!v36) {
                  break;
                }
              }
              else
              {
                CFRelease(v33);
              }
            }
LABEL_30:
            if (v29 == ++v30) {
              goto LABEL_36;
            }
          }
          uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v25, v30);
          if (IdentifierAtIndex != -1) {
            int v31 = a8(v59, v60, ValueAtIndex, IdentifierAtIndex, property, v58, a9);
          }
          goto LABEL_30;
        }
        int v31 = 1;
LABEL_36:
        CFRelease(v25);
        if (!v24) {
          goto LABEL_48;
        }
      }
      else
      {
        int v31 = 1;
        if (!v24) {
          goto LABEL_48;
        }
      }
      if (v31)
      {
        CFIndex v38 = ABMultiValueGetCount(v24);
        if (v38 >= 1)
        {
          CFIndex v39 = v38;
          CFIndex v40 = 0;
          while (v17)
          {
            BOOL v41 = (__CFString *)ABMultiValueCopyLabelAtIndex(v24, v40);
            if (v41)
            {
              CFComparisonResult v42 = v41;
              uint64_t v43 = VoiceDialCopySpokenLocalizedLabel(v41);
              if (v43)
              {
                CFAllocatorRef v44 = v43;
                uint64_t v45 = [v56 caseInsensitiveCompare:v43];
                CFRelease(v44);
                CFRelease(v42);
                if (!v45) {
                  break;
                }
              }
              else
              {
                CFRelease(v42);
              }
            }
LABEL_47:
            if (v39 == ++v40) {
              goto LABEL_48;
            }
          }
          uint64_t v46 = ABMultiValueGetIdentifierAtIndex(v24, v40);
          if (v46 != -1) {
            int v31 = a8(v59, v60, ValueAtIndex, v46, v54, v58, a9);
          }
          goto LABEL_47;
        }
LABEL_49:
        CFIndex Count = v48;
        CFArrayRef v19 = v49;
        CFIndex v26 = v53;
        CFRelease(v24);
        goto LABEL_51;
      }
LABEL_48:
      if (v24) {
        goto LABEL_49;
      }
      CFIndex Count = v48;
      CFArrayRef v19 = v49;
      CFIndex v26 = v53;
LABEL_51:
      ++v26;
    }
    while (v26 < Count && v31 == 1);
  }
  id v16 = v47;
  if (v19) {
    CFRelease(v19);
  }
LABEL_55:
}

void *VoiceDialCopySpokenLocalizedLabel(void *key)
{
  if (!key) {
    return 0;
  }
  if (!__VoiceDialLocalizedLabels
    || (Value = (void *)CFDictionaryGetValue((CFDictionaryRef)__VoiceDialLocalizedLabels, key)) == 0)
  {
    Value = key;
  }
  CFRetain(Value);
  return Value;
}

id VoiceDialCopyMostLikelyNumberWithPersonAndLabel(uint64_t a1, uint64_t a2)
{
  id result = 0;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFE9F8], "contactFromPerson:keysToFetch:");
    unint64_t v6 = [MEMORY[0x263EFEA98] sharedInstance];
    CFTypeRef v24 = (void *)v5;
    id v7 = [v6 entriesForContact:v5];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v9)
    {
      id v25 = 0;
      goto LABEL_18;
    }
    uint64_t v10 = v9;
    id v25 = 0;
    uint64_t v26 = a2;
    uint64_t v11 = *(void *)v29;
    uint64_t v12 = *MEMORY[0x263EFDEF8];
    uint64_t v13 = *MEMORY[0x263EFDEE8];
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v16 = [v15 contactProperty];
        uint64_t v17 = [v15 actionType];
        if (([v17 isEqual:v12] & 1) == 0) {
          goto LABEL_13;
        }
        CFArrayRef v18 = [v15 bundleIdentifier];
        if (([v18 isEqual:v13] & 1) == 0)
        {

LABEL_13:
          goto LABEL_14;
        }
        [v16 label];
        uint64_t v19 = v12;
        uint64_t v20 = v11;
        uint64_t v21 = v13;
        uint64_t v23 = v22 = v8;
        uint64_t v27 = [v23 caseInsensitiveCompare:v26];

        id v8 = v22;
        uint64_t v13 = v21;
        uint64_t v11 = v20;
        uint64_t v12 = v19;

        if (!v27) {
          id v25 = stringValueForContactProperty(v16);
        }
LABEL_14:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v10)
      {
LABEL_18:

        return v25;
      }
    }
  }
  return result;
}

id stringValueForContactProperty(void *a1)
{
  uint64_t v1 = [a1 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 stringValue];
LABEL_5:
    CFIndex v3 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    goto LABEL_5;
  }
  CFIndex v3 = 0;
LABEL_7:

  return v3;
}

void *VoiceDialGetMostLikelyFacetimeContactWithPersonAndLabel(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x263EFE9F8] contactFromPerson:a1 keysToFetch:MEMORY[0x263EFFA68]];
  id v4 = [MEMORY[0x263EFEA98] sharedInstance];
  uint64_t v37 = (void *)v3;
  uint64_t v5 = [v4 entriesForContact:v3];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  uint64_t v40 = a2;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    uint64_t v9 = *MEMORY[0x263EFDF38];
    uint64_t v10 = *MEMORY[0x263EFDEC0];
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v47 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v46 + 1) + 8 * v11);
      uint64_t v13 = [v12 contactProperty];
      uint64_t v14 = [v12 actionType];
      if (![v14 isEqual:v9]) {
        goto LABEL_13;
      }
      id v15 = [v12 bundleIdentifier];
      if (![v15 isEqual:v10]) {
        break;
      }
      if (!a2)
      {

LABEL_17:
        id v18 = stringValueForContactProperty(v13);
        if (v18)
        {
          uint64_t v35 = v18;
LABEL_39:
          CFIndex v34 = v37;

          goto LABEL_40;
        }
        goto LABEL_14;
      }
      id v16 = [v13 label];
      uint64_t v17 = [v16 caseInsensitiveCompare:v40];

      a2 = v40;
      if (!v17) {
        goto LABEL_17;
      }
LABEL_14:

      if (v7 == ++v11)
      {
        uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        uint64_t v7 = v19;
        if (v19) {
          goto LABEL_4;
        }
        goto LABEL_20;
      }
    }

LABEL_13:
    goto LABEL_14;
  }
LABEL_20:

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v39 = obj;
  uint64_t v20 = [v39 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    unint64_t v23 = 0x263F4A000uLL;
    unint64_t v24 = 0x263F4A000uLL;
    while (2)
    {
      uint64_t v25 = 0;
      uint64_t v38 = v21;
      do
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v39);
        }
        uint64_t v13 = [*(id *)(*((void *)&v42 + 1) + 8 * v25) contactProperty];
        uint64_t v35 = stringValueForContactProperty(v13);
        uint64_t v26 = IMCleanupPhoneNumber();
        uint64_t v27 = [*(id *)(v23 + 1424) sharedInstance];
        long long v28 = [*(id *)(v24 + 1552) facetimeService];
        if ([v27 statusForID:v26 onService:v28] == 1)
        {
          if (v40)
          {
            [v13 label];
            unint64_t v29 = v23;
            v31 = uint64_t v30 = v22;
            uint64_t v32 = [v31 caseInsensitiveCompare:v40];

            uint64_t v22 = v30;
            unint64_t v23 = v29;
            unint64_t v24 = 0x263F4A000;

            if (v32) {
              BOOL v33 = 1;
            }
            else {
              BOOL v33 = v35 == 0;
            }
            uint64_t v21 = v38;
            if (!v33)
            {
LABEL_38:

              goto LABEL_39;
            }
          }
          else
          {

            uint64_t v21 = v38;
            if (v35) {
              goto LABEL_38;
            }
          }
        }
        else
        {
        }
        ++v25;
      }
      while (v21 != v25);
      uint64_t v21 = [v39 countByEnumeratingWithState:&v42 objects:v50 count:16];
      uint64_t v35 = 0;
      CFIndex v34 = v37;
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v35 = 0;
    CFIndex v34 = v37;
  }
LABEL_40:

  return v35;
}

BOOL VoiceDialPersonIsCompany(const void *a1)
{
  CFNumberRef v1 = (const __CFNumber *)ABRecordCopyValue(a1, *MEMORY[0x263F244B8]);
  if (!v1) {
    return 0;
  }
  CFNumberRef v2 = v1;
  BOOL v3 = CFNumberCompare(v1, (CFNumberRef)*MEMORY[0x263F244A8], 0) == kCFCompareEqualTo;
  CFRelease(v2);
  return v3;
}

void VoiceDialAppendCompositeNamePropertyValue(CFMutableStringRef *a1, ABRecordRef record, ABPropertyID property, ABPropertyID a4, ABPropertyID a5, char a6, unsigned char *a7, const __CFString *cf, int a9)
{
  CFStringRef v9 = cf;
  if ((a6 & 1) == 0 && *MEMORY[0x263F244F8] == property) {
    return;
  }
  if (property == a9)
  {
    if (!cf) {
      return;
    }
    CFRetain(cf);
  }
  else
  {
    CFStringRef v9 = (const __CFString *)ABRecordCopyValue(record, property);
    if (!v9) {
      return;
    }
  }
  if (CFStringGetLength(v9) >= 1)
  {
    if ((a6 & 2) == 0)
    {
LABEL_10:
      CFStringRef v16 = v9;
LABEL_18:
      if (*a1)
      {
        CFStringAppend(*a1, @" ");
        Mutable = *a1;
      }
      else
      {
        Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        *a1 = Mutable;
      }
      CFStringAppend(Mutable, v16);
      goto LABEL_22;
    }
    CFStringRef v17 = (const __CFString *)ABRecordCopyValue(record, a4);
    if (v17)
    {
      CFStringRef v16 = v17;
      if (CFStringGetLength(v17)) {
        goto LABEL_17;
      }
      CFRelease(v16);
    }
    CFStringRef v18 = (const __CFString *)ABRecordCopyValue(record, a5);
    if (!v18) {
      goto LABEL_10;
    }
    CFStringRef v16 = v18;
    if (!CFStringGetLength(v18))
    {
      CFRelease(v16);
      goto LABEL_10;
    }
LABEL_17:
    CFRelease(v9);
    *a7 = 1;
    goto LABEL_18;
  }
  CFStringRef v16 = v9;
LABEL_22:

  CFRelease(v16);
}

CFMutableStringRef VoiceDialPersonCopyCompositeNameWithSubstitution(ABRecordRef record, const __CFString *a2, int a3, char a4)
{
  CFMutableStringRef v27 = 0;
  char v26 = 0;
  uint64_t v8 = (ABPropertyID *)MEMORY[0x263F244F8];
  if ((a4 & 8) != 0)
  {
    CFStringRef v9 = (const __CFString *)ABRecordCopyValue(record, *MEMORY[0x263F244F8]);
    CFMutableStringRef v10 = (CFMutableStringRef)v9;
    if (!v9) {
      return v10;
    }
    CFIndex Length = CFStringGetLength(v9);
    CFRelease(v10);
    if (!Length) {
      return 0;
    }
  }
  if (VoiceDialPersonIsCompany(record))
  {
    CFStringRef v12 = (const __CFString *)ABRecordCopyValue(record, *MEMORY[0x263F24518]);
    CFMutableStringRef v27 = (CFMutableStringRef)v12;
    if (v12)
    {
      CFMutableStringRef v10 = (CFMutableStringRef)v12;
      if (CFStringGetLength(v12))
      {
        BOOL v13 = 1;
        goto LABEL_37;
      }
      CFRelease(v10);
      CFMutableStringRef v27 = 0;
    }
  }
  ABPersonCompositeNameFormat CompositeNameFormatForRecord = ABPersonGetCompositeNameFormatForRecord(0);
  if (CompositeNameFormatForRecord) {
    ABPropertyID v15 = *MEMORY[0x263F244E8];
  }
  else {
    ABPropertyID v15 = *MEMORY[0x263F244C0];
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v16 = *MEMORY[0x263F243F8];
  }
  else {
    ABPropertyID v16 = *MEMORY[0x263F244E8];
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v17 = *MEMORY[0x263F244C0];
  }
  else {
    ABPropertyID v17 = *MEMORY[0x263F243F8];
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v18 = *MEMORY[0x263F244F0];
  }
  else {
    ABPropertyID v18 = *MEMORY[0x263F244C8];
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v19 = *MEMORY[0x263F24400];
  }
  else {
    ABPropertyID v19 = *MEMORY[0x263F244F0];
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v20 = *MEMORY[0x263F244C8];
  }
  else {
    ABPropertyID v20 = *MEMORY[0x263F24400];
  }
  ABPropertyID v21 = *v8;
  if (CompositeNameFormatForRecord) {
    ABPropertyID v22 = *v8;
  }
  else {
    ABPropertyID v22 = *MEMORY[0x263F244D0];
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v23 = *MEMORY[0x263F24408];
  }
  else {
    ABPropertyID v23 = v21;
  }
  if (CompositeNameFormatForRecord) {
    ABPropertyID v24 = *MEMORY[0x263F244D0];
  }
  else {
    ABPropertyID v24 = *MEMORY[0x263F24408];
  }
  VoiceDialAppendCompositeNamePropertyValue(&v27, record, v24, v20, v17, a4, &v26, a2, a3);
  VoiceDialAppendCompositeNamePropertyValue(&v27, record, v23, v19, v16, a4, &v26, a2, a3);
  VoiceDialAppendCompositeNamePropertyValue(&v27, record, v22, v18, v15, a4, &v26, a2, a3);
  CFMutableStringRef v10 = v27;
  BOOL v13 = v26 == 0;
LABEL_37:
  if ((a4 & 4) != 0 && v13 && v10)
  {
    CFRelease(v10);
    return 0;
  }
  return v10;
}

CFMutableStringRef VoiceDialPersonCopyCompositeName(const void *a1, char a2)
{
  return VoiceDialPersonCopyCompositeNameWithSubstitution(a1, 0, -1, a2);
}

id VoiceDialCopyErrorActionForResult(void *a1)
{
  CFNumberRef v1 = (objc_class *)MEMORY[0x263F255D8];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  int v4 = [v3 airplaneMode];

  uint64_t v5 = [v2 valueOfFirstElementWithClassIdentifier:@"facetime"];

  uint64_t v6 = [v2 recognitionAction];

  LOBYTE(v2) = [v6 sensitiveActionsEnabled];
  if ((v2 & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x263F84E78]);
    uint64_t v8 = @"SENSITIVE_ACTIONS_OFF";
    goto LABEL_5;
  }
  if (v4)
  {
    id v7 = objc_alloc(MEMORY[0x263F84E78]);
    uint64_t v8 = @"AIRPLANE_MODE_ON";
LABEL_5:
    CFStringRef v9 = VoiceDialSpokenLocalizedString(v8);
    CFMutableStringRef v10 = (void *)[v7 initWithSpokenFeedbackString:v9 willTerminate:1];

    goto LABEL_6;
  }
  if (v5)
  {
    if (([MEMORY[0x263F7E198] isFaceTimeVideoAvailable] & 1) == 0)
    {
      id v7 = objc_alloc(MEMORY[0x263F84E78]);
      uint64_t v8 = @"FACETIME_NOT_ENABLED";
      goto LABEL_5;
    }
  }
  else
  {
    CFStringRef Status = (const __CFString *)CTRegistrationGetStatus();
    if (Status)
    {
      CFStringRef v13 = Status;
      if (CFStringCompare(Status, (CFStringRef)*MEMORY[0x263F03008], 0))
      {
        if (CFStringCompare(v13, (CFStringRef)*MEMORY[0x263F03010], 0))
        {
          id v7 = objc_alloc(MEMORY[0x263F84E78]);
          uint64_t v8 = @"NOT_REGISTERED";
          goto LABEL_5;
        }
      }
    }
  }
  CFMutableStringRef v10 = 0;
LABEL_6:

  return v10;
}

id VoiceDialSpokenLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = VoiceDialSpokenLocalizedStringIfAvailable(v1);
  if (!v2)
  {
    id v3 = VoiceDialBundle();
    id v2 = [v3 localizedStringForKey:v1 value:&stru_26DE2E3C8 table:@"Feedback"];
  }

  return v2;
}

id VoiceDialBundle()
{
  dispatch_queue_t v0 = (void *)VoiceDialBundle___vdBundle;
  if (!VoiceDialBundle___vdBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = (void *)VoiceDialBundle___vdBundle;
    VoiceDialBundle___vdBundle = v1;

    dispatch_queue_t v0 = (void *)VoiceDialBundle___vdBundle;
  }

  return v0;
}

id VoiceDialSpokenLocalizedStringIfAvailable(void *a1)
{
  id v1 = a1;
  id v2 = (const void *)VSPreferencesCopySpokenLanguageIdentifier();
  pthread_mutex_lock(&VoiceDialSpokenLocalizedStringIfAvailable___locStringCacheLock);
  if (VoiceDialSpokenLocalizedStringIfAvailable___locStringCache)
  {
    char v3 = [(id)VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID isEqualToString:v2];
    int v4 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
    if (v3)
    {
      uint64_t v5 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    int v4 = 0;
  }
  VoiceDialSpokenLocalizedStringIfAvailable___locStringCache = 0;

  if (VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID) {
    CFRelease((CFTypeRef)VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID);
  }
  VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID = 0;
  if (v2)
  {
    uint64_t v6 = VoiceDialBundle();
    uint64_t v5 = VSRecognitionModelCopyResourceURL();

    if (v5)
    {
      uint64_t v7 = [objc_alloc(NSDictionary) initWithContentsOfURL:v5];
      uint64_t v8 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
      VoiceDialSpokenLocalizedStringIfAvailable___locStringCache = v7;
    }
    VoiceDialSpokenLocalizedStringIfAvailable___locStringCachedLanguageID = (uint64_t)v2;
    CFRetain(v2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v4 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
  if (!VoiceDialSpokenLocalizedStringIfAvailable___locStringCache)
  {
    id v9 = objc_alloc_init(NSDictionary);
    CFMutableStringRef v10 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
    VoiceDialSpokenLocalizedStringIfAvailable___locStringCache = (uint64_t)v9;

    int v4 = (void *)VoiceDialSpokenLocalizedStringIfAvailable___locStringCache;
  }
LABEL_14:
  uint64_t v11 = [v4 objectForKey:v1];
  pthread_mutex_unlock(&VoiceDialSpokenLocalizedStringIfAvailable___locStringCacheLock);
  if (v2) {
    CFRelease(v2);
  }

  return v11;
}

void VoiceDialConfigureSpokenLocalizedLabel(int a1)
{
  if (!a1)
  {
    if (!__VoiceDialLocalizedLabels)
    {
      id v9 = 0;
      id v1 = 0;
      goto LABEL_19;
    }
    CFRelease((CFTypeRef)__VoiceDialLocalizedLabels);
    id v6 = 0;
    id v1 = 0;
    __VoiceDialLocalizedLabels = 0;
    goto LABEL_18;
  }
  id v1 = MEMORY[0x22A6CE3A0]();
  if (![v1 count])
  {
    id v9 = 0;
    uint64_t v5 = 0;
    char v3 = (const void *)__VoiceDialLocalizedLabels;
    if (!__VoiceDialLocalizedLabels) {
      goto LABEL_15;
    }
LABEL_14:
    CFRelease(v3);
    __VoiceDialLocalizedLabels = 0;
    uint64_t v7 = (void *)__VoiceDialLocalizedLabelLanguageCode;
    __VoiceDialLocalizedLabelLanguageCode = 0;

    uint64_t v5 = __VoiceDialLocalizedLabels;
    goto LABEL_15;
  }
  uint64_t v2 = [v1 objectAtIndex:0];
  char v3 = (const void *)__VoiceDialLocalizedLabels;
  if (__VoiceDialLocalizedLabels)
  {
    if (v2)
    {
      id v9 = (id)v2;
      char v4 = objc_msgSend((id)__VoiceDialLocalizedLabelLanguageCode, "isEqualToString:");
      char v3 = (const void *)__VoiceDialLocalizedLabels;
      uint64_t v5 = __VoiceDialLocalizedLabels;
      if (v4) {
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = 0;
    }
    goto LABEL_14;
  }
  id v9 = (id)v2;
  uint64_t v5 = 0;
LABEL_15:
  if (v1 && !v5)
  {
    __VoiceDialLocalizedLabels = ABAddressBookCopyLocalizedStringsForLanguageArray();
    id v6 = v9;
LABEL_18:
    id v9 = v6;
    uint64_t v8 = (void *)__VoiceDialLocalizedLabelLanguageCode;
    __VoiceDialLocalizedLabelLanguageCode = (uint64_t)v6;
  }
LABEL_19:
}

id VoiceDialNumberToDialForNumber(void *a1)
{
  id v1 = a1;
  uint64_t v2 = VoiceDialNumberToDialForNumber___InternationalAssistFunction;
  if (VoiceDialNumberToDialForNumber___InternationalAssistFunction
    || ((char v3 = (void *)VoiceDialTelephonyUtilitiesFrameworkHandle()) == 0
      ? (uint64_t v2 = VoiceDialNumberToDialForNumber___InternationalAssistFunction)
      : (uint64_t v2 = dlsym(v3, "TUNumberToDial"), VoiceDialNumberToDialForNumber___InternationalAssistFunction = v2),
        char v4 = v1,
        v2))
  {
    char v4 = ((void (*)(id, void, void, void, void))v2)(v1, 0, 0, 0, 0);
  }

  return v4;
}

uint64_t VoiceDialTelephonyUtilitiesFrameworkHandle()
{
  uint64_t result = VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle;
  if (!VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle)
  {
    id v1 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities"];
    VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle = (uint64_t)dlopen((const char *)[v1 fileSystemRepresentation], 2);

    return VoiceDialTelephonyUtilitiesFrameworkHandle___TelephonyUtilitiesHandle;
  }
  return result;
}

uint64_t _VoiceDialAddressBookChangedCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _handleAddressBookChanged];
}

void sub_22A5F46E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
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

void sub_22A5F520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22A5F5638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Block_object_dispose((const void *)(v29 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _VoiceDialAddressBookPrefsChangedCallBack()
{
  return VSRecognitionModelDataProviderChanged();
}

uint64_t _VoiceDialPreferencesChangedCallBack()
{
  return VSRecognitionModelDataProviderChanged();
}

uint64_t _ResultValidationAddressBookCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (a7) {
    *a7 = 1;
  }
  return 0;
}

uint64_t _ResultDisambiguationAddressBookCallback(void *a1, void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = a7;
  CFStringRef v13 = (void *)ABRecordCopyValue(a3, [v12 previousNameProperty]);
  if (!v13
    || ([v12 previousName],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v13 caseInsensitiveCompare:v14],
        v14,
        v15))
  {
    id v16 = 0;
    ABPropertyID v17 = 0;
    goto LABEL_22;
  }
  id v34 = v11;
  uint64_t v18 = [v10 personNameCount];
  if (v18)
  {
    unint64_t v19 = v18;
    unint64_t v35 = 0;
    ABPropertyID v17 = 0;
    id v16 = 0;
    uint64_t v20 = 0;
    while (1)
    {
      if ([v10 typeOfNameAtIndex:v20] == 2)
      {
        id v36 = v16;
        int v21 = [v10 getName:&v36 phoneticName:0 atIndex:v20 forPerson:a3];
        id v22 = v36;

        if (!v21) {
          goto LABEL_12;
        }
        ABPropertyID v23 = [v12 matchedName];
        uint64_t v24 = [v22 caseInsensitiveCompare:v23];

        if (!v24)
        {
          id v16 = v22;
          goto LABEL_21;
        }
        if (!v22)
        {
          id v16 = 0;
          goto LABEL_14;
        }
        unint64_t v25 = [v22 length];
        if (v25 > v35)
        {
          unint64_t v26 = v25;
          id v16 = v22;

          ABPropertyID v17 = v16;
          unint64_t v35 = v26;
        }
        else
        {
LABEL_12:
          id v16 = v22;
        }
      }
LABEL_14:
      if (++v20 >= v19) {
        goto LABEL_17;
      }
    }
  }
  id v16 = 0;
  ABPropertyID v17 = 0;
LABEL_17:
  CFMutableStringRef v27 = [v12 matchedName];
  uint64_t v28 = [v27 caseInsensitiveCompare:v13];

  if (v28 && v17)
  {
    uint64_t v29 = objc_msgSend(*(id *)objc_msgSend(v12, "result"), "recognitionResultByReplacingValueForClassIdentifier:withValue:", @"name", v17);
    uint64_t v30 = (void **)[v12 result];
    long long v31 = *v30;
    *uint64_t v30 = (void *)v29;
  }
LABEL_21:
  id v11 = v34;
  [v12 setResultFound:1];
LABEL_22:
  uint64_t v32 = [v12 resultFound] ^ 1;

  return v32;
}

uint64_t ABAddressBookCopyAllLabelsForProperty()
{
  return MEMORY[0x270F0B398]();
}

uint64_t ABAddressBookCopyChangesSinceSequenceNumber()
{
  return MEMORY[0x270F0B3D8]();
}

CFStringRef ABAddressBookCopyLocalizedLabel(CFStringRef label)
{
  return (CFStringRef)MEMORY[0x270F0B3F0](label);
}

uint64_t ABAddressBookCopyLocalizedStringsForLanguageArray()
{
  return MEMORY[0x270F0B3F8]();
}

CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef addressBook, CFStringRef name)
{
  return (CFArrayRef)MEMORY[0x270F0B408](addressBook, name);
}

uint64_t ABAddressBookCopyUniqueIdentifier()
{
  return MEMORY[0x270F0B420]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x270F0B438](options, error);
}

CFIndex ABAddressBookGetPersonCount(ABAddressBookRef addressBook)
{
  return MEMORY[0x270F0B448](addressBook);
}

uint64_t ABAddressBookGetSequenceNumber()
{
  return MEMORY[0x270F0B460]();
}

uint64_t ABAddressBookInvalidateCaches()
{
  return MEMORY[0x270F0B468]();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

uint64_t ABCopyArrayOfPeopleAtOffset()
{
  return MEMORY[0x270F0B500]();
}

CFStringRef ABMultiValueCopyLabelAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFStringRef)MEMORY[0x270F0B558](multiValue, index);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x270F0B560](multiValue, index);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x270F0B578](multiValue);
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x270F0B580](multiValue, index);
}

CFIndex ABMultiValueGetIndexForIdentifier(ABMultiValueRef multiValue, ABMultiValueIdentifier identifier)
{
  return MEMORY[0x270F0B588](multiValue, *(void *)&identifier);
}

ABPersonCompositeNameFormat ABPersonGetCompositeNameFormatForRecord(ABRecordRef record)
{
  return MEMORY[0x270F0B5E8](record);
}

CFStringRef ABRecordCopyCompositeName(ABRecordRef record)
{
  return (CFStringRef)MEMORY[0x270F0B650](record);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x270F0B658](record, *(void *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x270F0B670](record);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

uint64_t CFPhoneNumberCopyUnformattedRepresentation()
{
  return MEMORY[0x270F0CCD0]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F0CCD8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

uint64_t CTRegistrationGetStatus()
{
  return MEMORY[0x270EE86C8]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

uint64_t IMCleanupPhoneNumber()
{
  return MEMORY[0x270F3CCC0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x270F0CE00]();
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x270F7CB40]();
}

uint64_t TUHomeCountryCode()
{
  return MEMORY[0x270F7CB58]();
}

uint64_t TUNetworkCountryCode()
{
  return MEMORY[0x270F7CB68]();
}

uint64_t TUStringsAreEqualOrNil()
{
  return MEMORY[0x270F7CB88]();
}

uint64_t VSPreferencesCopySpokenLanguageIdentifier()
{
  return MEMORY[0x270F84538]();
}

uint64_t VSRecognitionModelCopyActiveLanguageIdentifier()
{
  return MEMORY[0x270F84548]();
}

uint64_t VSRecognitionModelCopyActiveLanguageIdentifierArray()
{
  return MEMORY[0x270F84550]();
}

uint64_t VSRecognitionModelCopyLanguageResourceURL()
{
  return MEMORY[0x270F84558]();
}

uint64_t VSRecognitionModelCopyResourceURL()
{
  return MEMORY[0x270F84560]();
}

uint64_t VSRecognitionModelDataProviderChanged()
{
  return MEMORY[0x270F84568]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}