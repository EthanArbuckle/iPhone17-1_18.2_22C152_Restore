@interface PPConnectionsDuetSource
+ (PPConnectionsDuetSource)sharedInstance;
+ (id)duetUserActivitiesFromStreams:(id)a3 limit:(unint64_t)a4 afterDate:(id)a5 explanationSet:(id)a6;
- (BOOL)isDuetEventAuthorized:(id)a3 bundleID:(id)a4;
- (BOOL)testMetadataForValidAddressAndNameWithEvent:(id)a3;
- (id)duetLocationUserActivitiesWithLimit:(unint64_t)a3 afterDate:(id)a4 explanationSet:(id)a5;
- (id)duetLocationUserActivitiesWithLimit:(unint64_t)a3 explanationSet:(id)a4;
- (id)identifier;
- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8;
- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 duetLimit:(int64_t)a7 consumer:(unint64_t)a8 richLocationItems:(BOOL)a9 resolveEKLocations:(BOOL)a10 explanationSet:(id)a11;
- (id)supportedLocationFields;
- (id)whitespaceAndNewlineCharacterSet;
@end

@implementation PPConnectionsDuetSource

- (id)identifier
{
  return @"duet";
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  LOWORD(v9) = 256;
  return -[PPConnectionsDuetSource locationItemsWithCriteria:earliest:latest:limit:duetLimit:consumer:richLocationItems:resolveEKLocations:explanationSet:](self, "locationItemsWithCriteria:earliest:latest:limit:duetLimit:consumer:richLocationItems:resolveEKLocations:explanationSet:", a3, a4, a5, a6, 10, a7, v9, a8);
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 duetLimit:(int64_t)a7 consumer:(unint64_t)a8 richLocationItems:(BOOL)a9 resolveEKLocations:(BOOL)a10 explanationSet:(id)a11
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v141 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a11;
  v18 = (void *)MEMORY[0x1CB79D060]();
  v19 = objc_opt_new();
  v145 = self;
  v146 = v17;
  v20 = [(PPConnectionsDuetSource *)self duetLocationUserActivitiesWithLimit:a7 afterDate:v15 explanationSet:v17];
  v21 = v20;
  if (!v20)
  {
    v25 = pp_connections_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v127 = "PPConnectionsDuetSource: duetLocationUserActivitiesWithLimit timed out";
      v128 = v25;
      uint32_t v129 = 2;
LABEL_105:
      _os_log_impl(&dword_1CA9A8000, v128, OS_LOG_TYPE_DEFAULT, v127, buf, v129);
    }
LABEL_106:
    id v126 = 0;
    goto LABEL_111;
  }
  if (![v20 count])
  {
    [v146 push:27];
    v25 = pp_connections_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v164 = (uint64_t)v15;
      v127 = "PPConnectionsDuetSource: no activities found in Duet after date %@";
      v128 = v25;
      uint32_t v129 = 12;
      goto LABEL_105;
    }
    goto LABEL_106;
  }
  v136 = v21;
  v22 = [(PPConnectionsDuetSource *)self supportedLocationFields];
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v141, "locationField"));
  char v24 = [v22 containsObject:v23];

  if (v24)
  {
    v137 = v19;
    v132 = v18;
    id v133 = v16;
    v25 = [v141 bundleIdentifier];
    id v134 = v15;
    id v26 = v15;
    v152 = objc_opt_new();
    v27 = pp_connections_log_handle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v164 = [v136 count];
      _os_log_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: got %tu activities from Duet", buf, 0xCu);
    }

    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id obj = v136;
    uint64_t v28 = [obj countByEnumeratingWithState:&v159 objects:v167 count:16];
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v158 = *(void *)v160;
      uint64_t v135 = *MEMORY[0x1E4F8A0E8];
      *(void *)&long long v29 = 138740227;
      long long v131 = v29;
      id v140 = v26;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v160 != v158) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v159 + 1) + 8 * v31);
          v33 = (void *)MEMORY[0x1CB79D060]();
          v34 = [v32 value];
          v35 = [v34 stringValue];

          v36 = pp_connections_log_handle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = [v32 startDate];
            *(_DWORD *)buf = 138412546;
            uint64_t v164 = (uint64_t)v35;
            __int16 v165 = 2112;
            v166 = v37;
            _os_log_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: processing activity from bundle %@ at time %@", buf, 0x16u);
          }
          if (v25 && [v35 isEqualToString:v25])
          {
            v38 = pp_connections_log_handle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v164 = (uint64_t)v25;
              v39 = v38;
              v40 = "PPConnectionsDuetSource: skipping activity since it came from the requesting bundle (%@)";
              uint32_t v41 = 12;
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          v42 = objc_msgSend(v32, "value", v131);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            v38 = pp_connections_log_handle();
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_25;
            }
            *(_WORD *)buf = 0;
            v39 = v38;
            v40 = "PPConnectionsDuetSource: skipping activity since the value is not a _DKIdentifier";
            goto LABEL_23;
          }
          if ([v35 isEqualToString:@"unknown"])
          {
            v38 = pp_connections_log_handle();
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_25;
            }
LABEL_20:
            *(_WORD *)buf = 0;
            v39 = v38;
            v40 = "PPConnectionsDuetSource: skipping activity since the bundleId is unknown";
LABEL_23:
            uint32_t v41 = 2;
LABEL_24:
            _os_log_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, v41);
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          v44 = [v32 startDate];
          uint64_t v45 = [v44 compare:v26];

          if (v45 == -1)
          {
            v48 = pp_connections_log_handle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v48, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: skipping activity since it is before the cutoff time", buf, 2u);
            }

            [v146 push:5];
            goto LABEL_26;
          }
          v46 = [v32 startDate];
          uint64_t v47 = [v46 compare:v152];

          if (v47 == 1)
          {
            v38 = pp_connections_log_handle();
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_25;
            }
            goto LABEL_20;
          }
          v49 = [v32 metadata];
          v50 = [MEMORY[0x1E4F5B4A8] activityType];
          v155 = [v49 objectForKeyedSubscript:v50];

          v51 = [v32 metadata];
          v52 = [MEMORY[0x1E4F5B570] locationName];
          v156 = [v51 objectForKeyedSubscript:v52];

          v53 = [v32 metadata];
          v54 = [MEMORY[0x1E4F5B570] fullyFormattedAddress];
          v154 = [v53 objectForKeyedSubscript:v54];

          v55 = [v32 metadata];
          v56 = [MEMORY[0x1E4F5B570] thoroughfare];
          v153 = [v55 objectForKeyedSubscript:v56];

          BOOL v151 = [(PPConnectionsDuetSource *)v145 testMetadataForValidAddressAndNameWithEvent:v32];
          if (a10)
          {
            v57 = +[PPConnectionsUtils calendarUserActivityIdentifier];
            int v58 = [v155 isEqualToString:v57];

            if (v58)
            {
              if (v156)
              {
                v59 = +[PPConnectionsCalendarSource sharedInstance];
                v60 = [v32 metadata];
                v61 = +[PPConnectionsUtils calendarUserActivityExternalIDKey];
                v62 = [v60 objectForKeyedSubscript:v61];
                v144 = v59;
                uint64_t v63 = [v59 ekEventWithExternalID:v62];

                v64 = (void *)v63;
                if (!v63)
                {
                  v79 = pp_connections_log_handle();
                  id v26 = v140;
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1CA9A8000, v79, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: skipping activity since the calendar event could not be loaded", buf, 2u);
                  }

                  int v80 = 3;
                  goto LABEL_92;
                }
                id v65 = objc_alloc(MEMORY[0x1E4F89E00]);
                v66 = objc_opt_new();
                v67 = (void *)[v65 initWithEKEvent:v63 calendarInternPool:v66];

                if (!v67)
                {
                  v81 = pp_connections_log_handle();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    v82 = v81;
                    v83 = "PPConnectionsDuetSource: skipping activity since PPEvent conversion failed.";
                    goto LABEL_62;
                  }
LABEL_63:

                  int v80 = 3;
                  id v26 = v140;
                  v78 = v144;
                  goto LABEL_93;
                }
                if (([v144 isCalendarEventEligibleForLocationPrediction:v67] & 1) == 0)
                {
                  v81 = pp_connections_log_handle();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    v82 = v81;
                    v83 = "PPConnectionsDuetSource: skipping activity since the calendar event is not eligible for prediction";
LABEL_62:
                    _os_log_impl(&dword_1CA9A8000, v82, OS_LOG_TYPE_DEFAULT, v83, buf, 2u);
                  }
                  goto LABEL_63;
                }
                id v138 = +[PPConnectionsCalendarSource locationNameFromEvent:v67];
                v148 = +[PPConnectionsCalendarSource locationLabelFromEvent:v67];
                v68 = +[PPConnectionsCalendarSource locationValueFromEvent:v67];

                context = 0;
                v147 = 0;
                v69 = v64;
                id v26 = v140;
LABEL_73:

                v78 = v138;
                v88 = v144;
                goto LABEL_74;
              }
            }
          }
          if (v151
            && [(PPConnectionsDuetSource *)v145 isDuetEventAuthorized:v32 bundleID:v35])
          {
            v144 = +[PPConnectionsAddressFormatter postalAddressFromDuetEvent:v32];
            PPCollapseWhitespaceAndStrip();
            id v138 = (id)objc_claimAutoreleasedReturnValue();
            if ([v141 locationField] != 1) {
              goto LABEL_66;
            }
            if (!v154) {
              goto LABEL_66;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_66;
            }
            v70 = (void *)MEMORY[0x1CB79D060]();
            v71 = [(PPConnectionsDuetSource *)v145 whitespaceAndNewlineCharacterSet];
            v72 = [v154 stringByTrimmingCharactersInSet:v71];

            if ([v72 length])
            {
              if (v153)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  contexta = (void *)MEMORY[0x1CB79D060]();
                  v73 = [(PPConnectionsDuetSource *)v145 whitespaceAndNewlineCharacterSet];
                  v74 = [v153 stringByTrimmingCharactersInSet:v73];

                  if ([v74 length])
                  {
                    int v75 = [v154 containsString:v153];

                    if (v75)
                    {
                      uint64_t v142 = PPCollapseWhitespaceAndStrip();
                      unint64_t v76 = 0x1E65D2000;
                      v77 = v144;
LABEL_67:
                      context = objc_msgSend(*(id *)(v76 + 3336), "formattedAddressWithLocationField:address:duetEvent:shortStyle:", objc_msgSend(v141, "locationField"), v77, v32, 1);
                      if ([v35 isEqualToString:v135])
                      {
                        v84 = [v32 metadata];
                        v85 = [MEMORY[0x1E4F5B570] URL];
                        v86 = [v84 objectForKeyedSubscript:v85];
                        uint64_t v87 = PPCollapseWhitespaceAndStrip();

                        if (v87)
                        {
                          v147 = [MEMORY[0x1E4F1CB10] URLWithString:v87];
                        }
                        else
                        {
                          v147 = 0;
                        }
                        v148 = v138;
                        v69 = (void *)v87;
                        id v26 = v140;
                        v68 = (void *)v142;
                        goto LABEL_73;
                      }
                      v88 = v77;
                      v78 = v138;
                      v147 = 0;
                      v148 = v138;
                      id v26 = v140;
                      v68 = (void *)v142;
LABEL_74:

                      goto LABEL_75;
                    }
LABEL_66:
                    unint64_t v76 = 0x1E65D2000uLL;
                    v77 = v144;
                    uint64_t v142 = +[PPConnectionsAddressFormatter formattedAddressWithLocationField:address:duetEvent:shortStyle:](PPConnectionsAddressFormatter, "formattedAddressWithLocationField:address:duetEvent:shortStyle:", [v141 locationField], v144, v32, 0);
                    goto LABEL_67;
                  }
                }
              }
            }

            goto LABEL_66;
          }
          v78 = 0;
          v148 = 0;
          context = 0;
          v68 = 0;
          v147 = 0;
LABEL_75:
          if ([v68 length])
          {
            v143 = v68;
            if ([v78 length])
            {
              v89 = (void *)[objc_alloc(MEMORY[0x1E4F89DC0]) initWithOriginatingBundleID:v35];
              v144 = v78;
              [v89 setName:v78];
              if (v148)
              {
                objc_msgSend(v89, "setLabel:");
              }
              else
              {
                v93 = [v89 name];
                [v89 setLabel:v93];
              }
              [v89 setValue:v143];
              [v89 setShortValue:context];
              [v89 setOriginatingWebsiteURL:v147];
              [v89 setShouldAggregate:0];
              v94 = [v32 startDate];
              [v89 setCreatedAt:v94];

              v95 = +[PPConnectionsMetricsTracker donationSourceFromBundleID:v35];
              [v89 setSource:v95];

              v96 = NSNumber;
              v97 = +[PPConnectionsParameters sharedInstance];
              [v97 userActivityExpirySeconds];
              v98 = objc_msgSend(v96, "numberWithDouble:");
              [v89 setLifetime:v98];

              if (a9 && v151)
              {
                [v89 setFullFormattedAddress:v154];
                v99 = [v32 metadata];
                v100 = [MEMORY[0x1E4F5B570] subThoroughfare];
                v101 = [v99 objectForKeyedSubscript:v100];
                [v89 setSubThoroughfare:v101];

                [v89 setThoroughfare:v153];
                v102 = [v32 metadata];
                v103 = [MEMORY[0x1E4F5B570] postalCode];
                v104 = [v102 objectForKeyedSubscript:v103];
                [v89 setPostalCode:v104];

                v105 = [v32 metadata];
                v106 = [MEMORY[0x1E4F5B570] city];
                v107 = [v105 objectForKeyedSubscript:v106];
                [v89 setLocality:v107];

                v108 = [v32 metadata];
                v109 = [MEMORY[0x1E4F5B570] stateOrProvince];
                v110 = [v108 objectForKeyedSubscript:v109];
                [v89 setAdministrativeArea:v110];

                v111 = [v32 metadata];
                v112 = [MEMORY[0x1E4F5B570] country];
                v113 = [v111 objectForKeyedSubscript:v112];
                [v89 setCountry:v113];

                v114 = [v32 metadata];
                v115 = [MEMORY[0x1E4F5B570] latitude];
                v116 = [v114 objectForKeyedSubscript:v115];
                [v89 setLatitude:v116];

                v117 = [v32 metadata];
                v118 = [MEMORY[0x1E4F5B570] longitude];
                v119 = [v117 objectForKeyedSubscript:v118];
                [v89 setLongitude:v119];
              }
              v120 = pp_connections_log_handle();
              if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
              {
                v122 = [v89 name];
                v123 = [v89 value];
                *(_DWORD *)buf = v131;
                uint64_t v164 = (uint64_t)v122;
                __int16 v165 = 2117;
                v166 = v123;
                _os_log_debug_impl(&dword_1CA9A8000, v120, OS_LOG_TYPE_DEBUG, "PPConnectionsDuetSource: sourced connection: %{sensitive}@: %{sensitive}@", buf, 0x16u);
              }
              [v137 addObject:v89];
              BOOL v121 = [v137 count] == a6;

              int v80 = 2 * v121;
              id v26 = v140;
LABEL_92:
              v78 = v144;
              goto LABEL_93;
            }
            v92 = pp_connections_log_handle();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v92, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: ignoring location from Duet due to missing name", buf, 2u);
            }
          }
          else
          {
            v90 = v68;
            v91 = pp_connections_log_handle();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA9A8000, v91, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: ignoring location from Duet due to missing value", buf, 2u);
            }
          }
          int v80 = 3;
LABEL_93:

          if (v80 != 3 && v80) {
            goto LABEL_97;
          }
LABEL_27:
          ++v31;
        }
        while (v30 != v31);
        uint64_t v124 = [obj countByEnumeratingWithState:&v159 objects:v167 count:16];
        uint64_t v30 = v124;
      }
      while (v124);
    }
LABEL_97:

    v19 = v137;
    if ([v137 count]) {
      v125 = v137;
    }
    else {
      v125 = 0;
    }
    id v126 = v125;

    id v16 = v133;
    id v15 = v134;
    v18 = v132;
  }
  else
  {
    v25 = pp_connections_log_handle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v164) = [v141 locationField];
      _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPConnectionsDuetSource: supportedLocationFields does not contain field %d", buf, 8u);
    }
    id v126 = 0;
  }
  v21 = v136;
LABEL_111:

  return v126;
}

- (id)duetLocationUserActivitiesWithLimit:(unint64_t)a3 afterDate:(id)a4 explanationSet:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F5B5F8];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 appLocationActivityStream];
  v17[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v12 = +[PPConnectionsParameters sharedInstance];
  unint64_t v13 = [v12 userActivityBatchSize];

  if (v13 <= a3) {
    unint64_t v14 = a3;
  }
  else {
    unint64_t v14 = v13;
  }
  id v15 = +[PPConnectionsDuetSource duetUserActivitiesFromStreams:v11 limit:v14 afterDate:v9 explanationSet:v8];

  return v15;
}

+ (id)duetUserActivitiesFromStreams:(id)a3 limit:(unint64_t)a4 afterDate:(id)a5 explanationSet:(id)a6
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v26 = a6;
  context = (void *)MEMORY[0x1CB79D060]();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = [MEMORY[0x1E4F5B518] predicateForEventsWithStartDateAfter:v11];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  unint64_t v13 = (void *)v12;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__19302;
  uint32_t v41 = __Block_byref_object_dispose__19303;
  id v42 = (id)MEMORY[0x1E4F1CBF0];
  sel_getName(a2);
  unint64_t v14 = (void *)os_transaction_create();
  id v15 = (void *)MEMORY[0x1E4F5B518];
  id v16 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
  v43[0] = v16;
  id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"structuredMetadata._DKApplicationActivityMetadataKey__expirationDate" ascending:0];
  v43[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v19 = [v15 eventQueryWithPredicate:v13 eventStreams:v10 offset:0 limit:a4 sortDescriptors:v18];

  v20 = [MEMORY[0x1E4F5B518] allDevices];
  [v19 setDeviceIDs:v20];

  v21 = [MEMORY[0x1E4F5B560] knowledgeStore];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__19302;
  v35 = __Block_byref_object_dispose__19303;
  dispatch_semaphore_t v36 = 0;
  dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__PPConnectionsDuetSource_duetUserActivitiesFromStreams_limit_afterDate_explanationSet___block_invoke;
  v27[3] = &unk_1E65D9A88;
  long long v29 = &v37;
  uint64_t v30 = &v31;
  id v22 = v14;
  id v28 = v22;
  [v21 executeQuery:v19 responseQueue:0 withCompletion:v27];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v32[5] timeoutSeconds:60.0])
  {
    [v26 push:28];
    id v23 = 0;
  }
  else
  {
    id v23 = (id)v38[5];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

void __88__PPConnectionsDuetSource_duetUserActivitiesFromStreams_limit_afterDate_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = pp_connections_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138739971;
    id v11 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPConnectionsDuetSource: duet query results: %{sensitive}@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v5;
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  if (v6) {
    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", @"CD", [v6 code]);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v9 = self;
}

- (id)whitespaceAndNewlineCharacterSet
{
  if (whitespaceAndNewlineCharacterSet__pasOnceToken35 != -1) {
    dispatch_once(&whitespaceAndNewlineCharacterSet__pasOnceToken35, &__block_literal_global_64_19237);
  }
  v2 = (void *)whitespaceAndNewlineCharacterSet__pasExprOnceResult;
  return v2;
}

void __59__PPConnectionsDuetSource_whitespaceAndNewlineCharacterSet__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v2 = (void *)whitespaceAndNewlineCharacterSet__pasExprOnceResult;
  whitespaceAndNewlineCharacterSet__pasExprOnceResult = v1;
}

- (id)duetLocationUserActivitiesWithLimit:(unint64_t)a3 explanationSet:(id)a4
{
  return [(PPConnectionsDuetSource *)self duetLocationUserActivitiesWithLimit:a3 afterDate:0 explanationSet:a4];
}

- (BOOL)isDuetEventAuthorized:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F8A0E8]];
  id v8 = (void *)MEMORY[0x1CB79D060]();
  if (v7)
  {
    id v9 = [v5 metadata];
    int v10 = [MEMORY[0x1E4F5B570] URL];
    id v11 = [v9 objectForKeyedSubscript:v10];
    uint64_t v12 = PPCollapseWhitespaceAndStrip();

    unint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    unint64_t v14 = [v13 host];
    id v15 = [v14 lowercaseString];

    id v16 = +[PPConnectionsParameters sharedInstance];
    LODWORD(v14) = [v16 shouldUseAllowedWebsite];

    if (v14)
    {
      if (!v15
        || (+[PPConnectionsParameters sharedInstance],
            id v17 = objc_claimAutoreleasedReturnValue(),
            [v17 donationAllowedWebsites],
            v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 containsObject:v15],
            v18,
            v17,
            (v19 & 1) == 0))
      {
        v20 = pp_connections_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v41 = 0;
          v21 = "PPConnectionsDuetSource: website not allowed";
          id v22 = (uint8_t *)&v41;
LABEL_16:
          _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (v15)
    {
      uint64_t v30 = +[PPConnectionsParameters sharedInstance];
      uint64_t v31 = [v30 donationBlockedWebsites];
      int v32 = [v31 containsObject:v15];

      if (v32)
      {
        v20 = pp_connections_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v21 = "PPConnectionsDuetSource: website is blocked";
          id v22 = buf;
          goto LABEL_16;
        }
LABEL_17:

        goto LABEL_23;
      }
    }

LABEL_25:
    BOOL v36 = 1;
    goto LABEL_26;
  }
  uint64_t v12 = [v6 lowercaseString];
  id v23 = +[PPConnectionsParameters sharedInstance];
  int v24 = [v23 shouldUseAllowedApps];

  if (!v24)
  {
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v33 = +[PPConnectionsParameters sharedInstance];
    v34 = [v33 donationBlockedApps];
    int v35 = [v34 containsObject:v12];

    if (!v35) {
      goto LABEL_25;
    }
    id v15 = pp_connections_log_handle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v38 = 0;
    id v28 = "PPConnectionsDuetSource: app is blocked";
    long long v29 = (uint8_t *)&v38;
LABEL_22:
    _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, v28, v29, 2u);
    goto LABEL_23;
  }
  if (v6)
  {
    v25 = +[PPConnectionsParameters sharedInstance];
    id v26 = [v25 donationAllowedApps];
    char v27 = [v26 containsObject:v12];

    if (v27) {
      goto LABEL_25;
    }
  }
  id v15 = pp_connections_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v39 = 0;
    id v28 = "PPConnectionsDuetSource: app is not allowed";
    long long v29 = (uint8_t *)&v39;
    goto LABEL_22;
  }
LABEL_23:

  BOOL v36 = 0;
LABEL_26:

  return v36;
}

- (BOOL)testMetadataForValidAddressAndNameWithEvent:(id)a3
{
  id v8 = a3;
  id v9 = [v8 metadata];
  id v167 = [MEMORY[0x1E4F5B570] thoroughfare];
  id v168 = v9;
  int v10 = objc_msgSend(v9, "objectForKeyedSubscript:");
  if (!v10) {
    goto LABEL_8;
  }
  id v11 = [v8 metadata];
  v157 = [MEMORY[0x1E4F5B570] thoroughfare];
  uint64_t v158 = v11;
  uint64_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:");
  objc_opt_class();
  v156 = (void *)v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    uint64_t v166 = 0;
    int v165 = 0;
    memset(v164, 0, 29);
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    goto LABEL_9;
  }
  uint64_t v3 = MEMORY[0x1CB79D060]();
  uint64_t v4 = [v8 metadata];
  id v5 = [MEMORY[0x1E4F5B570] thoroughfare];
  unint64_t v13 = [(id)v4 objectForKeyedSubscript:v5];
  uint64_t v6 = [(PPConnectionsDuetSource *)self whitespaceAndNewlineCharacterSet];
  unint64_t v14 = [v13 stringByTrimmingCharactersInSet:v6];

  id v15 = v14;

  v153 = v15;
  if (![v15 length])
  {
    uint64_t v166 = 0;
    v164[28] = 0;
    int v165 = 0;
    memset(v164, 0, 24);
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    *(_DWORD *)&v164[24] = 1;
    goto LABEL_9;
  }
  id v16 = [v8 metadata];
  [MEMORY[0x1E4F5B570] city];
  BOOL v151 = v152 = v16;
  uint64_t v17 = objc_msgSend(v16, "objectForKeyedSubscript:");
  HIDWORD(v166) = v17 != 0;
  v150 = (void *)v17;
  if (v17)
  {
    v18 = [v8 metadata];
    [MEMORY[0x1E4F5B570] city];
    v146 = v147 = v18;
    uint64_t v19 = objc_msgSend(v18, "objectForKeyedSubscript:");
    uint64_t v3 = 0x1E4F29000uLL;
    objc_opt_class();
    v145 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_82;
    }
    v20 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v3 = [v8 metadata];
    uint64_t v4 = [MEMORY[0x1E4F5B570] city];
    id v5 = [(id)v3 objectForKeyedSubscript:v4];
    v21 = [(PPConnectionsDuetSource *)self whitespaceAndNewlineCharacterSet];
    id v22 = [v5 stringByTrimmingCharactersInSet:v21];

    id v23 = v22;

    v139 = v23;
    uint64_t v6 = 1;
    if ([v23 length])
    {
      uint64_t v4 = 0;
      goto LABEL_86;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v3 = 0x1E4F29000;
LABEL_82:
  uint64_t v30 = [v8 metadata];
  [MEMORY[0x1E4F5B570] postalCode];
  v148 = v149 = v30;
  uint64_t v31 = objc_msgSend(v30, "objectForKeyedSubscript:");
  if (!v31)
  {
    LODWORD(v166) = v6;
    v155 = 0;
    memset(v164, 0, 20);
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    v164[28] = 0;
    *(void *)&v164[20] = 0x100000001;
    int v165 = 1;
    goto LABEL_9;
  }
  v155 = (void *)v31;
  int v32 = [v8 metadata];
  [MEMORY[0x1E4F5B570] postalCode];
  v143 = v144 = v32;
  uint64_t v33 = objc_msgSend(v32, "objectForKeyedSubscript:");
  objc_opt_class();
  uint64_t v142 = (void *)v33;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LODWORD(v166) = v6;
    *(void *)&v164[8] = 0;
    *(void *)uint64_t v164 = 0;
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    v164[28] = 0;
    *(void *)&v164[20] = 0x100000001;
    int v165 = 1;
    *(_DWORD *)&v164[16] = 1;
    goto LABEL_9;
  }
  v34 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v3 = [v8 metadata];
  uint64_t v4 = [MEMORY[0x1E4F5B570] postalCode];
  id v5 = [(id)v3 objectForKeyedSubscript:v4];
  int v35 = [(PPConnectionsDuetSource *)self whitespaceAndNewlineCharacterSet];
  BOOL v36 = [v5 stringByTrimmingCharactersInSet:v35];

  id v37 = v36;

  id v138 = v37;
  if (![v37 length])
  {
    v164[28] = 0;
    *(void *)&v164[4] = 0;
    *(_DWORD *)uint64_t v164 = 0;
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    *(_DWORD *)&v164[16] = 1;
    *(void *)&v164[20] = 0x100000001;
    int v165 = 1;
    LODWORD(v166) = v6;
    *(_DWORD *)&v164[12] = 1;
    goto LABEL_9;
  }
  uint64_t v4 = 1;
LABEL_86:
  __int16 v38 = [v8 metadata];
  uint64_t v39 = [MEMORY[0x1E4F5B570] thoroughfare];
  uint64_t v40 = [v38 objectForKeyedSubscript:v39];
  int v165 = v4;
  LODWORD(v166) = v6;
  id v141 = v38;
  id v140 = (void *)v39;
  if (!v40)
  {
    v154 = 0;
    *(void *)uint64_t v164 = 0;
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    v164[28] = 0;
    *(_DWORD *)&v164[16] = v4;
    *(void *)&v164[20] = 0x100000001;
    *(_DWORD *)&v164[12] = v4;
    *(_DWORD *)&v164[8] = 1;
    goto LABEL_9;
  }
  v154 = (void *)v40;
  uint64_t v3 = [v8 metadata];
  v136 = [MEMORY[0x1E4F5B570] thoroughfare];
  id v5 = objc_msgSend((id)v3, "objectForKeyedSubscript:");
  objc_opt_class();
  uint64_t v135 = v5;
  v137 = (void *)v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v24 = 0;
    uint64_t v162 = 0;
    memset(v163, 0, sizeof(v163));
    int v25 = 0;
    uint64_t v161 = 0;
    long long v169 = 0uLL;
    memset(v160, 0, sizeof(v160));
    int v26 = 0;
    uint64_t v159 = 0;
    int v27 = 0;
    int v28 = 0;
    v164[28] = 0;
    *(_DWORD *)&v164[16] = v4;
    *(void *)&v164[20] = 0x100000001;
    *(_DWORD *)&v164[8] = 1;
    *(_DWORD *)&v164[12] = v4;
    *(void *)uint64_t v164 = 1;
    goto LABEL_9;
  }
  __int16 v41 = [v8 metadata];
  id v133 = [MEMORY[0x1E4F5B570] locationName];
  uint64_t v42 = objc_msgSend(v41, "objectForKeyedSubscript:");
  BOOL v66 = v42 != 0;
  v132 = (void *)v42;
  id v134 = v41;
  if (v42)
  {
    v43 = [v8 metadata];
    [MEMORY[0x1E4F5B570] locationName];
    v130 = long long v131 = v43;
    id v5 = objc_msgSend(v43, "objectForKeyedSubscript:");
    objc_opt_class();
    uint32_t v129 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v162 = 0;
      memset(v163, 0, sizeof(v163));
      int v25 = 0;
      uint64_t v161 = 0;
      long long v169 = 0uLL;
      memset(v160, 0, sizeof(v160));
      int v26 = 0;
      uint64_t v159 = 0;
      int v27 = 0;
      int v28 = 0;
      *(void *)&v164[24] = 1;
      *(_DWORD *)&v164[16] = v4;
      *(_DWORD *)&v164[20] = 1;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = 1;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    BOOL v121 = [MEMORY[0x1E4F5B570] locationName];
    v122 = v5;
    v120 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v120 length] > 0x12B)
    {
      *(void *)&v163[4] = 0;
      int v25 = 0;
      uint64_t v161 = 0;
      long long v169 = 0uLL;
      memset(v160, 0, sizeof(v160));
      int v26 = 0;
      uint64_t v159 = 0;
      uint64_t v162 = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = 1;
      *(_DWORD *)v163 = 1;
      goto LABEL_9;
    }
  }
  v44 = [v8 metadata];
  v127 = [MEMORY[0x1E4F5B570] subThoroughfare];
  v128 = v44;
  uint64_t v45 = objc_msgSend(v44, "objectForKeyedSubscript:");
  BOOL v65 = v45 != 0;
  id v126 = (void *)v45;
  if (v45)
  {
    v46 = [v8 metadata];
    uint64_t v124 = [MEMORY[0x1E4F5B570] subThoroughfare];
    v125 = v46;
    id v5 = objc_msgSend(v46, "objectForKeyedSubscript:");
    objc_opt_class();
    v123 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v161 = 0;
      long long v169 = 0uLL;
      memset(v160, 0, sizeof(v160));
      int v26 = 0;
      uint64_t v159 = 0;
      uint64_t v162 = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = 1;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    v112 = [MEMORY[0x1E4F5B570] subThoroughfare];
    v113 = v5;
    v111 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v111 length] > 0x12B)
    {
      uint64_t v161 = 0;
      uint64_t v162 = 0;
      long long v169 = 0uLL;
      *(void *)long long v160 = 0;
      *(void *)&v160[8] = 0;
      int v26 = 0;
      uint64_t v159 = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = 1;
      *(_DWORD *)&v160[16] = 1;
      goto LABEL_9;
    }
  }
  uint64_t v47 = [v8 metadata];
  v118 = [MEMORY[0x1E4F5B570] thoroughfare];
  v119 = v47;
  uint64_t v48 = objc_msgSend(v47, "objectForKeyedSubscript:");
  HIDWORD(v169) = v48 != 0;
  v117 = (void *)v48;
  if (v48)
  {
    v49 = [v8 metadata];
    v115 = [MEMORY[0x1E4F5B570] thoroughfare];
    v116 = v49;
    id v5 = objc_msgSend(v49, "objectForKeyedSubscript:");
    objc_opt_class();
    v114 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(void *)long long v160 = 0;
      *(void *)&v160[8] = 0;
      int v26 = 0;
      uint64_t v159 = 0;
      *(void *)((char *)&v169 + 4) = 0;
      uint64_t v161 = 0x100000000;
      uint64_t v162 = 0;
      LODWORD(v169) = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      HIDWORD(v169) = 1;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    v103 = [MEMORY[0x1E4F5B570] thoroughfare];
    v104 = v5;
    v102 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v102 length] > 0x12B)
    {
      *(void *)&v160[8] = 0;
      int v26 = 0;
      uint64_t v159 = 0;
      *(void *)((char *)&v169 + 4) = 0;
      uint64_t v161 = 0x100000000;
      uint64_t v162 = 0;
      LODWORD(v169) = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      HIDWORD(v169) = 1;
      *(void *)long long v160 = 1;
      goto LABEL_9;
    }
  }
  v50 = [v8 metadata];
  v109 = [MEMORY[0x1E4F5B570] postalCode];
  v110 = v50;
  uint64_t v51 = objc_msgSend(v50, "objectForKeyedSubscript:");
  BOOL v64 = v51 != 0;
  v108 = (void *)v51;
  if (v51)
  {
    v52 = [v8 metadata];
    v106 = [MEMORY[0x1E4F5B570] postalCode];
    v107 = v52;
    id v5 = objc_msgSend(v52, "objectForKeyedSubscript:");
    objc_opt_class();
    v105 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v159 = 0;
      *(void *)&v160[4] = 0;
      *(void *)((char *)&v169 + 4) = 0;
      uint64_t v161 = 0x100000000;
      uint64_t v162 = 0;
      LODWORD(v169) = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      int v26 = 1;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    v94 = [MEMORY[0x1E4F5B570] postalCode];
    v95 = v5;
    v93 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v93 length] > 0x12B)
    {
      *(void *)&v160[4] = 0;
      *(void *)((char *)&v169 + 4) = 0;
      uint64_t v161 = 0x100000000;
      uint64_t v162 = 0;
      LODWORD(v169) = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      int v26 = 1;
      uint64_t v159 = 1;
      goto LABEL_9;
    }
  }
  v53 = [v8 metadata];
  v100 = [MEMORY[0x1E4F5B570] city];
  v101 = v53;
  uint64_t v54 = objc_msgSend(v53, "objectForKeyedSubscript:");
  DWORD2(v169) = v54 != 0;
  v99 = (void *)v54;
  if (v54)
  {
    v55 = [v8 metadata];
    v97 = [MEMORY[0x1E4F5B570] city];
    v98 = v55;
    id v5 = objc_msgSend(v55, "objectForKeyedSubscript:");
    objc_opt_class();
    v96 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v161 = 0x100000000;
      *(void *)&long long v169 = 0;
      *(void *)&v160[8] = 0x100000000;
      uint64_t v162 = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      int v26 = v64;
      uint64_t v159 = v64;
      *(_DWORD *)&v160[4] = 1;
      DWORD2(v169) = 1;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    v85 = [MEMORY[0x1E4F5B570] city];
    v86 = v5;
    v84 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v84 length] > 0x12B)
    {
      uint64_t v161 = 0x100000000;
      *(void *)&long long v169 = 0;
      *(void *)&v160[8] = 0x100000000;
      uint64_t v162 = 0;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      int v26 = v64;
      uint64_t v159 = v64 | 0x100000000;
      *(_DWORD *)&v160[4] = 1;
      DWORD2(v169) = 1;
      goto LABEL_9;
    }
  }
  v56 = [v8 metadata];
  v91 = [MEMORY[0x1E4F5B570] stateOrProvince];
  v92 = v56;
  uint64_t v57 = objc_msgSend(v56, "objectForKeyedSubscript:");
  DWORD1(v169) = v57 != 0;
  v90 = (void *)v57;
  if (v57)
  {
    int v58 = [v8 metadata];
    v88 = [MEMORY[0x1E4F5B570] stateOrProvince];
    v89 = v58;
    id v5 = objc_msgSend(v58, "objectForKeyedSubscript:");
    objc_opt_class();
    uint64_t v87 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(void *)&v160[8] = 0x100000000;
      uint64_t v162 = 0;
      *(void *)&long long v169 = 0x100000000;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      int v26 = v64;
      uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
      *(_DWORD *)&v160[4] = 1;
      uint64_t v161 = 0x100000001;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    int v75 = [MEMORY[0x1E4F5B570] stateOrProvince];
    unint64_t v76 = v5;
    v74 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v74 length] > 0x12B)
    {
      uint64_t v162 = 0;
      *(void *)&long long v169 = 0x100000000;
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      int v26 = v64;
      uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
      uint64_t v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(void *)&v160[8] = 0x100000001;
      goto LABEL_9;
    }
  }
  id v5 = [v8 metadata];
  v82 = [MEMORY[0x1E4F5B570] country];
  v83 = v5;
  uint64_t v59 = objc_msgSend(v5, "objectForKeyedSubscript:");
  LODWORD(v169) = v59 != 0;
  v81 = (void *)v59;
  if (v59)
  {
    v60 = [v8 metadata];
    v78 = [MEMORY[0x1E4F5B570] country];
    v79 = v60;
    id v5 = objc_msgSend(v60, "objectForKeyedSubscript:");
    objc_opt_class();
    v77 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      int v26 = v64;
      uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
      uint64_t v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      uint64_t v162 = 1;
      LODWORD(v169) = 1;
      goto LABEL_9;
    }
    id v5 = [v8 metadata];
    v68 = [MEMORY[0x1E4F5B570] country];
    v69 = v5;
    v67 = objc_msgSend(v5, "objectForKeyedSubscript:");
    if ((unint64_t)[v67 length] > 0x12B)
    {
      int v27 = 0;
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(_DWORD *)&v163[8] = 0;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      int v26 = v64;
      uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
      uint64_t v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      uint64_t v162 = 0x100000001;
      LODWORD(v169) = 1;
      goto LABEL_9;
    }
  }
  v61 = [v8 metadata];
  v72 = [MEMORY[0x1E4F5B570] displayName];
  int v80 = objc_msgSend(v61, "objectForKeyedSubscript:");
  v73 = v61;
  if (v80)
  {
    v62 = [v8 metadata];
    v70 = [MEMORY[0x1E4F5B570] displayName];
    v71 = v62;
    uint64_t v3 = objc_msgSend(v62, "objectForKeyedSubscript:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 metadata];
      v4 = int v63 = v4;
      uint64_t v6 = [MEMORY[0x1E4F5B570] displayName];
      id v5 = [(id)v4 objectForKeyedSubscript:v6];
      v164[28] = (unint64_t)[v5 length] < 0x12C;
      *(_DWORD *)&v164[16] = v63;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v63;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)&v160[12] = 1;
      int v26 = v64;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      *(_DWORD *)&v160[4] = 1;
      uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
      uint64_t v161 = 0x100000001;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      LODWORD(v162) = 1;
      HIDWORD(v162) = v169;
      int v28 = 1;
    }
    else
    {
      int v28 = 0;
      v164[28] = 0;
      *(_DWORD *)&v164[16] = v4;
      *(void *)&v164[20] = 0x100000001;
      *(_DWORD *)&v164[8] = 1;
      *(_DWORD *)&v164[12] = v4;
      *(void *)uint64_t v164 = 0x100000001;
      int v24 = v66;
      *(_DWORD *)v163 = v66;
      *(_DWORD *)&v163[4] = 1;
      int v25 = v65;
      *(_DWORD *)&v160[16] = v65;
      *(_DWORD *)long long v160 = HIDWORD(v169);
      *(_DWORD *)&v160[12] = 1;
      int v26 = v64;
      uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
      uint64_t v161 = 0x100000001;
      *(_DWORD *)&v160[4] = 1;
      *(_DWORD *)&v160[8] = DWORD1(v169);
      LODWORD(v162) = 1;
      HIDWORD(v162) = v169;
    }
    *(_DWORD *)&v163[8] = 1;
    int v27 = 1;
  }
  else
  {
    int v80 = 0;
    int v27 = 0;
    int v28 = 0;
    *(void *)&v164[20] = 0x100000001;
    *(_DWORD *)&v164[12] = v4;
    *(_DWORD *)&v164[16] = v4;
    *(_DWORD *)&v164[8] = 1;
    *(void *)uint64_t v164 = 0x100000001;
    int v24 = v66;
    *(_DWORD *)v163 = v66;
    *(_DWORD *)&v163[4] = 1;
    int v25 = v65;
    *(_DWORD *)&v160[16] = v65;
    *(_DWORD *)long long v160 = HIDWORD(v169);
    *(_DWORD *)&v160[12] = 1;
    int v26 = v64;
    uint64_t v159 = __PAIR64__(DWORD2(v169), v64);
    uint64_t v161 = 0x100000001;
    *(_DWORD *)&v160[4] = 1;
    *(_DWORD *)&v160[8] = DWORD1(v169);
    LODWORD(v162) = 1;
    HIDWORD(v162) = v169;
    *(_DWORD *)&v163[8] = 1;
    v164[28] = 1;
  }
LABEL_9:
  if (v28)
  {
  }
  if (v27)
  {
  }
  if (*(_DWORD *)&v163[8])
  {
  }
  if (HIDWORD(v162))
  {
  }
  if (v169)
  {
  }
  if (v162)
  {
  }
  if (*(_DWORD *)&v160[8])
  {
  }
  if (DWORD1(v169))
  {
  }
  if (v161)
  {
  }
  if (HIDWORD(v159))
  {
  }
  if (DWORD2(v169))
  {
  }
  if (*(_DWORD *)&v160[4])
  {
  }
  if (v159)
  {
  }
  if (v26)
  {
  }
  if (*(_DWORD *)&v160[12])
  {
  }
  if (*(_DWORD *)v160)
  {
  }
  if (HIDWORD(v169))
  {
  }
  if (HIDWORD(v161))
  {
  }
  if (*(_DWORD *)&v160[16])
  {
  }
  if (v25)
  {
  }
  if (*(_DWORD *)&v163[4])
  {
  }
  if (*(_DWORD *)v163)
  {
  }
  if (v24)
  {
  }
  if (*(_DWORD *)&v164[4])
  {
  }
  if (*(_DWORD *)v164)
  {
  }
  if (*(_DWORD *)&v164[8])
  {
  }
  if (*(_DWORD *)&v164[12]) {

  }
  if (*(_DWORD *)&v164[16])
  {
  }
  if (v165)
  {
  }
  if (v166) {

  }
  if (HIDWORD(v166))
  {
  }
  if (*(_DWORD *)&v164[20])
  {
  }
  if (*(_DWORD *)&v164[24]) {

  }
  if (v10)
  {
  }
  return v164[28];
}

- (id)supportedLocationFields
{
  if (supportedLocationFields_onceToken != -1) {
    dispatch_once(&supportedLocationFields_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)supportedLocationFields_supportedLocationFields;
  return v2;
}

void __50__PPConnectionsDuetSource_supportedLocationFields__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F2569770, &unk_1F2569788, &unk_1F25697A0, &unk_1F25697B8, &unk_1F25697D0, &unk_1F25697E8, &unk_1F2569800, &unk_1F2569818, &unk_1F2569830, 0);
  v2 = (void *)supportedLocationFields_supportedLocationFields;
  supportedLocationFields_supportedLocationFields = v1;
}

+ (PPConnectionsDuetSource)sharedInstance
{
  if (sharedInstance_once_19314 != -1) {
    dispatch_once(&sharedInstance_once_19314, &__block_literal_global_19315);
  }
  v2 = (void *)sharedInstance_shared_19316;
  return (PPConnectionsDuetSource *)v2;
}

uint64_t __41__PPConnectionsDuetSource_sharedInstance__block_invoke()
{
  sharedInstance_shared_19316 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end