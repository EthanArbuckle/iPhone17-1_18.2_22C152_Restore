@interface TTSSiriAssetManager
+ (BOOL)spaceCheck:(id)a3;
+ (id)_assetFilterForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7 locallyAvailable:(BOOL)a8;
+ (id)_assetTechnologyForVoiceType:(int64_t)a3;
+ (id)_assetTypesForVoiceType:(int64_t)a3;
+ (id)_assetsForLanguage:(id)a3 voiceType:(int64_t)a4 installedOnly:(BOOL)a5;
+ (id)_footprintForType:(int64_t)a3;
+ (id)_siriAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7;
+ (id)_siriAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7 locallyAvailable:(BOOL)a8;
+ (id)assetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7;
+ (id)assetsForLanguage:(id)a3 voiceType:(int64_t)a4;
+ (id)convertTTSLanguageCodeToSiriLanguageCode:(id)a3;
+ (id)deprecatedVoicesMap;
+ (id)installedAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7;
+ (id)installedAssetsForLanguage:(id)a3 voiceType:(int64_t)a4;
+ (id)installedVoiceResourceForLanguage:(id)a3;
+ (id)ttsAssetFromVoiceAsset:(id)a3;
+ (id)voiceAssetFromTTSAsset:(id)a3;
+ (id)voiceIdentifierForAsset:(id)a3;
+ (id)voiceIdentifierForType:(int64_t)a3 footprint:(int64_t)a4 language:(id)a5 name:(id)a6;
+ (id)voiceResourceForLanguage:(id)a3 voiceType:(int64_t)a4;
+ (int64_t)_footprintForQuality:(id)a3;
+ (int64_t)_voiceTypeForAssetTechnology:(id)a3;
+ (void)downloadAsset:(id)a3 progressHandler:(id)a4;
+ (void)downloadVoiceResourceForLanguage:(id)a3 completion:(id)a4;
+ (void)purgeAsset:(id)a3;
+ (void)stopDownload:(id)a3;
@end

@implementation TTSSiriAssetManager

+ (id)_assetTypesForVoiceType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      objc_msgSend_vocalizerVoice(MEMORY[0x1E4FA4F98], a2, a3, v3, v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)&v20, 1, v10, v18, v19, v6, v21);
      goto LABEL_5;
    case 2:
      objc_msgSend_customVoice(MEMORY[0x1E4FA4F98], a2, a3, v3, v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)&v19, 1, v12, v18, v6, v20, v21);
      goto LABEL_5;
    case 4:
    case 5:
    case 7:
      objc_msgSend_gryphonVoice(MEMORY[0x1E4FA4F98], a2, a3, v3, v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)&v18, 1, v8, v6, v19, v20, v21);
      v13 = LABEL_5:;
      break;
    default:
      AXTTSLogCommon();
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        sub_1A688D2AC(a3, v6, v15, v16, v17);
      }
      v13 = 0;
      break;
  }

  return v13;
}

+ (id)_assetsForLanguage:(id)a3 voiceType:(int64_t)a4 installedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v64[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v63 = &unk_1EFB955A0;
  uint64_t v12 = objc_msgSend__assetTechnologyForVoiceType_(a1, v9, a4, v10, v11);
  v64[0] = v12;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v64, (uint64_t)&v63, 1);
  uint64_t v19 = objc_msgSend_mutableCopy(v14, v15, v16, v17, v18);

  if (v8) {
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, (uint64_t)v8, (uint64_t)&unk_1EFB95558, v22);
  }
  v23 = objc_msgSend__assetTypesForVoiceType_(a1, v20, a4, v21, v22);
  if (v23)
  {
    v26 = objc_opt_new();
    if (v5) {
      objc_msgSend_setObject_forKeyedSubscript_(v19, v24, MEMORY[0x1E4F1CC38], (uint64_t)&unk_1EFB95570, v25);
    }
    v27 = objc_msgSend_listAssetsOfTypes_matching_(MEMORY[0x1E4FA4F78], v24, (uint64_t)v23, (uint64_t)v19, v25);
    v28 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v51 = objc_msgSend_numberWithLong_(NSNumber, v29, a4, v30, v31);
      *(_DWORD *)buf = 138412802;
      v58 = v51;
      __int16 v59 = 2112;
      v60 = v19;
      __int16 v61 = 2112;
      v62 = v27;
      _os_log_debug_impl(&dword_1A66D3000, v28, OS_LOG_TYPE_DEBUG, "TTSAsset::listAssetsOfTypes (voiceTypes=%@ filter=%@): %@", buf, 0x20u);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v32 = v27;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v34)
    {
      uint64_t v38 = v34;
      uint64_t v39 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v53 != v39) {
            objc_enumerationMutation(v32);
          }
          v41 = objc_msgSend_voiceAssetFromTTSAsset_(a1, v35, *(void *)(*((void *)&v52 + 1) + 8 * i), v36, v37, (void)v52);
          objc_msgSend_addObject_(v26, v42, (uint64_t)v41, v43, v44);
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v52, (uint64_t)v56, 16);
      }
      while (v38);
    }

    v49 = objc_msgSend_allObjects(v26, v45, v46, v47, v48);
  }
  else
  {
    v49 = 0;
  }

  return v49;
}

+ (id)installedAssetsForLanguage:(id)a3 voiceType:(int64_t)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__assetsForLanguage_voiceType_installedOnly_, a3, a4, 1);
}

+ (id)_assetTechnologyForVoiceType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v6 = objc_msgSend_vocalizer(MEMORY[0x1E4FA4F90], a2, a3, v3, v4);
      break;
    case 2:
      v6 = objc_msgSend_custom(MEMORY[0x1E4FA4F90], a2, a3, v3, v4);
      break;
    case 4:
      v6 = objc_msgSend_gryphon(MEMORY[0x1E4FA4F90], a2, a3, v3, v4);
      break;
    case 5:
      v6 = objc_msgSend_neural(MEMORY[0x1E4FA4F90], a2, a3, v3, v4);
      break;
    case 7:
      v6 = objc_msgSend_neuralAX(MEMORY[0x1E4FA4F90], a2, a3, v3, v4);
      break;
    default:
      AXTTSLogCommon();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        sub_1A688D2AC(a3, v7, v8, v9, v10);
      }

      v6 = 0;
      break;
  }

  return v6;
}

+ (id)convertTTSLanguageCodeToSiriLanguageCode:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"ar-001", v5, v6))
  {
    uint64_t v10 = @"ar-SA";
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v3, v7, @"no-NO", v8, v9)) {
      goto LABEL_6;
    }
    uint64_t v10 = @"nb-NO";
  }

  uint64_t v3 = v10;
LABEL_6:

  return v3;
}

+ (void)downloadVoiceResourceForLanguage:(id)a3 completion:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  v7 = objc_opt_class();
  uint64_t v11 = objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(v7, v8, (uint64_t)v6, v9, v10);

  uint64_t v37 = &unk_1EFB95558;
  v38[0] = v11;
  v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v38, (uint64_t)&v37, 1);
  v14 = (void *)MEMORY[0x1E4FA4F78];
  uint64_t v19 = objc_msgSend_voiceResources(MEMORY[0x1E4FA4F98], v15, v16, v17, v18);
  uint64_t v36 = v19;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v36, 1, v21);
  uint64_t v25 = objc_msgSend_bestAssetOfTypes_matching_(v14, v23, (uint64_t)v22, (uint64_t)v13, v24);

  if (objc_msgSend_locallyAvailable(v25, v26, v27, v28, v29))
  {
    if (v5) {
      v5[2](v5, 1);
    }
  }
  else if (v25)
  {
    uint64_t v30 = AXTTSLogCommon();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_impl(&dword_1A66D3000, v30, OS_LOG_TYPE_INFO, "Downloading voice resources asset %@", buf, 0xCu);
    }

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1A66EBA0C;
    v32[3] = &unk_1E5C69768;
    v33 = v5;
    objc_msgSend_downloadWithReservation_useBattery_progress_then_(v25, v31, @"TextToSpeech.VoiceResources", 1, (uint64_t)&unk_1EFB802E0, v32);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

+ (id)installedVoiceResourceForLanguage:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(v4, v5, (uint64_t)v3, v6, v7);

  v25[0] = &unk_1EFB95570;
  v25[1] = &unk_1EFB95558;
  v26[0] = MEMORY[0x1E4F1CC38];
  v26[1] = v8;
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v26, (uint64_t)v25, 2);
  uint64_t v11 = (void *)MEMORY[0x1E4FA4F78];
  uint64_t v16 = objc_msgSend_voiceResources(MEMORY[0x1E4FA4F98], v12, v13, v14, v15);
  uint64_t v24 = v16;
  uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)&v24, 1, v18);
  uint64_t v22 = objc_msgSend_bestAssetOfTypes_matching_(v11, v20, (uint64_t)v19, (uint64_t)v10, v21);

  return v22;
}

+ (id)voiceResourceForLanguage:(id)a3 voiceType:(int64_t)a4
{
  v101[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v11 = objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(v7, v8, (uint64_t)v6, v9, v10);

  v100[0] = &unk_1EFB95570;
  v100[1] = &unk_1EFB95558;
  v101[0] = MEMORY[0x1E4F1CC38];
  v101[1] = v11;
  uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v101, (uint64_t)v100, 2);
  uint64_t v14 = (void *)MEMORY[0x1E4FA4F78];
  uint64_t v19 = objc_msgSend_voiceResources(MEMORY[0x1E4FA4F98], v15, v16, v17, v18);
  v99 = v19;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v99, 1, v21);
  uint64_t v25 = objc_msgSend_bestAssetOfTypes_matching_(v14, v23, (uint64_t)v22, (uint64_t)v13, v24);

  v26 = AXTTSLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_1A688D228();
  }

  if (v25)
  {
    uint64_t v31 = objc_msgSend_assetSource(v25, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_mobileAsset(MEMORY[0x1E4FA4F88], v32, v33, v34, v35);

    if (v31 == v36) {
      objc_msgSend_downloadVoiceResourceForLanguage_completion_(a1, v37, (uint64_t)v11, 0, v38);
    }
    uint64_t v39 = objc_alloc_init(TTSVoiceResourceAsset);
    objc_msgSend_setBundleIdentifier_(v39, v40, @"com.apple.MobileAsset.VoiceServices.VoiceResources", v41, v42);
    uint64_t v43 = NSNumber;
    uint64_t v48 = objc_msgSend_versionNumber(v25, v44, v45, v46, v47);
    long long v52 = objc_msgSend_numberWithInteger_(v43, v49, v48, v50, v51);
    v57 = objc_msgSend_stringValue(v52, v53, v54, v55, v56);
    objc_msgSend_setMasteredVersion_(v39, v58, (uint64_t)v57, v59, v60);

    objc_msgSend_setCompatibilityVersion_(v39, v61, (uint64_t)&unk_1EFB95588, v62, v63);
    objc_msgSend_setContentVersion_(v39, v64, (uint64_t)&unk_1EFB95588, v65, v66);
    v71 = objc_msgSend_supportedLanguages(v25, v67, v68, v69, v70);
    objc_msgSend_setLanguages_(v39, v72, (uint64_t)v71, v73, v74);

    if (objc_msgSend_locallyAvailable(v25, v75, v76, v77, v78))
    {
      v83 = objc_msgSend_bundle(v25, v79, v80, v81, v82);
      v88 = objc_msgSend_bundleURL(v83, v84, v85, v86, v87);

      objc_msgSend_setSearchPathURL_(v39, v89, (uint64_t)v88, v90, v91);
      v95 = objc_msgSend_URLByAppendingPathComponent_(v88, v92, @"voice_configs.plist", v93, v94);
      objc_msgSend_syncWithConfigFile_voiceType_(v39, v96, (uint64_t)v95, a4, v97);
    }
  }
  else
  {
    objc_msgSend_downloadVoiceResourceForLanguage_completion_(a1, v27, (uint64_t)v11, 0, v30);
    uint64_t v39 = 0;
  }

  return v39;
}

+ (id)_footprintForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3 == 4)
    {
      uint64_t v5 = objc_msgSend_premium(MEMORY[0x1E4FA4F80], a2, 4, v3, v4);
    }
    else if (a3 == 5)
    {
      uint64_t v5 = objc_msgSend_premiumhigh(MEMORY[0x1E4FA4F80], a2, 5, v3, v4);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend_compact(MEMORY[0x1E4FA4F80], a2, a3, v3, v4);
  }

  return v5;
}

+ (id)ttsAssetFromVoiceAsset:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v9 = objc_msgSend_languages(v4, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_firstObject(v9, v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_gender(v4, v15, v16, v17, v18);
    uint64_t v24 = objc_msgSend_footprint(v4, v20, v21, v22, v23);
    uint64_t v29 = objc_msgSend_name(v4, v25, v26, v27, v28);
    uint64_t v34 = objc_msgSend_voiceType(v4, v30, v31, v32, v33);
    uint64_t isInstalled = objc_msgSend_isInstalled(v4, v35, v36, v37, v38);

    uint64_t v41 = objc_msgSend__siriAssetForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, v40, (uint64_t)v14, v19, v24, v29, v34, isInstalled);
  }
  else
  {
    uint64_t v41 = 0;
  }

  return v41;
}

+ (int64_t)_footprintForQuality:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA4F80];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_compact(v3, v5, v6, v7, v8);
  int isEqual = objc_msgSend_isEqual_(v4, v10, (uint64_t)v9, v11, v12);

  if (isEqual) {
    int64_t v14 = 3;
  }
  else {
    int64_t v14 = 4;
  }

  return v14;
}

+ (id)voiceAssetFromTTSAsset:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (!v4)
  {
    isBuiltIn_masteredVersion_compatibilityVersion_neural = 0;
    goto LABEL_23;
  }
  uint64_t v10 = objc_msgSend_name(v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_name(v9, v11, v12, v13, v14);
  if (!objc_msgSend_length(v15, v16, v17, v18, v19))
  {

    goto LABEL_8;
  }
  uint64_t v24 = objc_msgSend_supportedLanguages(v9, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_count(v24, v25, v26, v27, v28);

  if (!v29)
  {
LABEL_8:
    long long v52 = AXTTSLogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      sub_1A688D33C();
    }

    isBuiltIn_masteredVersion_compatibilityVersion_neural = 0;
    goto LABEL_22;
  }
  uint64_t v34 = objc_msgSend_technology(v9, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_gryphon(MEMORY[0x1E4FA4F90], v35, v36, v37, v38);
  if (objc_msgSend_isEqual_(v34, v40, (uint64_t)v39, v41, v42))
  {

LABEL_12:
    uint64_t v63 = objc_msgSend_lowercaseString(v10, v47, v48, v49, v50);

    uint64_t v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v63, v64, @"-", (uint64_t)&stru_1EFB83720, v65);

    goto LABEL_13;
  }
  long long v53 = objc_msgSend_technology(v9, v43, v44, v45, v46);
  v58 = objc_msgSend_neural(MEMORY[0x1E4FA4F90], v54, v55, v56, v57);
  int isEqual = objc_msgSend_isEqual_(v53, v59, (uint64_t)v58, v60, v61);

  if (isEqual) {
    goto LABEL_12;
  }
LABEL_13:
  if (objc_msgSend_purgeable(v9, v47, v48, v49, v50)) {
    unsigned int v70 = 0;
  }
  else {
    unsigned int v70 = objc_msgSend_locallyAvailable(v9, v66, v67, v68, v69);
  }
  v71 = objc_msgSend_technology(v9, v66, v67, v68, v69);
  uint64_t v76 = objc_msgSend_custom(MEMORY[0x1E4FA4F90], v72, v73, v74, v75);
  uint64_t v194 = (uint64_t)v10;
  if (objc_msgSend_isEqual_(v71, v77, (uint64_t)v76, v78, v79))
  {
    v84 = objc_msgSend_quality(v9, v80, v81, v82, v83);
    v89 = objc_msgSend_compact(MEMORY[0x1E4FA4F80], v85, v86, v87, v88);
    int v93 = objc_msgSend_isEqual_(v84, v90, (uint64_t)v89, v91, v92);

    v70 |= v93;
  }
  unsigned int v191 = v70;

  v193 = [TTSVoiceAsset alloc];
  v98 = objc_msgSend_supportedLanguages(v9, v94, v95, v96, v97);
  uint64_t v103 = objc_msgSend_gender(v9, v99, v100, v101, v102);
  if (v103 == 2) {
    uint64_t v108 = 2;
  }
  else {
    uint64_t v108 = v103 == 1;
  }
  v109 = objc_msgSend_quality(v9, v104, v105, v106, v107);
  uint64_t v113 = objc_msgSend__footprintForQuality_(a1, v110, (uint64_t)v109, v111, v112);
  uint64_t v118 = objc_msgSend_locallyAvailable(v9, v114, v115, v116, v117);
  v123 = objc_msgSend_technology(v9, v119, v120, v121, v122);
  objc_msgSend_string(v123, v124, v125, v126, v127);
  v128 = id v192 = a1;
  v133 = objc_msgSend_neural(MEMORY[0x1E4FA4F90], v129, v130, v131, v132);
  v138 = objc_msgSend_string(v133, v134, v135, v136, v137);
  char isEqualToString = objc_msgSend_isEqualToString_(v128, v139, (uint64_t)v138, v140, v141);
  uint64_t v142 = v108;
  uint64_t v10 = (void *)v194;
  isBuiltIn_masteredVersion_compatibilityVersion_neural = objc_msgSend_initWithName_languages_gender_footprint_isInstalled_isBuiltIn_masteredVersion_compatibilityVersion_neural_(v193, v143, v194, (uint64_t)v98, v142, v113, v118, v191, @"1", @"1", isEqualToString);

  v148 = objc_msgSend_technology(v9, v144, v145, v146, v147);
  uint64_t v152 = objc_msgSend__voiceTypeForAssetTechnology_(v192, v149, (uint64_t)v148, v150, v151);

  v157 = objc_msgSend_bundle(v9, v153, v154, v155, v156);
  v162 = objc_msgSend_bundlePath(v157, v158, v159, v160, v161);
  objc_msgSend_setVoicePath_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v163, (uint64_t)v162, v164, v165);

  objc_msgSend_setVoiceType_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v166, v152, v167, v168);
  v172 = objc_msgSend_voiceIdentifierForAsset_(v192, v169, (uint64_t)v9, v170, v171);
  objc_msgSend_setIdentifier_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v173, (uint64_t)v172, v174, v175);

  v180 = objc_msgSend_diskSize(v9, v176, v177, v178, v179);
  unsigned int v185 = objc_msgSend_unsignedIntValue(v180, v181, v182, v183, v184);
  objc_msgSend_setFileSize_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v186, v185, v187, v188);

LABEL_22:
LABEL_23:

  return isBuiltIn_masteredVersion_compatibilityVersion_neural;
}

+ (id)voiceIdentifierForType:(int64_t)a3 footprint:(int64_t)a4 language:(id)a5 name:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v14 = v10;
  uint64_t v15 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v16 = NSString;
      uint64_t v17 = TTSStringForSpeechFootprint(a4);
      uint64_t v22 = objc_msgSend_lowercaseString(v17, v18, v19, v20, v21);
      objc_msgSend_stringWithFormat_(v16, v23, @"%@.%@-%@", v24, v25, @"com.apple.ttsbundle", v14, v22);
      goto LABEL_10;
    case 2:
      uint64_t v26 = NSString;
      uint64_t v27 = kTTSSiriVoiceIdentifierPrefix;
      goto LABEL_9;
    case 4:
      uint64_t v26 = NSString;
      uint64_t v27 = kTTSGryphonVoiceIdentifierPrefix;
      goto LABEL_9;
    case 5:
      uint64_t v26 = NSString;
      uint64_t v27 = kTTSNeuralVoiceIdentifierPrefix;
      goto LABEL_9;
    case 7:
      uint64_t v26 = NSString;
      if (a4 == 3)
      {
        uint64_t v15 = objc_msgSend_stringWithFormat_(NSString, v11, @"%@.%@", v12, v13, @"com.apple.voice", v10);
      }
      else
      {
        uint64_t v27 = kTTSNeuralAXVoiceIdentifierPrefix;
LABEL_9:
        uint64_t v28 = *v27;
        uint64_t v17 = TTSStringForSpeechFootprint(a4);
        uint64_t v22 = objc_msgSend_lowercaseString(v17, v29, v30, v31, v32);
        objc_msgSend_stringWithFormat_(v26, v33, @"%@_%@_%@_%@", v34, v35, v28, v14, v9, v22);
        uint64_t v15 = LABEL_10:;
      }
LABEL_11:

      return v15;
    default:
      goto LABEL_11;
  }
}

+ (id)voiceIdentifierForAsset:(id)a3
{
  id v4 = a3;
  id v9 = objc_msgSend_technology(v4, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend__voiceTypeForAssetTechnology_(a1, v10, (uint64_t)v9, v11, v12);

  uint64_t v18 = objc_msgSend_quality(v4, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend__footprintForQuality_(a1, v19, (uint64_t)v18, v20, v21);

  uint64_t v31 = objc_msgSend_primaryLanguage(v4, v23, v24, v25, v26);
  if (v31)
  {
    uint64_t v32 = objc_msgSend_primaryLanguage(v4, v27, v28, v29, v30);
  }
  else
  {
    uint64_t v33 = objc_msgSend_supportedLanguages(v4, v27, v28, v29, v30);
    uint64_t v32 = objc_msgSend_firstObject(v33, v34, v35, v36, v37);
  }
  uint64_t v42 = objc_msgSend_name(v4, v38, v39, v40, v41);
  uint64_t v44 = objc_msgSend_voiceIdentifierForType_footprint_language_name_(a1, v43, v13, v22, (uint64_t)v32, v42);

  return v44;
}

+ (BOOL)spaceCheck:(id)a3
{
  return 1;
}

+ (void)purgeAsset:(id)a3
{
  objc_msgSend_ttsAssetFromVoiceAsset_(a1, a2, (uint64_t)a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeImmediately_(v8, v5, 1, v6, v7);
}

+ (void)stopDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXTTSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_DEFAULT, "Reqeuesting cancel asset download", v13, 2u);
  }

  id v9 = objc_msgSend_ttsAssetFromVoiceAsset_(a1, v6, (uint64_t)v4, v7, v8);

  objc_msgSend_cancelDownloadingThen_(v9, v10, (uint64_t)&unk_1EFB7E498, v11, v12);
}

+ (id)deprecatedVoicesMap
{
  if (qword_1E96C46C8 != -1) {
    dispatch_once(&qword_1E96C46C8, &unk_1EFB7E4B8);
  }
  v2 = (void *)qword_1E96C46C0;

  return v2;
}

+ (void)downloadAsset:(id)a3 progressHandler:(id)a4
{
  id v6 = a4;
  id v10 = objc_msgSend_ttsAssetFromVoiceAsset_(a1, v7, (uint64_t)a3, v8, v9);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A66ECA5C;
  v15[3] = &unk_1E5C697B0;
  id v16 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A66ECA80;
  v13[3] = &unk_1E5C69768;
  id v14 = v16;
  id v11 = v16;
  objc_msgSend_downloadWithReservation_useBattery_progress_then_(v10, v12, @"Accessibility", 1, (uint64_t)v15, v13);
}

+ (int64_t)_voiceTypeForAssetTechnology:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_custom(MEMORY[0x1E4FA4F90], v4, v5, v6, v7);
  char isEqual = objc_msgSend_isEqual_(v3, v9, (uint64_t)v8, v10, v11);

  if (isEqual)
  {
    int64_t v17 = 2;
  }
  else
  {
    uint64_t v18 = objc_msgSend_vocalizer(MEMORY[0x1E4FA4F90], v13, v14, v15, v16);
    char v22 = objc_msgSend_isEqual_(v3, v19, (uint64_t)v18, v20, v21);

    if (v22)
    {
      int64_t v17 = 1;
    }
    else
    {
      uint64_t v27 = objc_msgSend_neural(MEMORY[0x1E4FA4F90], v23, v24, v25, v26);
      char v31 = objc_msgSend_isEqual_(v3, v28, (uint64_t)v27, v29, v30);

      if (v31)
      {
        int64_t v17 = 5;
      }
      else
      {
        uint64_t v36 = objc_msgSend_neuralAX(MEMORY[0x1E4FA4F90], v32, v33, v34, v35);
        char v40 = objc_msgSend_isEqual_(v3, v37, (uint64_t)v36, v38, v39);

        if (v40)
        {
          int64_t v17 = 7;
        }
        else
        {
          uint64_t v45 = objc_msgSend_gryphon(MEMORY[0x1E4FA4F90], v41, v42, v43, v44);
          int v49 = objc_msgSend_isEqual_(v3, v46, (uint64_t)v45, v47, v48);

          if (v49) {
            int64_t v17 = 4;
          }
          else {
            int64_t v17 = 1;
          }
        }
      }
    }
  }

  return v17;
}

+ (id)assetsForLanguage:(id)a3 voiceType:(int64_t)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__assetsForLanguage_voiceType_installedOnly_, a3, a4, 0);
}

+ (id)installedAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7
{
  uint64_t v8 = objc_msgSend__siriAssetForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, a2, (uint64_t)a3, a4, a5, a6, a7, 1);
  uint64_t v12 = objc_msgSend_voiceAssetFromTTSAsset_(a1, v9, (uint64_t)v8, v10, v11);

  return v12;
}

+ (id)assetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7
{
  uint64_t v8 = objc_msgSend__siriAssetForLanguage_gender_footprint_voiceName_voiceType_(a1, a2, (uint64_t)a3, a4, a5, a6, a7);
  uint64_t v12 = objc_msgSend_voiceAssetFromTTSAsset_(a1, v9, (uint64_t)v8, v10, v11);

  return v12;
}

+ (id)_siriAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7
{
  id v12 = a6;
  uint64_t v16 = objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(a1, v13, (uint64_t)a3, v14, v15);
  uint64_t v18 = objc_msgSend__assetFilterForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, v17, (uint64_t)v16, a4, a5, v12, a7, 1);

  uint64_t v23 = objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);
  uint64_t v29 = objc_msgSend__assetTypesForVoiceType_(a1, v24, a7, v25, v26);
  if (v29)
  {
    uint64_t v33 = objc_msgSend_bestAssetOfTypes_matching_(MEMORY[0x1E4FA4F78], v27, (uint64_t)v29, (uint64_t)v23, v28);
    if (!v33)
    {
      objc_msgSend_removeObjectForKey_(v23, v30, (uint64_t)&unk_1EFB95570, v31, v32);
      uint64_t v33 = objc_msgSend_bestAssetOfTypes_matching_(MEMORY[0x1E4FA4F78], v34, (uint64_t)v29, (uint64_t)v23, v35);
    }
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

+ (id)_siriAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7 locallyAvailable:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  uint64_t v18 = objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(a1, v15, (uint64_t)a3, v16, v17);
  uint64_t v23 = objc_msgSend__assetTypesForVoiceType_(a1, v19, a7, v20, v21);
  if (v23)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4FA4F78];
    uint64_t v25 = objc_msgSend__assetFilterForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, v22, (uint64_t)v18, a4, a5, v14, a7, v8);
    uint64_t v28 = objc_msgSend_bestAssetOfTypes_matching_(v24, v26, (uint64_t)v23, (uint64_t)v25, v27);
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

+ (id)_assetFilterForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7 locallyAvailable:(BOOL)a8
{
  BOOL v8 = a8;
  v38[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  v37[0] = &unk_1EFB955A0;
  uint64_t v18 = objc_msgSend__assetTechnologyForVoiceType_(a1, v15, a7, v16, v17);
  v38[0] = v18;
  v37[1] = &unk_1EFB955B8;
  uint64_t v22 = objc_msgSend__footprintForType_(a1, v19, a5, v20, v21);
  v38[1] = v22;
  v37[2] = &unk_1EFB95570;
  uint64_t v26 = objc_msgSend_numberWithBool_(NSNumber, v23, v8, v24, v25);
  void v38[2] = v26;
  uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v38, (uint64_t)v37, 3);
  uint64_t v33 = objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

  if (v13) {
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v13, (uint64_t)&unk_1EFB95558, v35);
  }
  if (v14) {
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v14, (uint64_t)&unk_1EFB955D0, v35);
  }

  return v33;
}

@end