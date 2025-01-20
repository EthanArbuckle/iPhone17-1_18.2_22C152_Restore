@interface PPHealthKitImporter
- (PPHealthKitImporter)initWithDatabase:(id)a3;
- (void)importHealthKitData;
- (void)importHealthKitDataWithShouldContinueBlock:(id)a3;
@end

@implementation PPHealthKitImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)importHealthKitDataWithShouldContinueBlock:(id)a3
{
  v23 = (uint64_t (**)(void))a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  if (*((unsigned char *)v30 + 24))
  {
    v20 = &v41;
    v21 = v25;
    v19 = &v42;
    v17 = &v40;
    v18 = &v35;
    while (2)
    {
      uint64_t v33 = 0;
      uint64_t v34 = (uint64_t)&v33;
      uint64_t v35 = 0x2050000000;
      v4 = (void *)getHKAnchoredObjectQueryClass_softClass;
      v36 = (void *)getHKAnchoredObjectQueryClass_softClass;
      if (!getHKAnchoredObjectQueryClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v39 = 3221225472;
        uint64_t v40 = (uint64_t)__getHKAnchoredObjectQueryClass_block_invoke;
        v41 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E65DC058;
        v42 = (void (*)(uint64_t))&v33;
        __getHKAnchoredObjectQueryClass_block_invoke((uint64_t)buf);
        v4 = *(void **)(v34 + 24);
      }
      v5 = v4;
      _Block_object_dispose(&v33, 8);
      id v6 = [v5 alloc];
      uint64_t v33 = 0;
      uint64_t v34 = (uint64_t)&v33;
      uint64_t v35 = 0x2050000000;
      v7 = (void *)getHKObjectTypeClass_softClass;
      v36 = (void *)getHKObjectTypeClass_softClass;
      if (!getHKObjectTypeClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v39 = 3221225472;
        uint64_t v40 = (uint64_t)__getHKObjectTypeClass_block_invoke;
        v41 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E65DC058;
        v42 = (void (*)(uint64_t))&v33;
        __getHKObjectTypeClass_block_invoke((uint64_t)buf);
        v7 = *(void **)(v34 + 24);
      }
      id v8 = v7;
      _Block_object_dispose(&v33, 8);
      v9 = objc_msgSend(v8, "workoutType", v17, v18, v19, v20, v21);
      if (self)
      {
        *(void *)buf = 0;
        uint64_t v39 = (uint64_t)buf;
        uint64_t v40 = 0x3032000000;
        v41 = __Block_byref_object_copy__22714;
        v42 = __Block_byref_object_dispose__22715;
        id v43 = 0;
        db = self->_db;
        uint64_t v33 = MEMORY[0x1E4F143A8];
        uint64_t v34 = 3221225472;
        uint64_t v35 = (uint64_t)__38__PPHealthKitImporter__getSavedAnchor__block_invoke;
        v36 = &unk_1E65DAC20;
        v37 = buf;
        [(PPSQLDatabase *)db readTransactionWithClient:6 block:&v33];
        id v11 = *(id *)(v39 + 40);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v11 = 0;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v25[0] = __66__PPHealthKitImporter_importHealthKitDataWithShouldContinueBlock___block_invoke;
      v25[1] = &unk_1E65DABD8;
      v28 = &v29;
      v12 = v23;
      id v27 = v12;
      v25[2] = self;
      v13 = v22;
      v26 = v13;
      v14 = (void *)[v6 initWithType:v9 predicate:0 anchor:v11 limit:50 resultsHandler:v24];

      [(HKHealthStore *)self->_healthStore executeQuery:v14];
      while ([MEMORY[0x1E4F93B18] waitForSemaphore:v13 timeoutSeconds:1.0] == 1)
      {
        if ((v23[2](v12) & 1) == 0)
        {
          v15 = pp_default_log_handle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: HealthKitImporter: deferring", buf, 2u);
          }

          [(HKHealthStore *)self->_healthStore stopQuery:v14];
          goto LABEL_19;
        }
      }

      if (*((unsigned char *)v30 + 24)) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  _Block_object_dispose(&v29, 8);
}

void __66__PPHealthKitImporter_importHealthKitDataWithShouldContinueBlock___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v244 = *MEMORY[0x1E4F143B8];
  id v65 = a2;
  id v68 = a3;
  id v67 = a4;
  id v66 = a5;
  id v70 = a6;
  self;
  v10 = +[PPSettings sharedInstance];
  uint64_t v76 = *MEMORY[0x1E4F8A068];
  LOBYTE(a5) = objc_msgSend(v10, "bundleIdentifierIsEnabledForDonation:");

  if ((a5 & 1) == 0)
  {
    id v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter disabled due to settings.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_8;
  }
  if (!v70)
  {
    if (![v68 count] && !objc_msgSend(v67, "count"))
    {
      id v11 = pp_default_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: All Workouts have been imported", (uint8_t *)&buf, 2u);
      }
      goto LABEL_8;
    }
    if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0) {
      goto LABEL_9;
    }
    if (a1[4])
    {
      v90 = 0;
      v13 = objc_msgSend(v67, "_pas_mappedArrayWithTransform:", &__block_literal_global_11);
      v14 = +[PPLocalTopicStore defaultStore];
      *(void *)&long long v86 = 0;
      int v15 = [v14 deleteAllTopicsFromSourcesWithBundleId:v76 documentIds:v13 deletedCount:&v90 error:&v86];
      id v16 = (id)v86;

      v17 = pp_default_log_handle();
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v90;
          _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: deleted %tu workouts", (uint8_t *)&buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: failed to delete workouts, %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v19 = a1[4];
    id v64 = v68;
    if (v19)
    {
      v20 = pp_default_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [v64 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: Received donation of %tu workout(s)", (uint8_t *)&buf, 0xCu);
      }

      self;
      v90 = &unk_1F2569908;
      v91 = (void **)&unk_1F2569920;
      *(void *)&long long buf = &unk_1F256A778;
      *((void *)&buf + 1) = &unk_1F256A790;
      uint64_t v92 = (uint64_t)&unk_1F2569938;
      v93 = &unk_1F2569950;
      v168 = (void (*)(uint64_t, void *))&unk_1F256A7A8;
      v169 = &unk_1F256A7C0;
      v94 = &unk_1F2569968;
      v95 = &unk_1F2569980;
      id v170 = &unk_1F256A7D8;
      v171 = (void **)&unk_1F256A7F0;
      v96 = &unk_1F2569998;
      v97 = &unk_1F25699B0;
      v172 = &unk_1F256A808;
      v173 = &unk_1F256A820;
      v98 = &unk_1F25699C8;
      v99 = &unk_1F25699E0;
      v174 = &unk_1F256A838;
      v175 = &unk_1F256A850;
      v100 = &unk_1F25699F8;
      v101 = &unk_1F2569A10;
      v176 = &unk_1F256A868;
      v177 = &unk_1F256A880;
      v102 = &unk_1F2569A28;
      v103 = &unk_1F2569A40;
      v178 = &unk_1F256A898;
      v179 = &unk_1F256A8B0;
      v104 = &unk_1F2569A58;
      v105 = &unk_1F2569A70;
      v180 = &unk_1F256A8C8;
      v181 = &unk_1F256A8E0;
      v106 = &unk_1F2569A88;
      v107 = &unk_1F2569AA0;
      v182 = &unk_1F256A8F8;
      v183 = &unk_1F256A910;
      v108 = &unk_1F2569AB8;
      v109 = &unk_1F2569AD0;
      v184 = &unk_1F256A928;
      v185 = &unk_1F256A940;
      v110 = &unk_1F2569AE8;
      v111 = &unk_1F2569B00;
      v186 = &unk_1F256A958;
      v187 = &unk_1F256A970;
      v112 = &unk_1F2569B18;
      v113 = &unk_1F2569B30;
      v188 = &unk_1F256A988;
      v189 = &unk_1F256A9A0;
      v114 = &unk_1F2569B48;
      v115 = &unk_1F2569B60;
      v190 = &unk_1F256A9B8;
      v191 = &unk_1F256A9D0;
      v116 = &unk_1F2569B78;
      v117 = &unk_1F2569B90;
      v192 = &unk_1F256A9E8;
      v193 = &unk_1F256AA00;
      v118 = &unk_1F2569BA8;
      v119 = &unk_1F2569BC0;
      v194 = &unk_1F256AA18;
      v195 = &unk_1F256AA30;
      v120 = &unk_1F2569BD8;
      v121 = &unk_1F2569BF0;
      v196 = &unk_1F256AA48;
      v197 = &unk_1F256AA60;
      v122 = &unk_1F2569C08;
      v123 = &unk_1F2569C20;
      v198 = &unk_1F256AA78;
      v199 = &unk_1F256AA90;
      v124 = &unk_1F2569C38;
      v125 = &unk_1F2569C50;
      v200 = &unk_1F256AAA8;
      v201 = &unk_1F256AAC0;
      v126 = &unk_1F2569C68;
      v127 = &unk_1F2569C80;
      v202 = &unk_1F256AAD8;
      v203 = &unk_1F256AAF0;
      v128 = &unk_1F2569C98;
      v129 = &unk_1F2569CB0;
      v204 = &unk_1F256AB08;
      v205 = &unk_1F256AB20;
      v130 = &unk_1F2569CC8;
      v131 = &unk_1F2569CE0;
      v206 = &unk_1F256AB38;
      v207 = &unk_1F256AB50;
      v132 = &unk_1F2569CF8;
      v133 = &unk_1F2569D10;
      v208 = &unk_1F256AB68;
      v209 = &unk_1F256AB80;
      v134 = &unk_1F2569D28;
      v135 = &unk_1F2569D40;
      v210 = &unk_1F256AB98;
      v211 = &unk_1F256ABB0;
      v136 = &unk_1F2569D58;
      v137 = &unk_1F2569D70;
      v212 = &unk_1F256ABC8;
      v213 = &unk_1F256ABE0;
      v138 = &unk_1F2569D88;
      v139 = &unk_1F2569DA0;
      v214 = &unk_1F256ABF8;
      v215 = &unk_1F256AC10;
      v140 = &unk_1F2569DB8;
      v141 = &unk_1F2569DD0;
      v216 = &unk_1F256AC28;
      v217 = &unk_1F256AC40;
      v142 = &unk_1F2569DE8;
      v143 = &unk_1F2569E00;
      v218 = &unk_1F256AC58;
      v219 = &unk_1F256AC70;
      v144 = &unk_1F2569E18;
      v145 = &unk_1F2569E30;
      v220 = &unk_1F256AC88;
      v221 = &unk_1F256ACA0;
      v146 = &unk_1F2569E48;
      v147 = &unk_1F2569E60;
      v222 = &unk_1F256ACB8;
      v223 = &unk_1F256ACD0;
      v148 = &unk_1F2569E78;
      v149 = &unk_1F2569E90;
      v224 = &unk_1F256ACE8;
      v225 = &unk_1F256AD00;
      v150 = &unk_1F2569EA8;
      v151 = &unk_1F2569EC0;
      v226 = &unk_1F256AD18;
      v227 = &unk_1F256AD30;
      v152 = &unk_1F2569ED8;
      v153 = &unk_1F2569EF0;
      v228 = &unk_1F256AD48;
      v229 = &unk_1F256AD60;
      v154 = &unk_1F2569F08;
      v230 = &unk_1F256AD78;
      v155 = &unk_1F2569F20;
      v231 = &unk_1F256AD90;
      v156 = &unk_1F2569F38;
      v232 = &unk_1F256ADA8;
      v157 = &unk_1F2569F50;
      v233 = &unk_1F256ADC0;
      v158 = &unk_1F2569F68;
      v234 = &unk_1F256ADD8;
      v159 = &unk_1F2569F80;
      v235 = &unk_1F256ADF0;
      v160 = &unk_1F2569F98;
      v236 = &unk_1F256AE08;
      v161 = &unk_1F2569FB0;
      v237 = &unk_1F256AE20;
      v162 = &unk_1F2569FC8;
      v238 = &unk_1F256AE38;
      v163 = &unk_1F2569FE0;
      v239 = &unk_1F256AE50;
      v164 = &unk_1F2569FF8;
      v240 = &unk_1F256AE68;
      v165 = &unk_1F256A010;
      v241 = &unk_1F256AE80;
      v166 = &unk_1F256A028;
      v242 = &unk_1F256AE98;
      v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v90 count:77];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      obuint64_t j = v64;
      uint64_t v75 = [obj countByEnumeratingWithState:&v82 objects:&v90 count:16];
      if (v75)
      {
        uint64_t v72 = *MEMORY[0x1E4F8A138];
        uint64_t v73 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v75; ++i)
          {
            if (*(void *)v83 != v73) {
              objc_enumerationMutation(obj);
            }
            dispatch_semaphore_t v22 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            context = (void *)MEMORY[0x1CB79D060]();
            v23 = pp_default_log_handle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = [v22 workoutActivityType];
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v24;
              _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: Workout Type %tu", (uint8_t *)&buf, 0xCu);
            }

            id v25 = v22;
            id v79 = v74;
            v26 = objc_opt_new();
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "workoutActivityType"));
            v28 = [v79 objectForKeyedSubscript:v27];

            uint64_t v29 = [v28 countByEnumeratingWithState:&v86 objects:&buf count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v87;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v87 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v86 + 1) + 8 * j);
                  if (v32)
                  {
                    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v32];
                    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v33 score:0.5];
                    [v26 addObject:v34];
                  }
                  else
                  {
                    uint64_t v33 = pp_default_log_handle();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v35 = [v25 workoutActivityType];
                      *(_DWORD *)v243 = 134217984;
                      *(void *)&v243[4] = v35;
                      _os_log_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: No unmapping found for workout activity type to QID: %tu", v243, 0xCu);
                    }
                  }
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v86 objects:&buf count:16];
              }
              while (v29);
            }

            id v36 = v25;
            id v37 = v26;
            v38 = [v36 workoutEvents];
            uint64_t v39 = v38;
            if (v38)
            {
              uint64_t v40 = [v38 lastObject];
              v41 = [v40 dateInterval];

              id v42 = objc_alloc(MEMORY[0x1E4F89F48]);
              [v41 duration];
              LODWORD(v44) = vcvtad_u64_f64(v43);
              v80 = (void *)[v42 initWithDwellTimeSeconds:0 lengthSeconds:v44 lengthCharacters:0 donationCount:1 contactHandleCount:0 flags:0];
              v78 = [v41 endDate];
            }
            else
            {
              v78 = 0;
              v80 = 0;
            }
            id v45 = objc_alloc(MEMORY[0x1E4F89F40]);
            v46 = [v36 UUID];
            v47 = [v46 UUIDString];
            if (v78)
            {
              v48 = (void *)[v45 initWithBundleId:v76 groupId:v72 documentId:v47 date:v78 relevanceDate:0 contactHandles:0 language:0 metadata:v80];
            }
            else
            {
              v49 = objc_opt_new();
              v48 = (void *)[v45 initWithBundleId:v76 groupId:v72 documentId:v47 date:v49 relevanceDate:0 contactHandles:0 language:0 metadata:v80];
            }
            v50 = +[PPLocalTopicStore defaultStore];
            *(void *)&long long v86 = 0;
            char v51 = [v50 donateTopics:v37 source:v48 algorithm:9 cloudSync:0 sentimentScore:0 exactMatchesInSourceText:&v86 error:0.0];

            id v52 = (id)v86;
            if (v51)
            {
              v53 = +[PPLocalTopicStore defaultStore];
              *(void *)v243 = 0;
              char v54 = [v53 flushDonationsWithError:v243];
              v55 = *(id *)v243;

              if ((v54 & 1) == 0)
              {
                v56 = pp_default_log_handle();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v55;
                  _os_log_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: HealthKitImporter: Warning: failed to flush: %@", (uint8_t *)&buf, 0xCu);
                }
              }
              v57 = pp_default_log_handle();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                uint64_t v58 = [v36 workoutActivityType];
                LODWORD(buf) = 134217984;
                *(void *)((char *)&buf + 4) = v58;
                _os_log_impl(&dword_1CA9A8000, v57, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: Donated topics for workout activity type: %tu", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              v55 = pp_default_log_handle();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v52;
                _os_log_error_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: Error donating topics %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          uint64_t v75 = [obj countByEnumeratingWithState:&v82 objects:&v90 count:16];
        }
        while (v75);
      }
    }
    if (v66)
    {
      uint64_t v59 = a1[4];
      id v60 = v66;
      if (v59)
      {
        v90 = 0;
        v91 = &v90;
        uint64_t v92 = 0x2020000000;
        LOBYTE(v93) = 0;
        v61 = *(void **)(v59 + 16);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v168 = __35__PPHealthKitImporter__saveAnchor___block_invoke;
        v169 = &unk_1E65DBB68;
        id v62 = v60;
        id v170 = v62;
        v171 = &v90;
        [v61 writeTransactionWithClient:6 block:&buf];
        LODWORD(v61) = *((unsigned char *)v91 + 24) == 0;

        _Block_object_dispose(&v90, 8);
        if (v61)
        {
          v63 = pp_default_log_handle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_INFO, "Portrait maintenance: HealthKitImporter: saved new anchor", (uint8_t *)&buf, 2u);
          }
          goto LABEL_73;
        }
      }
      else
      {
      }
    }
    v63 = pp_default_log_handle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: failed to save new anchor", (uint8_t *)&buf, 2u);
    }
LABEL_73:

    v12 = a1;
    goto LABEL_10;
  }
  id v11 = pp_default_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v70;
    _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: %@", (uint8_t *)&buf, 0xCu);
  }
LABEL_8:

LABEL_9:
  v12 = a1;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
LABEL_10:
  dispatch_semaphore_signal((dispatch_semaphore_t)v12[5]);
}

void __35__PPHealthKitImporter__saveAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v8];
  id v6 = v8;
  if (v5)
  {
    +[PPSQLKVStore storeBlob:v5 forKey:@"workoutQueryAnchorIdentifiers" transaction:v3];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: _workoutQueryAnchorIdentifiers: failed to serialize HKQueryAnchor: %@", buf, 0xCu);
    }
  }
}

id __46__PPHealthKitImporter__removeDeletedWorkouts___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

void __38__PPHealthKitImporter__getSavedAnchor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[PPSQLKVStore loadBlobForKey:@"workoutQueryAnchorIdentifiers" transaction:v3];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v6 = (void *)getHKQueryAnchorClass_softClass;
    uint64_t v17 = getHKQueryAnchorClass_softClass;
    if (!getHKQueryAnchorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v19 = __getHKQueryAnchorClass_block_invoke;
      v20 = &unk_1E65DC058;
      uint64_t v21 = &v14;
      __getHKQueryAnchorClass_block_invoke((uint64_t)&buf);
      id v6 = (void *)v15[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v14, 8);
    id v13 = 0;
    uint64_t v8 = [v5 unarchivedObjectOfClass:v7 fromData:v4 error:&v13];
    id v9 = v13;
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "Portrait maintenance: HealthKitImporter: _workoutQueryAnchorIdentifiers: failed to deserialize HKQueryAnchor: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

- (void)importHealthKitData
{
}

uint64_t __42__PPHealthKitImporter_importHealthKitData__block_invoke()
{
  return 1;
}

- (PPHealthKitImporter)initWithDatabase:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPHealthKitImporter;
  id v6 = [(PPHealthKitImporter *)&v12 init];
  if (v6)
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v7 = (void *)getHKHealthStoreClass_softClass_22733;
    uint64_t v17 = getHKHealthStoreClass_softClass_22733;
    if (!getHKHealthStoreClass_softClass_22733)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getHKHealthStoreClass_block_invoke_22734;
      v13[3] = &unk_1E65DC058;
      v13[4] = &v14;
      __getHKHealthStoreClass_block_invoke_22734((uint64_t)v13);
      id v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    uint64_t v9 = objc_opt_new();
    healthStore = v6->_healthStore;
    v6->_healthStore = (HKHealthStore *)v9;

    objc_storeStrong((id *)&v6->_db, a3);
  }

  return v6;
}

@end