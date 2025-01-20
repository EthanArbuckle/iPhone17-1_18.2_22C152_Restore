@interface MOEventPatternDetectorPredicateFilterBySignificantContact
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorPredicateFilterBySignificantContact)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOEventPatternDetectorPredicateFilterBySignificantContact

- (MOEventPatternDetectorPredicateFilterBySignificantContact)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterBySignificantContact;
  v2 = [(MOEventPatternDetectorPredicateFilterBySignificantContact *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_minimumTextCount = -1;
    v2->_maximumNumberOfContacts = -1;
    v2->_excludeTextOnlyConversations = 1;
    v4 = v2;
  }

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v4 = a3;
  if (self->_minimumTextCount == -1 || self->_minimumTotalCallDuration == -1 || self->_maximumNumberOfContacts == -1)
  {
    log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetectorPredicateFilterBySignificantContact filterEvents:](log);
    }
    v42 = 0;
    goto LABEL_57;
  }
  log = objc_opt_new();
  v5 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %lu", @"category", 10, @"provider", 3];
  objc_super v6 = [v4 filteredArrayUsingPredicate:v5];
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v73 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %lu significant contact events", buf, 0xCu);
  }

  if (![v6 count])
  {
    v42 = 0;
    goto LABEL_56;
  }
  v45 = v5;
  id v46 = v4;
  v49 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v44 = v6;
  id obj = v6;
  id v52 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (!v52) {
    goto LABEL_39;
  }
  uint64_t v50 = *(void *)v65;
  v51 = self;
  do
  {
    for (id i = 0; i != v52; id i = v24 + 1)
    {
      if (*(void *)v65 != v50) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v53 = v9;
      v54 = (char *)i;
      v10 = [v9 interactions];
      id v11 = [v10 countByEnumeratingWithState:&v60 objects:v70 count:16];
      if (v11)
      {
        id v12 = v11;
        int v13 = 0;
        int v14 = 0;
        uint64_t v15 = *(void *)v61;
        double v16 = 0.0;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v61 != v15) {
              objc_enumerationMutation(v10);
            }
            v18 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            unint64_t v19 = (unint64_t)[v18 mechanism];
            if (v19 <= 0x11)
            {
              if (((1 << v19) & 0x31B01) != 0)
              {
                ++v13;
                v20 = [v18 endDate];
                v21 = [v18 startDate];
                [v20 timeIntervalSinceDate:v21];
                double v23 = v22;

                double v16 = v16 + v23;
              }
              else if (((1 << v19) & 0x201E) != 0)
              {
                ++v14;
              }
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v60 objects:v70 count:16];
        }
        while (v12);
      }
      else
      {
        int v13 = 0;
        int v14 = 0;
        double v16 = 0.0;
      }

      if (v51->_excludeTextOnlyConversations)
      {
        v24 = v54;
        if (v14 < 1 || v13)
        {
          v25 = [v53 interactionContacts];
          if ((unint64_t)[v25 count] > v51->_maximumNumberOfContacts)
          {

            continue;
          }
          double minimumTotalCallDuration = (double)v51->_minimumTotalCallDuration;

          if (v16 >= minimumTotalCallDuration)
          {
LABEL_36:
            [v49 addObject:v53];
            continue;
          }
        }
      }
      else
      {
        v26 = [v53 interactionContacts];
        id v27 = [v26 count];
        unint64_t maximumNumberOfContacts = v51->_maximumNumberOfContacts;

        v24 = v54;
        if ((unint64_t)v27 <= maximumNumberOfContacts
          && (v14 >= v51->_minimumTextCount || v16 >= (double)v51->_minimumTotalCallDuration))
        {
          goto LABEL_36;
        }
      }
    }
    id v52 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  }
  while (v52);
LABEL_39:

  v30 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v31 = v49;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v32 = [v49 count];
    *(_DWORD *)buf = 134217984;
    id v73 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Found %lu significant contact events that met minimum requirements", buf, 0xCu);
  }

  if ([v49 count])
  {
    [v49 valueForKeyPath:@"@distinctUnionOfObjects.interactionScoredContact.contact.identifier"];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    id v33 = [v55 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v57;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v57 != v35) {
            objc_enumerationMutation(v55);
          }
          v37 = +[NSPredicate predicateWithFormat:@"interactionScoredContact.contact.identifier = %@", *(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
          v38 = [v49 filteredArrayUsingPredicate:v37];
          id v39 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
          id v68 = v39;
          v40 = +[NSArray arrayWithObjects:&v68 count:1];
          v41 = [v38 sortedArrayUsingDescriptors:v40];

          [log addObject:v41];
        }
        id v34 = [v55 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v34);
    }
    v42 = log;

    v31 = v49;
  }
  else
  {
    v42 = 0;
  }

  v5 = v45;
  id v4 = v46;
  objc_super v6 = v44;
LABEL_56:

LABEL_57:

  return v42;
}

- (BOOL)configure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    objc_super v6 = [v4 objectForKey:@"MinimumTextCount"];

    if (v6)
    {
      v7 = [v4 objectForKeyedSubscript:@"MinimumTextCount"];
      self->_minimumTextCount = [v7 intValue];
    }
    else
    {
      v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:]();
      }
    }
    v9 = [v4 objectForKey:@"MinimumTotalCallDuration"];

    if (v9)
    {
      v10 = [v4 objectForKeyedSubscript:@"MinimumTotalCallDuration"];
      self->_double minimumTotalCallDuration = [v10 intValue];
    }
    else
    {
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:]();
      }
    }

    id v11 = [v4 objectForKey:@"MaximumNumberOfContacts"];

    if (v11)
    {
      id v12 = [v4 objectForKeyedSubscript:@"MaximumNumberOfContacts"];
      self->_unint64_t maximumNumberOfContacts = [v12 intValue];
    }
    else
    {
      id v12 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:]();
      }
    }

    int v13 = [v4 objectForKey:@"ExcludeTextOnlyConversations"];

    if (v13)
    {
      int v14 = [v4 objectForKeyedSubscript:@"ExcludeTextOnlyConversations"];
      self->_excludeTextOnlyConversations = [v14 BOOLValue];
    }
    else
    {
      int v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorPredicateFilterBySignificantContact configure:]();
      }
    }
  }
  return v5 != 0;
}

- (void)filterEvents:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Significant contact filter configuration not set", v1, 2u);
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for significant contact filter: %@", v2, v3, v4, v5, v6);
}

@end