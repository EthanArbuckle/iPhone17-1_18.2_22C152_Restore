@interface TTSAXResourceMigrationUtilities
+ (id)sharedInstance;
- (AXAssetsService)assetsService;
- (BOOL)isMigrationComplete;
- (BOOL)resourceNeedsMigration:(id)a3;
- (NSDictionary)obsoleteVoicesWithReplacements;
- (TTSAXResourceMigrationUtilities)init;
- (id)_readIsMigrationCompleteFromPreferences;
- (id)_readVoiceIdentifiersToMigrateFromPreferences;
- (id)_remapGenderedSiriVoiceIdentifiers:(id)a3;
- (id)convertIdentifierIfNeeded:(id)a3;
- (id)legacyIdentifierForUpdatedIdentifierDuringMigration:(id)a3;
- (id)updatedIdentifierForLegacyIdentifier:(id)a3 withLanguageCode:(id)a4;
- (void)deleteCompactResourceIfNeededForIdentifier:(id)a3;
- (void)downloadCompactResourceIfNeededForIdentifier:(id)a3;
- (void)resourceCompletedMigration:(id)a3;
- (void)restartMigrationIfNeeded;
- (void)setAssetsService:(id)a3;
- (void)setIsMigrationComplete:(BOOL)a3;
- (void)setObsoleteVoicesWithReplacements:(id)a3;
- (void)writeIsMigrationCompleteToPreferences:(id)a3;
- (void)writeVoiceIdentifiersToMigrateToPreferences:(id)a3;
@end

@implementation TTSAXResourceMigrationUtilities

- (TTSAXResourceMigrationUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)TTSAXResourceMigrationUtilities;
  v2 = [(TTSAXResourceMigrationUtilities *)&v6 init];
  if (v2)
  {
    v3 = (AXAssetsService *)objc_alloc_init(MEMORY[0x1E4F47E28]);
    assetsService = v2->_assetsService;
    v2->_assetsService = v3;
  }
  return v2;
}

- (id)_remapGenderedSiriVoiceIdentifiers:(id)a3
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (qword_1EB67AAA0 != -1) {
    dispatch_once(&qword_1EB67AAA0, &unk_1EFB7E238);
  }
  unsigned int hasPrefix = objc_msgSend_hasPrefix_(v6, v3, qword_1EB67AA88, v4, v5);
  int v140 = objc_msgSend_hasPrefix_(v6, v8, qword_1EB67AA80, v9, v10);
  unsigned int v14 = objc_msgSend_hasPrefix_(v6, v11, qword_1EB67AA98, v12, v13);
  int v139 = objc_msgSend_hasPrefix_(v6, v15, qword_1EB67AA90, v16, v17);
  unint64_t v138 = __PAIR64__(v14, hasPrefix);
  int v21 = hasPrefix | v14;
  if (((hasPrefix | v14) & 1) == 0 && (v140 & 1) == 0 && !v139) {
    goto LABEL_55;
  }
  v136 = v6;
  v137 = objc_msgSend_componentsSeparatedByString_(v6, v18, @"_", v19, v20);
  if (objc_msgSend_count(v137, v22, v23, v24, v25) != 4)
  {
    id v127 = v6;

    goto LABEL_56;
  }
  v29 = objc_msgSend_objectAtIndexedSubscript_(v137, v26, 2, v27, v28);
  v142 = objc_msgSend_objectAtIndexedSubscript_(v137, v30, 3, v31, v32);
  uint64_t v148 = 0;
  v149 = &v148;
  uint64_t v150 = 0x2050000000;
  v37 = (void *)qword_1E96C4748;
  uint64_t v151 = qword_1E96C4748;
  if (!qword_1E96C4748)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v154 = sub_1A66EB59C;
    v155 = &unk_1E5C696C8;
    v156 = &v148;
    sub_1A66EB59C((uint64_t)&buf, v33, v34, v35, v36);
    v37 = (void *)v149[3];
  }
  id v38 = v37;
  _Block_object_dispose(&v148, 8);
  v43 = objc_msgSend_sharedInstance(v38, v39, v40, v41, v42);
  v46 = v43;
  if (v21) {
    objc_msgSend_voiceNamesForOutputLanguageCode_gender_(v43, v44, (uint64_t)v29, 1, v45);
  }
  else {
  v141 = objc_msgSend_voiceNamesForOutputLanguageCode_gender_(v43, v44, (uint64_t)v29, 2, v45);
  }

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v51 = objc_msgSend_sharedInstance(TTSAXResourceManager, v47, v48, v49, v50);
  objc_msgSend_allVoices_(v51, v52, 0, v53, v54);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v144, (uint64_t)v152, 16);
  if (!v60) {
    goto LABEL_54;
  }
  uint64_t v61 = *(void *)v145;
  uint64_t v135 = v138 ^ 0x100000001;
  while (2)
  {
    uint64_t v62 = 0;
    do
    {
      if (*(void *)v145 != v61) {
        objc_enumerationMutation(obj);
      }
      v63 = *(void **)(*((void *)&v144 + 1) + 8 * v62);
      v64 = objc_msgSend_language(v63, v56, v57, v58, v59, v135);
      if ((objc_msgSend_isEqualToString_(v64, v65, (uint64_t)v29, v66, v67) & 1) == 0)
      {

        goto LABEL_27;
      }
      v72 = objc_msgSend_identifier(v63, v68, v69, v70, v71);
      int hasSuffix = objc_msgSend_hasSuffix_(v72, v73, (uint64_t)v142, v74, v75);

      if (!hasSuffix) {
        goto LABEL_27;
      }
      v77 = objc_msgSend_identifier(v63, v56, v57, v58, v59);
      if (!objc_msgSend_hasPrefix_(v77, v78, @"com.apple.ttsbundle.gryphon", v79, v80)) {
        goto LABEL_31;
      }
      if (!v139)
      {
        if (HIDWORD(v138)) {
          goto LABEL_30;
        }
LABEL_31:
        BOOL v86 = 0;
        goto LABEL_32;
      }
      uint64_t v85 = objc_msgSend_gender(v63, v81, v82, v83, v84);
      BOOL v86 = v85 == 2;
      if (v85 == 2) {
        char v87 = 1;
      }
      else {
        char v87 = BYTE4(v135);
      }
      if ((v87 & 1) == 0) {
LABEL_30:
      }
        BOOL v86 = objc_msgSend_gender(v63, v81, v82, v83, v84) == 1;
LABEL_32:

      v92 = objc_msgSend_identifier(v63, v88, v89, v90, v91);
      if (!objc_msgSend_hasPrefix_(v92, v93, @"com.apple.ttsbundle.siri", v94, v95)) {
        goto LABEL_41;
      }
      if (!v140)
      {
        if (v138) {
          goto LABEL_40;
        }
LABEL_41:
        BOOL v101 = 0;
        goto LABEL_42;
      }
      uint64_t v100 = objc_msgSend_gender(v63, v96, v97, v98, v99);
      BOOL v101 = v100 == 2;
      if (v100 == 2) {
        char v102 = 1;
      }
      else {
        char v102 = v135;
      }
      if ((v102 & 1) == 0) {
LABEL_40:
      }
        BOOL v101 = objc_msgSend_gender(v63, v96, v97, v98, v99) == 1;
LABEL_42:

      if (v86)
      {
        if (!objc_msgSend_count(v141, v56, v57, v58, v59)) {
          goto LABEL_51;
        }
        v107 = objc_msgSend_name(v63, v103, v104, v105, v106);
        v112 = objc_msgSend_lowercaseString(v107, v108, v109, v110, v111);
        v116 = objc_msgSend_objectAtIndexedSubscript_(v141, v113, 0, v114, v115);
        v121 = objc_msgSend_lowercaseString(v116, v117, v118, v119, v120);
        char isEqualToString = objc_msgSend_isEqualToString_(v112, v122, (uint64_t)v121, v123, v124);

        if (isEqualToString)
        {
LABEL_51:
          v128 = AXLogCommon();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v136;
            _os_log_impl(&dword_1A66D3000, v128, OS_LOG_TYPE_INFO, "Updated identifier: %@", (uint8_t *)&buf, 0xCu);
          }

          uint64_t v133 = objc_msgSend_identifier(v63, v129, v130, v131, v132);

          v136 = (void *)v133;
          goto LABEL_54;
        }
      }
      else if (v101)
      {
        goto LABEL_51;
      }
LABEL_27:
      ++v62;
    }
    while (v60 != v62);
    uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v144, (uint64_t)v152, 16);
    uint64_t v60 = v126;
    if (v126) {
      continue;
    }
    break;
  }
LABEL_54:

  id v6 = v136;
LABEL_55:
  id v127 = v6;
LABEL_56:

  return v127;
}

- (id)convertIdentifierIfNeeded:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v12 = 0;
    goto LABEL_34;
  }
  uint64_t v5 = v4;
  if (!TTSIsInternalBuild()
    || !objc_msgSend_hasPrefix_(v5, v6, @"com.apple.maui.voice", v7, v8))
  {
    goto LABEL_11;
  }
  if (objc_msgSend_containsString_(v5, v6, @"premium", v7, v8))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v9, @"premium", @"enhanced", v11);
    uint64_t v15 = LABEL_9:;

    uint64_t v5 = (void *)v15;
    goto LABEL_10;
  }
  if (objc_msgSend_containsString_(v5, v9, @"high", v10, v11))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v13, @"high", @"premium", v14);
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v16 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v13, @".maui.", @".", v14);

  uint64_t v5 = (void *)v16;
LABEL_11:
  uint64_t v17 = objc_msgSend__remapGenderedSiriVoiceIdentifiers_(self, v6, (uint64_t)v5, v7, v8);

  v22 = (__CFString *)objc_msgSend_copy(v17, v18, v19, v20, v21);
  if (!objc_msgSend_hasPrefix_(v22, v23, @"com.apple.ttsbundle", v24, v25)) {
    goto LABEL_19;
  }
  v29 = objc_msgSend_updatedIdentifierForLegacyIdentifier_withLanguageCode_(self, v26, (uint64_t)v22, 0, v28);
  if (objc_msgSend_hasSuffix_(v17, v30, @"compact", v31, v32)) {
    goto LABEL_13;
  }
  if (!objc_msgSend_hasSuffix_(v17, v33, @"premium", v34, v35)) {
    goto LABEL_18;
  }
  uint64_t v41 = objc_msgSend_sharedInstance(TTSAXResourceManager, v37, v38, v39, v40);
  uint64_t v45 = objc_msgSend_resourceWithVoiceId_(v41, v42, (uint64_t)v29, v43, v44);
  int isInstalled = objc_msgSend_isInstalled(v45, v46, v47, v48, v49);

  if (isInstalled)
  {
LABEL_13:
    uint64_t v36 = v29;
  }
  else
  {
    v55 = objc_msgSend_sharedInstance(TTSAXResourceManager, v51, v52, v53, v54);
    uint64_t v59 = objc_msgSend_resourceWithVoiceId_(v55, v56, (uint64_t)v22, v57, v58);
    int v64 = objc_msgSend_isInstalled(v59, v60, v61, v62, v63);

    if (v64) {
      goto LABEL_18;
    }
    uint64_t v118 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v65, @"premium", @"compact", v66);

    objc_msgSend_updatedIdentifierForLegacyIdentifier_withLanguageCode_(self, v119, v118, 0, v120);
    uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = (__CFString *)v118;
  }

  v22 = v36;
LABEL_18:

LABEL_19:
  uint64_t v67 = objc_msgSend_stringWithFormat_(NSString, v26, @"%@.compact", v27, v28, @"com.apple.voice");
  int hasPrefix = objc_msgSend_hasPrefix_(v22, v68, (uint64_t)v67, v69, v70);

  if (!hasPrefix) {
    goto LABEL_27;
  }
  v76 = objc_msgSend_sharedInstance(TTSAXResourceManager, v72, v73, v74, v75);
  uint64_t v80 = objc_msgSend_resourceWithVoiceId_(v76, v77, (uint64_t)v22, v78, v79);

  if (!objc_msgSend_isInstalled(v80, v81, v82, v83, v84))
  {
    uint64_t v12 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v85, @".compact.", @".super-compact.", v86);
    uint64_t v91 = objc_msgSend_sharedInstance(TTSAXResourceManager, v87, v88, v89, v90);
    uint64_t v95 = objc_msgSend_resourceWithVoiceId_(v91, v92, (uint64_t)v12, v93, v94);
    char v100 = objc_msgSend_isInstalled(v95, v96, v97, v98, v99);

    if (v100)
    {
      BOOL v101 = AXTTSLogResourceMigration();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        v122 = v22;
        __int16 v123 = 2112;
        uint64_t v124 = v12;
        _os_log_impl(&dword_1A66D3000, v101, OS_LOG_TYPE_INFO, "Compact resource is not installed, falling back to on disk super-compact variant %@ => %@", buf, 0x16u);
      }

      goto LABEL_33;
    }

LABEL_27:
    if (objc_msgSend_isEqualToString_(v17, v72, @"com.apple.speech.voice.Alex", v74, v75))
    {

      v22 = @"com.apple.speech.synthesis.voice.Alex";
    }
    uint64_t v106 = objc_msgSend_sharedInstance(TTSAXResourceManager, v102, v103, v104, v105);
    uint64_t v110 = objc_msgSend_resourceWithVoiceId_(v106, v107, (uint64_t)v22, v108, v109);
    char v115 = objc_msgSend_isInstalled(v110, v111, v112, v113, v114);

    if (v115)
    {
      v116 = v22;
      v22 = v116;
    }
    else
    {
      v116 = v17;
    }
    uint64_t v12 = v116;
    goto LABEL_33;
  }
  v22 = v22;

  uint64_t v12 = v22;
LABEL_33:

LABEL_34:

  return v12;
}

+ (id)sharedInstance
{
  if (qword_1EB67ABA0 != -1) {
    dispatch_once(&qword_1EB67ABA0, &unk_1EFB802C0);
  }
  v2 = (void *)qword_1EB67AB90;

  return v2;
}

- (BOOL)isMigrationComplete
{
  if (self->_isMigrationComplete) {
    return 1;
  }
  uint64_t v7 = objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, a2, v2, v3, v4);
  if (objc_msgSend_count(v7, v8, v9, v10, v11))
  {
    self->_isMigrationComplete = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend__readIsMigrationCompleteFromPreferences(self, v12, v13, v14, v15);
    self->_isMigrationComplete = objc_msgSend_isEqualToNumber_(v16, v17, (uint64_t)&unk_1EFB95540, v18, v19);
  }
  return self->_isMigrationComplete;
}

- (void)restartMigrationIfNeeded
{
  char isMigrationComplete = objc_msgSend_isMigrationComplete(self, a2, v2, v3, v4);
  uint64_t v7 = AXTTSLogResourceMigration();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (isMigrationComplete)
  {
    if (v8)
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A66D3000, v7, OS_LOG_TYPE_INFO, "Migration is complete, no need to restart.", v17, 2u);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A66D3000, v7, OS_LOG_TYPE_INFO, "Migration is not complete, attempting to complete now.", buf, 2u);
    }

    uint64_t v7 = objc_msgSend_assetsService(self, v9, v10, v11, v12);
    objc_msgSend_restartTTSResourceMigration(v7, v13, v14, v15, v16);
  }
}

- (id)updatedIdentifierForLegacyIdentifier:(id)a3 withLanguageCode:(id)a4
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v6)
  {
    if (objc_msgSend_isEqualToString_(v6, v7, @"com.apple.speech.voice.Alex", v8, v9))
    {
      uint64_t v15 = @"com.apple.speech.synthesis.voice.Alex";
      goto LABEL_40;
    }
    uint64_t v17 = objc_msgSend_lowercaseString(v6, v11, v12, v13, v14);
    int v21 = objc_msgSend_containsObject_(&unk_1EFB95450, v18, (uint64_t)v17, v19, v20);

    if (v21)
    {
      uint64_t v15 = (__CFString *)v6;
      goto LABEL_40;
    }
    v26 = objc_msgSend_obsoleteVoicesWithReplacements(self, v22, v23, v24, v25);
    uint64_t v31 = objc_msgSend_lowercaseString(v6, v27, v28, v29, v30);
    uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v26, v32, (uint64_t)v31, v33, v34);

    if (v35)
    {
      uint64_t v15 = v35;
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v40 = objc_msgSend_sharedInstance(TTSRegexCache, v36, v37, v38, v39);
    uint64_t v43 = objc_msgSend_regexForString_atStart_(v40, v41, @"com\\.apple\\.ttsbundle\\.(?<name>[^.]*)\\-(?<quality>premium|compact|Premium|Compact)$", 1, v42);

    uint64_t v48 = objc_msgSend_length(v6, v44, v45, v46, v47);
    uint64_t v50 = objc_msgSend_firstMatchInString_options_range_(v43, v49, (uint64_t)v6, 2, 0, v48);
    if (!objc_msgSend_numberOfRanges(v50, v51, v52, v53, v54))
    {
      uint64_t v15 = (__CFString *)v6;
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v58 = objc_msgSend_rangeWithName_(v50, v55, @"name", v56, v57);
    uint64_t v60 = (uint64_t)v59;
    uint64_t v63 = objc_msgSend_rangeWithName_(v50, v59, @"quality", v61, v62);
    uint64_t v65 = (uint64_t)v64;
    uint64_t v67 = objc_msgSend_substringWithRange_(v6, v64, v58, v60, v66);
    uint64_t v70 = objc_msgSend_substringWithRange_(v6, v68, v63, v65, v69);
    uint64_t v75 = objc_msgSend_lowercaseString(v70, v71, v72, v73, v74);

    if (objc_msgSend_containsString_(v67, v76, @"-", v77, v78))
    {
      uint64_t v82 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v67, v79, @"-", (uint64_t)&stru_1EFB83720, v81);
      char v87 = objc_msgSend_lowercaseString(v82, v83, v84, v85, v86);
      uint64_t v92 = objc_msgSend_capitalizedString(v87, v88, v89, v90, v91);

      uint64_t v67 = (void *)v92;
    }
    int isEqualToString = objc_msgSend_isEqualToString_(v75, v79, @"compact", v80, v81);
    if (v10 && isEqualToString)
    {
      uint64_t v98 = objc_msgSend_sharedInstance(TTSLocaleUtilities, v94, v95, v96, v97);
      objc_msgSend_defaultVoiceIdentifierForGeneralLanguageCode_(v98, v99, (uint64_t)v10, v100, v101);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
LABEL_37:

        goto LABEL_38;
      }
    }
    else if (!v10)
    {
      v107 = objc_msgSend_sharedInstance(TTSAXResourceManager, v94, v95, v96, v97);
      objc_msgSend_languageCodeForResourceName_withType_(v107, v108, (uint64_t)v67, 4, v109);
      id v106 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    id v106 = v10;
LABEL_22:
    uint64_t v110 = _BuiltInVoiceNameForLanguage((uint64_t)v106, v102, v103, v104, v105);
    uint64_t v148 = v50;
    v149 = v43;
    uint64_t v150 = v110;
    uint64_t v114 = v75;
    if (v110)
    {
      if ((objc_msgSend_isEqualToString_(v110, v111, (uint64_t)v67, v112, v113) & 1) == 0)
      {
        uint64_t v119 = objc_msgSend_sharedInstance(TTSAXResourceManager, v115, v116, v117, v118);
        v122 = objc_msgSend_languageCodeForResourceName_withType_(v119, v120, (uint64_t)v67, 4, v121);

        if ((objc_msgSend_isEqualToString_(v106, v123, (uint64_t)v122, v124, v125) & 1) == 0)
        {
          id v126 = v150;

          uint64_t v67 = v126;
        }
      }
      id v127 = v106;
    }
    else
    {
      v128 = AXTTSLogResourceMigration();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v152 = v106;
        _os_log_impl(&dword_1A66D3000, v128, OS_LOG_TYPE_INFO, "No voice found for language code: %@. Attempting to find fallback language.", buf, 0xCu);
      }

      uint64_t v133 = objc_msgSend_sharedInstance(TTSAXResourceManager, v129, v130, v131, v132);
      id v127 = objc_msgSend_languageCodeForResourceName_withType_(v133, v134, (uint64_t)v67, 4, v135);

      v136 = AXTTSLogResourceMigration();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v152 = v127;
        _os_log_impl(&dword_1A66D3000, v136, OS_LOG_TYPE_INFO, "Found fallback language code: %@", buf, 0xCu);
      }
    }
    v137 = NSString;
    uint64_t v75 = v114;
    if (objc_msgSend_isEqualToString_(v114, v115, @"compact", v117, v118)) {
      v142 = @"compact";
    }
    else {
      v142 = @"enhanced";
    }
    v143 = objc_msgSend_capitalizedString(v67, v138, v139, v140, v141);
    objc_msgSend_stringWithFormat_(v137, v144, @"%@.%@.%@.%@", v145, v146, @"com.apple.voice", v142, v127, v143);
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v50 = v148;
    uint64_t v43 = v149;
    goto LABEL_37;
  }
  uint64_t v16 = AXTTSLogResourceMigration();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1A688CDDC();
  }

  uint64_t v15 = 0;
LABEL_40:

  return v15;
}

- (id)legacyIdentifierForUpdatedIdentifierDuringMigration:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, v5, v6, v7, v8);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)v17, v12, v13, (void)v34);
        uint64_t v23 = objc_msgSend_lowercaseString(v18, v19, v20, v21, v22);
        uint64_t v28 = objc_msgSend_lowercaseString(v4, v24, v25, v26, v27);
        char isEqualToString = objc_msgSend_isEqualToString_(v23, v29, (uint64_t)v28, v30, v31);

        if (isEqualToString)
        {
          id v14 = v17;
          goto LABEL_11;
        }
      }
      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v34, (uint64_t)v38, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v14;
}

- (void)downloadCompactResourceIfNeededForIdentifier:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"%@.%@", v6, v7, @"com.apple.voice", @"compact");
  int hasPrefix = objc_msgSend_hasPrefix_(v4, v9, (uint64_t)v8, v10, v11);

  if (hasPrefix)
  {
    uint64_t v15 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v13, @".compact.", @".super-compact.", v14);
    uint64_t v20 = objc_msgSend_sharedInstance(TTSAXResourceManager, v16, v17, v18, v19);
    uint64_t v24 = objc_msgSend_resourceWithVoiceId_(v20, v21, (uint64_t)v4, v22, v23);

    uint64_t v29 = objc_msgSend_sharedInstance(TTSAXResourceManager, v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_resourceWithVoiceId_(v29, v30, (uint64_t)v15, v31, v32);
    if (objc_msgSend_isInstalled(v33, v34, v35, v36, v37))
    {
      char isInstalled = objc_msgSend_isInstalled(v24, v38, v39, v40, v41);

      if ((isInstalled & 1) == 0)
      {
        uint64_t v43 = AXTTSLogResourceMigration();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v53 = v15;
          _os_log_impl(&dword_1A66D3000, v43, OS_LOG_TYPE_INFO, "Beginning compact identifier download for %@", buf, 0xCu);
        }

        uint64_t v48 = objc_msgSend_assetsService(self, v44, v45, v46, v47);
        objc_msgSend_downloadTTSResourceForVoiceId_(v48, v49, (uint64_t)v4, v50, v51);
      }
    }
    else
    {
    }
  }
}

- (void)deleteCompactResourceIfNeededForIdentifier:(id)a3
{
  id v20 = a3;
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v4, @"%@.compact", v5, v6, @"com.apple.voice");
  int hasPrefix = objc_msgSend_hasPrefix_(v20, v8, (uint64_t)v7, v9, v10);

  if (hasPrefix)
  {
    uint64_t v16 = objc_msgSend_assetsService(self, v12, v13, v14, v15);
    objc_msgSend_deleteCompactResourceIfNeededForIdentifier_(v16, v17, (uint64_t)v20, v18, v19);
  }
}

- (BOOL)resourceNeedsMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_allValues(v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_voiceId(v4, v15, v16, v17, v18);

  LOBYTE(v4) = objc_msgSend_containsObject_(v14, v20, (uint64_t)v19, v21, v22);
  return (char)v4;
}

- (void)resourceCompletedMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend__readVoiceIdentifiersToMigrateFromPreferences(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_mutableCopy(v9, v10, v11, v12, v13);

  if (v4
    && (objc_msgSend_voiceId(v4, v15, v16, v17, v18),
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v19))
  {
    uint64_t v24 = objc_msgSend_voiceId(v4, v20, v21, v22, v23);
    uint64_t v29 = objc_msgSend_lowercaseString(v24, v25, v26, v27, v28);
    objc_msgSend_removeObjectForKey_(v14, v30, (uint64_t)v29, v31, v32);
  }
  else
  {
    uint64_t v24 = AXTTSLogResourceMigration();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_1A688CEC4();
    }
  }

  uint64_t v33 = AXTTSLogResourceMigration();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    sub_1A688CE50();
  }

  objc_msgSend_writeVoiceIdentifiersToMigrateToPreferences_(self, v34, (uint64_t)v14, v35, v36);
  if (!objc_msgSend_count(v14, v37, v38, v39, v40)) {
    objc_msgSend_writeIsMigrationCompleteToPreferences_(self, v41, (uint64_t)&unk_1EFB95540, v42, v43);
  }
}

- (void)writeIsMigrationCompleteToPreferences:(id)a3
{
  id v6 = 0;
  uint64_t v3 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)a3, 1, (uint64_t)&v6);
  id v4 = v6;
  if (v4)
  {
    uint64_t v5 = AXTTSLogResourceMigration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1A688CF48();
    }
  }
  TTSPreferencesSetValueForKey(@"TTSCachedIsMigrationCompleteKey", v3);
}

- (id)_readIsMigrationCompleteFromPreferences
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)TTSPreferencesCopyValueForKey(@"TTSCachedIsMigrationCompleteKey");
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28DC0]);
    id v20 = 0;
    id v6 = objc_msgSend_initForReadingFromData_error_(v3, v4, (uint64_t)v2, (uint64_t)&v20, v5);
    id v7 = v20;
    if (v7)
    {
      uint64_t v8 = AXTTSLogResourceMigration();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1A688CFB0();
      }
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
      v21[0] = objc_opt_class();
      uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v21, 1, v12);
      uint64_t v8 = objc_msgSend_setWithArray_(v10, v14, (uint64_t)v13, v15, v16);

      uint64_t v9 = objc_msgSend_decodeObjectOfClasses_forKey_(v6, v17, (uint64_t)v8, *MEMORY[0x1E4F284E8], v18);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)writeVoiceIdentifiersToMigrateToPreferences:(id)a3
{
  id v3 = a3;
  if (AXProcessIsAXAssetsd())
  {
    id v8 = 0;
    uint64_t v5 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)v3, 1, (uint64_t)&v8);
    id v6 = v8;
    if (v6)
    {
      id v7 = AXTTSLogResourceMigration();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1A688D018();
      }
    }
    TTSPreferencesSetValueForKey(@"TTSCachedVoiceIdentifiersToMigrateKey", v5);
  }
  else
  {
    id v6 = AXTTSLogResourceMigration();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1A688D080(v6);
    }
  }
}

- (id)_readVoiceIdentifiersToMigrateFromPreferences
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)TTSPreferencesCopyValueForKey(@"TTSCachedVoiceIdentifiersToMigrateKey");
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28DC0]);
    id v20 = 0;
    id v6 = objc_msgSend_initForReadingFromData_error_(v3, v4, (uint64_t)v2, (uint64_t)&v20, v5);
    id v7 = v20;
    if (v7)
    {
      id v8 = AXTTSLogResourceMigration();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1A688D0C4();
      }
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
      v21[0] = objc_opt_class();
      v21[1] = objc_opt_class();
      uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v21, 2, v12);
      id v8 = objc_msgSend_setWithArray_(v10, v14, (uint64_t)v13, v15, v16);

      uint64_t v9 = objc_msgSend_decodeObjectOfClasses_forKey_(v6, v17, (uint64_t)v8, *MEMORY[0x1E4F284E8], v18);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSDictionary)obsoleteVoicesWithReplacements
{
  uint64_t v5 = self;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  obsoleteVoicesWithReplacements = self->_obsoleteVoicesWithReplacements;
  if (!obsoleteVoicesWithReplacements)
  {
    uint64_t v11 = objc_msgSend_deprecatedVoicesMap(TTSSiriAssetManager, a2, v2, v3, v4);
    if (v11)
    {
      uint64_t v70 = v5;
      uint64_t v77 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9, v10);
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      objc_msgSend_allKeys(v11, v12, v13, v14, v15);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v84, (uint64_t)v91, 16);
      if (v73)
      {
        uint64_t v72 = *(void *)v85;
        v76 = v11;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v85 != v72) {
              objc_enumerationMutation(obj);
            }
            uint64_t v74 = v20;
            uint64_t v21 = *(void *)(*((void *)&v84 + 1) + 8 * v20);
            long long v80 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            objc_msgSend_objectForKeyedSubscript_(v11, v17, v21, v18, v19);
            id v75 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v22, (uint64_t)&v80, (uint64_t)v90, 16);
            if (v79)
            {
              uint64_t v78 = *(void *)v81;
              do
              {
                uint64_t v26 = 0;
                do
                {
                  if (*(void *)v81 != v78) {
                    objc_enumerationMutation(v75);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v80 + 1) + 8 * v26);
                  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v11, v23, v21, v24, v25);
                  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v28, v29, v27, v30, v31);

                  if (v32)
                  {
                    uint64_t v36 = objc_msgSend_stringWithFormat_(NSString, v33, @"%@_%@_%@_premium", v34, v35, @"com.apple.ttsbundle.gryphon", v32, v21);
                    uint64_t v40 = objc_msgSend_stringWithFormat_(NSString, v37, @"%@_%@_%@_premium", v38, v39, @"com.apple.ttsbundle.gryphon", v27, v21);
                    uint64_t v45 = objc_msgSend_lowercaseString(v40, v41, v42, v43, v44);
                    objc_msgSend_setObject_forKey_(v77, v46, (uint64_t)v36, (uint64_t)v45, v47);

                    uint64_t v51 = objc_msgSend_stringWithFormat_(NSString, v48, @"%@_%@_%@_premium", v49, v50, @"com.apple.ttsbundle.gryphon-neural", v32, v21);
                    v55 = objc_msgSend_stringWithFormat_(NSString, v52, @"%@_%@_%@_premium", v53, v54, @"com.apple.ttsbundle.gryphon-neural", v27, v21);
                    uint64_t v60 = objc_msgSend_lowercaseString(v55, v56, v57, v58, v59);
                    objc_msgSend_setObject_forKey_(v77, v61, (uint64_t)v51, (uint64_t)v60, v62);

                    uint64_t v11 = v76;
                  }
                  else
                  {
                    uint64_t v51 = AXTTSLogResourceMigration();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      uint64_t v89 = v11;
                      _os_log_error_impl(&dword_1A66D3000, v51, OS_LOG_TYPE_ERROR, "SiriTTS returned nil deprecated voices. %@", buf, 0xCu);
                    }
                  }

                  ++v26;
                }
                while (v79 != v26);
                uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v23, (uint64_t)&v80, (uint64_t)v90, 16);
              }
              while (v79);
            }

            ++v20;
          }
          while (v74 + 1 != v73);
          uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v84, (uint64_t)v91, 16);
        }
        while (v73);
      }

      uint64_t v67 = objc_msgSend_copy(v77, v63, v64, v65, v66);
      uint64_t v5 = v70;
      v68 = v70->_obsoleteVoicesWithReplacements;
      v70->_obsoleteVoicesWithReplacements = (NSDictionary *)v67;
    }
    obsoleteVoicesWithReplacements = v5->_obsoleteVoicesWithReplacements;
  }

  return obsoleteVoicesWithReplacements;
}

- (void)setObsoleteVoicesWithReplacements:(id)a3
{
}

- (AXAssetsService)assetsService
{
  return self->_assetsService;
}

- (void)setAssetsService:(id)a3
{
}

- (void)setIsMigrationComplete:(BOOL)a3
{
  self->_char isMigrationComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsService, 0);

  objc_storeStrong((id *)&self->_obsoleteVoicesWithReplacements, 0);
}

@end