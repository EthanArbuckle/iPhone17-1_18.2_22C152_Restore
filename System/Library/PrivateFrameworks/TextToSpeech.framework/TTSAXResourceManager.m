@interface TTSAXResourceManager
+ (id)sharedInstance;
+ (void)freeSharedInstance;
- (AXAsset)samplesAsset;
- (AXAssetController)assetController;
- (AXAssetController)legacyCombinedVocalizerAssetController;
- (AXAssetController)legacyMacinTalkAssetController;
- (AXAssetsService)assetsService;
- (BOOL)_isValidResourceTypeKey:(id)a3;
- (BOOL)_validateCacheStructure:(id)a3;
- (BOOL)downloadingSamples;
- (BOOL)readDidMigrateUninformedSiriVoicesFromPreferences;
- (NSHashTable)_observers;
- (NSMutableDictionary)_resources;
- (NSMutableDictionary)_resourcesByAssetId;
- (NSMutableDictionary)_resourcesById;
- (NSSet)allAvailableLanguages;
- (NSString)catalogBuildVersion;
- (OS_dispatch_queue)assetLoadingQueue;
- (OS_dispatch_queue)preferenceWriteQueue;
- (OS_dispatch_queue)siriServiceQueue;
- (TTSAXResourceManager)init;
- (id)_axAssetsForTTSAXResourceModel:(BOOL)a3;
- (id)_debugCountSummaryForResources:(id)a3;
- (id)_dictionaryForResources:(id)a3;
- (id)_expensiveResources;
- (id)_findAndSwapLegacyMacinTalkAssetsForMacinTalkResources:(id)a3;
- (id)_findLocalResourcesForPath:(id)a3;
- (id)_findResourcesForLegacyAssets;
- (id)_getSynthesisProviderResources;
- (id)_locked_ResourceWithVoiceId:(id)a3 assetId:(id)a4;
- (id)_readCatalogBuildNumberFromPreferences;
- (id)_readResourcesFromPreferences;
- (id)_refreshAssetForResource:(id)a3 withAssetController:(id)a4 installedOnly:(BOOL)a5;
- (id)_refreshResourcesForManagerType:(unint64_t)a3;
- (id)_refreshSamples:(BOOL)a3;
- (id)_refreshSiriResources:(BOOL)a3;
- (id)_resourceWithVoiceId:(id)a3 assetId:(id)a4;
- (id)_resourcesForAssets:(id)a3;
- (id)_resourcesWithType:(unint64_t)a3 subType:(unint64_t)a4 languageCode:(id)a5;
- (id)allLanguagesForVoices:(BOOL)a3;
- (id)allVoices:(BOOL)a3;
- (id)defaultVoiceForLanguage:(id)a3;
- (id)languageCodeForResourceName:(id)a3 withType:(unint64_t)a4;
- (id)refreshAssetForResource:(id)a3 installedOnly:(BOOL)a4;
- (id)refreshResourcesCacheForManagerType:(unint64_t)a3;
- (id)refreshedResourcesForResources:(id)a3;
- (id)resourceWithAssetId:(id)a3;
- (id)resourceWithVoiceId:(id)a3;
- (id)resourcesWithLanguage:(id)a3 type:(unint64_t)a4;
- (id)resourcesWithType:(unint64_t)a3 subType:(unint64_t)a4;
- (id)speechVoiceWithVoiceId:(id)a3;
- (id)superCompactVoiceIdForCompactVoiceId:(id)a3;
- (int64_t)readResourceCacheVersionFromPreferences;
- (unint64_t)_managerTypeForResourceType:(unint64_t)a3;
- (void)_accessResourceCache:(id)a3;
- (void)_deleteResource:(id)a3;
- (void)_deleteSiriVoiceAssetWithResource:(id)a3;
- (void)_downloadLegacyResourceForTesting:(id)a3;
- (void)_downloadResource:(id)a3 userInitiated:(BOOL)a4;
- (void)_downloadSiriVoiceAssetWithResource:(id)a3;
- (void)_mergeInExpensiveInstalledAssets_locked:(BOOL)a3 notifyObservers:(BOOL)a4;
- (void)_mergeInResources:(id)a3 to:(id)a4;
- (void)_notifyObserversOfCacheUpdate;
- (void)_performBlockOnObservers:(id)a3;
- (void)_stopDownloadResource:(id)a3;
- (void)_stopDownloadSiriVoiceAssetWithResource:(id)a3;
- (void)_updateCachedResources_locked:(id)a3;
- (void)_writeResourceCacheVersionToPreferences;
- (void)_writeResourcesToPreferences:(id)a3;
- (void)addObserver:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)dealloc;
- (void)deleteResourceWithAssetId:(id)a3;
- (void)deleteResourceWithVoiceId:(id)a3;
- (void)downloadResourceWithAssetId:(id)a3;
- (void)downloadResourceWithVoiceId:(id)a3;
- (void)downloadResourceWithVoiceId:(id)a3 userInitiated:(BOOL)a4;
- (void)downloadSamplesIfNecessary;
- (void)purgeLegacyResourceCache;
- (void)rebuildSystemCacheForActionType:(unint64_t)a3;
- (void)removeObserver:(id)a3;
- (void)resetInMemoryAssetCatalogs;
- (void)resetResourcesCache;
- (void)sampleURLForVoiceId:(id)a3 completion:(id)a4;
- (void)setAllAvailableLanguages:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setAssetLoadingQueue:(id)a3;
- (void)setAssetsService:(id)a3;
- (void)setCatalogBuildVersion:(id)a3;
- (void)setDownloadingSamples:(BOOL)a3;
- (void)setLegacyCombinedVocalizerAssetController:(id)a3;
- (void)setLegacyMacinTalkAssetController:(id)a3;
- (void)setPreferenceWriteQueue:(id)a3;
- (void)setSamplesAsset:(id)a3;
- (void)setSiriServiceQueue:(id)a3;
- (void)set_observers:(id)a3;
- (void)set_resources:(id)a3;
- (void)set_resourcesByAssetId:(id)a3;
- (void)set_resourcesById:(id)a3;
- (void)stopDownloadResourceWithVoiceId:(id)a3;
- (void)updateCatalogBuildVersion:(id)a3;
- (void)updateCatalogIfNeeded;
- (void)updateDidMigrateUninformedSiriVoices:(BOOL)a3;
@end

@implementation TTSAXResourceManager

- (int64_t)readResourceCacheVersionFromPreferences
{
  v2 = (void *)TTSPreferencesCopyValueForKey(@"TTSResourceCacheVersionKey");
  v3 = AXTTSLogResourceManager();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1A688ECEC();
    }

    int64_t v9 = objc_msgSend_integerValue(v2, v5, v6, v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A66D3000, v4, OS_LOG_TYPE_INFO, "No resource cache version found in preferences", v11, 2u);
    }

    int64_t v9 = 0;
  }

  return v9;
}

- (id)_findResourcesForLegacyAssets
{
  uint64_t v240 = *MEMORY[0x1E4F143B8];
  v3 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_INFO, "Will find resources for legacy assets", buf, 2u);
  }

  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6, v7);
  id v211 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)MEMORY[0x1AD0C1200]();
  v200 = self;
  v13 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v9, v10, v11, v12);
  int isAssetCatalogInstalled = objc_msgSend_isAssetCatalogInstalled(v13, v14, v15, v16, v17);

  if (isAssetCatalogInstalled)
  {
    v199 = v8;
    v23 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v19, v20, v21, v22);
    v28 = objc_msgSend_refreshWithoutCatalogUpdateSynchronously(v23, v24, v25, v26, v27);

    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    id obj = v28;
    uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v216, (uint64_t)v239, 16);
    if (v206)
    {
      uint64_t v34 = *(void *)v217;
      uint64_t v205 = *(void *)v217;
      do
      {
        for (uint64_t i = 0; i != v206; ++i)
        {
          if (*(void *)v217 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v216 + 1) + 8 * i);
          v37 = objc_msgSend_localURL(v36, v30, v31, v32, v33);

          if (v37)
          {
            v38 = objc_msgSend_properties(v36, v30, v31, v32, v33);
            uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v38, v39, @"Name", v40, v41);

            v47 = objc_msgSend_properties(v36, v43, v44, v45, v46);
            v207 = objc_msgSend_objectForKeyedSubscript_(v47, v48, @"Languages", v49, v50);

            v55 = objc_msgSend_properties(v36, v51, v52, v53, v54);
            v209 = objc_msgSend_objectForKeyedSubscript_(v55, v56, @"Gender", v57, v58);

            v59 = NSString;
            v64 = objc_msgSend_properties(v36, v60, v61, v62, v63);
            v68 = objc_msgSend_objectForKeyedSubscript_(v64, v65, @"VoiceId", v66, v67);
            v72 = objc_msgSend_stringWithFormat_(v59, v69, @"%@-%@", v70, v71, v68, @"compact");

            v73 = NSString;
            v74 = (void *)v42;
            v79 = objc_msgSend_properties(v36, v75, v76, v77, v78);
            v83 = objc_msgSend_objectForKeyedSubscript_(v79, v80, @"VoiceId", v81, v82);
            v87 = objc_msgSend_stringWithFormat_(v73, v84, @"%@-%@", v85, v86, v83, @"premium");

            if (v36 && v42 && v207 && v209 && v72 && v87)
            {
              contexta = [TTSAXResource alloc];
              v225[0] = @"Name";
              v225[1] = @"VoiceId";
              v226[0] = v42;
              v226[1] = v72;
              v225[2] = @"Languages";
              v225[3] = @"Type";
              v226[2] = v207;
              v226[3] = @"LegacyCombinedVocalizer";
              v225[4] = @"Subtype";
              v225[5] = @"Footprint";
              v226[4] = @"None";
              v226[5] = @"compact";
              v225[6] = @"Gender";
              v226[6] = v209;
              v89 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v88, (uint64_t)v226, (uint64_t)v225, 7);
              v93 = objc_msgSend_initWithData_(contexta, v90, (uint64_t)v89, v91, v92);

              objc_msgSend_setAxAsset_(v93, v94, (uint64_t)v36, v95, v96);
              v97 = [TTSAXResource alloc];
              v223[0] = @"Name";
              v223[1] = @"VoiceId";
              v224[0] = v42;
              v224[1] = v87;
              v223[2] = @"Languages";
              v223[3] = @"Type";
              v224[2] = v207;
              v224[3] = @"LegacyCombinedVocalizer";
              v223[4] = @"Subtype";
              v223[5] = @"Footprint";
              v224[4] = @"None";
              v224[5] = @"enhanced";
              v223[6] = @"Gender";
              v224[6] = v209;
              v99 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v98, (uint64_t)v224, (uint64_t)v223, 7);
              v103 = objc_msgSend_initWithData_(v97, v100, (uint64_t)v99, v101, v102);

              objc_msgSend_setAxAsset_(v103, v104, (uint64_t)v36, v105, v106);
              v110 = objc_msgSend_objectForKey_(v211, v107, @"LegacyCombinedVocalizer", v108, v109);
              v115 = objc_msgSend_mutableCopy(v110, v111, v112, v113, v114);

              if (!v115)
              {
                v115 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v116, v117, v118, v119);
              }
              v120 = v93;
              if (v93 && v103)
              {
                objc_msgSend_addObject_(v115, v116, (uint64_t)v93, v118, v119);
                objc_msgSend_addObject_(v115, v121, (uint64_t)v103, v122, v123);
              }
              v124 = objc_msgSend_copy(v115, v116, v117, v118, v119);
              objc_msgSend_setObject_forKey_(v211, v125, (uint64_t)v124, @"LegacyCombinedVocalizer", v126);

              uint64_t v34 = v205;
              v74 = (void *)v42;
            }
            else
            {
              v120 = AXTTSLogResourceManager();
              uint64_t v34 = v205;
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413570;
                v228 = v36;
                __int16 v229 = 2112;
                uint64_t v230 = v42;
                __int16 v231 = 2112;
                v232 = v207;
                __int16 v233 = 2112;
                v234 = v209;
                __int16 v235 = 2112;
                v236 = v72;
                __int16 v237 = 2112;
                v238 = v87;
                _os_log_error_impl(&dword_1A66D3000, v120, OS_LOG_TYPE_ERROR, "Legacy combined vocalizer asset or asset properties were nil: [Asset]: %@, [Asset Name]: %@, [Asset Languages]: %@, [Asset Gender]: %@, [Compact Identifier]: %@, [Premium Identifier]: %@", buf, 0x3Eu);
              }
            }
          }
        }
        uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v216, (uint64_t)v239, 16);
      }
      while (v206);
    }

    uint64_t v8 = v199;
  }
  v129 = objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v127, 0, 1, v128);
  context = (void *)MEMORY[0x1AD0C1200]();
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  id v204 = v129;
  uint64_t v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v130, (uint64_t)&v212, (uint64_t)v222, 16);
  if (v210)
  {
    uint64_t v208 = *(void *)v213;
    do
    {
      uint64_t v131 = 0;
      do
      {
        if (*(void *)v213 != v208) {
          objc_enumerationMutation(v204);
        }
        v132 = *(void **)(*((void *)&v212 + 1) + 8 * v131);
        v133 = [TTSAXResource alloc];
        v220[0] = @"Name";
        v138 = objc_msgSend_name(v132, v134, v135, v136, v137);
        v221[0] = v138;
        v220[1] = @"VoiceId";
        uint64_t v143 = objc_msgSend_identifier(v132, v139, v140, v141, v142);
        v148 = (void *)v143;
        if (v143) {
          v149 = (__CFString *)v143;
        }
        else {
          v149 = &stru_1EFB83720;
        }
        v221[1] = v149;
        v220[2] = @"Languages";
        uint64_t v150 = objc_msgSend_languages(v132, v144, v145, v146, v147);
        v155 = (void *)v150;
        if (v150) {
          v156 = (__CFString *)v150;
        }
        else {
          v156 = &stru_1EFB83720;
        }
        v221[2] = v156;
        v221[3] = @"LegacyVocalizer";
        v220[3] = @"Type";
        v220[4] = @"Subtype";
        v221[4] = @"None";
        v221[5] = @"enhanced";
        v220[5] = @"Footprint";
        v220[6] = @"Gender";
        unint64_t v157 = objc_msgSend_gender(v132, v151, v152, v153, v154);
        v158 = TTSStringForSpeechGender(v157);
        v163 = objc_msgSend_lowercaseString(v158, v159, v160, v161, v162);
        v221[6] = v163;
        v165 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v164, (uint64_t)v221, (uint64_t)v220, 7);
        v169 = objc_msgSend_initWithData_(v133, v166, (uint64_t)v165, v167, v168);

        objc_msgSend_setVoiceAsset_(v169, v170, (uint64_t)v132, v171, v172);
        v176 = objc_msgSend_objectForKey_(v211, v173, @"LegacyVocalizer", v174, v175);
        v181 = objc_msgSend_mutableCopy(v176, v177, v178, v179, v180);

        if (v181)
        {
          if (!v169) {
            goto LABEL_42;
          }
LABEL_41:
          objc_msgSend_addObject_(v181, v182, (uint64_t)v169, v184, v185);
          goto LABEL_42;
        }
        v181 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v182, v183, v184, v185);
        if (v169) {
          goto LABEL_41;
        }
LABEL_42:
        v186 = objc_msgSend_copy(v181, v182, v183, v184, v185);
        objc_msgSend_setObject_forKey_(v211, v187, (uint64_t)v186, @"LegacyVocalizer", v188);

        ++v131;
      }
      while (v210 != v131);
      uint64_t v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v189, (uint64_t)&v212, (uint64_t)v222, 16);
      uint64_t v210 = v190;
    }
    while (v190);
  }

  v191 = AXTTSLogResourceManager();
  BOOL v192 = os_log_type_enabled(v191, OS_LOG_TYPE_INFO);

  if (v192)
  {
    v193 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
    {
      v197 = objc_msgSend__debugCountSummaryForResources_(v200, v194, (uint64_t)v211, v195, v196);
      *(_DWORD *)buf = 138412290;
      v228 = v197;
      _os_log_impl(&dword_1A66D3000, v193, OS_LOG_TYPE_INFO, "Returning Legacy resources: %@", buf, 0xCu);
    }
  }

  return v211;
}

- (id)_readResourcesFromPreferences
{
  v28[5] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_readResourceCacheVersionFromPreferences(self, a2, v2, v3, v4) == 4)
  {
    uint64_t v5 = TTSPreferencesCopyValueForKey(@"AllCachedAvailableResourcesKey");
    if (!v5)
    {
      uint64_t v16 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A66D3000, v16, OS_LOG_TYPE_INFO, "No resource data found in preferences", buf, 2u);
      }
      v18 = 0;
      goto LABEL_20;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v28[4] = objc_opt_class();
    int64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v28, 5, v8);
    v13 = objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11, v12);

    id v26 = 0;
    uint64_t v15 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v14, (uint64_t)v13, (uint64_t)v5, (uint64_t)&v26);
    uint64_t v16 = v26;
    if (v16)
    {
      uint64_t v17 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1A688EDF0();
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = AXTTSLogResourceManager();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_1A688EE58();
        }

        v18 = objc_msgSend_mutableCopy(v15, v20, v21, v22, v23);
        goto LABEL_19;
      }
      uint64_t v17 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        sub_1A688EEC0(v24, buf, v17);
      }
    }

    v18 = 0;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  uint64_t v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "Cache version mismatch. Returning nil for resource preferences.", buf, 2u);
  }
  v18 = 0;
LABEL_21:

  return v18;
}

- (TTSAXResourceManager)init
{
  v70.receiver = self;
  v70.super_class = (Class)TTSAXResourceManager;
  uint64_t v2 = [(TTSAXResourceManager *)&v70 init];
  uint64_t v3 = v2;
  if (v2)
  {
    resources = v2->__resources;
    v2->__resources = 0;

    resourcesById = v3->__resourcesById;
    v3->__resourcesById = 0;

    resourcesByAssetId = v3->__resourcesByAssetId;
    v3->__resourcesByAssetId = 0;

    uint64_t v7 = (void *)MEMORY[0x1E4F47E08];
    uint64_t v12 = objc_msgSend_policy(MEMORY[0x1E4F47E60], v8, v9, v10, v11);
    uint64_t v14 = objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(v7, v13, (uint64_t)v12, 25, 0);
    assetController = v3->_assetController;
    v3->_assetController = (AXAssetController *)v14;

    objc_msgSend_setUserInitiated_(v3->_assetController, v16, 1, v17, v18);
    objc_msgSend_addObserver_(v3->_assetController, v19, (uint64_t)v3, v20, v21);
    uint64_t v22 = (void *)MEMORY[0x1E4F47E08];
    uint64_t v27 = objc_msgSend_policy(MEMORY[0x1E4F47E50], v23, v24, v25, v26);
    uint64_t v29 = objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(v22, v28, (uint64_t)v27, 25, 0);
    legacyCombinedVocalizerAssetController = v3->_legacyCombinedVocalizerAssetController;
    v3->_legacyCombinedVocalizerAssetController = (AXAssetController *)v29;

    objc_msgSend_setUserInitiated_(v3->_legacyCombinedVocalizerAssetController, v31, 1, v32, v33);
    objc_msgSend_addObserver_(v3->_legacyCombinedVocalizerAssetController, v34, (uint64_t)v3, v35, v36);
    v37 = (void *)MEMORY[0x1E4F47E08];
    uint64_t v42 = objc_msgSend_policy(MEMORY[0x1E4F47E58], v38, v39, v40, v41);
    uint64_t v44 = objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(v37, v43, (uint64_t)v42, 25, 0);
    legacyMacinTalkAssetController = v3->_legacyMacinTalkAssetController;
    v3->_legacyMacinTalkAssetController = (AXAssetController *)v44;

    objc_msgSend_setUserInitiated_(v3->_legacyMacinTalkAssetController, v46, 1, v47, v48);
    objc_msgSend_addObserver_(v3->_legacyMacinTalkAssetController, v49, (uint64_t)v3, v50, v51);
    if ((TTSIsBaseSystem() & 1) == 0)
    {
      v56 = (AXAssetsService *)objc_alloc_init(MEMORY[0x1E4F47E28]);
      assetsService = v3->_assetsService;
      v3->_assetsService = v56;
    }
    uint64_t v58 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v52, v53, v54, v55);
    observers = v3->__observers;
    v3->__observers = (NSHashTable *)v58;

    v60 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v61 = dispatch_queue_create("com.accessibility.resourcepref", v60);
    preferenceWriteQueue = v3->_preferenceWriteQueue;
    v3->_preferenceWriteQueue = (OS_dispatch_queue *)v61;

    dispatch_queue_t v63 = dispatch_queue_create("com.accessibility.asset-loading", v60);
    assetLoadingQueue = v3->_assetLoadingQueue;
    v3->_assetLoadingQueue = (OS_dispatch_queue *)v63;

    dispatch_queue_t v65 = dispatch_queue_create("com.accessibility.siri-service", v60);
    siriServiceQueue = v3->_siriServiceQueue;
    v3->_siriServiceQueue = (OS_dispatch_queue *)v65;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_1A670B644, (CFStringRef)*MEMORY[0x1E4FB93D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v68 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v68, v3, (CFNotificationCallback)sub_1A670B644, @"com.apple.TTS.synthProviderVoicesDidUpdate", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return v3;
}

- (id)_debugCountSummaryForResources:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_string(MEMORY[0x1E4F28E78], v4, v5, v6, v7);
  if (objc_msgSend_count(v3, v9, v10, v11, v12))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1A66D8C20;
    v20[3] = &unk_1E5C69FB8;
    id v21 = v8;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v16, (uint64_t)v20, v17, v18);
  }
  else
  {
    objc_msgSend_appendString_(v8, v13, @"None", v14, v15);
  }

  return v8;
}

- (id)resourceWithVoiceId:(id)a3
{
  if (a3)
  {
    uint64_t v5 = objc_msgSend__resourceWithVoiceId_assetId_(self, a2, (uint64_t)a3, 0, v3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)_resourceWithVoiceId:(id)a3 assetId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1A670B5E4;
  uint64_t v23 = sub_1A670B5F4;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A670E9F0;
  v15[3] = &unk_1E5C6A1E0;
  uint64_t v18 = &v19;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  objc_msgSend__accessResourceCache_(self, v10, (uint64_t)v15, v11, v12);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)_locked_ResourceWithVoiceId:(id)a3 assetId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = v7;
  if (v6)
  {
    id v13 = objc_msgSend__resourcesById(self, v8, v9, v10, v11);
    uint64_t v18 = objc_msgSend_lowercaseString(v6, v14, v15, v16, v17);
    uint64_t v22 = objc_msgSend_objectForKey_(v13, v19, (uint64_t)v18, v20, v21);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v13 = objc_msgSend__resourcesByAssetId(self, v8, v9, v10, v11);
    uint64_t v22 = objc_msgSend_objectForKey_(v13, v23, (uint64_t)v12, v24, v25);
    goto LABEL_5;
  }
  uint64_t v22 = 0;
LABEL_6:

  return v22;
}

+ (id)sharedInstance
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_1A670B5E4;
  id v8 = sub_1A670B5F4;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)allVoices:(BOOL)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1A670B5E4;
  id v13 = sub_1A670B5F4;
  id v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A66DB8CC;
  v7[3] = &unk_1E5C6A2A0;
  BOOL v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  objc_msgSend__accessResourceCache_(self, a2, (uint64_t)v7, v3, v4);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)_getSynthesisProviderResources
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v2, OS_LOG_TYPE_INFO, "Will find resources for synthesis providers", buf, 2u);
  }

  id v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6);
  BOOL v8 = (void *)MEMORY[0x1AD0C1200]();
  id v13 = objc_msgSend_allSynthesisProviderVoices(TTSSynthesisProviderVoiceManager, v9, v10, v11, v12);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v42, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v20 = [TTSAXResource alloc];
        uint64_t v27 = objc_msgSend_initWithSSEVoice_(v20, v21, v19, v22, v23);
        if (v27) {
          objc_msgSend_addObject_(v7, v24, (uint64_t)v27, v25, v26);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v28, (uint64_t)&v36, (uint64_t)v42, 16);
    }
    while (v16);
  }

  uint64_t v29 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v34 = objc_msgSend_count(v7, v30, v31, v32, v33);
    *(_DWORD *)buf = 134217984;
    uint64_t v41 = v34;
    _os_log_impl(&dword_1A66D3000, v29, OS_LOG_TYPE_INFO, "Did find %ld resources for synthesis providers", buf, 0xCu);
  }

  return v7;
}

- (AXAssetController)legacyCombinedVocalizerAssetController
{
  return self->_legacyCombinedVocalizerAssetController;
}

- (OS_dispatch_queue)assetLoadingQueue
{
  return self->_assetLoadingQueue;
}

+ (void)freeSharedInstance
{
  objc_msgSend_sharedInstance(TTSAXResourceManager, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetResourcesCache(v9, v5, v6, v7, v8);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TTSAXResourceManager;
  [(TTSAXResourceManager *)&v4 dealloc];
}

- (void)_accessResourceCache:(id)a3
{
  id v3 = a3;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char IsAXAssetsd = 0;
  char IsAXAssetsd = AXProcessIsAXAssetsd();
  id v4 = v3;
  AX_PERFORM_WITH_LOCK();

  _Block_object_dispose(v5, 8);
}

- (void)_updateCachedResources_locked:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  objc_msgSend_set_resources_(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v6 = objc_opt_new();
  objc_msgSend_set_resourcesById_(self, v7, (uint64_t)v6, v8, v9);

  uint64_t v10 = objc_opt_new();
  objc_msgSend_set_resourcesByAssetId_(self, v11, (uint64_t)v10, v12, v13);

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v18 = objc_msgSend__resources(self, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_allValues(v18, v19, v20, v21, v22);

  id obj = v23;
  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v72, (uint64_t)v77, 16);
  if (v67)
  {
    uint64_t v66 = *(void *)v73;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v73 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v72 + 1) + 8 * v25);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v27 = v26;
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v68, (uint64_t)v76, 16);
        if (v29)
        {
          uint64_t v34 = v29;
          uint64_t v35 = *(void *)v69;
          do
          {
            uint64_t v36 = 0;
            do
            {
              if (*(void *)v69 != v35) {
                objc_enumerationMutation(v27);
              }
              long long v37 = *(void **)(*((void *)&v68 + 1) + 8 * v36);
              long long v38 = objc_msgSend__resourcesById(self, v30, v31, v32, v33);
              uint64_t v43 = objc_msgSend_voiceId(v37, v39, v40, v41, v42);
              uint64_t v48 = objc_msgSend_lowercaseString(v43, v44, v45, v46, v47);
              objc_msgSend_setObject_forKey_(v38, v49, (uint64_t)v37, (uint64_t)v48, v50);

              uint64_t v55 = objc_msgSend_assetId(v37, v51, v52, v53, v54);

              if (v55)
              {
                v56 = objc_msgSend__resourcesByAssetId(self, v30, v31, v32, v33);
                dispatch_queue_t v61 = objc_msgSend_assetId(v37, v57, v58, v59, v60);
                objc_msgSend_setObject_forKey_(v56, v62, (uint64_t)v37, (uint64_t)v61, v63);
              }
              ++v36;
            }
            while (v34 != v36);
            uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v68, (uint64_t)v76, 16);
          }
          while (v34);
        }

        ++v25;
      }
      while (v25 != v67);
      uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v64, (uint64_t)&v72, (uint64_t)v77, 16);
    }
    while (v67);
  }
}

- (void)_mergeInResources:(id)a3 to:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v5;
  uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v71, (uint64_t)v76, 16);
  if (v63)
  {
    uint64_t v61 = *(void *)v72;
    uint64_t v62 = v6;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v72 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v6, v8, (uint64_t)v12, v9, v10);
        id v14 = (void *)v13;
        uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
        if (v13) {
          uint64_t v15 = (void *)v13;
        }
        id v16 = v15;

        uint64_t v66 = v16;
        uint64_t v20 = objc_msgSend__dictionaryForResources_(self, v17, (uint64_t)v16, v18, v19);
        uint64_t v25 = objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);

        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(obj, v26, (uint64_t)v12, v27, v28);
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v67, (uint64_t)v75, 16);
        if (v31)
        {
          uint64_t v36 = v31;
          uint64_t v37 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v68 != v37) {
                objc_enumerationMutation(v29);
              }
              long long v39 = *(void **)(*((void *)&v67 + 1) + 8 * j);
              uint64_t v40 = objc_msgSend_voiceId(v39, v32, v33, v34, v35);

              if (v40)
              {
                uint64_t v41 = objc_msgSend_voiceId(v39, v32, v33, v34, v35);
                uint64_t v46 = objc_msgSend_lowercaseString(v41, v42, v43, v44, v45);
                objc_msgSend_setObject_forKeyedSubscript_(v25, v47, (uint64_t)v39, (uint64_t)v46, v48);
              }
            }
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v67, (uint64_t)v75, 16);
          }
          while (v36);
        }

        uint64_t v53 = objc_msgSend_allValues(v25, v49, v50, v51, v52);
        if (objc_msgSend_isEqualToString_(v12, v54, @"MacinTalk", v55, v56))
        {
          uint64_t v60 = objc_msgSend__findAndSwapLegacyMacinTalkAssetsForMacinTalkResources_(self, v57, (uint64_t)v53, v58, v59);

          uint64_t v53 = (void *)v60;
        }
        id v6 = v62;
        objc_msgSend_setObject_forKeyedSubscript_(v62, v57, (uint64_t)v53, (uint64_t)v12, v59);
      }
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v71, (uint64_t)v76, 16);
    }
    while (v63);
  }
}

- (id)_expensiveResources
{
  uint64_t v3 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_INFO, "Running block to compute expensive resources", buf, 2u);
  }

  uint64_t v8 = objc_msgSend__findResourcesForLegacyAssets(self, v4, v5, v6, v7);
  uint64_t v9 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_1A66D3000, v9, OS_LOG_TYPE_INFO, "Will ask assetController to refresh only-installed TTSResource AXAssets now", v29, 2u);
  }

  uint64_t v13 = objc_msgSend__axAssetsForTTSAXResourceModel_(self, v10, 1, v11, v12);
  uint64_t v17 = objc_msgSend__resourcesForAssets_(self, v14, (uint64_t)v13, v15, v16);

  uint64_t v21 = objc_msgSend__refreshSiriResources_(self, v18, 1, v19, v20);
  objc_msgSend_addEntriesFromDictionary_(v8, v22, (uint64_t)v17, v23, v24);
  objc_msgSend_addEntriesFromDictionary_(v8, v25, (uint64_t)v21, v26, v27);

  return v8;
}

- (void)_mergeInExpensiveInstalledAssets_locked:(BOOL)a3 notifyObservers:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((TTSIsBaseSystem() & 1) == 0)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A670C40C;
    aBlock[3] = &unk_1E5C69FE0;
    objc_copyWeak(&v18, &location);
    aBlock[4] = self;
    BOOL v19 = v5;
    BOOL v20 = a4;
    uint64_t v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v8 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      BOOL v23 = v5;
      _os_log_impl(&dword_1A66D3000, v8, OS_LOG_TYPE_INFO, "Will merge in expensive resources. sync=%ld", buf, 0xCu);
    }

    if (v5)
    {
      uint64_t v13 = objc_msgSend__expensiveResources(self, v9, v10, v11, v12);
      v7[2](v7, v13);
    }
    else
    {
      id v14 = objc_msgSend_assetLoadingQueue(self, v9, v10, v11, v12);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1A670C53C;
      v15[3] = &unk_1E5C6A030;
      v15[4] = self;
      uint64_t v16 = v7;
      dispatch_async(v14, v15);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (AXAsset)samplesAsset
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_samplesAsset)
  {
    uint64_t v3 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_INFO, "Samples asset has not been initialized, attempting to read from mobile asset.", (uint8_t *)&v18, 2u);
    }

    objc_msgSend__refreshSamples_(self, v4, 1, v5, v6);
    uint64_t v7 = (AXAsset *)objc_claimAutoreleasedReturnValue();
    samplesAsset = self->_samplesAsset;
    self->_samplesAsset = v7;

    uint64_t v9 = self->_samplesAsset;
    uint64_t v10 = AXTTSLogResourceManager();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        uint64_t v12 = self->_samplesAsset;
        int v18 = 138412290;
        BOOL v19 = v12;
        uint64_t v13 = "Samples asset has been found: %@";
        id v14 = v10;
        uint32_t v15 = 12;
LABEL_9:
        _os_log_impl(&dword_1A66D3000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, v15);
      }
    }
    else if (v11)
    {
      LOWORD(v18) = 0;
      uint64_t v13 = "Samples asset was nil, it has not been downloaded yet.";
      id v14 = v10;
      uint32_t v15 = 2;
      goto LABEL_9;
    }
  }
  uint64_t v16 = self->_samplesAsset;

  return v16;
}

- (id)_refreshSamples:(BOOL)a3
{
  BOOL v5 = a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = @"Sample";
  uint64_t v7 = objc_msgSend_stringValue(MEMORY[0x1E4F1CC38], a2, a3, v3, v4);
  v25[0] = v7;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v25, (uint64_t)&v24, 1);

  id v14 = objc_msgSend_assetController(self, v10, v11, v12, v13);
  uint64_t v17 = objc_msgSend_refreshAssetsWithAttributesSynchronously_installedOnly_(v14, v15, (uint64_t)v9, v5, v16);
  uint64_t v22 = objc_msgSend_firstObject(v17, v18, v19, v20, v21);

  return v22;
}

- (id)_refreshResourcesForManagerType:(unint64_t)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  BOOL v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v6, a3, v7, v8);
    int v90 = 138412290;
    uint64_t v91 = v9;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "Will refresh resources for type: %@", (uint8_t *)&v90, 0xCu);
  }
  uint64_t v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12, v13);
  if (a3)
  {
    int v18 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], v14, @"/System/Library/PrivateFrameworks/TextToSpeechMauiSupport.framework", v15, v16);
    uint64_t v21 = v18;
    if (v18)
    {
      uint64_t v22 = objc_msgSend_pathForResource_ofType_(v18, v19, @"TTSResources", 0, v20);
      uint64_t v26 = objc_msgSend__findLocalResourcesForPath_(self, v23, (uint64_t)v22, v24, v25);

      if (v26) {
        objc_msgSend_addEntriesFromDictionary_(v17, v27, (uint64_t)v26, v28, v29);
      }
    }
    else
    {
      uint64_t v26 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1A688E6D0();
      }
    }

    if (TTSIsBaseSystem()) {
      goto LABEL_19;
    }
    v30 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(v90) = 0;
      _os_log_impl(&dword_1A66D3000, v30, OS_LOG_TYPE_INFO, "Will ask assetController to refresh TTSResource AXAssets now", (uint8_t *)&v90, 2u);
    }

    uint64_t v34 = objc_msgSend__axAssetsForTTSAXResourceModel_(self, v31, 0, v32, v33);
    long long v38 = objc_msgSend__resourcesForAssets_(self, v35, (uint64_t)v34, v36, v37);

    uint64_t v42 = objc_msgSend_objectForKey_(v17, v39, @"Maui", v40, v41);
    uint64_t v47 = v42;
    if (!v42) {
      uint64_t v42 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v48 = objc_msgSend_mutableCopy(v42, v43, v44, v45, v46);

    uint64_t v52 = objc_msgSend_objectForKey_(v38, v49, @"Maui", v50, v51);
    objc_msgSend_addObjectsFromArray_(v48, v53, (uint64_t)v52, v54, v55);

    uint64_t v59 = objc_msgSend_objectForKey_(v17, v56, @"MacinTalk", v57, v58);
    v64 = v59;
    if (!v59) {
      uint64_t v59 = (void *)MEMORY[0x1E4F1CBF0];
    }
    dispatch_queue_t v65 = objc_msgSend_mutableCopy(v59, v60, v61, v62, v63);

    long long v69 = objc_msgSend_objectForKey_(v38, v66, @"MacinTalk", v67, v68);
    objc_msgSend_addObjectsFromArray_(v65, v70, (uint64_t)v69, v71, v72);

    uint64_t v77 = objc_msgSend_copy(v48, v73, v74, v75, v76);
    objc_msgSend_setObject_forKey_(v17, v78, (uint64_t)v77, @"Maui", v79);

    v83 = objc_msgSend__findAndSwapLegacyMacinTalkAssetsForMacinTalkResources_(self, v80, (uint64_t)v65, v81, v82);
    objc_msgSend_setObject_forKey_(v17, v84, (uint64_t)v83, @"MacinTalk", v85);
  }
  if ((a3 & 2) == 0) {
    goto LABEL_20;
  }
  uint64_t v21 = objc_msgSend__refreshSiriResources_(self, v14, 0, v15, v16);
  objc_msgSend_addEntriesFromDictionary_(v17, v86, (uint64_t)v21, v87, v88);
LABEL_19:

LABEL_20:

  return v17;
}

- (void)rebuildSystemCacheForActionType:(unint64_t)a3
{
  BOOL v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1A688E704();
  }

  uint64_t v10 = objc_msgSend_assetsService(self, v6, v7, v8, v9);
  objc_msgSend_updateTTSResourcesForActionType_(v10, v11, a3, v12, v13);
}

- (void)downloadResourceWithAssetId:(id)a3
{
  objc_msgSend_resourceWithAssetId_(self, a2, (uint64_t)a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__downloadResource_userInitiated_(self, v6, (uint64_t)v8, 1, v7);
}

- (void)downloadResourceWithVoiceId:(id)a3
{
}

- (void)downloadResourceWithVoiceId:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v5 = a4;
  objc_msgSend_resourceWithVoiceId_(self, a2, (uint64_t)a3, a4, v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v15, v7, v8, v9, v10) == 3 || objc_msgSend_type(v15, v11, v12, v13, v14) == 10) {
    objc_msgSend__downloadSiriVoiceAssetWithResource_(self, v11, (uint64_t)v15, v13, v14);
  }
  else {
    objc_msgSend__downloadResource_userInitiated_(self, v11, (uint64_t)v15, v5, v14);
  }
}

- (void)stopDownloadResourceWithVoiceId:(id)a3
{
  objc_msgSend_resourceWithVoiceId_(self, a2, (uint64_t)a3, v3, v4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v14, v6, v7, v8, v9) == 3 || objc_msgSend_type(v14, v10, v11, v12, v13) == 10) {
    objc_msgSend__stopDownloadSiriVoiceAssetWithResource_(self, v10, (uint64_t)v14, v12, v13);
  }
  else {
    objc_msgSend__stopDownloadResource_(self, v10, (uint64_t)v14, v12, v13);
  }
}

- (void)_stopDownloadSiriVoiceAssetWithResource:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v10 = objc_msgSend_primaryLanguage(v4, v5, v6, v7, v8);
    uint64_t v15 = objc_msgSend_gender(v9, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_footprint(v9, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_name(v9, v21, v22, v23, v24);
    v30 = objc_msgSend_speechVoice(v9, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_voiceType(v30, v31, v32, v33, v34);
    uint64_t v37 = objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v36, (uint64_t)v10, v15, v20, v25, v35);

    objc_msgSend_stopDownload_(TTSSiriAssetManager, v38, (uint64_t)v37, v39, v40);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = sub_1A670CF08;
    v44[3] = &unk_1E5C6A058;
    id v45 = v9;
    objc_msgSend__performBlockOnObservers_(self, v41, (uint64_t)v44, v42, v43);
  }
  else
  {
    uint64_t v37 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1A688E744();
    }
  }
}

- (void)_stopDownloadResource:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_assetController(self, v5, v6, v7, v8);
  uint64_t v11 = objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v10, (uint64_t)v4, (uint64_t)v9, 0);

  if (v4 && v11)
  {
    uint64_t v16 = objc_msgSend_assetController(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1A670D13C;
    v20[3] = &unk_1E5C6A080;
    void v20[4] = self;
    id v21 = v4;
    id v22 = v11;
    objc_msgSend_stopDownloadAsset_completion_(v16, v17, (uint64_t)v22, (uint64_t)v20, v18);
  }
  else
  {
    uint64_t v19 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1A688E778();
    }
  }
}

- (void)_downloadResource:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = v6;
  if (v6)
  {
    if (objc_msgSend_isInstalled(v6, v7, v8, v9, v10))
    {
      uint64_t v16 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1A688E8BC();
      }
    }
    else
    {
      if (objc_msgSend_type(v11, v12, v13, v14, v15) == 6 || objc_msgSend_type(v11, v24, v25, v26, v27) == 7)
      {
        uint64_t v16 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v24, v25, v26, v27);
        objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v28, (uint64_t)v11, (uint64_t)v16, 0);
      }
      else
      {
        uint64_t v16 = objc_msgSend_assetController(self, v24, v25, v26, v27);
        objc_msgSend_setUserInitiated_(v16, v29, v4, v30, v31);
        objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v32, (uint64_t)v11, (uint64_t)v16, 0);
      uint64_t v33 = };
      uint64_t v36 = (void *)v33;
      if (v33)
      {
        v43[0] = v33;
        uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v43, 1, v35);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = sub_1A670D4E4;
        v41[3] = &unk_1E5C6A0A8;
        uint64_t v42 = v36;
        objc_msgSend_downloadAssets_successStartBlock_(v16, v38, (uint64_t)v37, (uint64_t)v41, v39);

        uint64_t v40 = v42;
      }
      else
      {
        uint64_t v40 = AXTTSLogResourceManager();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_1A688E778();
        }
      }
    }
  }
  else
  {
    uint64_t v16 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1A688E84C(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)_downloadSiriVoiceAssetWithResource:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v10 = objc_msgSend_primaryLanguage(v4, v5, v6, v7, v8);
    uint64_t v15 = objc_msgSend_gender(v9, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend_footprint(v9, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_name(v9, v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_speechVoice(v9, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_voiceType(v30, v31, v32, v33, v34);
    uint64_t v37 = objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v36, (uint64_t)v10, v15, v20, v25, v35);

    long long v38 = AXTTSLogResourceManager();
    uint64_t v39 = v38;
    if (v37)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v47 = v37;
        _os_log_impl(&dword_1A66D3000, v39, OS_LOG_TYPE_DEFAULT, "Will ask SiriTTS to download asset: %@", buf, 0xCu);
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = sub_1A670D74C;
      v42[3] = &unk_1E5C6A148;
      uint64_t v43 = v9;
      uint64_t v44 = self;
      id v45 = v37;
      objc_msgSend_downloadAsset_progressHandler_(TTSSiriAssetManager, v40, (uint64_t)v45, (uint64_t)v42, v41);

      uint64_t v39 = v43;
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      sub_1A688E9C4();
    }
  }
  else
  {
    uint64_t v37 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1A688E990();
    }
  }
}

- (void)downloadSamplesIfNecessary
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_samplesAsset(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_localURL(v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v16 = (void *)v11;
    uint64_t v17 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13, v14, v15);
    uint64_t v22 = objc_msgSend_localURL(v6, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_path(v22, v23, v24, v25, v26);
    int v31 = objc_msgSend_fileExistsAtPath_(v17, v28, (uint64_t)v27, v29, v30);

    if (v31)
    {
      uint64_t v32 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A66D3000, v32, OS_LOG_TYPE_INFO, "Speech sample DL: Already downloaded. Bailing", buf, 2u);
      }

LABEL_11:
      return;
    }
  }
  if ((objc_msgSend_isDownloading(v6, v12, v13, v14, v15) & 1) != 0
    || objc_msgSend_downloadingSamples(self, v33, v34, v35, v36))
  {
    uint64_t v40 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v81 = objc_msgSend_downloadingSamples(self, v41, v42, v43, v44);
      __int16 v82 = 2048;
      uint64_t isDownloading = objc_msgSend_isDownloading(v6, v45, v46, v47, v48);
      _os_log_impl(&dword_1A66D3000, v40, OS_LOG_TYPE_INFO, "Speech sample DL: Already in progress. downloadingSamples=%ld samplesAsset.isDownloading=%ld", buf, 0x16u);
    }

    goto LABEL_11;
  }
  objc_msgSend_setDownloadingSamples_(self, v37, 1, v38, v39);
  uint64_t v52 = objc_msgSend__refreshSamples_(self, v49, 0, v50, v51);

  if (v52)
  {
    objc_msgSend_setSamplesAsset_(self, v53, (uint64_t)v52, v54, v55);
    uint64_t v60 = objc_msgSend_assetController(self, v56, v57, v58, v59);
    objc_msgSend_setUserInitiated_(v60, v61, 0, v62, v63);

    v64 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A66D3000, v64, OS_LOG_TYPE_INFO, "Speech sample DL: About to kick off download.", buf, 2u);
    }

    long long v69 = objc_msgSend_assetController(self, v65, v66, v67, v68);
    uint64_t v79 = v52;
    uint64_t v72 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v70, (uint64_t)&v79, 1, v71);
    objc_msgSend_downloadAssets_successStartBlock_(v69, v73, (uint64_t)v72, (uint64_t)&unk_1EFB803E0, v74);
  }
  else
  {
    uint64_t v75 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      sub_1A688EA2C();
    }

    objc_msgSend_setDownloadingSamples_(self, v76, 0, v77, v78);
  }
}

- (void)deleteResourceWithAssetId:(id)a3
{
  objc_msgSend_resourceWithAssetId_(self, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deleteResource_(self, v6, (uint64_t)v9, v7, v8);
}

- (void)deleteResourceWithVoiceId:(id)a3
{
  objc_msgSend_resourceWithVoiceId_(self, a2, (uint64_t)a3, v3, v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(v15, v6, v7, v8, v9) == 3
    || objc_msgSend_type(v15, v10, v11, v12, v13) == 7
    || objc_msgSend_type(v15, v10, v14, v12, v13) == 10)
  {
    objc_msgSend__deleteSiriVoiceAssetWithResource_(self, v10, (uint64_t)v15, v12, v13);
  }
  else
  {
    objc_msgSend__deleteResource_(self, v10, (uint64_t)v15, v12, v13);
  }
}

- (void)_deleteResource:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isInstalled(v4, v5, v6, v7, v8))
  {
    if (objc_msgSend_type(v4, v9, v10, v11, v12) == 6 || objc_msgSend_type(v4, v13, v14, v15, v16) == 7)
    {
      uint64_t v17 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v13, v14, v15, v16);
    }
    else
    {
      uint64_t v17 = objc_msgSend_assetController(self, v13, v14, v15, v16);
    }
    uint64_t v19 = v17;
    uint64_t v20 = objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v18, (uint64_t)v4, v17, 1);
    if (v20)
    {
      uint64_t v25 = v20;
    }
    else
    {
      uint64_t v26 = objc_msgSend_legacyMacinTalkAssetController(self, v21, v22, v23, v24);
      uint64_t v25 = objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v27, (uint64_t)v4, (uint64_t)v26, 1);

      if (!v25)
      {
        uint64_t v25 = AXTTSLogResourceManager();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1A688E778();
        }
        goto LABEL_13;
      }
      uint64_t v32 = objc_msgSend_legacyMacinTalkAssetController(self, v28, v29, v30, v31);

      uint64_t v19 = v32;
    }
    v45[0] = v25;
    uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v45, 1, v24);
    objc_msgSend_purgeAssetsSynchronously_(v19, v34, (uint64_t)v33, v35, v36);

    objc_msgSend_rebuildSystemCacheForActionType_(self, v37, 0, v38, v39);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    void v43[2] = sub_1A670E1E4;
    v43[3] = &unk_1E5C6A058;
    id v44 = v4;
    objc_msgSend__performBlockOnObservers_(self, v40, (uint64_t)v43, v41, v42);

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v19 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1A688EA60();
  }
LABEL_14:
}

- (void)_deleteSiriVoiceAssetWithResource:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_primaryLanguage(v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_gender(v4, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_footprint(v4, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_name(v4, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_speechVoice(v4, v25, v26, v27, v28);
  uint64_t v34 = objc_msgSend_voiceType(v29, v30, v31, v32, v33);
  uint64_t v36 = objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v35, (uint64_t)v9, v14, v19, v24, v34);

  objc_msgSend_purgeAsset_(TTSSiriAssetManager, v37, (uint64_t)v36, v38, v39);
  objc_msgSend_rebuildSystemCacheForActionType_(self, v40, 0, v41, v42);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1A670E434;
  v47[3] = &unk_1E5C6A058;
  id v48 = v4;
  id v43 = v4;
  objc_msgSend__performBlockOnObservers_(self, v44, (uint64_t)v47, v45, v46);
}

- (id)resourcesWithLanguage:(id)a3 type:(unint64_t)a4
{
  return (id)objc_msgSend__resourcesWithType_subType_languageCode_(self, a2, a4, 1, (uint64_t)a3);
}

- (id)resourcesWithType:(unint64_t)a3 subType:(unint64_t)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v5 = objc_msgSend__resourcesWithType_subType_languageCode_(self, a2, a3, a4, 0);
  }
  return v5;
}

- (id)_resourcesWithType:(unint64_t)a3 subType:(unint64_t)a4 languageCode:(id)a5
{
  id v8 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1A670B5E4;
  uint64_t v24 = sub_1A670B5F4;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A670E6CC;
  v15[3] = &unk_1E5C6A1B8;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  v15[4] = self;
  id v9 = v8;
  id v16 = v9;
  uint64_t v17 = &v20;
  objc_msgSend__accessResourceCache_(self, v10, (uint64_t)v15, v11, v12);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

- (id)resourceWithAssetId:(id)a3
{
  if (a3)
  {
    BOOL v5 = objc_msgSend__resourceWithVoiceId_assetId_(self, a2, 0, (uint64_t)a3, v3);
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (id)defaultVoiceForLanguage:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_resourcesWithLanguage_type_(self, v5, (uint64_t)v4, 1, v6);
  uint64_t v11 = objc_msgSend_ax_filteredArrayUsingBlock_(v7, v8, (uint64_t)&unk_1EFB80A28, v9, v10);
  if ((unint64_t)objc_msgSend_count(v11, v12, v13, v14, v15) < 2)
  {
    if (objc_msgSend_count(v11, v16, v17, v18, v19)) {
      goto LABEL_9;
    }
    uint64_t v20 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v33 = 138412290;
      *(void *)&v33[4] = v4;
      uint64_t v21 = "No default resources found for language: %@. ";
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v20 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v33 = 138412290;
      *(void *)&v33[4] = v4;
      uint64_t v21 = "Multiple default resources found for language: %@. Returning one at random";
LABEL_7:
      _os_log_impl(&dword_1A66D3000, v20, OS_LOG_TYPE_DEFAULT, v21, v33, 0xCu);
    }
  }

LABEL_9:
  uint64_t v26 = objc_msgSend_firstObject(v11, v22, v23, v24, v25, *(_OWORD *)v33);
  uint64_t v31 = objc_msgSend_speechVoice(v26, v27, v28, v29, v30);

  return v31;
}

- (id)languageCodeForResourceName:(id)a3 withType:(unint64_t)a4
{
  id v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend_resourcesWithType_subType_(self, v6, a4, 1, v7);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_1A670ED30;
    uint64_t v28 = &unk_1E5C6A228;
    id v29 = v8;
    unint64_t v30 = a4;
    uint64_t v14 = objc_msgSend_indexOfObjectPassingTest_(v10, v11, (uint64_t)&v25, v12, v13);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = 0;
      objc_msgSend_primaryLanguage(0, v15, v16, v17, v18, v25, v26, v27, v28);
    }
    else
    {
      uint64_t v19 = objc_msgSend_objectAtIndex_(v10, v15, v14, v17, v18, v25, v26, v27, v28);
      objc_msgSend_primaryLanguage(v19, v20, v21, v22, v23, v25, v26, v27, v28);
    uint64_t v9 = };
  }

  return v9;
}

- (id)superCompactVoiceIdForCompactVoiceId:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_hasPrefix_(v3, v4, @"com.apple.voice.compact", v5, v6))
  {
    uint64_t v9 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v3, v7, @"compact", @"super-compact", v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_findLocalResourcesForPath:(id)a3
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v159 = (uint64_t)v4;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "Will find local resources at path: %@", buf, 0xCu);
  }

  uint64_t v146 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7, v8, v9);
  unint64_t v10 = 0x1E4F28000uLL;
  uint64_t v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12, v13, v14);
  id v157 = 0;
  v134 = objc_msgSend_contentsOfDirectoryAtPath_error_(v15, v16, (uint64_t)v4, (uint64_t)&v157, v17);
  id v18 = v157;

  if (v18)
  {
    uint64_t v20 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1A688EB64();
    }
LABEL_6:
    id v21 = 0;
    goto LABEL_48;
  }
  v133 = self;
  id v156 = 0;
  uint64_t v20 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v19, @"^[^-]{2,3}-[^-]{2,3}(-[^-]{2,3})?$", 0, (uint64_t)&v156);
  id v22 = v156;
  if (!v22)
  {
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    uint64_t v23 = v134;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v152, (uint64_t)v163, 16);
    if (!v25) {
      goto LABEL_42;
    }
    uint64_t v29 = v25;
    uint64_t v30 = *(void *)v153;
    uint64_t v137 = v20;
    id v138 = v4;
    uint64_t v135 = *(void *)v153;
    uint64_t v136 = v23;
LABEL_12:
    uint64_t v31 = 0;
    uint64_t v139 = v29;
    while (1)
    {
      if (*(void *)v153 != v30) {
        objc_enumerationMutation(v23);
      }
      uint64_t v32 = *(void **)(*((void *)&v152 + 1) + 8 * v31);
      if ((objc_msgSend_isEqualToString_(v32, v26, @"common", v27, v28) & 1) == 0)
      {
        uint64_t v34 = objc_msgSend_length(v32, v26, v33, v27, v28);
        uint64_t v141 = objc_msgSend_matchesInString_options_range_(v20, v35, (uint64_t)v32, 0, 0, v34);
        if (objc_msgSend_count(v141, v36, v37, v38, v39))
        {
          uint64_t v43 = objc_msgSend_stringByAppendingPathComponent_(v4, v40, (uint64_t)v32, v41, v42);
          id v48 = objc_msgSend_defaultManager(*(void **)(v10 + 3256), v44, v45, v46, v47);
          id v151 = 0;
          uint64_t v143 = (void *)v43;
          uint64_t v51 = objc_msgSend_contentsOfDirectoryAtPath_error_(v48, v49, v43, (uint64_t)&v151, v50);
          id v18 = v151;

          if (v18)
          {
            v132 = AXTTSLogResourceManager();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
              sub_1A688EA94();
            }

            goto LABEL_6;
          }
          uint64_t v140 = v31;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          id obj = v51;
          uint64_t v53 = v143;
          uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v147, (uint64_t)v162, 16);
          if (!v145) {
            goto LABEL_36;
          }
          uint64_t v144 = *(void *)v148;
          while (2)
          {
            uint64_t v57 = 0;
LABEL_21:
            if (*(void *)v148 != v144) {
              objc_enumerationMutation(obj);
            }
            uint64_t v58 = *(void *)(*((void *)&v147 + 1) + 8 * v57);
            uint64_t v59 = objc_msgSend_stringByAppendingPathComponent_(v53, v54, v58, v55, v56);
            uint64_t v63 = objc_msgSend_stringByAppendingPathComponent_(v59, v60, @"Info.plist", v61, v62);
            uint64_t v67 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v64, (uint64_t)v63, v65, v66);
            uint64_t v71 = objc_msgSend_objectForKey_(v67, v68, @"MobileAssetProperties", v69, v70);
            uint64_t v76 = objc_msgSend_mutableCopy(v71, v72, v73, v74, v75);

            uint64_t v77 = [TTSAXResource alloc];
            uint64_t v81 = objc_msgSend_initWithData_(v77, v78, (uint64_t)v76, v79, v80);
            uint64_t v86 = objc_msgSend_voiceId(v81, v82, v83, v84, v85);
            if (objc_msgSend_hasPrefix_(v86, v87, @"com.apple.maui.voice", v88, v89))
            {
              char v90 = TTSIsInternalBuild();

              if (v90) {
                goto LABEL_34;
              }
            }
            else
            {
            }
            unint64_t v95 = objc_msgSend_type(v81, v91, v92, v93, v94);
            uint64_t v96 = TTSStringForResourceType(v95);
            v100 = objc_msgSend_objectForKey_(v146, v97, (uint64_t)v96, v98, v99);
            uint64_t v105 = objc_msgSend_mutableCopy(v100, v101, v102, v103, v104);

            if (!v105)
            {
              uint64_t v105 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v106, v107, v108, v109);
            }
            uint64_t v53 = v143;
            if (v81)
            {
              objc_msgSend_addObject_(v105, v106, (uint64_t)v81, v108, v109);
              uint64_t v114 = objc_msgSend_copy(v105, v110, v111, v112, v113);
              unint64_t v119 = objc_msgSend_type(v81, v115, v116, v117, v118);
              v120 = TTSStringForResourceType(v119);
              objc_msgSend_setObject_forKey_(v146, v121, (uint64_t)v114, (uint64_t)v120, v122);
            }
            else
            {
              uint64_t v114 = AXTTSLogResourceManager();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v159 = v58;
                _os_log_error_impl(&dword_1A66D3000, v114, OS_LOG_TYPE_ERROR, "Resource for %@ is nil", buf, 0xCu);
              }
            }

LABEL_34:
            if (v145 == ++v57)
            {
              uint64_t v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v147, (uint64_t)v162, 16);
              if (!v145)
              {
LABEL_36:

                uint64_t v20 = v137;
                id v4 = v138;
                uint64_t v30 = v135;
                uint64_t v23 = v136;
                unint64_t v10 = 0x1E4F28000;
                uint64_t v29 = v139;
                uint64_t v31 = v140;
                goto LABEL_39;
              }
              continue;
            }
            goto LABEL_21;
          }
        }
        uint64_t v123 = AXTTSLogResourceManager();
        uint64_t v143 = v123;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v159 = (uint64_t)v32;
          _os_log_impl(&dword_1A66D3000, v123, OS_LOG_TYPE_INFO, "Invalid directory format %@", buf, 0xCu);
        }
LABEL_39:
      }
      if (++v31 == v29)
      {
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v152, (uint64_t)v163, 16);
        if (!v29)
        {
LABEL_42:
          id v18 = 0;
          goto LABEL_43;
        }
        goto LABEL_12;
      }
    }
  }
  id v18 = v22;
  uint64_t v23 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_1A688EAFC();
  }
LABEL_43:

  v124 = AXTTSLogResourceManager();
  BOOL v125 = os_log_type_enabled(v124, OS_LOG_TYPE_INFO);

  if (v125)
  {
    uint64_t v126 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
    {
      v130 = objc_msgSend__debugCountSummaryForResources_(v133, v127, (uint64_t)v146, v128, v129);
      *(_DWORD *)buf = 138412546;
      uint64_t v159 = (uint64_t)v4;
      __int16 v160 = 2112;
      uint64_t v161 = v130;
      _os_log_impl(&dword_1A66D3000, v126, OS_LOG_TYPE_INFO, "Did find local resources at path: %@. %@", buf, 0x16u);
    }
  }
  id v21 = v146;
LABEL_48:

  return v21;
}

- (id)speechVoiceWithVoiceId:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_allVoices_(self, v5, 0, v6, v7);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A670F61C;
  v19[3] = &unk_1E5C6A250;
  id v9 = v4;
  id v20 = v9;
  uint64_t v13 = objc_msgSend_indexOfObjectPassingTest_(v8, v10, (uint64_t)v19, v11, v12);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_objectAtIndex_(v8, v14, v13, v15, v16);
  }

  return v17;
}

- (id)refreshedResourcesForResources:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v4;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v12)
  {
    uint64_t v17 = v12;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v10);
        }
        uint64_t v23 = objc_msgSend_voiceId(*(void **)(*((void *)&v29 + 1) + 8 * i), v13, v14, v15, v16, (void)v29);
        if (v23)
        {
          uint64_t v27 = objc_msgSend_resourceWithVoiceId_(self, v20, (uint64_t)v23, v21, v22);
          if (v27) {
            objc_msgSend_addObject_(v9, v24, (uint64_t)v27, v25, v26);
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v17);
  }

  return v9;
}

- (void)sampleURLForVoiceId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_resourceWithVoiceId_(self, v8, (uint64_t)v6, v9, v10);
  if (objc_msgSend_type(v11, v12, v13, v14, v15) == 3)
  {
    siriServiceQueue = self->_siriServiceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A670FA24;
    block[3] = &unk_1E5C69F18;
    id v60 = v11;
    id v62 = v7;
    id v61 = v6;
    dispatch_async(siriServiceQueue, block);
  }
  else
  {
    uint64_t v21 = objc_msgSend_samplesAsset(self, v16, v17, v18, v19);
    if (!v21) {
      goto LABEL_9;
    }
    uint64_t v26 = (void *)v21;
    uint64_t v27 = objc_msgSend_samplesAsset(self, v22, v23, v24, v25);
    long long v32 = objc_msgSend_localURL(v27, v28, v29, v30, v31);

    if (v32)
    {
      uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(&unk_1EFB95780, v33, (uint64_t)v6, v34, v35);
      uint64_t v37 = (void *)v36;
      if (v36) {
        uint64_t v38 = (void *)v36;
      }
      else {
        uint64_t v38 = v6;
      }
      id v39 = v38;

      id v44 = objc_msgSend_samplesAsset(self, v40, v41, v42, v43);
      uint64_t v49 = objc_msgSend_localURL(v44, v45, v46, v47, v48);
      uint64_t v53 = objc_msgSend_stringWithFormat_(NSString, v50, @"Contents/%@.caf", v51, v52, v39);

      uint64_t v57 = objc_msgSend_URLByAppendingPathComponent_(v49, v54, (uint64_t)v53, v55, v56);
      (*((void (**)(id, void *))v7 + 2))(v7, v57);
    }
    else
    {
LABEL_9:
      uint64_t v58 = AXTTSLogResourceManager();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_1A688EB98();
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (id)_resourcesForAssets:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6, v7);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v9 = v3;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v116, (uint64_t)v121, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v117;
    uint64_t v14 = &off_1E5C69000;
    id v109 = v9;
    uint64_t v110 = *(void *)v117;
    do
    {
      uint64_t v15 = 0;
      uint64_t v111 = v12;
      do
      {
        if (*(void *)v117 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void *)(*((void *)&v116 + 1) + 8 * v15);
        id v17 = objc_alloc((Class)v14[39]);
        uint64_t v21 = objc_msgSend_initWithAsset_(v17, v18, v16, v19, v20);
        if (v21)
        {
          if (!TTSIsInternalBuild()
            || (objc_msgSend_voiceId(v21, v22, v23, v24, v25),
                uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                char hasPrefix = objc_msgSend_hasPrefix_(v26, v27, @"com.apple.maui.voice", v28, v29),
                v26,
                (hasPrefix & 1) == 0))
          {
            unint64_t v31 = objc_msgSend_type(v21, v22, v23, v24, v25);
            long long v32 = TTSStringForResourceType(v31);
            uint64_t v36 = objc_msgSend_objectForKey_(v8, v33, (uint64_t)v32, v34, v35);

            if (!v36)
            {
              uint64_t v36 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v37, v38, v39, v40);
            }
            uint64_t v41 = objc_msgSend_voiceId(v21, v37, v38, v39, v40);
            uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v36, v42, (uint64_t)v41, v43, v44);

            if (!v45) {
              goto LABEL_15;
            }
            if (!objc_msgSend_isInstalled(v45, v46, v47, v48, v49)
              || objc_msgSend_isInstalled(v21, v50, v51, v52, v53))
            {
              uint64_t v54 = objc_msgSend_axAsset(v45, v50, v51, v52, v53);
              unint64_t v59 = objc_msgSend_contentVersion(v54, v55, v56, v57, v58);
              objc_msgSend_axAsset(v21, v60, v61, v62, v63);
              v64 = v14;
              uint64_t v66 = v65 = v8;
              unint64_t v71 = objc_msgSend_contentVersion(v66, v67, v68, v69, v70);

              uint64_t v8 = v65;
              uint64_t v14 = v64;

              BOOL v72 = v59 > v71;
              id v9 = v109;
              uint64_t v13 = v110;
              if (!v72)
              {
LABEL_15:
                uint64_t v73 = objc_msgSend_voiceId(v21, v46, v47, v48, v49);
                objc_msgSend_setObject_forKeyedSubscript_(v36, v74, (uint64_t)v21, (uint64_t)v73, v75);

                unint64_t v80 = objc_msgSend_type(v21, v76, v77, v78, v79);
                uint64_t v81 = TTSStringForResourceType(v80);
                objc_msgSend_setObject_forKey_(v8, v82, (uint64_t)v36, (uint64_t)v81, v83);
              }
            }

            uint64_t v12 = v111;
          }
        }

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v84, (uint64_t)&v116, (uint64_t)v121, 16);
    }
    while (v12);
  }

  uint64_t v89 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v85, v86, v87, v88);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v90 = v8;
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v112, (uint64_t)v120, 16);
  if (v92)
  {
    uint64_t v96 = v92;
    uint64_t v97 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v113 != v97) {
          objc_enumerationMutation(v90);
        }
        uint64_t v99 = *(void *)(*((void *)&v112 + 1) + 8 * i);
        v100 = objc_msgSend_objectForKeyedSubscript_(v90, v93, v99, v94, v95);
        uint64_t v105 = objc_msgSend_allValues(v100, v101, v102, v103, v104);
        objc_msgSend_setObject_forKeyedSubscript_(v89, v106, (uint64_t)v105, v99, v107);
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v112, (uint64_t)v120, 16);
    }
    while (v96);
  }

  return v89;
}

- (id)allLanguagesForVoices:(BOOL)a3
{
  uint64_t v5 = objc_msgSend_allVoices_(self, a2, a3, v3, v4);
  id v9 = objc_msgSend_ax_flatMappedArrayUsingBlock_(v5, v6, (uint64_t)&unk_1EFB80A48, v7, v8);
  uint64_t v13 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v10, (uint64_t)v9, v11, v12);

  return v13;
}

- (NSSet)allAvailableLanguages
{
  allAvailableLanguages = self->_allAvailableLanguages;
  if (!allAvailableLanguages)
  {
    uint64_t v5 = objc_msgSend_resourcesWithType_subType_(self, a2, 4, 2, v2);
    uint64_t v8 = objc_msgSend_resourcesWithType_subType_(self, v6, 9, 2, v7);
    uint64_t v12 = objc_msgSend_ax_filteredArrayUsingBlock_(v5, v9, (uint64_t)&unk_1EFB80A68, v10, v11);
    uint64_t v16 = objc_msgSend_arrayByAddingObjectsFromArray_(v12, v13, (uint64_t)v8, v14, v15);
    uint64_t v21 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_ax_flatMappedArrayUsingBlock_(v16, v22, (uint64_t)&unk_1EFB80A88, v23, v24);
    objc_msgSend_setByAddingObjectsFromArray_(v21, v26, (uint64_t)v25, v27, v28);
    uint64_t v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = self->_allAvailableLanguages;
    self->_allAvailableLanguages = v29;

    allAvailableLanguages = self->_allAvailableLanguages;
  }

  return allAvailableLanguages;
}

- (unint64_t)_managerTypeForResourceType:(unint64_t)a3
{
  if (a3 - 2 > 8) {
    return 3;
  }
  else {
    return qword_1A689D748[a3 - 2];
  }
}

- (BOOL)_isValidResourceTypeKey:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, @"MacinTalk", v5, v6) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v7, @"Gryphon", v8, v9) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v10, @"Custom", v11, v12) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v13, @"Maui", v14, v15) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v16, @"Kona", v17, v18) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v19, @"LegacyCombinedVocalizer", v20, v21) & 1) != 0
      || (objc_msgSend_isEqualToString_(v3, v22, @"LegacyVocalizer", v23, v24) & 1) != 0)
    {
      char isEqualToString = 1;
    }
    else
    {
      char isEqualToString = objc_msgSend_isEqualToString_(v3, v25, @"SynthesizerExtension", v26, v27);
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (id)_dictionaryForResources:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6, v7);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v3;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v9);
        }
        uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_voiceId(v19, v12, v13, v14, v15, (void)v30);

        if (v20)
        {
          uint64_t v21 = objc_msgSend_voiceId(v19, v12, v13, v14, v15);
          uint64_t v26 = objc_msgSend_lowercaseString(v21, v22, v23, v24, v25);
          objc_msgSend_setObject_forKeyedSubscript_(v8, v27, (uint64_t)v19, (uint64_t)v26, v28);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v16);
  }

  return v8;
}

- (id)_axAssetsForTTSAXResourceModel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v18 = 134217984;
    BOOL v19 = v3;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "Requesting refreshed TTSResource assets (sync). onlyInstalled=%ld", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v10 = objc_msgSend_assetController(self, v6, v7, v8, v9);
  uint64_t v15 = v10;
  if (v3) {
    objc_msgSend_refreshInstalledAssetsSynchronously(v10, v11, v12, v13, v14);
  }
  else {
  uint64_t v16 = objc_msgSend_refreshWithoutCatalogUpdateSynchronously(v10, v11, v12, v13, v14);
  }

  return v16;
}

- (void)resetResourcesCache
{
  BOOL v3 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v3, OS_LOG_TYPE_INFO, "Resetting in-memory resources to nil", buf, 2u);
  }

  AX_PERFORM_WITH_LOCK();
  objc_msgSend_setAllAvailableLanguages_(self, v4, 0, v5, v6);
  objc_msgSend__notifyObserversOfCacheUpdate(self, v7, v8, v9, v10);
}

- (void)resetInMemoryAssetCatalogs
{
  uint64_t v6 = objc_msgSend_assetController(self, a2, v2, v3, v4);
  objc_msgSend_purgeInMemoryCachedAssets(v6, v7, v8, v9, v10);

  uint64_t v15 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v11, v12, v13, v14);
  objc_msgSend_purgeInMemoryCachedAssets(v15, v16, v17, v18, v19);

  objc_msgSend_legacyMacinTalkAssetController(self, v20, v21, v22, v23);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeInMemoryCachedAssets(v28, v24, v25, v26, v27);
}

- (void)_notifyObserversOfCacheUpdate
{
  objc_msgSend__performBlockOnObservers_(self, a2, (uint64_t)&unk_1EFB80988, v2, v3);

  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)updateCatalogIfNeeded
{
  objc_msgSend_assetsService(self, a2, v2, v3, v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_assetController(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_assetPolicy(v10, v11, v12, v13, v14);
  objc_msgSend_updateAssetForPolicy_(v19, v16, (uint64_t)v15, v17, v18);
}

- (NSString)catalogBuildVersion
{
  catalogBuildVersion = self->_catalogBuildVersion;
  if (!catalogBuildVersion)
  {
    objc_msgSend__readCatalogBuildNumberFromPreferences(self, a2, v2, v3, v4);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = self->_catalogBuildVersion;
    self->_catalogBuildVersion = v7;

    catalogBuildVersion = self->_catalogBuildVersion;
  }

  return catalogBuildVersion;
}

- (id)refreshAssetForResource:(id)a3 installedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v11 = objc_msgSend_assetController(self, v7, v8, v9, v10);
  if (objc_msgSend_type(v6, v12, v13, v14, v15) == 6)
  {
    uint64_t v20 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v16, v17, v18, v19);

    uint64_t v11 = (void *)v20;
  }
  uint64_t v21 = objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v16, (uint64_t)v6, (uint64_t)v11, v4);
  if (objc_msgSend_type(v6, v22, v23, v24, v25) == 2 && !v21)
  {
    long long v30 = objc_msgSend_legacyMacinTalkAssetController(self, v26, v27, v28, v29);
    uint64_t v21 = objc_msgSend__refreshAssetForResource_withAssetController_installedOnly_(self, v31, (uint64_t)v6, (uint64_t)v30, v4);
  }

  return v21;
}

- (id)_refreshAssetForResource:(id)a3 withAssetController:(id)a4 installedOnly:(BOOL)a5
{
  BOOL v6 = a5;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_msgSend_voiceId(v9, v11, v12, v13, v14);
  uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_legacyMacinTalkAssetController(self, v16, v17, v18, v19);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v10
    && objc_msgSend_isEqualToString_(v15, v21, @"com.apple.speech.synthesis.voice.Alex", v23, v24))
  {

    uint64_t v15 = @"com.apple.speech.voice.Alex";
  }
  uint64_t v51 = @"VoiceId";
  uint64_t v28 = objc_msgSend_type(v9, v21, v22, v23, v24);
  uint64_t v29 = v15;
  if (v28 == 6)
  {
    uint64_t v5 = objc_msgSend_componentsSeparatedByString_(v15, v25, @"-", v26, v27);
    uint64_t v29 = objc_msgSend_firstObject(v5, v30, v31, v32, v33);
  }
  v52[0] = v29;
  uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v52, (uint64_t)&v51, 1);
  if (v28 == 6)
  {
  }
  uint64_t v37 = objc_msgSend_refreshAssetsWithAttributesSynchronously_installedOnly_(v10, v34, (uint64_t)v36, v6, v35);
  uint64_t v42 = objc_msgSend_firstObject(v37, v38, v39, v40, v41);

  uint64_t v47 = objc_msgSend_assetId(v42, v43, v44, v45, v46);

  if (v47)
  {
    id v49 = v9;
    id v50 = v42;
    AX_PERFORM_WITH_LOCK();
  }

  return v42;
}

- (id)refreshResourcesCacheForManagerType:(unint64_t)a3
{
  if (AXProcessIsAXAssetsd())
  {
    uint64_t v8 = objc_msgSend__refreshResourcesForManagerType_(self, v5, a3, v6, v7);
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = sub_1A670B5E4;
    long long v30 = sub_1A670B5F4;
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_preferenceWriteQueue(self, v13, v14, v15, v16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1A6710DA0;
    v22[3] = &unk_1E5C6A308;
    v22[4] = self;
    uint64_t v18 = v8;
    uint64_t v23 = v18;
    uint64_t v24 = &v26;
    BOOL v25 = (~a3 & 3) == 0;
    dispatch_sync(v17, v22);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E4FB93D8], 0, 0, 1u);
    id v20 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    uint64_t v18 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1A688EC38();
    }
    id v20 = 0;
  }

  return v20;
}

- (BOOL)readDidMigrateUninformedSiriVoicesFromPreferences
{
  uint64_t v2 = (void *)TTSPreferencesCopyValueForKey(@"DidMigrateUninformedSiriVoices");
  char v7 = objc_msgSend_BOOLValue(v2, v3, v4, v5, v6);

  uint64_t v8 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1A688EC6C();
  }

  return v7;
}

- (void)updateDidMigrateUninformedSiriVoices:(BOOL)a3
{
  uint64_t v5 = (const void *)objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4);

  TTSPreferencesSetValueForKey(@"DidMigrateUninformedSiriVoices", v5);
}

- (void)_writeResourceCacheVersionToPreferences
{
}

- (id)_readCatalogBuildNumberFromPreferences
{
  uint64_t v2 = (void *)TTSPreferencesCopyValueForKey(@"TTSCachedBuildNumberKey");
  uint64_t v3 = AXTTSLogResourceManager();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1A688ED54();
    }

    id v5 = v2;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_1A66D3000, v4, OS_LOG_TYPE_INFO, "No catalog build number found in preferences", v7, 2u);
    }
  }

  return v2;
}

- (void)updateCatalogBuildVersion:(id)a3
{
  id v3 = a3;
  if (AXProcessIsAXAssetsd())
  {
    TTSPreferencesSetValueForKey(@"TTSCachedBuildNumberKey", v3);
  }
  else
  {
    uint64_t v4 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1A688EDBC();
    }
  }
}

- (BOOL)_validateCacheStructure:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = objc_msgSend_allValues(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    uint64_t v27 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v14 = AXTTSLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
            sub_1A688EF48();
          }
LABEL_21:

          BOOL v24 = 0;
          goto LABEL_23;
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v14 = v11;
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v28, (uint64_t)v36, 16);
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v14);
              }
              id v20 = self;
              char v21 = objc_opt_isKindOfClass();

              if ((v21 & 1) == 0)
              {
                BOOL v25 = AXTTSLogCommon();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
                  sub_1A688EF08();
                }

                goto LABEL_21;
              }
            }
            uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v28, (uint64_t)v36, 16);
            if (v17) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v27;
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v23, (uint64_t)&v32, (uint64_t)v37, 16);
      BOOL v24 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v24 = 1;
  }
LABEL_23:

  return v24;
}

- (void)_writeResourcesToPreferences:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v25 = 0;
  id v5 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)v3, 1, (uint64_t)&v25);
  id v10 = v25;
  if (v10)
  {
    uint64_t v11 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A688EFFC();
    }
  }
  else
  {
    unint64_t v12 = objc_msgSend_length(v5, v6, v7, v8, v9);
    uint64_t v13 = AXTTSLogResourceManager();
    uint64_t v14 = v13;
    if (v12 <= 0x7A120)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = NSNumber;
        uint64_t v20 = objc_msgSend_length(v5, v15, v16, v17, v18);
        BOOL v24 = objc_msgSend_numberWithUnsignedInteger_(v19, v21, v20, v22, v23);
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v24;
        _os_log_impl(&dword_1A66D3000, v14, OS_LOG_TYPE_INFO, "Writing %@ bytes to the resource cache", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      sub_1A688EF88();
    }

    TTSPreferencesSetValueForKey(@"AllCachedAvailableResourcesKey", v5);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

- (void)_performBlockOnObservers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = sub_1A670B5E4;
  id v25 = sub_1A670B5F4;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_1A6711AB4;
  uint64_t v18 = &unk_1E5C6A330;
  uint64_t v19 = self;
  uint64_t v20 = &v21;
  AX_PERFORM_WITH_LOCK();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)v22[5];
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v11, (uint64_t)v27, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v10, (uint64_t)&v11, (uint64_t)v27, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v17 = objc_msgSend_assetId(v11, v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_resourceWithAssetId_(self, v18, (uint64_t)v17, v19, v20);

  uint64_t v22 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v61 = v21;
    __int16 v62 = 2112;
    id v63 = v11;
    _os_log_impl(&dword_1A66D3000, v22, OS_LOG_TYPE_INFO, "AXAssetControllerObserver: Download completed for resource: %@ with asset: %@", buf, 0x16u);
  }

  uint64_t v27 = objc_msgSend_assetPolicy(v10, v23, v24, v25, v26);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    long long v32 = objc_msgSend_assetPolicy(v10, v28, v29, v30, v31);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
  }
  long long v34 = [TTSAXResource alloc];
  uint64_t v38 = objc_msgSend_initWithAsset_(v34, v35, (uint64_t)v11, v36, v37);

  uint64_t v21 = (void *)v38;
LABEL_7:
  uint64_t v39 = AXTTSLogResourceManager();
  uint64_t v40 = v39;
  if (v12)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1A688F0CC();
    }
  }
  else if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v61 = v11;
    _os_log_impl(&dword_1A66D3000, v40, OS_LOG_TYPE_INFO, "Download succeeded: %@", buf, 0xCu);
  }

  uint64_t v45 = objc_msgSend_properties(v11, v41, v42, v43, v44);
  id v49 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"Sample", v47, v48);

  if (v49)
  {
    objc_msgSend_setDownloadingSamples_(self, v50, 0, v51, v52);
  }
  else if (v21)
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = sub_1A6711E24;
    v57[3] = &unk_1E5C6A120;
    id v58 = v21;
    id v59 = v12;
    objc_msgSend__performBlockOnObservers_(self, v53, (uint64_t)v57, v54, v55);
  }
  else
  {
    uint64_t v56 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_1A688F064();
    }
  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  uint64_t v16 = objc_msgSend_assetId(v11, v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_resourceWithAssetId_(self, v17, (uint64_t)v16, v18, v19);

  if (!v20)
  {
    uint64_t v25 = objc_msgSend_properties(v11, v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"VoiceId", v27, v28);

    if (v29)
    {
      long long v34 = objc_msgSend_properties(v11, v30, v31, v32, v33);
      uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"VoiceId", v36, v37);
      uint64_t v20 = objc_msgSend_resourceWithVoiceId_(self, v39, (uint64_t)v38, v40, v41);
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  float v42 = (float)a5 / (float)a6;
  uint64_t v43 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    uint64_t v48 = objc_msgSend_voiceId(v20, v44, v45, v46, v47);
    id v49 = (void *)v48;
    id v50 = @"Sample";
    if (v48) {
      id v50 = (__CFString *)v48;
    }
    *(_DWORD *)buf = 138543618;
    id v59 = v50;
    __int16 v60 = 2050;
    double v61 = v42;
    _os_log_impl(&dword_1A66D3000, v43, OS_LOG_TYPE_INFO, "DL progress: %{public}@ %{public}f", buf, 0x16u);
  }
  if (v20)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = sub_1A6712184;
    v54[3] = &unk_1E5C6A380;
    id v55 = v20;
    float v57 = v42;
    id v56 = v11;
    objc_msgSend__performBlockOnObservers_(self, v51, (uint64_t)v54, v52, v53);
  }
}

- (id)_refreshSiriResources:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v227 = *MEMORY[0x1E4F143B8];
  id v4 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v218 = v3;
    _os_log_impl(&dword_1A66D3000, v4, OS_LOG_TYPE_INFO, "Will find Siri resources. onlyInstalled=%ld", buf, 0xCu);
  }

  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6, v7, v8);
  v200 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13);
  v199 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21);
  if (v3) {
    objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v22, 0, 4, v23);
  }
  else {
  uint64_t v25 = objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v22, 0, 4, v23);
  }
  uint64_t v28 = objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v26, 0, 2, v27, self);
  uint64_t v33 = objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

  uint64_t v195 = (void *)v9;
  uint64_t v196 = (void *)v25;
  BOOL v193 = v3;
  v203 = v33;
  if (v3)
  {
    if (TTSSupportsNeuralVoices())
    {
      v197 = objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v37, 0, 5, v38);
    }
    else
    {
      v197 = 0;
    }
  }
  else
  {
    uint64_t v39 = objc_msgSend_ax_flatMappedArrayUsingBlock_(v33, v34, (uint64_t)&unk_1EFB80AC8, v35, v36);
    context = (void *)MEMORY[0x1AD0C1200]();
    float v42 = objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v40, 0, 2, v41);
    long long v213 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v213, (uint64_t)v226, 16);
    if (v44)
    {
      uint64_t v49 = v44;
      uint64_t v50 = *(void *)v214;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v214 != v50) {
            objc_enumerationMutation(v42);
          }
          uint64_t v52 = *(void **)(*((void *)&v213 + 1) + 8 * i);
          uint64_t v53 = objc_msgSend_identifier(v52, v45, v46, v47, v48);
          char v57 = objc_msgSend_containsObject_(v39, v54, (uint64_t)v53, v55, v56);

          if ((v57 & 1) == 0) {
            objc_msgSend_addObject_(v203, v45, (uint64_t)v52, v47, v48);
          }
        }
        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v213, (uint64_t)v226, 16);
      }
      while (v49);
    }

    uint64_t v25 = (uint64_t)v196;
    if (TTSSupportsNeuralVoices())
    {
      v197 = objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v58, 0, 5, v59);
      uint64_t v60 = TTSSupportsNeuralAXVoices();
      v198 = 0;
      uint64_t v64 = (uint64_t)v203;
      if (v60) {
        goto LABEL_72;
      }
LABEL_27:
      if (!v25) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    v197 = 0;
    LOBYTE(v3) = v193;
  }
  uint64_t v64 = (uint64_t)v203;
  uint64_t v60 = TTSSupportsNeuralAXVoices();
  if ((v60 & 1) == 0)
  {
    v198 = 0;
    goto LABEL_27;
  }
  if (v3)
  {
    uint64_t v60 = objc_msgSend_installedAssetsForLanguage_voiceType_(TTSSiriAssetManager, v61, 0, 7, v63);
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v60 = objc_msgSend_assetsForLanguage_voiceType_(TTSSiriAssetManager, v61, 0, 7, v63);
LABEL_73:
  v198 = (void *)v60;
  if (v25) {
LABEL_28:
  }
    uint64_t v60 = objc_msgSend_addObjectsFromArray_(v24, v61, v25, v62, v63);
LABEL_29:
  if (v64) {
    uint64_t v60 = objc_msgSend_addObjectsFromArray_(v24, v61, v64, v62, v63);
  }
  if (v197) {
    uint64_t v60 = objc_msgSend_addObjectsFromArray_(v24, v61, (uint64_t)v197, v62, v63);
  }
  if (v198) {
    uint64_t v60 = objc_msgSend_addObjectsFromArray_(v24, v61, (uint64_t)v198, v62, v63);
  }
  v194 = (void *)MEMORY[0x1AD0C1200](v60);
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v65 = v24;
  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v209, (uint64_t)v225, 16);
  if (v67)
  {
    uint64_t v72 = v67;
    uint64_t v73 = *(void *)v210;
    uint64_t v201 = *(void *)v210;
    id v202 = v65;
    do
    {
      uint64_t v74 = 0;
      uint64_t v204 = v72;
      do
      {
        if (*(void *)v210 != v73) {
          objc_enumerationMutation(v65);
        }
        uint64_t v75 = *(void **)(*((void *)&v209 + 1) + 8 * v74);
        if (v75)
        {
          uint64_t v76 = objc_msgSend_name(*(void **)(*((void *)&v209 + 1) + 8 * v74), v68, v69, v70, v71);
          if (objc_msgSend_length(v76, v77, v78, v79, v80))
          {
            uint64_t v85 = objc_msgSend_identifier(v75, v81, v82, v83, v84);
            uint64_t v90 = objc_msgSend_length(v85, v86, v87, v88, v89);

            if (v90)
            {
              uint64_t v95 = objc_msgSend_footprint(v75, v91, v92, v93, v94);
              uint64_t v96 = TTSStringForSpeechFootprint(v95);
              uint64_t v101 = objc_msgSend_lowercaseString(v96, v97, v98, v99, v100);

              if (objc_msgSend_footprint(v75, v102, v103, v104, v105) == 4)
              {
                uint64_t v110 = @"enhanced";

                uint64_t v101 = v110;
              }
              uint64_t v111 = objc_msgSend_name(v75, v106, v107, v108, v109);
              long long v112 = @"None";
              uint64_t v117 = objc_msgSend_voiceType(v75, v113, v114, v115, v116);
              long long v118 = @"Gryphon";
              if (v117 == 4 || (long long v118 = @"SiriNeuralAX", v117 == 7) || (long long v118 = @"SiriNeural", v117 == 5))
              {
                long long v119 = v118;

                long long v112 = v119;
              }
              v120 = [TTSAXResource alloc];
              v224[0] = v111;
              v223[0] = @"Name";
              v223[1] = @"VoiceId";
              BOOL v125 = objc_msgSend_identifier(v75, v121, v122, v123, v124);
              v224[1] = v125;
              v223[2] = @"Languages";
              objc_msgSend_languages(v75, v126, v127, v128, v129);
              v130 = contexta = (void *)v111;
              v224[2] = v130;
              v223[3] = @"Type";
              uint64_t v135 = objc_msgSend_voiceType(v75, v131, v132, v133, v134);
              uint64_t v140 = @"Custom";
              if (v135 != 2) {
                uint64_t v140 = @"Gryphon";
              }
              v224[3] = v140;
              v224[4] = v112;
              v223[4] = @"Subtype";
              v223[5] = @"Footprint";
              v224[5] = v101;
              v223[6] = @"Gender";
              unint64_t v141 = objc_msgSend_gender(v75, v136, v137, v138, v139);
              uint64_t v142 = TTSStringForSpeechGender(v141);
              long long v147 = objc_msgSend_lowercaseString(v142, v143, v144, v145, v146);
              v224[6] = v147;
              long long v149 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v148, (uint64_t)v224, (uint64_t)v223, 7);
              long long v153 = objc_msgSend_initWithData_(v120, v150, (uint64_t)v149, v151, v152);

              objc_msgSend_setVoiceAsset_(v153, v154, (uint64_t)v75, v155, v156);
              if (v153)
              {
                uint64_t v73 = v201;
                id v65 = v202;
                uint64_t v72 = v204;
                if (objc_msgSend_type(v153, v157, v158, v159, v160) == 3)
                {
                  objc_msgSend_addObject_(v200, v161, (uint64_t)v153, v163, v164);
                }
                else if (objc_msgSend_type(v153, v161, v162, v163, v164) == 10)
                {
                  objc_msgSend_addObject_(v199, v170, (uint64_t)v153, v171, v172);
                }
              }
              else
              {
                uint64_t v73 = v201;
                id v65 = v202;
                uint64_t v72 = v204;
              }
              goto LABEL_63;
            }
          }
          else
          {
          }
          v165 = AXTTSLogResourceManager();
          if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          {
            v173 = objc_msgSend_name(v75, v166, v167, v168, v169);
            uint64_t v178 = objc_msgSend_identifier(v75, v174, v175, v176, v177);
            *(_DWORD *)buf = 138412802;
            unint64_t v218 = (unint64_t)v173;
            __int16 v219 = 2112;
            v220 = v178;
            __int16 v221 = 2112;
            v222 = v75;
            _os_log_error_impl(&dword_1A66D3000, v165, OS_LOG_TYPE_ERROR, "Error: TTSAsset had nil name %@ or identifier %@. Asset: %@", buf, 0x20u);
          }
          long long v153 = 0;
        }
        else
        {
          long long v153 = AXTTSLogResourceManager();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
            sub_1A688F150(&v207, v208, v153);
          }
        }
LABEL_63:

        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v209, (uint64_t)v225, 16);
    }
    while (v72);
  }

  objc_msgSend_setObject_forKey_(v195, v179, (uint64_t)v200, @"Gryphon", v180);
  objc_msgSend_setObject_forKey_(v195, v181, (uint64_t)v199, @"Custom", v182);
  uint64_t v183 = AXTTSLogResourceManager();
  BOOL v184 = os_log_type_enabled(v183, OS_LOG_TYPE_INFO);

  if (v184)
  {
    uint64_t v185 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
    {
      v189 = objc_msgSend__debugCountSummaryForResources_(v192, v186, (uint64_t)v195, v187, v188);
      *(_DWORD *)buf = 134218242;
      unint64_t v218 = v193;
      __int16 v219 = 2112;
      v220 = v189;
      _os_log_impl(&dword_1A66D3000, v185, OS_LOG_TYPE_INFO, "Returning Siri resources (onlyInstalled=%ld): %@", buf, 0x16u);
    }
  }

  return v195;
}

- (id)_findAndSwapLegacyMacinTalkAssetsForMacinTalkResources:(id)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "Will find Macintalk resources", buf, 2u);
  }

  uint64_t v14 = objc_msgSend_mutableCopy(v4, v6, v7, v8, v9);
  if (!v14)
  {
    uint64_t v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13);
  }
  uint64_t v15 = (void *)MEMORY[0x1AD0C1200]();
  uint64_t v20 = objc_msgSend_legacyMacinTalkAssetController(self, v16, v17, v18, v19);
  int isAssetCatalogInstalled = objc_msgSend_isAssetCatalogInstalled(v20, v21, v22, v23, v24);

  if (isAssetCatalogInstalled)
  {
    uint64_t v109 = v15;
    id v110 = v4;
    uint64_t v30 = objc_msgSend_legacyMacinTalkAssetController(self, v26, v27, v28, v29);
    uint64_t v35 = objc_msgSend_refreshWithoutCatalogUpdateSynchronously(v30, v31, v32, v33, v34);

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obj = v35;
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v115, (uint64_t)v123, 16);
    if (v37)
    {
      uint64_t v42 = v37;
      uint64_t v43 = *(void *)v116;
      uint64_t v111 = *(void *)v116;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v116 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void **)(*((void *)&v115 + 1) + 8 * i);
          uint64_t v46 = objc_msgSend_localURL(v45, v38, v39, v40, v41);

          if (v46)
          {
            uint64_t v47 = objc_msgSend_properties(v45, v38, v39, v40, v41);
            uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v47, v48, @"Name", v49, v50);
            char isEqualToString = objc_msgSend_isEqualToString_(v51, v52, @"Alex", v53, v54);

            uint64_t v60 = @"com.apple.speech.synthesis.voice.Alex";
            if ((isEqualToString & 1) == 0)
            {
              double v61 = objc_msgSend_properties(v45, v56, v57, v58, v59);
              objc_msgSend_objectForKeyedSubscript_(v61, v62, @"VoiceId", v63, v64);
              uint64_t v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            v113[0] = MEMORY[0x1E4F143A8];
            v113[1] = 3221225472;
            v113[2] = sub_1A67130E8;
            v113[3] = &unk_1E5C6A278;
            uint64_t v114 = v60;
            id v65 = v60;
            uint64_t v69 = objc_msgSend_indexOfObjectPassingTest_(v14, v66, (uint64_t)v113, v67, v68);
            if (v69 == 0x7FFFFFFFFFFFFFFFLL
              || (objc_msgSend_objectAtIndex_(v14, v70, v69, v71, v72),
                  (uint64_t v73 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              uint64_t v78 = [TTSAXResource alloc];
              v121[0] = @"Name";
              uint64_t v83 = objc_msgSend_properties(v45, v79, v80, v81, v82);
              uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v83, v84, @"Name", v85, v86);
              v122[0] = v87;
              v122[1] = v65;
              v121[1] = @"VoiceId";
              v121[2] = @"Languages";
              v122[2] = &unk_1EFB954C8;
              v122[3] = @"MacinTalk";
              v121[3] = @"Type";
              v121[4] = @"Subtype";
              v121[5] = @"Footprint";
              v122[4] = @"None";
              v122[5] = @"enhanced";
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v88, (uint64_t)v122, (uint64_t)v121, 6);
              uint64_t v89 = v65;
              uint64_t v90 = v42;
              v92 = uint64_t v91 = v14;
              uint64_t v77 = objc_msgSend_initWithData_(v78, v93, (uint64_t)v92, v94, v95);

              uint64_t v14 = v91;
              uint64_t v42 = v90;
              id v65 = v89;

              uint64_t v43 = v111;
              objc_msgSend_setAxAsset_(v77, v96, (uint64_t)v45, v97, v98);
              objc_msgSend_addObject_(v14, v99, (uint64_t)v77, v100, v101);
            }
            else
            {
              uint64_t v77 = v73;
              objc_msgSend_setAxAsset_(v73, v74, (uint64_t)v45, v75, v76);
            }
          }
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v115, (uint64_t)v123, 16);
      }
      while (v42);
    }

    uint64_t v15 = v109;
    id v4 = v110;
  }
  uint64_t v102 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    uint64_t v107 = objc_msgSend_count(v14, v103, v104, v105, v106);
    *(_DWORD *)buf = 134217984;
    uint64_t v120 = v107;
    _os_log_impl(&dword_1A66D3000, v102, OS_LOG_TYPE_INFO, "Did find %ld Macintalk resources", buf, 0xCu);
  }

  return v14;
}

- (void)_downloadLegacyResourceForTesting:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AXTTSLogResourceManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v4;
    _os_log_impl(&dword_1A66D3000, v5, OS_LOG_TYPE_INFO, "Will download legacy resource for testing: %@", buf, 0xCu);
  }

  id v10 = objc_msgSend_voiceId(v4, v6, v7, v8, v9);
  int hasPrefix = objc_msgSend_hasPrefix_(v10, v11, @"com.apple.speech.synthesis.voice", v12, v13);

  if (hasPrefix)
  {
    uint64_t v19 = objc_msgSend_legacyMacinTalkAssetController(self, v15, v16, v17, v18);
  }
  else
  {
    if (objc_msgSend_type(v4, v15, v16, v17, v18) != 6) {
      goto LABEL_9;
    }
    uint64_t v19 = objc_msgSend_legacyCombinedVocalizerAssetController(self, v20, v21, v22, v23);
  }
  uint64_t v24 = v19;
  if (v19)
  {
    id v25 = objc_initWeak((id *)buf, v19);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    void v52[2] = sub_1A6713414;
    v52[3] = &unk_1E5C6A3C8;
    id v53 = v4;
    objc_copyWeak(&v54, (id *)buf);
    objc_msgSend_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion_(v24, v26, 1, 1, (uint64_t)&unk_1EFB95738, v52);

    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);
LABEL_11:

    goto LABEL_12;
  }
LABEL_9:
  if (objc_msgSend_type(v4, v20, v21, v22, v23) == 7)
  {
    uint64_t v31 = objc_msgSend_primaryLanguage(v4, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_gender(v4, v32, v33, v34, v35);
    uint64_t v41 = objc_msgSend_footprint(v4, v37, v38, v39, v40);
    uint64_t v46 = objc_msgSend_name(v4, v42, v43, v44, v45);
    uint64_t v24 = objc_msgSend_assetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v47, (uint64_t)v31, v36, v41, v46, 4);

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1A671373C;
    v50[3] = &unk_1E5C6A3F0;
    v50[4] = self;
    id v51 = v4;
    objc_msgSend_downloadAsset_progressHandler_(TTSSiriAssetManager, v48, (uint64_t)v24, (uint64_t)v50, v49);

    goto LABEL_11;
  }
LABEL_12:
}

- (void)purgeLegacyResourceCache
{
  TTSPreferencesSetValueForKey(@"AllAvailableVoicesPreference", 0);

  TTSPreferencesSetValueForKey(@"AXSExtantVoicesPreference", 0);
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (void)setLegacyCombinedVocalizerAssetController:(id)a3
{
}

- (AXAssetController)legacyMacinTalkAssetController
{
  return self->_legacyMacinTalkAssetController;
}

- (void)setLegacyMacinTalkAssetController:(id)a3
{
}

- (AXAssetsService)assetsService
{
  return self->_assetsService;
}

- (void)setAssetsService:(id)a3
{
}

- (void)setAllAvailableLanguages:(id)a3
{
}

- (void)setSamplesAsset:(id)a3
{
}

- (void)setCatalogBuildVersion:(id)a3
{
}

- (BOOL)downloadingSamples
{
  return self->_downloadingSamples;
}

- (void)setDownloadingSamples:(BOOL)a3
{
  self->_downloadingSamples = a3;
}

- (OS_dispatch_queue)preferenceWriteQueue
{
  return self->_preferenceWriteQueue;
}

- (void)setPreferenceWriteQueue:(id)a3
{
}

- (void)setAssetLoadingQueue:(id)a3
{
}

- (OS_dispatch_queue)siriServiceQueue
{
  return self->_siriServiceQueue;
}

- (void)setSiriServiceQueue:(id)a3
{
}

- (NSMutableDictionary)_resourcesById
{
  return self->__resourcesById;
}

- (void)set_resourcesById:(id)a3
{
}

- (NSMutableDictionary)_resourcesByAssetId
{
  return self->__resourcesByAssetId;
}

- (void)set_resourcesByAssetId:(id)a3
{
}

- (NSMutableDictionary)_resources
{
  return self->__resources;
}

- (void)set_resources:(id)a3
{
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->__resources, 0);
  objc_storeStrong((id *)&self->__resourcesByAssetId, 0);
  objc_storeStrong((id *)&self->__resourcesById, 0);
  objc_storeStrong((id *)&self->_siriServiceQueue, 0);
  objc_storeStrong((id *)&self->_assetLoadingQueue, 0);
  objc_storeStrong((id *)&self->_preferenceWriteQueue, 0);
  objc_storeStrong((id *)&self->_catalogBuildVersion, 0);
  objc_storeStrong((id *)&self->_samplesAsset, 0);
  objc_storeStrong((id *)&self->_allAvailableLanguages, 0);
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_legacyMacinTalkAssetController, 0);
  objc_storeStrong((id *)&self->_legacyCombinedVocalizerAssetController, 0);

  objc_storeStrong((id *)&self->_assetController, 0);
}

@end