@interface MOEventBundleLabelFormatter
- (MOEventBundleLabelFormatter)init;
- (MOEventBundleLabelFormatter)initWithTemplatePath:(id)a3;
- (MOEventBundleLabelFormatter)initWithUniverse:(id)a3;
- (NSDictionary)context;
- (NSDictionary)templates;
- (id)formattedBundleLabelsForMetaData:(id)a3 bundleType:(id)a4;
- (id)formattedBundlePromptsForMetaData:(id)a3 bundleType:(id)a4;
- (id)formattedStringsForMetaData:(id)a3 templateType:(id)a4 bundleType:(id)a5;
- (id)formattedStringsForMetaData:(id)a3 templates:(id)a4;
- (id)getContextForBundleType:(id)a3;
- (id)getTemplateDirectoryURL;
- (id)keywordForTemplateType:(id)a3 bundleType:(id)a4;
- (id)loadDictionaryFromPath:(id)a3;
- (id)shuffleStrings:(id)a3 shuffleMode:(unint64_t)a4;
- (void)getTemplateDirectoryURL;
- (void)loadLabelTemplates;
- (void)loadLabelTemplatesFromDirectory:(id)a3;
- (void)logDiagnoticsInformation;
@end

@implementation MOEventBundleLabelFormatter

- (MOEventBundleLabelFormatter)init
{
  v8.receiver = self;
  v8.super_class = (Class)MOEventBundleLabelFormatter;
  v2 = [(MOEventBundleLabelFormatter *)&v8 init];
  v3 = v2;
  if (v2)
  {
    templatePath = v2->_templatePath;
    v2->_templatePath = 0;

    templates = v3->_templates;
    v3->_templates = 0;

    context = v3->_context;
    v3->_context = 0;
  }
  return v3;
}

- (MOEventBundleLabelFormatter)initWithTemplatePath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOEventBundleLabelFormatter;
  v6 = [(MOEventBundleLabelFormatter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templatePath, a3);
    templates = v7->_templates;
    v7->_templates = 0;

    context = v7->_context;
    v7->_context = 0;
  }
  return v7;
}

- (void)loadLabelTemplates
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "loadLabelTemplates from dir, %@", v1, 0xCu);
}

- (MOEventBundleLabelFormatter)initWithUniverse:(id)a3
{
  return [(MOEventBundleLabelFormatter *)self initWithTemplatePath:@"/System/Library/PrivateFrameworks/Moments.framework/LabelTemplates"];
}

- (id)getTemplateDirectoryURL
{
  uint64_t v2 = +[MOEventBundleLabelLocalizer _MomentsBundle];
  v3 = [v2 bundlePath];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
    id v5 = [v4 URLByAppendingPathComponent:@"LabelTemplates"];
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormatter getTemplateDirectoryURL]();
    }

    id v5 = 0;
  }

  return v5;
}

- (NSDictionary)templates
{
  templates = self->_templates;
  if (!templates)
  {
    templatePath = self->_templatePath;
    if (!templatePath)
    {
      id v5 = [(MOEventBundleLabelFormatter *)self getTemplateDirectoryURL];
      v6 = [v5 path];
      v7 = self->_templatePath;
      self->_templatePath = v6;

      templatePath = self->_templatePath;
    }
    [(MOEventBundleLabelFormatter *)self loadLabelTemplatesFromDirectory:templatePath];
    templates = self->_templates;
  }
  return templates;
}

- (NSDictionary)context
{
  context = self->_context;
  if (!context)
  {
    templatePath = self->_templatePath;
    if (!templatePath)
    {
      id v5 = [(MOEventBundleLabelFormatter *)self getTemplateDirectoryURL];
      v6 = [v5 path];
      v7 = self->_templatePath;
      self->_templatePath = v6;

      templatePath = self->_templatePath;
    }
    [(MOEventBundleLabelFormatter *)self loadLabelTemplatesFromDirectory:templatePath];
    context = self->_context;
  }
  return context;
}

- (void)loadLabelTemplatesFromDirectory:(id)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:]();
  }

  [MEMORY[0x1E4F28CB8] defaultManager];
  v69 = id v120 = 0;
  id v5 = [v69 contentsOfDirectoryAtPath:v3 error:&v120];
  id v6 = v120;
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self ENDSWITH '.json'"];
  v68 = v5;
  objc_super v8 = [v5 filteredArrayUsingPredicate:v7];

  v67 = v8;
  if (v8 && [v8 count])
  {
    id v66 = v6;
    v78 = (NSDictionary *)objc_opt_new();
    v82 = (NSDictionary *)objc_opt_new();
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    obuint64_t j = v8;
    id v70 = v3;
    uint64_t v73 = [obj countByEnumeratingWithState:&v116 objects:v130 count:16];
    if (v73)
    {
      uint64_t v72 = *(void *)v117;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v117 != v72) {
            objc_enumerationMutation(obj);
          }
          uint64_t v75 = v9;
          uint64_t v10 = *(void *)(*((void *)&v116 + 1) + 8 * v9);
          v74 = (void *)MEMORY[0x1D26065F0]();
          uint64_t v11 = [v3 stringByAppendingPathComponent:v10];
          v12 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v123 = v11;
            _os_log_debug_impl(&dword_1D24AE000, v12, OS_LOG_TYPE_DEBUG, "Template file, %@", buf, 0xCu);
          }

          v13 = [(MOEventBundleLabelFormatter *)self loadDictionaryFromPath:v11];
          v87 = (void *)v11;
          v76 = v13;
          if (v13 && [v13 count])
          {
            v14 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v123 = v11;
              __int16 v124 = 2112;
              v125 = v76;
              _os_log_debug_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_DEBUG, "Template file, %@, dict, %@", buf, 0x16u);
            }

            v15 = [v76 objectForKeyedSubscript:@"cases"];
            long long v112 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v77 = v15;
            uint64_t v81 = [v77 countByEnumeratingWithState:&v112 objects:v129 count:16];
            if (v81)
            {
              v92 = 0;
              v93 = 0;
              uint64_t v79 = *(void *)v113;
              do
              {
                uint64_t v16 = 0;
                do
                {
                  if (*(void *)v113 != v79) {
                    objc_enumerationMutation(v77);
                  }
                  uint64_t v85 = v16;
                  v17 = *(void **)(*((void *)&v112 + 1) + 8 * v16);
                  v84 = (void *)MEMORY[0x1D26065F0]();
                  v18 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v123 = (uint64_t)v87;
                    __int16 v124 = 2112;
                    v125 = v17;
                    _os_log_debug_impl(&dword_1D24AE000, v18, OS_LOG_TYPE_DEBUG, "Template file, %@, subdict, %@", buf, 0x16u);
                  }

                  uint64_t v19 = [v17 objectForKeyedSubscript:@"bundleType"];
                  v86 = [(MOEventBundleLabelFormatter *)self keywordForTemplateType:@"labels" bundleType:v19];
                  v88 = [(MOEventBundleLabelFormatter *)self keywordForTemplateType:@"prompts" bundleType:v19];
                  v90 = objc_opt_new();
                  v89 = objc_opt_new();
                  v20 = [v17 objectForKeyedSubscript:@"context"];
                  if (v20)
                  {
                    v21 = [(NSDictionary *)v82 objectForKey:v19];
                    if (v21)
                    {
                      v22 = (void *)[v20 mutableCopy];
                      [v22 addEntriesFromDictionary:v21];

                      v20 = v22;
                    }
                    -[NSDictionary setObject:forKey:](v82, "setObject:forKey:", v20, v19, v66, v67);
                  }
                  v94 = v20;
                  v83 = (void *)v19;
                  v23 = objc_msgSend(v17, "objectForKeyedSubscript:", @"templates", v66);
                  long long v108 = 0u;
                  long long v109 = 0u;
                  long long v110 = 0u;
                  long long v111 = 0u;
                  id v91 = v23;
                  uint64_t v96 = [v91 countByEnumeratingWithState:&v108 objects:v128 count:16];
                  if (v96)
                  {
                    uint64_t v95 = *(void *)v109;
                    do
                    {
                      for (uint64_t i = 0; i != v96; ++i)
                      {
                        if (*(void *)v109 != v95) {
                          objc_enumerationMutation(v91);
                        }
                        v25 = *(void **)(*((void *)&v108 + 1) + 8 * i);
                        uint64_t v26 = MEMORY[0x1D26065F0]();
                        uint64_t v27 = [v25 objectForKeyedSubscript:@"conditions"];
                        uint64_t v28 = [v25 objectForKeyedSubscript:@"extends"];
                        uint64_t v29 = [v25 objectForKeyedSubscript:@"capitalizations"];
                        v30 = [v25 objectForKeyedSubscript:@"labels"];
                        v31 = [v25 objectForKeyedSubscript:@"prompts"];
                        v32 = v31;
                        context = (void *)v26;
                        if (v30)
                        {
                          id v33 = [v30 arrayByAddingObjectsFromArray:v31];
                        }
                        else
                        {
                          id v33 = v31;
                        }
                        v99 = v33;
                        uint64_t v34 = +[MOEventBundleLabelTemplate conditionsFromLabels:v33];
                        uint64_t v35 = +[MOEventBundleLabelTemplate conditionsFromConditionStrings:v27];
                        v101 = (void *)v28;
                        uint64_t v36 = +[MOEventBundleLabelTemplate conditionsFromExtendStrings:v28];
                        v100 = (void *)v29;
                        v37 = +[MOEventBundleLabelTemplate conditionsFromCapitalizations:v29];
                        v97 = (void *)v35;
                        v98 = (void *)v34;
                        v38 = (void *)v35;
                        v39 = (void *)v36;
                        v40 = [v38 setByAddingObjectsFromSet:v34];
                        if ([v39 count])
                        {
                          uint64_t v41 = [v40 setByAddingObjectsFromSet:v39];

                          v40 = (void *)v41;
                        }
                        v103 = (void *)v27;
                        if ([v37 count])
                        {
                          uint64_t v42 = [v40 setByAddingObjectsFromSet:v37];

                          v40 = (void *)v42;
                        }
                        v43 = +[MOEventBundleLabelTemplate formatsFromLabels:v30];
                        v44 = +[MOEventBundleLabelTemplate formatsFromLabels:v32];
                        if (v30 && [v30 count])
                        {
                          v45 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            uint64_t v123 = (uint64_t)v30;
                            __int16 v124 = 2112;
                            v125 = v103;
                            __int16 v126 = 2112;
                            uint64_t v127 = (uint64_t)v40;
                            _os_log_debug_impl(&dword_1D24AE000, v45, OS_LOG_TYPE_DEBUG, "template parsing, labels, %@, conditionStrings, %@, conditions, %@", buf, 0x20u);
                          }

                          v46 = [[MOEventBundleLabelTemplate alloc] initWithConditions:v40 formats:v43 context:v94];
                          [v90 addObject:v46];
                          ++v92;
                        }
                        if (v32 && [v32 count])
                        {
                          v47 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            uint64_t v123 = (uint64_t)v30;
                            __int16 v124 = 2112;
                            v125 = v103;
                            __int16 v126 = 2112;
                            uint64_t v127 = (uint64_t)v40;
                            _os_log_debug_impl(&dword_1D24AE000, v47, OS_LOG_TYPE_DEBUG, "template parsing, prompts, %@, conditionStrings, %@, conditions, %@", buf, 0x20u);
                          }

                          v48 = [[MOEventBundleLabelTemplate alloc] initWithConditions:v40 formats:v44 context:v94];
                          [v89 addObject:v48];
                          ++v93;
                        }
                      }
                      uint64_t v96 = [v91 countByEnumeratingWithState:&v108 objects:v128 count:16];
                    }
                    while (v96);
                  }

                  v49 = [(NSDictionary *)v78 objectForKey:v86];
                  [v90 addObjectsFromArray:v49];
                  [(NSDictionary *)v78 setObject:v90 forKey:v86];
                  v50 = [(NSDictionary *)v78 objectForKey:v88];
                  [v89 addObjectsFromArray:v50];
                  [(NSDictionary *)v78 setObject:v89 forKey:v88];
                  v51 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v60 = [v90 count];
                    *(_DWORD *)buf = 138412802;
                    uint64_t v123 = (uint64_t)v87;
                    __int16 v124 = 2112;
                    v125 = v86;
                    __int16 v126 = 2048;
                    uint64_t v127 = v60;
                    _os_log_debug_impl(&dword_1D24AE000, v51, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, templates.count, %lu", buf, 0x20u);
                  }

                  v52 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v61 = [v89 count];
                    *(_DWORD *)buf = 138412802;
                    uint64_t v123 = (uint64_t)v87;
                    __int16 v124 = 2112;
                    v125 = v88;
                    __int16 v126 = 2048;
                    uint64_t v127 = v61;
                    _os_log_debug_impl(&dword_1D24AE000, v52, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, templates.count, %lu", buf, 0x20u);
                  }

                  long long v106 = 0u;
                  long long v107 = 0u;
                  long long v104 = 0u;
                  long long v105 = 0u;
                  id v53 = v89;
                  uint64_t v54 = [v53 countByEnumeratingWithState:&v104 objects:v121 count:16];
                  if (v54)
                  {
                    uint64_t v55 = v54;
                    uint64_t v56 = *(void *)v105;
                    do
                    {
                      for (uint64_t j = 0; j != v55; ++j)
                      {
                        if (*(void *)v105 != v56) {
                          objc_enumerationMutation(v53);
                        }
                        uint64_t v58 = *(void *)(*((void *)&v104 + 1) + 8 * j);
                        v59 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          uint64_t v123 = (uint64_t)v87;
                          __int16 v124 = 2112;
                          v125 = v88;
                          __int16 v126 = 2112;
                          uint64_t v127 = v58;
                          _os_log_debug_impl(&dword_1D24AE000, v59, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, flattened template, %@", buf, 0x20u);
                        }
                      }
                      uint64_t v55 = [v53 countByEnumeratingWithState:&v104 objects:v121 count:16];
                    }
                    while (v55);
                  }

                  uint64_t v16 = v85 + 1;
                }
                while (v85 + 1 != v81);
                uint64_t v81 = [v77 countByEnumeratingWithState:&v112 objects:v129 count:16];
              }
              while (v81);
            }
            else
            {
              v92 = 0;
              v93 = 0;
            }

            id v3 = v70;
          }
          else
          {
            v92 = 0;
            v93 = 0;
          }
          v62 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v123 = (uint64_t)v87;
            __int16 v124 = 2048;
            v125 = v92;
            __int16 v126 = 2048;
            uint64_t v127 = (uint64_t)v93;
            _os_log_debug_impl(&dword_1D24AE000, v62, OS_LOG_TYPE_DEBUG, "Template file, %@, label.count, %lu, prompts.count, %lu", buf, 0x20u);
          }

          uint64_t v9 = v75 + 1;
        }
        while (v75 + 1 != v73);
        uint64_t v73 = [obj countByEnumeratingWithState:&v116 objects:v130 count:16];
      }
      while (v73);
    }

    templates = self->_templates;
    self->_templates = v78;
    v64 = v78;

    id v3 = v70;
    v65 = self->_context;
    self->_context = v82;

    id v6 = v66;
  }
  else
  {
    v64 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:]();
    }
  }
}

- (id)loadDictionaryFromPath:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v14];
  id v5 = v14;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v9 = v5;
    v7 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormatter loadDictionaryFromPath:]();
    }
    goto LABEL_13;
  }
  id v13 = 0;
  objc_super v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v13];
  id v9 = v13;
  uint64_t v10 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v7 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelFormatter loadDictionaryFromPath:]();
    }
LABEL_13:
    objc_super v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_INFO, "The json file was successfully read.", v12, 2u);
  }
LABEL_14:

  return v8;
}

- (id)getContextForBundleType:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundleLabelFormatter *)self context];

  BOOL v6 = 0;
  if (v4 && v5)
  {
    v7 = [(MOEventBundleLabelFormatter *)self context];
    BOOL v6 = [v7 objectForKey:v4];
  }
  return v6;
}

- (id)formattedStringsForMetaData:(id)a3 templates:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v20 = self;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1D26065F0]();
        v15 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v13;
          _os_log_debug_impl(&dword_1D24AE000, v15, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        if ([v13 checkConditionForMetaData:v6])
        {
          uint64_t v16 = [v13 formattedStringsForMetaData:v6];
          if ([v16 count])
          {
            v17 = [v6 objectForKey:@"shuffle_mode"];
            uint64_t v18 = (int)[v17 intValue];

            uint64_t v11 = [(MOEventBundleLabelFormatter *)v20 shuffleStrings:v16 shuffleMode:v18];

            goto LABEL_16;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_16:

  return v11;
}

- (id)shuffleStrings:(id)a3 shuffleMode:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    if (a4 == 1)
    {
      id v7 = [MEMORY[0x1E4F1C9C8] now];
      [v7 timeIntervalSinceReferenceDate];
      unint64_t v9 = (unint64_t)(v8 / 86400.0);
      unint64_t v10 = v9 % [v6 count];
      uint64_t v11 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 134218754;
        uint64_t v17 = [v6 count];
        __int16 v18 = 2048;
        unint64_t v19 = v9;
        __int16 v20 = 2048;
        unint64_t v21 = v10;
        __int16 v22 = 2112;
        long long v23 = v7;
        _os_log_debug_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEBUG, "Shuffle Labels: count, %lu, seed, %lu, start_index, %lu, nowDate, %@", (uint8_t *)&v16, 0x2Au);
      }

      if (v10)
      {
        id v12 = (id)objc_opt_new();
        id v13 = objc_msgSend(v6, "subarrayWithRange:", v10, objc_msgSend(v6, "count") - v10);
        [v12 addObjectsFromArray:v13];

        id v14 = objc_msgSend(v6, "subarrayWithRange:", 0, v10);
        [v12 addObjectsFromArray:v14];
      }
      else
      {
        id v12 = v6;
      }
    }
    else
    {
      id v12 = v6;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)formattedBundleLabelsForMetaData:(id)a3 bundleType:(id)a4
{
  return [(MOEventBundleLabelFormatter *)self formattedStringsForMetaData:a3 templateType:@"labels" bundleType:a4];
}

- (id)formattedBundlePromptsForMetaData:(id)a3 bundleType:(id)a4
{
  return [(MOEventBundleLabelFormatter *)self formattedStringsForMetaData:a3 templateType:@"prompts" bundleType:a4];
}

- (id)formattedStringsForMetaData:(id)a3 templateType:(id)a4 bundleType:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(MOEventBundleLabelFormatter *)self keywordForTemplateType:v9 bundleType:a5];
  uint64_t v11 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:]();
  }

  id v12 = [(MOEventBundleLabelFormatter *)self templates];
  id v13 = [v12 objectForKey:v10];

  if (v13 && [v13 count])
  {
    id v14 = [(MOEventBundleLabelFormatter *)self formattedStringsForMetaData:v8 templates:v13];
  }
  else
  {
    if ([v9 isEqualToString:@"prompts"]) {
      v15 = @"default_prompt";
    }
    else {
      v15 = @"default_label";
    }
    uint64_t v16 = [v8 objectForKey:v15];
    uint64_t v17 = (void *)v16;
    if (v16)
    {
      v29[0] = v16;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    }
    else
    {
      __int16 v18 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = [v8 allKeys];
        unint64_t v21 = [(MOEventBundleLabelFormatter *)self templates];
        __int16 v22 = [v21 allKeys];
        int v23 = 138412802;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = v22;
        _os_log_error_impl(&dword_1D24AE000, v18, OS_LOG_TYPE_ERROR, "The label template is not found for the keyword, %@, meta, %@, all keywords, %@", (uint8_t *)&v23, 0x20u);
      }
      id v14 = 0;
    }
  }
  return v14;
}

- (id)keywordForTemplateType:(id)a3 bundleType:(id)a4
{
  id v4 = [NSString stringWithFormat:@"%@_%@", a3, a4];
  id v5 = [v4 lowercaseString];

  return v5;
}

- (void)logDiagnoticsInformation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v3 = [v2 firstObject];
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 localeIdentifier];
  id v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 preferredLocalizations];
  id v8 = [v7 firstObject];
  OUTLINED_FUNCTION_3_1();
  id v12 = v5;
  __int16 v13 = v9;
  uint64_t v14 = v10;
  _os_log_debug_impl(&dword_1D24AE000, a1, OS_LOG_TYPE_DEBUG, "preferredLanguage, %@, locale, %@, mainBundlePreferredLocalization, %@", v11, 0x20u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_templatePath, 0);
}

- (void)getTemplateDirectoryURL
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "failed to get cache directory to store collection date plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

- (void)loadLabelTemplatesFromDirectory:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "The template directory is empty.", v2, v3, v4, v5, v6);
}

- (void)loadLabelTemplatesFromDirectory:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEBUG, "load templates from %@", v1, 0xCu);
}

- (void)loadDictionaryFromPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_ERROR, "Could not read to the JSON file, error: %@", v1, 0xCu);
}

- (void)loadDictionaryFromPath:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D24AE000, v1, OS_LOG_TYPE_ERROR, "Couldn't parse JSON to dictionary. %@, error, %@", v2, 0x16u);
}

- (void)formattedStringsForMetaData:templateType:bundleType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEBUG, "keyword, %@", v1, 0xCu);
}

@end