@interface MOSignificantContactManager
- (BOOL)_eligibleInteraction:(id)a3;
- (CNContactStore)cnContactStore;
- (GDEntityTaggingService)entityTaggingSerice;
- (GDVisualIdentifierView)visualIdentifierView;
- (MOConfigurationManager)configurationManager;
- (MOEventStore)momentStore;
- (MOSignificantContactManager)initWithDuetStore:(id)a3 ppContactStore:(id)a4 cnContactStore:(id)a5 momentStore:(id)a6 configurationManager:(id)a7;
- (MOSignificantContactManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (PPContactStore)ppContactStore;
- (_CDInteractionStore)interactionStore;
- (id)_collectSignificantContactsFromInteractions:(id)a3;
- (id)_conversationsFromInteractions:(id)a3;
- (id)_createEventFromConversation:(id)a3;
- (id)_createEventsFromConversations:(id)a3;
- (id)_createNewEventsFromConversations:(id)a3 storedEvents:(id)a4;
- (id)_fetchClassificationForSignificantContacts:(id)a3;
- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 conversations:(id)a4;
- (id)_rehydrateStoredEvents:(id)a3 fromConversations:(id)a4;
- (id)initializeVisualIdentifierView;
- (id)intializeEntityTaggingService;
- (void)_fetchConversationEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)_fetchInteractionsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)_rehydrateConversations:(id)a3 handler:(id)a4;
- (void)_saveConversations:(id)a3 handler:(id)a4;
- (void)_setDynamicPropertiesForEvent:(id)a3 fromCoversation:(id)a4;
- (void)_updateClassificationForEvent:(id)a3 withClassificationDict:(id)a4 contactDict:(id)a5;
- (void)_updateClassificationForEvents:(id)a3;
- (void)_updateConversationsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)fetchAndSaveConversationsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)fetchConversationEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6;
- (void)intializeEntityTaggingService;
- (void)rehydrateConversations:(id)a3 handler:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)updateConversationsDeletedAtSource:(id)a3 handler:(id)a4;
- (void)waitForQueueEmpty;
@end

@implementation MOSignificantContactManager

- (MOSignificantContactManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v5 = +[_CDInteractionStore defaultDatabaseDirectory];
  v6 = +[_CDInteractionStore storeWithDirectory:v5 readOnly:1];
  id v7 = objc_alloc_init((Class)PPContactStore);
  v8 = objc_opt_new();
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v4 getService:v10];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v4 getService:v13];

  v15 = [(MOSignificantContactManager *)self initWithDuetStore:v6 ppContactStore:v7 cnContactStore:v8 momentStore:v11 configurationManager:v14];
  return v15;
}

- (MOSignificantContactManager)initWithDuetStore:(id)a3 ppContactStore:(id)a4 cnContactStore:(id)a5 momentStore:(id)a6 configurationManager:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v86 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v16)
  {
    v84 = a2;
    v18 = 0;
    if (v14 && v15 && v86)
    {
      id v83 = v17;
      v89.receiver = self;
      v89.super_class = (Class)MOSignificantContactManager;
      v19 = [(MOSignificantContactManager *)&v89 init];
      if (v19)
      {
        id v81 = v15;
        v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v21 = dispatch_queue_create("MOSignificantContactManager", v20);
        queue = v19->_queue;
        v19->_queue = (OS_dispatch_queue *)v21;

        objc_storeStrong((id *)&v19->_interactionStore, a3);
        objc_storeStrong((id *)&v19->_ppContactStore, a4);
        objc_storeStrong((id *)&v19->_cnContactStore, a5);
        objc_storeStrong((id *)&v19->_momentStore, a6);
        objc_storeStrong((id *)&v19->_configurationManager, a7);
        uint64_t v23 = [(MOSignificantContactManager *)v19 initializeVisualIdentifierView];
        visualIdentifierView = v19->_visualIdentifierView;
        v19->_visualIdentifierView = (GDVisualIdentifierView *)v23;

        uint64_t v25 = [(MOSignificantContactManager *)v19 intializeEntityTaggingService];
        entityTaggingSerice = v19->_entityTaggingSerice;
        v19->_entityTaggingSerice = (GDEntityTaggingService *)v25;

        v27 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"+1800", @"+1833", @"+1844", @"+1855", @"+1866", @"+1877", @"+1888", @"+1822", @"+1880", @"+1881", @"+1882", @"+1883", @"+1884", @"+1885", @"+1886", @"+1887", @"+1889",
                         @"+1900",
                         @"+1976",
                         @"800",
                         @"833",
                         @"844",
                         @"855",
                         @"866",
                         @"877",
                         @"888",
                         @"822",
                         @"880",
                         @"881",
                         @"882",
                         @"883",
                         @"884",
                         @"885",
                         @"886",
                         @"887",
                         @"889",
                         @"900",
                         @"976",
                         0);
        tollFreeNumberPrefixes = v19->_tollFreeNumberPrefixes;
        v19->_tollFreeNumberPrefixes = v27;

        v29 = (NSSet *)[objc_alloc((Class)NSSet) initWithObjects:&off_1002F49D0, &off_1002F49E8, &off_1002F4A00, &off_1002F4A18, &off_1002F4A30, &off_1002F4A48, &off_1002F4A60, &off_1002F4A78, 0];
        callLikeMechanismsSet = v19->_callLikeMechanismsSet;
        v19->_callLikeMechanismsSet = v29;

        cnContactStore = v19->_cnContactStore;
        v102 = CNContactGivenNameKey;
        v32 = +[NSArray arrayWithObjects:&v102 count:1];
        id v88 = 0;
        v33 = [(CNContactStore *)cnContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:v32 error:&v88];
        id v34 = v88;

        v35 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = NSStringFromSelector(v84);
          v37 = [v33 identifier];
          v38 = [v33 givenName];
          [v38 mask];
          v40 = v39 = v33;
          *(_DWORD *)buf = 138413058;
          v91 = v36;
          __int16 v92 = 2112;
          id v93 = v37;
          __int16 v94 = 2112;
          v95 = v40;
          __int16 v96 = 2112;
          id v97 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@, meCard info, identifier, %@, name, %@, error, %@", buf, 0x2Au);

          v33 = v39;
        }

        uint64_t v41 = objc_opt_new();
        meIdentifiers = v19->_meIdentifiers;
        v19->_meIdentifiers = (NSMutableSet *)v41;

        v43 = [v33 identifier];

        if (v43)
        {
          v44 = v19->_meIdentifiers;
          v45 = [v33 identifier];
          [(NSMutableSet *)v44 addObject:v45];
        }
        uint64_t v46 = +[NSPredicate predicateWithFormat:@"%K == %i", @"mechanism", 4];
        uint64_t v47 = +[NSPredicate predicateWithFormat:@"%K == %i", @"direction", 1];
        uint64_t v48 = +[NSPredicate predicateWithFormat:@"%K.%K != nil", @"sender", @"personId"];
        v79 = (void *)v47;
        v80 = (void *)v46;
        v101[0] = v46;
        v101[1] = v47;
        v78 = (void *)v48;
        v101[2] = v48;
        v49 = +[NSArray arrayWithObjects:v101 count:3];
        uint64_t v50 = +[NSCompoundPredicate andPredicateWithSubpredicates:v49];

        v51 = [(MOSignificantContactManager *)v19 interactionStore];
        v52 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
        v100 = v52;
        v53 = +[NSArray arrayWithObjects:&v100 count:1];
        id v87 = v34;
        v77 = (void *)v50;
        v54 = [v51 queryInteractionsUsingPredicate:v50 sortDescriptors:v53 limit:1 error:&v87];
        id v82 = v87;

        v55 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(v84);
          v56 = id v76 = v14;
          id v73 = [v54 count];
          v75 = [v54 firstObject];
          v74 = [v75 sender];
          v57 = [v74 personId];
          v58 = [v54 firstObject];
          v59 = [v58 sender];
          [v59 displayName];
          v60 = v85 = v33;
          v61 = [v60 mask];
          *(_DWORD *)buf = 138413314;
          v91 = v56;
          __int16 v92 = 2048;
          id v93 = v73;
          __int16 v94 = 2112;
          v95 = v57;
          __int16 v96 = 2112;
          id v97 = v61;
          __int16 v98 = 2112;
          id v99 = v82;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%@, fetched result count, %lu, sender info, identifier, %@, name, %@, error, %@", buf, 0x34u);

          v33 = v85;
          id v14 = v76;
        }

        v62 = [v54 firstObject];
        v63 = [v62 sender];
        v64 = [v63 personId];

        if (v64)
        {
          v65 = v19->_meIdentifiers;
          v66 = [v54 firstObject];
          v67 = [v66 sender];
          v68 = [v67 personId];
          [(NSMutableSet *)v65 addObject:v68];
        }
        id v15 = v81;
      }
      self = v19;
      v18 = self;
      id v17 = v83;
    }
  }
  else
  {
    id v69 = v17;
    v70 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:]();
    }

    v71 = +[NSAssertionHandler currentHandler];
    [v71 handleFailureInMethod:a2 object:self file:@"MOSignificantContactManager.m" lineNumber:93 description:@"Invalid parameter not satisfying: momentStore"];

    v18 = 0;
    id v17 = v69;
  }

  return v18;
}

- (id)initializeVisualIdentifierView
{
  v2 = +[GDViewService defaultService];
  id v10 = 0;
  v3 = [v2 visualIdentifierViewWithError:&v10];
  id v4 = v10;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v8 = v3;
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#megadome failed to get visualIdentifierView with error: %@", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)intializeEntityTaggingService
{
  id v9 = 0;
  v2 = objc_opt_new();
  id v3 = [objc_alloc((Class)GDEntityTaggingService) initWithConfig:v2 error:&v9];
  id v4 = v3;
  if (v9) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    BOOL v6 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(MOSignificantContactManager *)&v9 intializeEntityTaggingService];
    }

    id v7 = 0;
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (BOOL)_eligibleInteraction:(id)a3
{
  id v5 = a3;
  callLikeMechanismsSet = self->_callLikeMechanismsSet;
  id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 mechanism]);
  LODWORD(callLikeMechanismsSet) = [(NSSet *)callLikeMechanismsSet containsObject:v7];

  if (callLikeMechanismsSet)
  {
    uint64_t v8 = [v5 sender];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [v5 sender];
      id v11 = [v10 type];

      if (v11 == (id)1)
      {
        v12 = [v5 sender];
        v13 = [v12 identifier];
        if ((unint64_t)[v13 length] < 5)
        {
          id v16 = 0;
        }
        else
        {
          id v14 = [v5 sender];
          id v15 = [v14 identifier];
          id v16 = [v15 substringToIndex:5];
        }
        id v17 = [v5 sender];
        v18 = [v17 identifier];
        if ((unint64_t)[v18 length] < 3)
        {
          dispatch_queue_t v21 = 0;
        }
        else
        {
          v19 = [v5 sender];
          v20 = [v19 identifier];
          dispatch_queue_t v21 = [v20 substringToIndex:3];
        }
        if (v16 && [(NSSet *)self->_tollFreeNumberPrefixes containsObject:v16]
          || v21 && [(NSSet *)self->_tollFreeNumberPrefixes containsObject:v21])
        {
          v22 = [v5 sender];
          uint64_t v23 = [v22 identifier];

LABEL_39:
          v39 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            [(MOSignificantContactManager *)a2 _eligibleInteraction:v39];
          }

          BOOL v37 = 0;
LABEL_43:

          goto LABEL_44;
        }
      }
    }
    v24 = [v5 recipients];
    id v25 = [v24 count];

    if (v25)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v23 = [v5 recipients];
      id v26 = [v23 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v41 = a2;
        id v42 = v5;
        uint64_t v28 = *(void *)v44;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v44 != v28) {
              objc_enumerationMutation(v23);
            }
            v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if (objc_msgSend(v30, "type", v41) == (id)1)
            {
              v31 = [v30 identifier];
              if ((unint64_t)[v31 length] < 5)
              {
                v33 = 0;
              }
              else
              {
                v32 = [v30 identifier];
                v33 = [v32 substringToIndex:5];
              }
              id v34 = [v30 identifier];
              if ((unint64_t)[v34 length] < 3)
              {
                v36 = 0;
              }
              else
              {
                v35 = [v30 identifier];
                v36 = [v35 substringToIndex:3];
              }
              if (v33 && [(NSSet *)self->_tollFreeNumberPrefixes containsObject:v33]
                || v36 && [(NSSet *)self->_tollFreeNumberPrefixes containsObject:v36])
              {
                uint64_t v38 = [v30 identifier];

                uint64_t v23 = (void *)v38;
                a2 = v41;
                id v5 = v42;
                goto LABEL_39;
              }
            }
          }
          id v27 = [v23 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v27) {
            continue;
          }
          break;
        }
        BOOL v37 = 1;
        id v5 = v42;
      }
      else
      {
        BOOL v37 = 1;
      }
      goto LABEL_43;
    }
  }
  BOOL v37 = 1;
LABEL_44:

  return v37;
}

- (void)_fetchInteractionsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && v10 && ![v10 isBeforeDate:v9])
  {
    if (_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__onceToken != -1) {
      dispatch_once(&_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__onceToken, &__block_literal_global_7);
    }
    id v14 = [(MOSignificantContactManager *)self queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
    v15[3] = &unk_1002CABE8;
    id v16 = v9;
    id v17 = v10;
    v18 = self;
    SEL v20 = a2;
    id v19 = v11;
    dispatch_async(v14, v15);

    v13 = v16;
  }
  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"invalid start date or end date";
    v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v13 = +[NSError errorWithDomain:@"MOErrorDomain" code:7 userInfo:v12];

    (*((void (**)(id, void *, void *))v11 + 2))(v11, &__NSArray0__struct, v13);
  }
}

void __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke(id a1)
{
  v1 = +[NSString stringWithFormat:@"%@", @"mechanism"];
  v2 = objc_opt_new();
  for (uint64_t i = 0; i != 11; ++i)
  {
    id v4 = +[NSPredicate predicateWithFormat:@"%K == %i", v1, kPPContactUNKPrefix_block_invoke_mechanismAllowList[i]];
    [v2 addObject:v4];
  }
  uint64_t v5 = +[NSCompoundPredicate orPredicateWithSubpredicates:v2];
  BOOL v6 = (void *)_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateMechanism;
  _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateMechanism = v5;

  id v7 = +[NSPredicate predicateWithFormat:@"%K.%K != nil", @"sender", @"personId"];
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"(ANY %K.%K != nil)", @"recipients", @"personId"];
  v14[0] = v7;
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  uint64_t v10 = +[NSCompoundPredicate orPredicateWithSubpredicates:v9];
  id v11 = (void *)_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicatePersonIdNotNil;
  _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicatePersonIdNotNil = v10;

  uint64_t v12 = +[NSPredicate predicateWithFormat:@"%K != %@", @"bundleId", @"com.apple.Contacts.Autocomplete"];
  v13 = (void *)_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateBundleId;
  _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateBundleId = v12;
}

void __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = +[NSCalendar currentCalendar];
  id v2 = [v47 startOfDayForDate:*(void *)(a1 + 32)];
  id v3 = NSAssertionHandler_ptr;
  id v4 = objc_opt_new();
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5)
    {
      if (objc_msgSend(v5, "isAfterDate:")
        && [v2 isBeforeDate:*(void *)(a1 + 40)])
      {
        BOOL v6 = 0;
        do
        {
          id v7 = v2;
          uint64_t v8 = [v2 dateByAddingTimeInterval:86400.0];

          unsigned __int8 v9 = [v7 isAfterDate:*(void *)(a1 + 32)];
          uint64_t v10 = v7;
          if ((v9 & 1) == 0) {
            uint64_t v10 = *(void **)(a1 + 32);
          }
          id v11 = v10;
          unsigned __int8 v12 = [v8 isBeforeDate:*(void *)(a1 + 40)];
          v13 = v8;
          if ((v12 & 1) == 0) {
            v13 = *(void **)(a1 + 40);
          }
          id v14 = v13;
          id v15 = v14;
          if (v11 && v14 && [v11 isBeforeDate:v14])
          {
            id v16 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v11 endDate:v15];
            [v4 addObject:v16];
          }
          id v2 = v8;

          BOOL v6 = v2;
        }
        while (([v2 isBeforeDate:*(void *)(a1 + 40)] & 1) != 0);

        id v3 = NSAssertionHandler_ptr;
      }
    }
  }
  uint64_t v48 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v4;
  id v54 = [obj countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v61;
    id v46 = v2;
    uint64_t v49 = a1;
    while (2)
    {
      id v17 = 0;
      do
      {
        if (*(void *)v61 != v53) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v17);
        id v19 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
        v75 = v19;
        uint64_t v20 = +[NSArray arrayWithObjects:&v75 count:1];

        NSErrorUserInfoKey v21 = [v18 startDate];
        CFStringRef v22 = [v18 endDate];
        uint64_t v23 = +[NSPredicate predicateWithFormat:@"startDate >= %@ && startDate <= %@", v21, v22];

        v55 = (void *)v23;
        v74[0] = v23;
        v74[1] = _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateMechanism;
        v74[2] = _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicatePersonIdNotNil;
        v74[3] = _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateBundleId;
        v24 = +[NSArray arrayWithObjects:v74 count:4];
        id v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

        id v26 = (void *)v20;
        id v27 = [*(id *)(a1 + 48) interactionStore];
        id v59 = 0;
        uint64_t v28 = [v27 queryInteractionsUsingPredicate:v25 sortDescriptors:v20 limit:1000 error:&v59];
        id v29 = v59;

        v30 = objc_opt_new();
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_3;
        v57[3] = &unk_1002CABC0;
        v57[4] = *(void *)(a1 + 48);
        id v31 = v30;
        id v58 = v31;
        [v28 enumerateObjectsWithOptions:2 usingBlock:v57];
        v32 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v51 = v17;
          v33 = v52 = v25;
          id v34 = [v28 count];
          id v35 = v29;
          v36 = v28;
          BOOL v37 = v26;
          uint64_t v38 = v3;
          id v39 = v34;
          v40 = [v18 startDate];
          uint64_t v41 = [v18 endDate];
          id v42 = [v31 count];
          *(_DWORD *)buf = 138413314;
          id v65 = v33;
          __int16 v66 = 2048;
          id v67 = v39;
          id v3 = v38;
          id v26 = v37;
          uint64_t v28 = v36;
          id v29 = v35;
          __int16 v68 = 2112;
          id v69 = v40;
          __int16 v70 = 2112;
          v71 = v41;
          __int16 v72 = 2048;
          id v73 = v42;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%@, fetched interaction count, %lu, startDate, %@, endDate, %@, filtered interaction count, %lu", buf, 0x34u);

          a1 = v49;
          id v17 = v51;
          id v25 = v52;
        }

        if (v29)
        {
          long long v43 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v65 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Interactions query error: %@", buf, 0xCu);
          }

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        else
        {
          long long v44 = [*(id *)(a1 + 48) _conversationsFromInteractions:v31];
          if ([v44 count]) {
            [v48 addObjectsFromArray:v44];
          }
        }
        if (v29)
        {

          id v2 = v46;
          long long v45 = v48;
          goto LABEL_35;
        }
        id v17 = (char *)v17 + 1;
      }
      while (v54 != v17);
      id v2 = v46;
      id v54 = [obj countByEnumeratingWithState:&v60 objects:v76 count:16];
      if (v54) {
        continue;
      }
      break;
    }
  }

  long long v45 = v48;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_35:
}

void __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_eligibleInteraction:"))
  {
    id v3 = [[MOInteraction alloc] initWithCDInteraction:v4 meIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
    if (v3) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

- (id)_collectSignificantContactsFromInteractions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v13 = [v11 participants];
        id v14 = [v13 count];

        if (v14)
        {
          id v15 = [v11 participants];
          [v5 addObjectsFromArray:v15];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v8);
  }

  id v16 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = v17;
    __int16 v39 = 2112;
    v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, identifiers: %@", buf, 0x16u);
  }
  uint64_t v18 = objc_opt_new();
  id v19 = objc_opt_new();
  uint64_t v20 = [v5 allObjects];
  [v19 setMatchingIdentifiers:v20];

  ppContactStore = self->_ppContactStore;
  SEL v31 = a2;
  id v32 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke;
  v29[3] = &unk_1002CAC10;
  v29[4] = self;
  id v22 = (id)v18;
  id v30 = v22;
  LOBYTE(v18) = [(PPContactStore *)ppContactStore iterRankedContactsWithQuery:v19 error:&v32 block:v29];
  id v23 = v32;
  if ((v18 & 1) == 0)
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager _collectSignificantContactsFromInteractions:]();
    }
  }
  id v25 = v30;
  id v26 = v22;

  return v26;
}

void __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke_cold_1(a1, v3, v4);
  }

  [v3 score];
  if (v5 >= 0.49999)
  {
    id v6 = [v3 contact];
    id v7 = [v6 identifier];

    if ([v7 hasPrefix:@"CN:"])
    {
      uint64_t v9 = [v7 substringFromIndex:([@"CN:" length])];
      if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v9] & 1) == 0) {
        [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v9];
      }

      goto LABEL_14;
    }
    if ([v7 hasPrefix:@"FIA:"])
    {
      uint64_t v10 = *(void **)(a1 + 40);
      unsigned __int8 v12 = @"FIA:";
    }
    else
    {
      unsigned int v13 = [v7 hasPrefix:@"UNK:"];
      uint64_t v10 = *(void **)(a1 + 40);
      if (!v13)
      {
        [v10 setObject:v3 forKeyedSubscript:v7];
        goto LABEL_14;
      }
      unsigned __int8 v12 = @"UNK:";
    }
    id v14 = [v7 substringFromIndex:-[__CFString length](v12, "length")];
    [v10 setObject:v3 forKeyedSubscript:v14];

LABEL_14:
  }
}

- (id)_conversationsFromInteractions:(id)a3
{
  id v4 = a3;
  double v5 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v111 = v6;
    __int16 v112 = 2048;
    id v113 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@, interaction count, %lu", buf, 0x16u);
  }
  id v81 = objc_opt_new();
  if (v4 && [v4 count])
  {
    v78 = v4;
    id v7 = [(MOSignificantContactManager *)self _collectSignificantContactsFromInteractions:v4];
    id v8 = v7;
    if (v7 && [v7 count])
    {
      uint64_t v9 = objc_opt_new();
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id obj = v78;
      id v10 = [obj countByEnumeratingWithState:&v106 objects:v124 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v107;
        uint64_t v82 = *(void *)v107;
        v85 = v9;
        do
        {
          id v13 = 0;
          id v89 = v11;
          do
          {
            if (*(void *)v107 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v106 + 1) + 8 * (void)v13);
            id v16 = [v9 member:v14];
            id v17 = v16;
            if (v16)
            {
              [v16 addInteraction:v14];
            }
            else
            {
              id v93 = v15;
              id v95 = v13;
              long long v104 = 0u;
              long long v105 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              v91 = v14;
              uint64_t v18 = [v14 participants];
              id v19 = [v18 countByEnumeratingWithState:&v102 objects:v123 count:16];
              if (v19)
              {
                id v20 = v19;
                NSErrorUserInfoKey v21 = 0;
                uint64_t v22 = *(void *)v103;
                id v23 = &off_1002F9710;
                do
                {
                  for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v103 != v22) {
                      objc_enumerationMutation(v18);
                    }
                    id v25 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v102 + 1) + 8 * i)];
                    id v26 = v25;
                    if (v25)
                    {
                      [v25 score];
                      double v28 = v27;
                      [v23 doubleValue];
                      if (v28 > v29)
                      {
                        id v30 = v26;

                        [v30 score];
                        uint64_t v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

                        NSErrorUserInfoKey v21 = v30;
                        id v23 = (_UNKNOWN **)v31;
                      }
                    }
                  }
                  id v20 = [v18 countByEnumeratingWithState:&v102 objects:v123 count:16];
                }
                while (v20);
              }
              else
              {
                NSErrorUserInfoKey v21 = 0;
                id v23 = &off_1002F9710;
              }

              id v32 = [[MOGroupedInteraction alloc] initWithScoredContact:v21 interactionScore:v23 interaction:v91];
              uint64_t v9 = v85;
              [v85 addObject:v32];

              uint64_t v12 = v82;
              id v11 = v89;
              id v15 = v93;
              id v13 = v95;
              id v17 = 0;
            }

            id v13 = (char *)v13 + 1;
          }
          while (v13 != v11);
          id v11 = [obj countByEnumeratingWithState:&v106 objects:v124 count:16];
        }
        while (v11);
      }

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v96 = v9;
      id v33 = [v96 countByEnumeratingWithState:&v98 objects:v122 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = 0;
        uint64_t v36 = *(void *)v99;
        uint64_t v92 = *(void *)v99;
        do
        {
          BOOL v37 = 0;
          id v94 = v34;
          do
          {
            if (*(void *)v99 != v36) {
              objc_enumerationMutation(v96);
            }
            uint64_t v38 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v37);
            __int16 v39 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              id v58 = NSStringFromSelector(a2);
              uint64_t v59 = [v38 interactionKey];
              v80 = (void *)v59;
              id v86 = [v38 scoredContact];
              id v83 = [v86 contact];
              uint64_t v60 = [v83 identifier];
              unsigned int v61 = [v38 isScoredContactUsable];
              CFStringRef v62 = @"NO";
              if (v61) {
                CFStringRef v62 = @"YES";
              }
              CFStringRef v79 = v62;
              long long v63 = [v38 interactionScore];
              v64 = [v38 interactions];
              id v65 = [v64 count];
              *(_DWORD *)buf = 138413570;
              v111 = v58;
              __int16 v112 = 2112;
              id v113 = (id)v59;
              __int16 v114 = 2112;
              uint64_t v115 = v60;
              __int16 v66 = (void *)v60;
              __int16 v116 = 2112;
              CFStringRef v117 = v79;
              id v34 = v94;
              __int16 v118 = 2112;
              v119 = v63;
              __int16 v120 = 2048;
              id v121 = v65;
              _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%@, grouped interactions for compound key: %@, main scored contact id: %@, usable %@, score %@, num interactions: %lu", buf, 0x3Eu);

              uint64_t v36 = v92;
            }

            v40 = [v38 interactions];
            id v41 = [v40 count];

            if ([v38 isScoredContactUsable]
              && ([v38 interactions],
                  id v42 = objc_claimAutoreleasedReturnValue(),
                  id v43 = [v42 count],
                  v42,
                  v43))
            {
              long long v44 = [MOConversation alloc];
              long long v45 = [v38 interactionKey];
              id v46 = [v38 scoredContact];
              uint64_t v47 = [v38 interactions];
              uint64_t v48 = [(MOConversation *)v44 initWithContactIdentifier:v45 scoredContact:v46 interactions:v47];

              uint64_t v49 = +[NSCalendar currentCalendar];
              uint64_t v50 = [v48 endDate];
              v51 = [v49 startOfDayForDate:v50];

              v52 = +[NSDateFormatter localizedStringFromDate:v51 dateStyle:4 timeStyle:3];
              uint64_t v53 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                id v87 = [v48 contactIdentifier];
                id v67 = [v87 mask];
                v84 = [v48 interactions];
                id v68 = [v84 count];
                *(_DWORD *)buf = 138412802;
                v111 = v67;
                __int16 v112 = 2112;
                id v113 = v52;
                __int16 v114 = 2048;
                uint64_t v115 = (uint64_t)v68;
                _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "new conversation created for compound key: %@, for date %@, interaction count, %lu", buf, 0x20u);
              }
              id v54 = [v48 interactions];
              v97[0] = _NSConcreteStackBlock;
              v97[1] = 3221225472;
              v97[2] = __62__MOSignificantContactManager__conversationsFromInteractions___block_invoke;
              v97[3] = &__block_descriptor_40_e30_v32__0__MOInteraction_8Q16_B24l;
              v97[4] = a2;
              [v54 enumerateObjectsUsingBlock:v97];

              [v81 addObject:v48];
              uint64_t v36 = v92;
              id v34 = v94;
            }
            else
            {
              uint64_t v48 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                v55 = [v38 interactionKey];
                v56 = [v38 interactions];
                id v57 = [v56 count];
                *(_DWORD *)buf = 138412546;
                v111 = v55;
                __int16 v112 = 2048;
                id v113 = v57;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "daily grouped interactions not used to make any conversation, compound key: %@, interaction count, %lu", buf, 0x16u);
              }
            }
            v35 += (uint64_t)v41;

            BOOL v37 = (char *)v37 + 1;
          }
          while (v34 != v37);
          id v69 = [v96 countByEnumeratingWithState:&v98 objects:v122 count:16];
          id v34 = v69;
        }
        while (v69);
      }

      v74 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
        -[MOSignificantContactManager _conversationsFromInteractions:](obj, v74);
      }

      v75 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        -[MOSignificantContactManager _conversationsFromInteractions:]();
      }

      __int16 v70 = v81;
      id v76 = v81;
    }
    else
    {
      __int16 v72 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "significantContacts is empty, returning.", buf, 2u);
      }

      __int16 v70 = v81;
      id v73 = v81;
    }

    id v4 = v78;
  }
  else
  {
    __int16 v70 = v81;
    id v71 = v81;
  }

  return v70;
}

void __62__MOSignificantContactManager__conversationsFromInteractions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, interaction, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_createEventFromConversation:(id)a3
{
  id v4 = a3;
  id v5 = [MOEvent alloc];
  id v6 = +[NSUUID UUID];
  id v7 = [v4 startDate];
  int v8 = [v4 endDate];
  uint64_t v9 = +[NSDate date];
  __int16 v10 = [(MOEvent *)v5 initWithEventIdentifier:v6 startDate:v7 endDate:v8 creationDate:v9 provider:3 category:10];

  uint64_t v11 = [v4 endDate];
  __int16 v12 = [(MOSignificantContactManager *)self configurationManager];
  LODWORD(v13) = 1242802176;
  [v12 getFloatSettingForKey:@"EventManagerOverrideMaximumEventAge" withFallback:v13];
  id v15 = [v11 dateByAddingTimeInterval:v14];
  [(MOEvent *)v10 setExpirationDate:v15];

  id v16 = [v4 providerId];

  [(MOEvent *)v10 setIdentifierFromProvider:v16];

  return v10;
}

- (void)_saveConversations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  int v8 = +[NSDate distantFuture];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        float v14 = [v13 startDate];
        unsigned int v15 = [v8 isAfterDate:v14];

        if (v15)
        {
          uint64_t v16 = [v13 startDate];

          int v8 = (void *)v16;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v10);
  }

  uint64_t v36 = 0;
  v37[0] = &v36;
  v37[1] = 0x3032000000;
  v37[2] = __Block_byref_object_copy__5;
  v37[3] = __Block_byref_object_dispose__5;
  id v38 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__5;
  v34[4] = __Block_byref_object_dispose__5;
  id v35 = 0;
  id v17 = [(MOSignificantContactManager *)self momentStore];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __58__MOSignificantContactManager__saveConversations_handler___block_invoke;
  v33[3] = &unk_1002CAC98;
  v33[4] = &v36;
  v33[5] = v34;
  [v17 fetchEventsWithStartDateAfter:v8 Category:10 CompletionHandler:v33];

  if (*(void *)(v37[0] + 40))
  {
    uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager _saveConversations:handler:]((uint64_t)v37, v18, v19, v20, v21, v22, v23, v24);
    }

    id v25 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager _saveConversations:handler:]();
    }

    if (v7) {
      v7[2](v7, *(void *)(v37[0] + 40), &__NSDictionary0__struct);
    }
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __58__MOSignificantContactManager__saveConversations_handler___block_invoke_448;
    v32[3] = &unk_1002CACC0;
    v32[4] = self;
    v32[5] = v34;
    id v26 = [v9 _pas_mappedArrayWithTransform:v32];
    double v27 = [(MOSignificantContactManager *)self momentStore];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_450;
    v29[3] = &unk_1002CACE8;
    id v28 = v26;
    id v30 = v28;
    uint64_t v31 = v7;
    [v27 storeEvents:v28 CompletionHandler:v29];
  }
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
}

void __58__MOSignificantContactManager__saveConversations_handler___block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  id v8 = objc_alloc((Class)NSSet);
  [v7 _pas_mappedArrayWithTransform:&__block_literal_global_446];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v8 initWithArray:v12];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

id __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return [(MOEvent *)a2 identifierFromProvider];
}

id __58__MOSignificantContactManager__saveConversations_handler___block_invoke_448(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [v3 providerId];
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) _createEventFromConversation:v3];
  }

  return v6;
}

void __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_450(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_450_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "saved conversations, %lu", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (id)_rehydrateStoredEvents:(id)a3 fromConversations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "no input events for rehydrating contact events", buf, 2u);
    }
    goto LABEL_33;
  }
  if (![v6 count])
  {
    id v38 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "no interactions fetched for rehydrating contact events", buf, 2u);
    }

    long long v39 = [MORehydrationMetrics alloc];
    long long v40 = [v5 firstObject];
    id v41 = [v40 category];
    long long v42 = [v5 firstObject];
    id v7 = [[MORehydrationMetrics alloc] initWithCategory:v39 provider:[v42 provider] spiSuccess:1 spiError:0 failCount:[v5 count] successAfterPreFailCount:3 totalCount:[v5 count] rehydrationTrigger:0.0];

    uint64_t v61 = 0;
    [v7 submitMetricsWithError:&v61];
LABEL_33:
    id v50 = 0;
    goto LABEL_34;
  }
  long long v45 = v5;
  id v7 = objc_opt_new();
  id v46 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v44 = v6;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        unsigned int v15 = [v13 providerId];
        uint64_t v16 = v15;
        if (v15)
        {
          if ([v15 length])
          {
            [v7 setObject:v13 forKeyedSubscript:v16];
            id v17 = [v13 interactions];
            id v18 = [v17 count];

            if (v18)
            {
              uint64_t v19 = [v13 interactions];
              uint64_t v20 = [v19 firstObject];
              [v46 addObject:v20];
            }
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v10);
  }

  uint64_t v47 = objc_opt_new();
  id v50 = (id)objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v45;
  id v21 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
        id v26 = [v25 identifierFromProvider];
        double v27 = [v7 objectForKeyedSubscript:v26];

        if (v27)
        {
          id v28 = [v25 copy];
          if ([v25 rehydrationFailCount])
          {
            double v29 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v25 category] provider:[v25 provider] failureCount:[v25 rehydrationFailCount]];
            id v52 = 0;
            [(MORehydrationThresholdMetrics *)v29 submitMetricsWithError:&v52];
            id v30 = v52;
            [v28 setRehydrationFailCount:0];
            [v47 addObject:v25];
          }
          [(MOSignificantContactManager *)self _setDynamicPropertiesForEvent:v28 fromCoversation:v27];
          [v50 addObject:v28];
        }
      }
      id v22 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
    }
    while (v22);
  }

  uint64_t v31 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v50 count];
    *(_DWORD *)buf = 134217984;
    id v63 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "rehydrated contact events count, %lu", buf, 0xCu);
  }

  id v33 = [MORehydrationMetrics alloc];
  id v34 = [obj firstObject];
  id v35 = [v34 category];
  uint64_t v36 = [obj firstObject];
  BOOL v37 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v33, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v35, [v36 provider], 1, 0, [obj count], 3, (double)(int)[obj count] - [v50 count], (double)(int)[v47 count]);

  uint64_t v51 = 0;
  [(MORehydrationMetrics *)v37 submitMetricsWithError:&v51];

  id v6 = v44;
  id v5 = v45;
LABEL_34:

  return v50;
}

- (id)_fetchClassificationForSignificantContacts:(id)a3
{
  id v70 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v4;
  if (!self->_visualIdentifierView)
  {
    id v44 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "#megadome,visualIdentifierView is nil", buf, 2u);
    }
    goto LABEL_55;
  }
  if (!self->_entityTaggingSerice)
  {
    id v44 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager _fetchClassificationForSignificantContacts:]();
    }
LABEL_55:

    id v45 = v5;
    goto LABEL_71;
  }
  v64 = v4;
  id v69 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = [v70 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v92 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#megadome,fetchClassificationInfo,contactIdentifier,%@", buf, 0xCu);
        }

        id v12 = [(GDVisualIdentifierView *)self->_visualIdentifierView personForIdentifier:v10];
        double v13 = [v12 entityIdentifier];
        float v14 = [v13 stringValue];

        unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)uint64_t v92 = v10;
          *(_WORD *)&v92[8] = 2112;
          *(void *)&v92[10] = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#megadome,CNContactID,%@,contactIdentifierMD,%@", buf, 0x16u);
        }

        if (v14)
        {
          [v69 setObject:v10 forKey:v14];
        }
        else
        {
          uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v92 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#megadome,could not get MD identifier for contactIdentifier %@", buf, 0xCu);
          }

          id v17 = [v70 objectForKey:v10];
          id v18 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
          [v64 setObject:v18 forKey:v17];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v7);
  }

  uint64_t v19 = v69;
  uint64_t v20 = [v69 allKeys];
  id v21 = [v20 count];

  if (v21)
  {
    id v22 = [objc_alloc((Class)GDPersonTaggingOptions) initWithTagThresholds:&off_1002F9A00];
    entityTaggingSerice = self->_entityTaggingSerice;
    uint64_t v24 = [v69 allKeys];
    id v83 = 0;
    id v25 = [(GDEntityTaggingService *)entityTaggingSerice entityTagsForIdentifiers:v24 options:v22 error:&v83];
    id v26 = v83;

    id v5 = v64;
    if (v26 || !v25)
    {
      uint64_t v48 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[MOSignificantContactManager _fetchClassificationForSignificantContacts:]();
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v63 = [v69 allKeys];
      id v49 = [v63 countByEnumeratingWithState:&v79 objects:v90 count:16];
      if (v49)
      {
        id v50 = v49;
        id v59 = v26;
        uint64_t v51 = *(void *)v80;
        do
        {
          for (j = 0; j != v50; j = (char *)j + 1)
          {
            if (*(void *)v80 != v51) {
              objc_enumerationMutation(v63);
            }
            long long v53 = [v69 objectForKey:*(void *)(*((void *)&v79 + 1) + 8 * (void)j)];
            long long v54 = [v70 objectForKey:v53];
            long long v55 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
            [v64 setObject:v55 forKey:v54];
          }
          id v50 = [v63 countByEnumeratingWithState:&v79 objects:v90 count:16];
        }
        while (v50);
        id v26 = v59;
      }
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v63 = [v69 allKeys];
      CFStringRef v62 = (char *)[v63 countByEnumeratingWithState:&v75 objects:v89 count:16];
      if (v62)
      {
        id v58 = v22;
        uint64_t v61 = *(void *)v76;
        long long v60 = v25;
        do
        {
          double v27 = 0;
          do
          {
            if (*(void *)v76 != v61) {
              objc_enumerationMutation(v63);
            }
            uint64_t v65 = *(void *)(*((void *)&v75 + 1) + 8 * (void)v27);
            id v28 = [v25 objectForKey:v58];
            double v29 = [v28 scoredPersonEntityTags];

            obja = v27;
            __int16 v66 = v29;
            if ([v29 count])
            {
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              id v30 = v29;
              id v31 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
              if (v31)
              {
                id v32 = v31;
                LODWORD(v33) = 0;
                uint64_t v34 = *(void *)v72;
                do
                {
                  for (k = 0; k != v32; k = (char *)k + 1)
                  {
                    if (*(void *)v72 != v34) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v36 = *(void **)(*((void *)&v71 + 1) + 8 * (void)k);
                    BOOL v37 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                    {
                      id v38 = [v36 tag];
                      [v36 score];
                      *(_DWORD *)buf = 134218240;
                      *(void *)uint64_t v92 = v38;
                      *(_WORD *)&v92[8] = 2048;
                      *(void *)&v92[10] = v39;
                      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#megadome,personTag,%ld,score,%f", buf, 0x16u);
                    }

                    if ([v36 tag] == (id)26)
                    {
                      uint64_t v33 = v33 | 0x100008;
                    }
                    else if ([v36 tag] == (id)22)
                    {
                      uint64_t v33 = v33 | 0x200000;
                    }
                    else
                    {
                      uint64_t v33 = v33;
                    }
                  }
                  id v32 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
                }
                while (v32);
              }
              else
              {
                uint64_t v33 = 0;
              }

              id v5 = v64;
              uint64_t v19 = v69;
              id v25 = v60;
            }
            else
            {
              uint64_t v33 = 0;
            }
            long long v40 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)uint64_t v92 = v33;
              *(_WORD *)&v92[4] = 2112;
              *(void *)&v92[6] = v65;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "#megadome,classification,%u, for contact id,%@", buf, 0x12u);
            }

            id v41 = [v19 objectForKey:v65];
            long long v42 = [v70 objectForKey:v41];
            id v43 = +[NSNumber numberWithInt:v33];
            [v5 setObject:v43 forKey:v42];

            double v27 = obja + 1;
          }
          while (obja + 1 != v62);
          CFStringRef v62 = (char *)[v63 countByEnumeratingWithState:&v75 objects:v89 count:16];
        }
        while (v62);
        id v22 = v58;
        id v26 = 0;
      }
    }

    id v56 = v5;
  }
  else
  {
    id v46 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    id v5 = v64;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager _fetchClassificationForSignificantContacts:]();
    }

    id v47 = v64;
  }

LABEL_71:

  return v5;
}

- (void)_setDynamicPropertiesForEvent:(id)a3 fromCoversation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 scoredContact];
  [v7 score];
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v5 setInteractionContactScore:v8];

  id v9 = [v6 scoredContact];
  [v5 setInteractionScoredContact:v9];

  uint64_t v10 = [v6 interactions];
  id v11 = [v10 count];

  if (v11)
  {
    id v12 = [v6 interactions];
    double v13 = [v12 objectAtIndexedSubscript:0];
    float v14 = [v13 groupName];
    [v5 setInteractionGroupName:v14];
  }
  unsigned int v15 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = [v6 interactions];
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(*((void *)&v23 + 1) + 8 * (void)v20) mechanism]);
        [v15 addObject:v21];

        uint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  [v5 setInteractionMechanisms:v15];
  id v22 = [v6 interactions];
  [v5 setInteractions:v22];
}

- (void)fetchAndSaveConversationsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002CAD10;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(MOSignificantContactManager *)v9 _fetchInteractionsBetweenStartDate:a3 EndDate:a4 CompletionHandler:v8];
}

void __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v6, 0);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke_2;
    v9[3] = &unk_1002C9A50;
    uint64_t v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 _saveConversations:v5 handler:v9];
  }
}

uint64_t __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)rehydrateConversations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MOSignificantContactManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOSignificantContactManager_rehydrateConversations_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __62__MOSignificantContactManager_rehydrateConversations_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateConversations:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateConversations:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 getDurationOfMOEventArray];
  id v9 = [v8 startDate];
  id v10 = [v8 endDate];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __63__MOSignificantContactManager__rehydrateConversations_handler___block_invoke;
  v13[3] = &unk_1002CAD60;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(MOSignificantContactManager *)self _fetchInteractionsBetweenStartDate:v9 EndDate:v10 CompletionHandler:v13];
}

void __63__MOSignificantContactManager__rehydrateConversations_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = [v5 _rehydrateStoredEvents:v6 fromConversations:a2];
  [*(id *)(a1 + 32) _updateClassificationForEvents:v8];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateConversationsDeletedAtSource:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __74__MOSignificantContactManager_updateConversationsDeletedAtSource_handler___block_invoke;
  v7[3] = &unk_1002C9A50;
  id v8 = a4;
  id v6 = v8;
  [(MOSignificantContactManager *)self _updateConversationsDeletedAtSource:a3 handler:v7];
  [(MOSignificantContactManager *)self waitForQueueEmpty];
}

uint64_t __74__MOSignificantContactManager_updateConversationsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateConversationsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v39 = a4;
  long long v42 = v5;
  id v41 = [v5 getDurationOfMOEventArray];
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = __Block_byref_object_copy__5;
  __int16 v66 = __Block_byref_object_dispose__5;
  id v67 = 0;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = __Block_byref_object_copy__5;
  long long v60 = __Block_byref_object_dispose__5;
  id v61 = 0;
  id v6 = [v41 startDate];
  id v7 = [v41 endDate];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke;
  v55[3] = &unk_1002CAC98;
  v55[4] = &v62;
  v55[5] = &v56;
  [(MOSignificantContactManager *)self _fetchInteractionsBetweenStartDate:v6 EndDate:v7 CompletionHandler:v55];

  [(MOSignificantContactManager *)self waitForQueueEmpty];
  if (v63[5])
  {
    id v43 = (MORehydrationMetrics *)objc_alloc_init((Class)NSMutableArray);
    id v44 = objc_alloc_init((Class)NSMutableArray);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = v42;
    id v9 = [v8 countByEnumeratingWithState:&v50 objects:v70 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v13 = (void *)v63[5];
          id v14 = [v12 identifierFromProvider];
          id v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            if ([v12 rehydrationFailCount])
            {
              uint64_t v16 = [[MORehydrationThresholdMetrics alloc] initWithCategory:[v12 category] provider:[v12 provider] failureCount:[v12 rehydrationFailCount]];
              id v49 = 0;
              [(MORehydrationThresholdMetrics *)v16 submitMetricsWithError:&v49];
              id v17 = v49;
              [v12 setRehydrationFailCount:0];
              [v44 addObject:v12];
            }
          }
          else
          {
            [v12 setRehydrationFailCount:((char *)[v12 rehydrationFailCount]) + 1];
            [(MORehydrationMetrics *)v43 addObject:v12];
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v50 objects:v70 count:16];
      }
      while (v9);
    }

    id v18 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [(MORehydrationMetrics *)v43 count];
      *(_DWORD *)buf = 134217984;
      id v69 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%ld previously saved conversation(s) not found, therefore deleting them.", buf, 0xCu);
    }

    uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v44 count];
      *(_DWORD *)buf = 134217984;
      id v69 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%ld previously rehydration failed conversation(s) now are found, therefore change rehydration failure count.", buf, 0xCu);
    }

    id v22 = [MORehydrationMetrics alloc];
    long long v23 = [v8 firstObject];
    id v24 = [v23 category];
    long long v25 = [v8 firstObject];
    long long v26 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v22, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v24, [v25 provider], 1, 0, [v8 count], 1, (double)[MORehydrationMetrics count](v43, "count"), (double)[MORehydrationMetrics count](v44, "count"));

    id v48 = 0;
    [(MORehydrationMetrics *)v26 submitMetricsWithError:&v48];
    id v27 = v48;
    id v28 = [(MORehydrationMetrics *)v43 copy];
    [v44 addObjectsFromArray:v28];

    double v29 = [(MOSignificantContactManager *)self momentStore];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_466;
    v45[3] = &unk_1002CACE8;
    id v30 = v44;
    id v46 = v30;
    id v47 = v39;
    [v29 storeEvents:v30 CompletionHandler:v45];

    id v31 = v43;
  }
  else
  {
    id v32 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[MOSignificantContactManager _updateConversationsDeletedAtSource:handler:]();
    }

    if (v39) {
      (*((void (**)(id, uint64_t, void *))v39 + 2))(v39, v57[5], &__NSDictionary0__struct);
    }
    uint64_t v33 = [MORehydrationMetrics alloc];
    uint64_t v34 = [v42 firstObject];
    id v35 = [v34 category];
    uint64_t v36 = [v42 firstObject];
    id v37 = [v36 provider];
    id v38 = [(id)v57[5] description];
    id v31 = [[MORehydrationMetrics alloc] initWithCategory:v33 provider:v37 spiSuccess:0 spiError:v38 failCount:[v42 count] successAfterPreFailCount:1 totalCount:(double)(int)[v42 count] rehydrationTrigger:0.0];

    uint64_t v54 = 0;
    [(MORehydrationMetrics *)v31 submitMetricsWithError:&v54];
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
}

void __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v5 count]];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v17 = [v15 providerId:v20];
        [v16 setObject:v15 forKeyedSubscript:v17];
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v6;
}

void __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_466(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_466_cold_1(a1, (uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) count];
    int v11 = 134217984;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "update %ld significant contact event(s) in database succeeded!", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)waitForQueueEmpty
{
}

- (void)fetchConversationEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOSignificantContactManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __104__MOSignificantContactManager_fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002CA300;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

id __104__MOSignificantContactManager_fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchConversationEventsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) withStoredEvents:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_fetchConversationEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 10];
  id v15 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 3];
  v30[0] = v14;
  v30[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v30 count:2];
  id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

  [v12 filteredArrayUsingPredicate:v17];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __105__MOSignificantContactManager__fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v23[3] = &unk_1002CADA8;
  id v24 = v12;
  long long v25 = self;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = v10;
  id v28 = v11;
  id v29 = v13;
  id v18 = v11;
  id v19 = v10;
  id v20 = v26;
  id v21 = v12;
  id v22 = v13;
  [(MOSignificantContactManager *)self _fetchInteractionsBetweenStartDate:v19 EndDate:v18 CompletionHandler:v23];
}

void __105__MOSignificantContactManager__fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  if (v6)
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetching interactions from source hit error", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    id v10 = [MORehydrationMetrics alloc];
    id v11 = [v6 description];
    id v12 = [-MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v10, 10, 3, 0, v11, [*(id *)(a1 + 32) count], 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    uint64_t v22 = 0;
    [(MORehydrationMetrics *)v12 submitMetricsWithError:&v22];
  }
  else
  {
    id v12 = [*(id *)(a1 + 40) _rehydrateStoredEvents:*(void *)(a1 + 48) fromConversations:v5];
    id v13 = [*(id *)(a1 + 40) _createNewEventsFromConversations:v5 storedEvents:*(void *)(a1 + 48)];
    id v14 = [*(id *)(a1 + 40) _findUnrehydratedEventsWithStoredEvents:*(void *)(a1 + 48) conversations:v5];
    id v15 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 64);
      id v19 = [(MORehydrationMetrics *)v12 count];
      id v18 = [v13 count];
      id v16 = [v14 count];
      id v17 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138413570;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      id v28 = v19;
      __int16 v29 = 2048;
      id v30 = v18;
      __int16 v31 = 2048;
      id v32 = v16;
      __int16 v33 = 2048;
      id v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated contact events count, %lu, new contact events counts, %lu, unrehydrated contact events count, %lu, stored contact events count, %lu", buf, 0x3Eu);
    }

    if (v14) {
      [v7 setObject:v14 forKey:@"unrehydratedEvents"];
    }
    if (v13)
    {
      [v7 setObject:v13 forKey:@"newEvents"];
      [v8 addObjectsFromArray:v13];
    }
    if (v12)
    {
      [v7 setObject:v12 forKey:@"rehydratedEvents"];
      [v8 addObjectsFromArray:v12];
    }
    [*(id *)(a1 + 40) _updateClassificationForEvents:v8];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

- (void)_updateClassificationForEvents:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v11 significantContactEvent];
        id v13 = [v12 interactions];
        id v14 = [v13 count];

        if (v14)
        {
          id v15 = [v11 significantContactEvent];
          id v16 = [v15 interactions];
          id v17 = [v16 firstObject];
          [v5 addObject:v17];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v8);
  }

  id v18 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v5 count];
    *(_DWORD *)buf = 134217984;
    id v37 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "interactions count, %lu", buf, 0xCu);
  }

  uint64_t v20 = [(MOSignificantContactManager *)self _collectSignificantContactsFromInteractions:v5];
  uint64_t v21 = [(MOSignificantContactManager *)self _fetchClassificationForSignificantContacts:v20];
  if ([v6 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v22 = v6;
    id v23 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          -[MOSignificantContactManager _updateClassificationForEvent:withClassificationDict:contactDict:](self, "_updateClassificationForEvent:withClassificationDict:contactDict:", *(void *)(*((void *)&v27 + 1) + 8 * (void)j), v21, v20, (void)v27);
        }
        id v24 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v24);
    }
  }
  else
  {
    uint64_t v22 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "No MOEvents to be updated for classification", buf, 2u);
    }
  }
}

- (void)_updateClassificationForEvent:(id)a3 withClassificationDict:(id)a4 contactDict:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v73 = objc_opt_new();
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = [v7 significantContactEvent];
  id v12 = [v11 interactions];
  id v66 = v10;
  if ([v12 count])
  {
    id v13 = [v7 significantContactEvent];
    id v14 = [v13 interactions];
    id v15 = [v14 objectAtIndexedSubscript:0];
    id v16 = [v15 sender];
    uint64_t v17 = [v16 personId];
    if (v17)
    {
      id v18 = (void *)v17;
      id v63 = [v7 significantContactEvent];
      [v63 interactions];
      long long v60 = v71 = v11;
      [v60 objectAtIndexedSubscript:0];
      v19 = id v69 = v14;
      [v19 sender];
      uint64_t v20 = v67 = v13;
      [v20 personId];
      uint64_t v21 = v61 = v15;
      uint64_t v22 = [v9 objectForKey:v21];

      id v10 = v66;
      if (!v22) {
        goto LABEL_7;
      }
      id v23 = [v7 significantContactEvent];
      id v24 = [v23 interactions];
      uint64_t v25 = [v24 objectAtIndexedSubscript:0];
      uint64_t v26 = [v25 sender];
      id v11 = [v26 personId];

      id v12 = [v9 objectForKey:v11];
      [v73 addObject:v12];
    }
    else
    {

      id v10 = v66;
    }
  }

LABEL_7:
  long long v27 = [v7 significantContactEvent];
  long long v28 = [v27 interactions];
  id v29 = [v28 count];

  if (v29)
  {
    id v64 = v8;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v30 = v7;
    long long v31 = [v7 significantContactEvent];
    long long v32 = [v31 interactions];
    long long v33 = [v32 objectAtIndexedSubscript:0];
    long long v34 = [v33 recipients];

    id v35 = [v34 countByEnumeratingWithState:&v78 objects:v89 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v36; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v79 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v40 = [v39 personId];
          if (v40)
          {
            id v41 = (void *)v40;
            long long v42 = [v39 personId];
            id v43 = [v9 objectForKey:v42];

            if (v43)
            {
              id v44 = [v39 personId];
              id v45 = [v9 objectForKey:v44];
              [v73 addObject:v45];
            }
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v78 objects:v89 count:16];
      }
      while (v36);
    }

    id v7 = v30;
    id v8 = v64;
    id v10 = v66;
  }
  if ([v73 count]
    && ([v8 allKeys],
        id v46 = objc_claimAutoreleasedReturnValue(),
        id v47 = [v46 count],
        v46,
        v47))
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v48 = v73;
    id v49 = [v48 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v49)
    {
      id v50 = v49;
      id v62 = v7;
      uint64_t v51 = *(void *)v75;
      id v65 = v8;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(v48);
          }
          long long v53 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
          uint64_t v54 = [v8 objectForKey:v53];
          if (v54)
          {
            [v10 setObject:v54 forKey:v53];
            long long v55 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              long long v72 = [v53 contact];
              id v68 = [v72 identifier];
              id v70 = [v53 contact];
              uint64_t v56 = [v70 givenName];
              long long v57 = [v56 mask];
              *(_DWORD *)buf = 138412802;
              id v83 = v54;
              __int16 v84 = 2112;
              long long v85 = v68;
              __int16 v86 = 2112;
              long long v87 = v57;
              _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "_updateClassificationForEvent, classification, %@, contactID, %@, name, %@", buf, 0x20u);

              id v10 = v66;
              id v8 = v65;
            }
          }
        }
        id v50 = [v48 countByEnumeratingWithState:&v74 objects:v88 count:16];
      }
      while (v50);
      id v7 = v62;
    }
  }
  else
  {
    id v48 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "No contacts or no classification dictionary", buf, 2u);
    }
  }

  uint64_t v58 = [v7 significantContactEvent];
  [v58 setContactClassificationMap:v10];

  id v59 = [v7 significantContactEvent];
  [v59 setInteractionContacts:v73];
}

- (id)_createEventsFromConversations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v12 = -[MOSignificantContactManager _createEventFromConversation:](self, "_createEventFromConversation:", v11, (void)v14);
          [(MOSignificantContactManager *)self _setDynamicPropertiesForEvent:v12 fromCoversation:v11];
          [v5 addObject:v12];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "no conversation for creating events", buf, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)_createNewEventsFromConversations:(id)a3 storedEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if ([v7 count])
    {
      long long v28 = self;
      id v8 = objc_opt_new();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v29 = v7;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = [*(id *)(*((void *)&v34 + 1) + 8 * i) identifierFromProvider:v28];
            [v8 addObject:v14];
          }
          id v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v11);
      }

      long long v15 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v6;
      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
            uint64_t v22 = [v21 providerId:v28];
            unsigned __int8 v23 = [v8 containsObject:v22];

            if ((v23 & 1) == 0) {
              [v15 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v18);
      }

      id v24 = [(MOSignificantContactManager *)v28 _createEventsFromConversations:v15];

      id v7 = v29;
    }
    else
    {
      uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no stored events to check for creating new contact events", buf, 2u);
      }

      id v24 = [(MOSignificantContactManager *)self _createEventsFromConversations:v6];
    }
  }
  else
  {
    uint64_t v25 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "no workouts for creating new contact events", buf, 2u);
    }

    id v24 = 0;
  }

  return v24;
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 conversations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if ([v6 count])
    {
      id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v6, "count")];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v33 = v6;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v39 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            long long v14 = [v13 providerId];
            [v7 setObject:v13 forKeyedSubscript:v14];
          }
          id v10 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v10);
      }

      id v15 = objc_alloc_init((Class)NSMutableArray);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
            uint64_t v22 = [v21 identifierFromProvider];
            unsigned __int8 v23 = [v7 objectForKeyedSubscript:v22];

            if (!v23)
            {
              [v21 setRehydrationFailCount:[v21 rehydrationFailCount] + 1];
              [v15 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v18);
      }

      id v6 = v33;
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v25 = v5;
      id v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v43;
        do
        {
          for (k = 0; k != v27; k = (char *)k + 1)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v42 + 1) + 8 * (void)k) setRehydrationFailCount:[*(id *)(*((void *)&v42 + 1) + 8 * (void)k) rehydrationFailCount] + 1];
          }
          id v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v27);
      }

      long long v30 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = [v25 count];
        *(_DWORD *)buf = 134217984;
        id v49 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "no conversation fetched ,so all stored contact events are unrehydrated, count, %lu", buf, 0xCu);
      }

      id v15 = v25;
    }
  }
  else
  {
    id v24 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "no stored contact events for finding unrehydrated events", buf, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (PPContactStore)ppContactStore
{
  return self->_ppContactStore;
}

- (CNContactStore)cnContactStore
{
  return self->_cnContactStore;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (GDVisualIdentifierView)visualIdentifierView
{
  return self->_visualIdentifierView;
}

- (GDEntityTaggingService)entityTaggingSerice
{
  return self->_entityTaggingSerice;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_entityTaggingSerice, 0);
  objc_storeStrong((id *)&self->_visualIdentifierView, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_cnContactStore, 0);
  objc_storeStrong((id *)&self->_ppContactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_meIdentifiers, 0);
  objc_storeStrong((id *)&self->_callLikeMechanismsSet, 0);

  objc_storeStrong((id *)&self->_tollFreeNumberPrefixes, 0);
}

- (void)initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: momentStore", v2, v3, v4, v5, v6);
}

- (void)intializeEntityTaggingService
{
  uint64_t v3 = [*a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#megadome,GDEntityTaggingService init failed,error,%@", v4, 0xCu);
}

- (void)_eligibleInteraction:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(a1);
  uint8_t v6 = [a2 mask];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, filter out ineligible interaction with phone number, %@", (uint8_t *)&v7, 0x16u);
}

- (void)_collectSignificantContactsFromInteractions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Ranked contact query error: %@", v2, v3, v4, v5, v6);
}

void __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint8_t v6 = [a2 contact];
  int v7 = [v6 localizedFullName];
  id v8 = [v7 mask];
  __int16 v9 = [a2 contact];
  id v10 = [v9 identifier];
  [a2 score];
  int v12 = 138413058;
  id v13 = v5;
  __int16 v14 = 2112;
  id v15 = v8;
  __int16 v16 = 2112;
  id v17 = v10;
  __int16 v18 = 2048;
  uint64_t v19 = v11;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, name: %@, identifier: %@, score: %f", (uint8_t *)&v12, 0x2Au);
}

- (void)_conversationsFromInteractions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, " ---  Grouped Interactions Count  :%3lu", v1, 0xCu);
}

- (void)_conversationsFromInteractions:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, " ---  Received Interactions Count :%3lu", v3, 0xCu);
}

- (void)_saveConversations:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "No conversations will be saved this round", v2, v3, v4, v5, v6);
}

- (void)_saveConversations:(uint64_t)a3 handler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_450_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving conversations into database failed with error, %@", v2, v3, v4, v5, v6);
}

- (void)_fetchClassificationForSignificantContacts:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "#megadome,GDEntityTaggingService init failed", v2, v3, v4, v5, v6);
}

- (void)_fetchClassificationForSignificantContacts:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "#megadome,no mega person ID is found", v2, v3, v4, v5, v6);
}

- (void)_fetchClassificationForSignificantContacts:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "#megadome,GDRankedPersonEntityTags fetch hit error, %@", v2, v3, v4, v5, v6);
}

- (void)_updateConversationsDeletedAtSource:handler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "nil query result from interactions fetching, no events removed.", v2, v3, v4, v5, v6);
}

void __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_466_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "update %ld significant contact event(s) in database failed, error %@", v5, 0x16u);
}

@end