@interface MOTemplateBasedContextBuilder
- (MOContextConfigurationManager)configurationManager;
- (MOTemplateBasedContextBuilder)initWithTemplateStore:(id)a3 ConfigurationManager:(id)a4;
- (MOTemplateStore)templateStore;
- (NSArray)insignificantPlaceTypes;
- (NSArray)musicMoodsForGeneralEvents;
- (NSArray)musicMoodsForRelaxingEvents;
- (NSArray)musicMoodsForUpbeatEvents;
- (OS_dispatch_queue)queue;
- (double)_computeTemplateScore:(id)a3 withBundleContent:(id)a4;
- (double)_getMostRecentTemplateVersion;
- (id)_createContextStringFromTemplate:(id)a3 withBundleContent:(id)a4;
- (id)_filterTemplates:(id)a3;
- (id)_readTemplatesToRemovePlistFile:(id)a3;
- (id)musicMoodStringsForBundleContent:(id)a3;
- (id)songTitleAndArtistStringsForBundleContent:(id)a3;
- (void)_findTemplatesForBundleContent:(id)a3 withHandler:(id)a4;
- (void)_generateContextStringsBasedOnNewTemplateFromBundleContents:(id)a3 WithHandler:(id)a4;
- (void)_generateContextStringsFromBundleContents:(id)a3 WithHandler:(id)a4;
- (void)_generateContextStringsFromTemplateWithBundleContent:(id)a3 withHandler:(id)a4;
- (void)generateContextStringsFromBundleContents:(id)a3 WithHandler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setTemplateStore:(id)a3;
@end

@implementation MOTemplateBasedContextBuilder

- (MOTemplateBasedContextBuilder)initWithTemplateStore:(id)a3 ConfigurationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MOTemplateBasedContextBuilder;
  v9 = [(MOTemplateBasedContextBuilder *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_templateStore, a3);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MOTemplateBasedContextBuilder", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_configurationManager, a4);
    uint64_t v14 = +[NSArray arrayWithObjects:@", with dreamy music", @", with a dreamy song", @", with sentimental music", @", with a sentimental song", @", with chill music", @", with a chill song", @", with happy music", @", with a happy song", 0];
    musicMoodsForRelaxingEvents = v10->_musicMoodsForRelaxingEvents;
    v10->_musicMoodsForRelaxingEvents = (NSArray *)v14;

    uint64_t v16 = +[NSArray arrayWithObjects:@", with happy music", @", with a happy song", @", with uplifting music", @", with an uplifting song", @", with epic music", @", with an epic song", 0];
    musicMoodsForUpbeatEvents = v10->_musicMoodsForUpbeatEvents;
    v10->_musicMoodsForUpbeatEvents = (NSArray *)v16;

    uint64_t v18 = +[NSArray arrayWithObjects:@", with chill music", @", with a chill song", @", with happy music", @", with a happy song", @", with uplifting music", @", with an uplifting song", 0];
    musicMoodsForGeneralEvents = v10->_musicMoodsForGeneralEvents;
    v10->_musicMoodsForGeneralEvents = (NSArray *)v18;

    uint64_t v20 = +[MOBundleContentExtractor insignificantPlaceTypes];
    insignificantPlaceTypes = v10->_insignificantPlaceTypes;
    v10->_insignificantPlaceTypes = (NSArray *)v20;
  }
  return v10;
}

- (void)_generateContextStringsFromTemplateWithBundleContent:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __98__MOTemplateBasedContextBuilder__generateContextStringsFromTemplateWithBundleContent_withHandler___block_invoke;
  v11[3] = &unk_1000A5288;
  id v12 = v6;
  v13 = self;
  id v14 = (id)objc_opt_new();
  id v15 = v7;
  id v8 = v14;
  id v9 = v7;
  id v10 = v6;
  [(MOTemplateBasedContextBuilder *)self _findTemplatesForBundleContent:v10 withHandler:v11];
}

void __98__MOTemplateBasedContextBuilder__generateContextStringsFromTemplateWithBundleContent_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v52 = v6;
    id v53 = v5;
    id v7 = [*(id *)(a1 + 40) _filterTemplates:v5];
    id v73 = objc_alloc_init((Class)NSMutableDictionary);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v79 objects:v126 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v80;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v80 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          [*(id *)(a1 + 40) _computeTemplateScore:v12 withBundleContent:*(void *)(a1 + 32)];
          double v14 = v13;
          objc_msgSend(v12, "setTotalScore:");
          id v15 = +[NSNumber numberWithDouble:v14];
          [v73 setObject:v15 forKey:v12];
        }
        id v9 = [obj countByEnumeratingWithState:&v79 objects:v126 count:16];
      }
      while (v9);
    }

    uint64_t v16 = [v73 keysSortedByValueUsingComparator:&__block_literal_global_2];
    id v17 = [*(id *)(a1 + 32) bundleType];
    id v18 = [v16 count];
    uint64_t v19 = 5;
    if ((unint64_t)v18 < 5) {
      uint64_t v19 = (uint64_t)v18;
    }
    if (v17 == (id)6) {
      BOOL v20 = v18 != 0;
    }
    else {
      BOOL v20 = v19;
    }
    v51 = v16;
    v21 = objc_msgSend(v16, "subarrayWithRange:", 0, v20);
    v22 = objc_opt_new();
    v54 = objc_opt_new();
    if ([v21 count] && objc_msgSend(v21, "count"))
    {
      unint64_t v23 = 0;
      do
      {
        v24 = [v21 objectAtIndexedSubscript:v23];
        v25 = [v24 templateString];
        unsigned __int8 v26 = [v54 containsObject:v25];

        if ((v26 & 1) == 0)
        {
          v27 = [v21 objectAtIndexedSubscript:v23];
          [v22 addObject:v27];

          v28 = [v21 objectAtIndexedSubscript:v23];
          v29 = [v28 templateString];
          [v54 addObject:v29];
        }
        ++v23;
      }
      while ((unint64_t)[v21 count] > v23);
    }
    v50 = v21;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v56 = v22;
    id v74 = [v56 countByEnumeratingWithState:&v75 objects:v125 count:16];
    if (v74)
    {
      uint64_t v30 = *(void *)v76;
      v31 = &MOLogFacilityPersonalizedSensing;
      uint64_t v55 = *(void *)v76;
      do
      {
        for (j = 0; j != v74; j = (char *)j + 1)
        {
          if (*(void *)v76 != v30) {
            objc_enumerationMutation(v56);
          }
          v33 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
          v34 = _mo_log_facility_get_os_log(v31);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = objc_msgSend(*(id *)(a1 + 32), "associatedBundleID", v50);
            v36 = [*(id *)(a1 + 32) suggestionLabel];
            id v72 = [*(id *)(a1 + 32) activityType];
            id v71 = [*(id *)(a1 + 32) placeType];
            id v37 = [*(id *)(a1 + 32) bundleType];
            id v70 = [*(id *)(a1 + 32) time];
            id v69 = [*(id *)(a1 + 32) peopleClassification];
            id v68 = [*(id *)(a1 + 32) photoTrait];
            unsigned int v67 = [*(id *)(a1 + 32) hasPersonName];
            unsigned int v66 = [*(id *)(a1 + 32) hasTimeReference];
            id v65 = [*(id *)(a1 + 32) patternType];
            v64 = [v33 templateString];
            id v63 = [v33 activityType];
            id v62 = [v33 placeType];
            id v61 = [v33 bundleType];
            id v60 = [v33 time];
            id v59 = [v33 peopleClassification];
            id v58 = [v33 photoTrait];
            unsigned int v38 = [v33 hasPersonName];
            v39 = v31;
            unsigned int v40 = [v33 hasTimeReference];
            id v41 = [v33 patternType];
            *(_DWORD *)buf = 138417410;
            v84 = v35;
            __int16 v85 = 2112;
            v86 = v36;
            __int16 v87 = 2048;
            id v88 = v72;
            __int16 v89 = 2048;
            id v90 = v71;
            __int16 v91 = 2048;
            id v92 = v37;
            __int16 v93 = 2048;
            id v94 = v70;
            __int16 v95 = 2048;
            id v96 = v69;
            __int16 v97 = 2048;
            id v98 = v68;
            __int16 v99 = 1024;
            unsigned int v100 = v67;
            __int16 v101 = 1024;
            unsigned int v102 = v66;
            __int16 v103 = 2048;
            id v104 = v65;
            __int16 v105 = 2112;
            v106 = v64;
            __int16 v107 = 2048;
            id v108 = v63;
            __int16 v109 = 2048;
            id v110 = v62;
            __int16 v111 = 2048;
            id v112 = v61;
            __int16 v113 = 2048;
            id v114 = v60;
            __int16 v115 = 2048;
            id v116 = v59;
            __int16 v117 = 2048;
            id v118 = v58;
            __int16 v119 = 1024;
            unsigned int v120 = v38;
            uint64_t v30 = v55;
            __int16 v121 = 1024;
            unsigned int v122 = v40;
            v31 = v39;
            __int16 v123 = 2048;
            id v124 = v41;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "template found for this bundle content with bundle ID: %@, suggestion label: %@, activityType: %ld, placeType: %ld, bundleType: %ld, time: %ld, peopleClassification, %ld, photoTrait, %ld, hasPerson, %d, hasTimeReference %d, patternType %ld, matching template string: %@, with activityType: %ld, placeType: %ld, bundleType: %ld, time: %ld, peopleClassification, %ld, photoTrait, %ld, hasPerson, %d, hasTimeReference %d, patternType, %ld", buf, 0xC4u);
          }
          v42 = [*(id *)(a1 + 40) _createContextStringFromTemplate:v33 withBundleContent:*(void *)(a1 + 32)];
          if (v42) {
            [*(id *)(a1 + 48) addObject:v42];
          }
        }
        id v74 = [v56 countByEnumeratingWithState:&v75 objects:v125 count:16];
      }
      while (v74);
    }

    v44 = *(void **)(a1 + 48);
    uint64_t v43 = *(void *)(a1 + 56);
    id v6 = v52;
    if ([v44 count]) {
      id v45 = 0;
    }
    else {
      id v45 = v52;
    }
    (*(void (**)(uint64_t, void *, id))(v43 + 16))(v43, v44, v45);

    id v5 = v53;
  }
  else
  {
    v46 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      __98__MOTemplateBasedContextBuilder__generateContextStringsFromTemplateWithBundleContent_withHandler___block_invoke_cold_1(a1, v46);
    }

    NSErrorUserInfoKey v127 = NSLocalizedDescriptionKey;
    CFStringRef v128 = @"No matching template is found";
    v47 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
    v48 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:1544 userInfo:v47];
    uint64_t v49 = +[NSError errorUsingError:v48 withUnderyingError:v6];

    id obj = (id)v49;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

int64_t __98__MOTemplateBasedContextBuilder__generateContextStringsFromTemplateWithBundleContent_withHandler___block_invoke_83(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

- (void)_findTemplatesForBundleContent:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MOTemplateBasedContextBuilder *)self templateStore];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __76__MOTemplateBasedContextBuilder__findTemplatesForBundleContent_withHandler___block_invoke;
  v10[3] = &unk_1000A52B0;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchTemplatesWithBundleContent:v7 handler:v10];
}

uint64_t __76__MOTemplateBasedContextBuilder__findTemplatesForBundleContent_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createContextStringFromTemplate:(id)a3 withBundleContent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MOContextString alloc];
  id v8 = +[NSUUID UUID];
  id v9 = [v5 templateString];
  uint64_t v10 = [(MOContextString *)v7 initWithIdentifier:v8 string:v9];

  [(MOContextString *)v10 setSource:2];
  [v5 accuracy];
  -[MOContextString setAccuracy:](v10, "setAccuracy:");
  [v5 satisfaction];
  -[MOContextString setSatisfaction:](v10, "setSatisfaction:");
  -[MOContextString setPromptIndex:](v10, "setPromptIndex:", [v5 promptIndex]);
  [v5 totalScore];
  -[MOContextString setTotalScore:](v10, "setTotalScore:");
  id v11 = objc_opt_new();
  id v12 = [v5 globalTraits];
  id v13 = [v12 count];

  if (v13)
  {
    id v25 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v14 = [v5 globalTraits];
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          BOOL v20 = [MOContextDimension alloc];
          v21 = [v19 title];
          v22 = [(MOContextDimension *)v20 initWithName:v21];

          unint64_t v23 = [v19 queries];
          [(MOContextDimension *)v22 setQueries:v23];

          if (v22) {
            [v11 addObject:v22];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    id v5 = v25;
  }
  if ([v11 count]) {
    [(MOContextString *)v10 setContextDimensions:v11];
  }
  if ([v5 photoTrait]) {
    [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x100];
  }
  if ([v5 hasPersonName]) {
    [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 1];
  }
  if ([v5 peopleClassification])
  {
    [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 2];
    if ([v5 peopleClassification] == (id)1) {
      [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x200];
    }
    if ([v5 peopleClassification] == (id)2) {
      [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x400];
    }
    if ([v5 peopleClassification] == (id)3) {
      [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x800];
    }
    if ([v5 peopleClassification] == (id)4) {
      [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x1000];
    }
    if ([v5 peopleClassification] == (id)5) {
      [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x2000];
    }
  }
  if ([v5 hasPlaceName]) {
    [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 4];
  }
  if ([v5 hasCityName]) {
    [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 8];
  }
  if ([v6 hasTimeReference]) {
    [(MOContextString *)v10 setContentType:[(MOContextString *)v10 contentType] | 0x4000];
  }

  return v10;
}

- (id)_filterTemplates:(id)a3
{
  id v4 = a3;
  id v5 = [(MOContextConfigurationManager *)self->_configurationManager getFilePathSettingForKey:@"Templates_To_Remove" withFallback:@"fallback"];
  v46 = v5;
  if (v5 && (id v6 = v5, ([v5 isEqualToString:@"fallback"] & 1) == 0))
  {
    id v7 = +[NSURL fileURLWithPath:v6];
    if (v7)
    {
      id v8 = [(MOTemplateBasedContextBuilder *)self _readTemplatesToRemovePlistFile:v7];
      goto LABEL_6;
    }
    id v45 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[MOTemplateBasedContextBuilder _filterTemplates:](v45);
    }
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOTemplateBasedContextBuilder _filterTemplates:](v7);
    }
  }
  id v8 = 0;
LABEL_6:

  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Accuracy_MaxThreshold" withFallback:2.0];
  double v10 = v9;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Satisfaction_MaxThreshold" withFallback:2.0];
  double v12 = v11;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Utility_MaxThreshold" withFallback:2.0];
  double v14 = v13;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Generalizability_MaxThreshold" withFallback:4.0];
  double v16 = v15;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Satisfaction_MinThreshold" withFallback:1.0];
  double v18 = v17;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Generalizability_MinThreshold" withFallback:2.0];
  double v20 = v19;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Accuracy_MinThreshold" withFallback:0.0];
  double v22 = v21;
  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"Template_Utility_MinThreshold" withFallback:0.0];
  double v24 = v23;
  id v47 = (id)objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v4;
  id v25 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v25) {
    goto LABEL_29;
  }
  id v26 = v25;
  uint64_t v27 = *(void *)v50;
  do
  {
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(void *)v50 != v27) {
        objc_enumerationMutation(obj);
      }
      long long v29 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      [v29 satisfaction];
      if (v30 >= v18)
      {
        [v29 utility];
        if (v31 >= v24)
        {
          [v29 accuracy];
          if (v32 >= v22)
          {
            [v29 generalizability];
            if (v33 >= v20)
            {
              [v29 accuracy];
              if (v34 <= v10)
              {
                [v29 satisfaction];
                if (v35 <= v12)
                {
                  [v29 utility];
                  if (v36 <= v14)
                  {
                    [v29 generalizability];
                    if (v37 <= v16)
                    {
                      [v47 addObject:v29];
                      unsigned int v38 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v54 = v29;
                        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Template is filtered because of score, %@", buf, 0xCu);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v39 = [v8 allValues];
      if ([v39 count])
      {
        unsigned int v40 = [v8 allValues];
        id v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 promptIndex]);
        v42 = [v41 stringValue];
        unsigned int v43 = [v40 containsObject:v42];

        if (!v43) {
          continue;
        }
        [v47 addObject:v29];
        v39 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v29;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Template is filtered because of plist, %@", buf, 0xCu);
        }
      }
    }
    id v26 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  }
  while (v26);
LABEL_29:

  return v47;
}

- (double)_computeTemplateScore:(id)a3 withBundleContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 accuracy];
  double v9 = v8 + 0.0;
  [v6 satisfaction];
  double v11 = v10;
  double v12 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[MOTemplateBasedContextBuilder _computeTemplateScore:withBundleContent:]();
  }
  double v13 = v9 + v11;

  if ([v6 bundleType])
  {
    double v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 10;
      __int16 v41 = 2112;
      double v42 = *(double *)&v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#score, kMOContextStringBundleTypeScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 10.0;
  }
  if ([v6 hasPersonName])
  {
    double v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 30;
      __int16 v41 = 2112;
      double v42 = *(double *)&v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#score, kMOContextStringPersonNameScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 30.0;
  }
  if ([v6 hasPlaceName])
  {
    double v18 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 30;
      __int16 v41 = 2112;
      double v42 = *(double *)&v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#score, kMOContextStringPlaceNameScore score (%lu) added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 30.0;
  }
  if ([v6 hasCityName])
  {
    double v20 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      double v21 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 10;
      __int16 v41 = 2112;
      double v42 = *(double *)&v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#score, kMOContextStringCityNameScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 10.0;
  }
  if ([v6 peopleClassification])
  {
    double v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 30;
      __int16 v41 = 2112;
      double v42 = *(double *)&v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "kMOContextStringPeopleClassificationScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 30.0;
  }
  if ([v6 photoTrait])
  {
    double v24 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 40;
      __int16 v41 = 2112;
      double v42 = *(double *)&v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "kMOContextStringTraitScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 40.0;
  }
  if ([v6 placeType])
  {
    insignificantPlaceTypes = self->_insignificantPlaceTypes;
    uint64_t v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 placeType]);
    LOBYTE(insignificantPlaceTypes) = [(NSArray *)insignificantPlaceTypes containsObject:v27];

    if ((insignificantPlaceTypes & 1) == 0)
    {
      long long v28 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = [v6 templateString];
        int v39 = 134218242;
        uint64_t v40 = 30;
        __int16 v41 = 2112;
        double v42 = *(double *)&v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "kMOContextStringPlaceTypeScore (%lu) score added for %@", (uint8_t *)&v39, 0x16u);
      }
      double v13 = v13 + 30.0;
    }
  }
  if ([v6 activityType])
  {
    double v30 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      double v31 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 10;
      __int16 v41 = 2112;
      double v42 = *(double *)&v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "kMOContextStringActivityTypeScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 10.0;
  }
  if ([v6 patternType])
  {
    double v32 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      double v33 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 30;
      __int16 v41 = 2112;
      double v42 = *(double *)&v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "kMOContextStringPatternTypeScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 30.0;
  }
  if ([v6 hasTimeReference])
  {
    double v34 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      double v35 = [v6 templateString];
      int v39 = 134218242;
      uint64_t v40 = 10;
      __int16 v41 = 2112;
      double v42 = *(double *)&v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#score, kMOContextStringTimeReferenceScore (%lu) score added for %@,", (uint8_t *)&v39, 0x16u);
    }
    double v13 = v13 + 10.0;
  }
  double v36 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    double v37 = [v6 templateString];
    int v39 = 138412546;
    uint64_t v40 = (uint64_t)v37;
    __int16 v41 = 2048;
    double v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#score, string, %@, score, %f", (uint8_t *)&v39, 0x16u);
  }
  return v13;
}

- (id)_readTemplatesToRemovePlistFile:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[MOTemplateBasedContextBuilder _readTemplatesToRemovePlistFile:].cold.4();
    }

    id v6 = [v3 URLByAppendingPathComponent:@"templates_to_remove.plist"];
    id v7 = [v6 path];
    unsigned int v8 = [v4 fileExistsAtPath:v7];

    double v9 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        -[MOTemplateBasedContextBuilder _readTemplatesToRemovePlistFile:]();
      }

      id v16 = 0;
      id v11 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v6 error:&v16];
      id v12 = v16;
      if (v12)
      {
        double v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[MOTemplateBasedContextBuilder _readTemplatesToRemovePlistFile:]();
        }
        id v14 = 0;
      }
      else
      {
        id v14 = v11;
        double v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Templates to remove plist: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v10) {
        -[MOTemplateBasedContextBuilder _readTemplatesToRemovePlistFile:]();
      }

      id v14 = objc_alloc_init((Class)NSDictionary);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)_generateContextStringsFromBundleContents:(id)a3 WithHandler:(id)a4
{
  id v6 = a3;
  id v16 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__2;
  v34[4] = __Block_byref_object_dispose__2;
  id v35 = +[NSMutableDictionary dictionary];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2;
  v32[4] = __Block_byref_object_dispose__2;
  id v33 = 0;
  id v7 = dispatch_group_create();
  unsigned int v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.mosaic.contextsGenerationTemplate", v8);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v12);
        dispatch_group_enter(v7);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = __87__MOTemplateBasedContextBuilder__generateContextStringsFromBundleContents_WithHandler___block_invoke;
        v22[3] = &unk_1000A5300;
        double v23 = v9;
        uint64_t v24 = v13;
        id v26 = v34;
        uint64_t v27 = v32;
        id v25 = v7;
        [(MOTemplateBasedContextBuilder *)self _generateContextStringsFromTemplateWithBundleContent:v13 withHandler:v22];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __87__MOTemplateBasedContextBuilder__generateContextStringsFromBundleContents_WithHandler___block_invoke_3;
  block[3] = &unk_1000A5328;
  double v20 = v34;
  double v21 = v32;
  id v19 = v16;
  id v15 = v16;
  dispatch_group_notify(v7, queue, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

void __87__MOTemplateBasedContextBuilder__generateContextStringsFromBundleContents_WithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __87__MOTemplateBasedContextBuilder__generateContextStringsFromBundleContents_WithHandler___block_invoke_2;
  block[3] = &unk_1000A52D8;
  unsigned int v8 = *(NSObject **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  long long v15 = *(_OWORD *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __87__MOTemplateBasedContextBuilder__generateContextStringsFromBundleContents_WithHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) bundleContentIdentifier];
    [v2 setObject:v3 forKey:v4];
  }
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    objc_storeStrong(v6, v5);
  }
}

uint64_t __87__MOTemplateBasedContextBuilder__generateContextStringsFromBundleContents_WithHandler___block_invoke_3(void *a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(a1[5] + 8) + 40) count];
    uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v13 = 134218242;
    id v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "context result count, %ld, error, %@", (uint8_t *)&v13, 0x16u);
  }

  if (!*(void *)(*(void *)(a1[5] + 8) + 40)) {
    goto LABEL_11;
  }
  id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = [v5 domain];
  uint64_t v7 = v6;
  if (v6 != @"MOContextErrorDomain")
  {

LABEL_11:
    uint64_t v11 = *(uint64_t (**)(void))(a1[4] + 16);
    return v11();
  }
  id v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) code];

  if (v8 != (id)1544) {
    goto LABEL_11;
  }
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = *(void **)(*(void *)(a1[6] + 8) + 40);
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "suppress the template error as the context is not empty so the error is only for part of the bundles, error, %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v11 = *(uint64_t (**)(void))(a1[4] + 16);
  return v11();
}

- (double)_getMostRecentTemplateVersion
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 bundlePath];
  if (!v4) {
    goto LABEL_12;
  }
  int v5 = 1;
  id v6 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  uint64_t v7 = [v6 path];
  id v8 = [v7 stringByAppendingPathComponent:@"templateVersion.json"];

  id v18 = 0;
  id v9 = +[NSData dataWithContentsOfFile:v8 options:0 error:&v18];
  id v10 = v18;
  if (!v10 && v9)
  {
    id v17 = 0;
    uint64_t v11 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:&v17];
    id v10 = v17;
    if (v11)
    {
      id v12 = [v11 objectForKeyedSubscript:@"templateVersion"];

      if (v12)
      {
        int v13 = [v11 objectForKeyedSubscript:@"templateVersion"];
        [v13 doubleValue];
        double v2 = v14;

        __int16 v15 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v20 = v2;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "most recent template version from file: %f", buf, 0xCu);
        }

        int v5 = 0;
      }
      else
      {
        int v5 = 1;
      }
    }
  }
  if (v5) {
LABEL_12:
  }
    double v2 = 0.0;

  return v2;
}

- (void)_generateContextStringsBasedOnNewTemplateFromBundleContents:(id)a3 WithHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MOTemplateBasedContextBuilder *)self _getMostRecentTemplateVersion];
  uint64_t v9 = v8;
  id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "most recent template version: %f", buf, 0xCu);
  }

  [(MOContextConfigurationManager *)self->_configurationManager getDoubleSettingForKey:@"LocalTemplateVersion" withFallback:0.0];
  uint64_t v12 = v11;
  int v13 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "local template version: %f", buf, 0xCu);
  }

  double v14 = [(MOTemplateBasedContextBuilder *)self templateStore];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke;
  v17[3] = &unk_1000A53A0;
  uint64_t v20 = v12;
  uint64_t v21 = v9;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  [v14 checkTemplateStoreIsEmptyWithHandler:v17];
}

void __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && ((v3 = *(double *)(a1 + 56), v3 != 0.0) ? (BOOL v4 = v3 == *(double *)(a1 + 64)) : (BOOL v4 = 0), v4))
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "skip removing old templates and loading new templates", buf, 2u);
    }

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_104;
    v16[3] = &unk_1000A5350;
    id v6 = &v17;
    id v17 = *(id *)(a1 + 48);
    [v11 _generateContextStringsFromBundleContents:v12 WithHandler:v16];
  }
  else
  {
    int v5 = [*(id *)(a1 + 32) templateStore];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_2;
    v13[3] = &unk_1000A5378;
    id v6 = &v15;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    id v15 = v7;
    v13[4] = v8;
    id v14 = v9;
    [v5 loadNewTemplatesFromFileWithHandler:v13];
  }
}

uint64_t __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_2_cold_1();
    }

    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"MOTemplateStore:load new templates hit error";
    int v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v6 = +[NSError errorWithDomain:@"MOContextErrorDomain" code:2308 userInfo:v5];
    id v7 = +[NSError errorUsingError:v6 withUnderyingError:v3];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_109;
    v10[3] = &unk_1000A5350;
    id v11 = *(id *)(a1 + 48);
    [v8 _generateContextStringsFromBundleContents:v9 WithHandler:v10];
    id v7 = v11;
  }
}

uint64_t __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateContextStringsFromBundleContents:(id)a3 WithHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __86__MOTemplateBasedContextBuilder_generateContextStringsFromBundleContents_WithHandler___block_invoke;
  block[3] = &unk_1000A53C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __86__MOTemplateBasedContextBuilder_generateContextStringsFromBundleContents_WithHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __86__MOTemplateBasedContextBuilder_generateContextStringsFromBundleContents_WithHandler___block_invoke_2;
  v3[3] = &unk_1000A5350;
  id v4 = *(id *)(a1 + 48);
  [v1 _generateContextStringsBasedOnNewTemplateFromBundleContents:v2 WithHandler:v3];
}

uint64_t __86__MOTemplateBasedContextBuilder_generateContextStringsFromBundleContents_WithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)songTitleAndArtistStringsForBundleContent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  int v5 = [v3 musicSuggestionArtistName];
  if (v5)
  {
    id v6 = [v3 musicSuggestionArtistName];
    BOOL v7 = (unint64_t)[v6 length] < 0x1F5;
  }
  else
  {
    BOOL v7 = 0;
  }

  uint64_t v8 = [v3 musicSuggestionSongTitle];
  if (v8)
  {
    id v9 = [v3 musicSuggestionSongTitle];
    BOOL v10 = (unint64_t)[v9 length] < 0x1F5;
  }
  else
  {
    BOOL v10 = 0;
  }

  id v11 = [v3 musicSuggestionContentRating];
  unsigned int v12 = [v11 isEqualToString:@"not explicit"];

  if (v12)
  {
    int v13 = !v10;
    if (!v7 || (v13 & 1) != 0)
    {
      if (!v7 || v10)
      {
        if ((v7 | v13)) {
          goto LABEL_22;
        }
        uint64_t v20 = [v3 musicSuggestionSongTitle];
        id v16 = +[NSString stringWithFormat:@", with the song %@", v20];

        uint64_t v21 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Appending music strings for case of artist name not present and song title present", v24, 2u);
        }
      }
      else
      {
        double v22 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Appending music strings for case of artist name present and song title not present", v25, 2u);
        }

        uint64_t v21 = [v3 musicSuggestionArtistName];
        id v16 = +[NSString stringWithFormat:@", with music by %@", v21];
      }

      [v4 addObject:v16];
    }
    else
    {
      id v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Appending music strings for case of artist name present and song title present", buf, 2u);
      }

      id v15 = [v3 musicSuggestionArtistName];
      id v16 = +[NSString stringWithFormat:@", with music by %@", v15];

      id v17 = [v3 musicSuggestionSongTitle];
      id v18 = [v3 musicSuggestionArtistName];
      id v19 = +[NSString stringWithFormat:@", with the song %@ by %@", v17, v18];

      [v4 addObject:v16];
      [v4 addObject:v19];
    }
  }
LABEL_22:

  return v4;
}

- (id)musicMoodStringsForBundleContent:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  if ([v4 bundleType] == (id)5 || objc_msgSend(v4, "placeType") == (id)16)
  {
    uint64_t v6 = [(MOTemplateBasedContextBuilder *)self musicMoodsForRelaxingEvents];
  }
  else if ([v4 activityType] {
         || [v4 placeType] == (id)5
  }
         || [v4 placeType] == (id)8
         || [v4 placeType] == (id)11
         || [v4 placeType] == (id)15
         || [v4 placeType] == (id)21
         || [v4 placeType] == (id)25
         || [v4 placeType] == (id)27
         || [v4 placeType] == (id)31
         || [v4 placeType] == (id)32
         || [v4 placeType] == (id)33
         || [v4 bundleType] == (id)2
         || [v4 photoTrait] == (id)9
         || [v4 photoTrait] == (id)10
         || [v4 photoTrait] == (id)11
         || [v4 photoTrait] == (id)14
         || [v4 photoTrait] == (id)15
         || [v4 photoTrait] == (id)17
         || [v4 photoTrait] == (id)25
         || [v4 photoTrait] == (id)26
         || [v4 photoTrait] == (id)27
         || [v4 photoTrait] == (id)28
         || [v4 photoTrait] == (id)29
         || [v4 photoTrait] == (id)30
         || [v4 photoTrait] == (id)31
         || [v4 photoTrait] == (id)32
         || [v4 photoTrait] == (id)33
         || [v4 photoTrait] == (id)34
         || [v4 photoTrait] == (id)35
         || [v4 photoTrait] == (id)36
         || [v4 photoTrait] == (id)37
         || [v4 photoTrait] == (id)38
         || [v4 photoTrait] == (id)42
         || [v4 photoTrait] == (id)43
         || [v4 photoTrait] == (id)44
         || [v4 photoTrait] == (id)45
         || [v4 photoTrait] == (id)46
         || [v4 photoTrait] == (id)47
         || [v4 photoTrait] == (id)48
         || [v4 photoTrait] == (id)49
         || [v4 photoTrait] == (id)50
         || [v4 photoTrait] == (id)51
         || [v4 photoTrait] == (id)54
         || [v4 photoTrait] == (id)55
         || [v4 photoTrait] == (id)56
         || [v4 photoTrait] == (id)57
         || [v4 photoTrait] == (id)58
         || [v4 photoTrait] == (id)60
         || [v4 photoTrait] == (id)61
         || [v4 photoTrait] == (id)65
         || [v4 photoTrait] == (id)66
         || [v4 photoTrait] == (id)70
         || [v4 photoTrait] == (id)72
         || [v4 photoTrait] == (id)73
         || [v4 photoTrait] == (id)74
         || [v4 photoTrait] == (id)75
         || [v4 photoTrait] == (id)77
         || [v4 photoTrait] == (id)78
         || [v4 photoTrait] == (id)79
         || [v4 photoTrait] == (id)82
         || [v4 photoTrait] == (id)83
         || [v4 placeType] == (id)35
         || [v4 placeType] == (id)36)
  {
    uint64_t v6 = [(MOTemplateBasedContextBuilder *)self musicMoodsForUpbeatEvents];
  }
  else
  {
    uint64_t v6 = [(MOTemplateBasedContextBuilder *)self musicMoodsForGeneralEvents];
  }
  BOOL v7 = (void *)v6;
  [v5 addObjectsFromArray:v6];

  return v5;
}

- (MOTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MOContextConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSArray)musicMoodsForRelaxingEvents
{
  return self->_musicMoodsForRelaxingEvents;
}

- (NSArray)musicMoodsForUpbeatEvents
{
  return self->_musicMoodsForUpbeatEvents;
}

- (NSArray)musicMoodsForGeneralEvents
{
  return self->_musicMoodsForGeneralEvents;
}

- (NSArray)insignificantPlaceTypes
{
  return self->_insignificantPlaceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insignificantPlaceTypes, 0);
  objc_storeStrong((id *)&self->_musicMoodsForGeneralEvents, 0);
  objc_storeStrong((id *)&self->_musicMoodsForUpbeatEvents, 0);
  objc_storeStrong((id *)&self->_musicMoodsForRelaxingEvents, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
}

void __98__MOTemplateBasedContextBuilder__generateContextStringsFromTemplateWithBundleContent_withHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3 = [*(id *)(a1 + 32) associatedBundleID];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "no template found for this bundle content with bundle ID %@", v4, 0xCu);
}

- (void)_filterTemplates:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get path of plist file, nil file path.", v1, 2u);
}

- (void)_filterTemplates:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get directory of plist file.", v1, 2u);
}

- (void)_computeTemplateScore:withBundleContent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#score template, %@, with bundle content, %@", v2, 0x16u);
}

- (void)_readTemplatesToRemovePlistFile:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not read the Templates to remove plist file, error: %@", v1, 0xCu);
}

- (void)_readTemplatesToRemovePlistFile:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "File found at path: %@.", v2, v3, v4, v5, v6);
}

- (void)_readTemplatesToRemovePlistFile:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "No plist found at path: %@, ", v2, v3, v4, v5, v6);
}

- (void)_readTemplatesToRemovePlistFile:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Path to check: %@", v2, v3, v4, v5, v6);
}

void __105__MOTemplateBasedContextBuilder__generateContextStringsBasedOnNewTemplateFromBundleContents_WithHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "failed to load new templates with error %@", v1, 0xCu);
}

@end