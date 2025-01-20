@interface STFamilyOrganizationController
- (BOOL)validateBlueprintDictionary:(id)a3;
- (NSFetchedResultsController)installedAppsFetchedResultsController;
- (NSFetchedResultsController)usageRequestsFetchedResultsController;
- (NSMutableDictionary)fetchUsageOperationByAltURI;
- (NSOperationQueue)fetchUsageOperationQueue;
- (NSOperationQueue)persistUsageOperationQueue;
- (OS_dispatch_queue)usageQueue;
- (STAskForTimeManager)askForTimeManager;
- (STConduit)conduit;
- (STFamily)cachedFamily;
- (STFamilyOrganizationController)initWithPersistenceController:(id)a3 askForTimeManager:(id)a4;
- (STFamilySettingsManager)familySettingsManager;
- (STGroupFetchedResultsController)settingsResultsController;
- (STPersistenceControllerProtocol)persistenceController;
- (STRequestManagerBlueprintSourceDelegate)blueprintSourceDelegate;
- (void)_enqueueOperationToFetchUsageForRequestPayload:(id)a3;
- (void)_enqueueOperationToPersistUsageForResponsePayload:(id)a3;
- (void)_fetchUsageOperationDidFinish:(id)a3 requestingAltURI:(id)a4;
- (void)_handleCheckinRequestPayload:(id)a3;
- (void)_handleCheckinResponsePayload:(id)a3;
- (void)_handleIDSAccountBecameActiveNotification:(id)a3;
- (void)_sendCheckinRequestOnAccountOfReachabilityChange;
- (void)_sendCheckinRequestPayloadToDestination:(id)a3;
- (void)_sendCheckinRequestPayloadToDestination:(id)a3 context:(id)a4;
- (void)_sendCheckinResponseToDestination:(id)a3 afterVersions:(id)a4;
- (void)_sendCheckinResponseToDestination:(id)a3 afterVersions:(id)a4 context:(id)a5;
- (void)_sendOutUsageRequestsIfNeeded;
- (void)_startListeningForIDSAccountBecameActiveNotifications;
- (void)_stopListeningForIDSAccountBecameActiveNotifications;
- (void)conduit:(id)a3 didDeliverTransportPayload:(id)a4;
- (void)conduit:(id)a3 didReceiveTransportPayload:(id)a4;
- (void)conduitDidInvalidate:(id)a3;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)groupResultsControllerDidChangeContents:(id)a3;
- (void)loudlySendLegacyAskRequest:(id)a3 toSpecificDeviceIDSDestinations:(id)a4;
- (void)reachabilityDidChange:(id)a3;
- (void)sendAskRequestToParents:(id)a3 toParentsWithDSIDs:(id)a4;
- (void)sendAskResponse:(id)a3 toChildWithDSID:(id)a4 toParentsWithDSIDs:(id)a5;
- (void)sendCheckinRequest;
- (void)sendCheckinResponseToDestination:(id)a3;
- (void)sendFamilySettingsPayload;
- (void)sendPayloads:(id)a3;
- (void)setAskForTimeManager:(id)a3;
- (void)setBlueprintSourceDelegate:(id)a3;
- (void)setCachedFamily:(id)a3;
- (void)setConduit:(id)a3;
- (void)setFamilySettingsManager:(id)a3;
- (void)setFetchUsageOperationByAltURI:(id)a3;
- (void)setFetchUsageOperationQueue:(id)a3;
- (void)setInstalledAppsFetchedResultsController:(id)a3;
- (void)setPersistUsageOperationQueue:(id)a3;
- (void)setSettingsResultsController:(id)a3;
- (void)setUsageQueue:(id)a3;
- (void)setUsageRequestsFetchedResultsController:(id)a3;
- (void)updateWithFamily:(id)a3 inContext:(id)a4;
@end

@implementation STFamilyOrganizationController

- (STFamilyOrganizationController)initWithPersistenceController:(id)a3 askForTimeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)STFamilyOrganizationController;
  v9 = [(STFamilyOrganizationController *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistenceController, a3);
    v11 = [STFamilySettingsManager alloc];
    v12 = [(STFamilyOrganizationController *)v10 persistenceController];
    v13 = [(STFamilySettingsManager *)v11 initWithCapabilities:0 persistenceController:v12];
    familySettingsManager = v10->_familySettingsManager;
    v10->_familySettingsManager = v13;

    objc_storeStrong((id *)&v10->_askForTimeManager, a4);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ScreenTimeAgent.family-screen-time-manager.usage", 0);
    usageQueue = v10->_usageQueue;
    v10->_usageQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_opt_new();
    fetchUsageOperationQueue = v10->_fetchUsageOperationQueue;
    v10->_fetchUsageOperationQueue = (NSOperationQueue *)v17;

    [(NSOperationQueue *)v10->_fetchUsageOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_fetchUsageOperationQueue setName:@"com.apple.ScreenTimeAgent.family-screen-time-manager.fetch-usage"];
    uint64_t v19 = objc_opt_new();
    persistUsageOperationQueue = v10->_persistUsageOperationQueue;
    v10->_persistUsageOperationQueue = (NSOperationQueue *)v19;

    [(NSOperationQueue *)v10->_persistUsageOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_persistUsageOperationQueue setName:@"com.apple.ScreenTimeAgent.family-screen-time-manager.persist-usage"];
    uint64_t v21 = objc_opt_new();
    fetchUsageOperationByAltURI = v10->_fetchUsageOperationByAltURI;
    v10->_fetchUsageOperationByAltURI = (NSMutableDictionary *)v21;

    v23 = +[NSNotificationCenter defaultCenter];
    v24 = +[STNetworkDetector sharedInstance];
    [v23 addObserver:v10 selector:"reachabilityDidChange:" name:@"STNetworkDetectorChangedNotificationName" object:v24];
  }
  return v10;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_fetchUsageOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_persistUsageOperationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)STFamilyOrganizationController;
  [(STFamilyOrganizationController *)&v3 dealloc];
}

- (void)reachabilityDidChange:(id)a3
{
  id v4 = [a3 object];
  if ([v4 isOnline])
  {
    [(STFamilyOrganizationController *)self _sendCheckinRequestOnAccountOfReachabilityChange];
    [(STFamilyOrganizationController *)self sendCheckinResponseToDestination:0];
  }
}

- (void)updateWithFamily:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v116 = a4;
  objc_storeStrong((id *)&self->_cachedFamily, a3);
  id v8 = +[STLog familyScreenTimeManager];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing iCloud family", buf, 2u);
    }

    id v120 = 0;
    v34 = +[STCoreUser fetchLocalUserInContext:v116 error:&v120];
    id v35 = v120;
    if (v34)
    {
      [v34 setContactsEditable:1];
    }
    else
    {
      v55 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_10025E7A0();
      }
    }
    id v119 = v35;
    v36 = +[STFamilyOrganization fetchOrCreateFamilyOrganizationWithContext:v116 error:&v119];
    id v37 = v119;

    if (v36)
    {
      v56 = [v36 settings];
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472;
      v117[2] = sub_10003425C;
      v117[3] = &unk_1002FC5F8;
      v57 = v116;
      v118 = v57;
      [v56 enumerateObjectsUsingBlock:v117];

      v58 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Deleting Family Organization", buf, 2u);
      }

      [v57 deleteObject:v36];
      v59 = [(STFamilyOrganizationController *)self conduit];
      [v59 invalidate];

      [(STFamilyOrganizationController *)self setConduit:0];
      v60 = [(STFamilyOrganizationController *)self settingsResultsController];
      [v60 setDelegate:0];

      [(STFamilyOrganizationController *)self setSettingsResultsController:0];
      v61 = [(STFamilyOrganizationController *)self usageRequestsFetchedResultsController];
      [v61 setDelegate:0];

      [(STFamilyOrganizationController *)self setUsageRequestsFetchedResultsController:0];
      v62 = [(STFamilyOrganizationController *)self fetchUsageOperationQueue];
      [v62 cancelAllOperations];

      v63 = [(STFamilyOrganizationController *)self persistUsageOperationQueue];
      [v63 cancelAllOperations];

      v64 = [(STFamilyOrganizationController *)self familySettingsManager];
      [v64 registerFamilyMembers:&__NSArray0__struct];

      [(STFamilyOrganizationController *)self _stopListeningForIDSAccountBecameActiveNotifications];
      v40 = v118;
    }
    else
    {
      v40 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        sub_10025E738();
      }
    }
    goto LABEL_77;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating iCloud family", buf, 2u);
  }
  v111 = self;

  v115 = objc_opt_new();
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v110 = v7;
  v10 = [v7 members];
  id v11 = [v10 countByEnumeratingWithState:&v129 objects:v142 count:16];
  if (!v11)
  {
    id v13 = 0;
    goto LABEL_32;
  }
  id v12 = v11;
  id v13 = 0;
  uint64_t v14 = *(void *)v130;
  dispatch_queue_t v15 = (void *)STFamilyMemberTypeUnknown;
  uint64_t v113 = STErrorDomain;
  do
  {
    v16 = 0;
    uint64_t v17 = v13;
    do
    {
      if (*(void *)v130 != v14) {
        objc_enumerationMutation(v10);
      }
      v18 = *(void **)(*((void *)&v129 + 1) + 8 * (void)v16);
      uint64_t v19 = [v18 memberType];

      if (v19 == v15)
      {
        id v13 = v17;
        goto LABEL_24;
      }
      v20 = [v18 DSID];
      id v128 = v17;
      uint64_t v21 = +[STCoreUser fetchUserWithDSID:v20 inContext:v116 error:&v128];
      id v13 = v128;

      if (!v21)
      {
        v31 = [v13 domain];
        if (![v31 isEqualToString:v113])
        {

LABEL_21:
          uint64_t v21 = +[STLog familyScreenTimeManager];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v139 = v18;
            __int16 v140 = 2112;
            id v141 = v13;
            _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "failed to create user %@: %@", buf, 0x16u);
          }
          goto LABEL_23;
        }
        id v32 = [v13 code];

        if (v32 != (id)11) {
          goto LABEL_21;
        }
        uint64_t v21 = [objc_alloc((Class)STCoreUser) initWithContext:v116];
        v33 = [v18 DSID];
        [v21 setDsid:v33];
      }
      v22 = [v21 localUserDeviceState];

      if (!v22)
      {
        v23 = [v18 appleID];
        [v21 setAppleID:v23];

        v24 = [v18 firstName];
        [v21 setGivenName:v24];

        v25 = [v18 lastName];
        [v21 setFamilyName:v25];
      }
      objc_super v26 = [v18 altDSID];
      [v21 setAltDSID:v26];

      -[NSObject setIsFamilyOrganizer:](v21, "setIsFamilyOrganizer:", [v18 isOrganizer]);
      -[NSObject setIsParent:](v21, "setIsParent:", [v18 isParent]);
      v27 = [v18 memberType];
      [v21 setFamilyMemberType:v27];

      v28 = [v21 familySettings];

      if (!v28)
      {
        id v29 = [objc_alloc((Class)STFamilyOrganizationSettings) initWithContext:v116];
        [v21 setFamilySettings:v29];
      }
      v30 = [v21 familySettings];
      [v115 addObject:v30];

LABEL_23:
      uint64_t v17 = v13;
LABEL_24:
      v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    id v12 = [v10 countByEnumeratingWithState:&v129 objects:v142 count:16];
  }
  while (v12);
LABEL_32:

  id v127 = v13;
  v36 = +[STFamilyOrganization fetchOrCreateFamilyOrganizationWithContext:v116 error:&v127];
  id v37 = v127;

  if (v36)
  {
    id v109 = v37;
    v112 = v36;
    v38 = [v36 settings];
    v39 = +[NSMutableSet setWithSet:v38];

    [v39 minusSet:v115];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v40 = v39;
    id v41 = [v40 countByEnumeratingWithState:&v123 objects:v137 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v124;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v124 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          v46 = +[STLog familyScreenTimeManager];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = [v45 user];
            *(_DWORD *)buf = 138412290;
            v139 = v47;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Deleting removed family member: %@", buf, 0xCu);
          }
          v48 = [v45 user];
          [v116 deleteObject:v48];

          [v116 deleteObject:v45];
        }
        id v42 = [v40 countByEnumeratingWithState:&v123 objects:v137 count:16];
      }
      while (v42);
    }

    v34 = v115;
    [v36 setSettings:v115];
    v49 = [(STFamilyOrganizationController *)v111 conduit];

    if (v49)
    {
      id v37 = v109;
      id v7 = v110;
      goto LABEL_77;
    }
    v50 = +[STLog familyScreenTimeManager];
    id v7 = v110;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Starting conduit and database observers for family", buf, 2u);
    }

    uint64_t v51 = objc_opt_new();
    v52 = [v110 me];
    v53 = [v52 memberType];
    uint64_t v54 = STFamilyMemberTypeChild;
    if ([v53 isEqualToString:STFamilyMemberTypeChild])
    {

      goto LABEL_61;
    }
    unsigned int v65 = [v53 isEqualToString:STFamilyMemberTypeTeen];

    if (v65) {
LABEL_61:
    }
      uint64_t v66 = objc_opt_new();
    else {
      uint64_t v66 = 0;
    }
    v67 = [STConduit alloc];
    v68 = [(STFamilyOrganizationController *)v111 persistenceController];
    v107 = (void *)v66;
    v108 = (void *)v51;
    v69 = [(STConduit *)v67 initWithOrganizationIdentifier:@"screentime" transport:v51 localTransport:v66 persistenceController:v68];

    [(STConduit *)v69 setDelegate:v111];
    [(STConduit *)v69 resume];
    v106 = v69;
    [(STFamilyOrganizationController *)v111 setConduit:v69];
    v70 = [(STFamilyOrganizationController *)v111 persistenceController];
    uint64_t v71 = [v70 viewContext];

    v72 = +[STFamilyOrganizationSettings fetchRequest];
    v73 = +[NSPredicate predicateWithFormat:@"%K == NO", @"user.isParent"];
    [v72 setPredicate:v73];

    id v74 = objc_alloc((Class)STGroupFetchedResultsController);
    v105 = v72;
    v75 = +[STFetchResultsRequest requestWithFetchRequest:v72];
    v136 = v75;
    v76 = +[NSArray arrayWithObjects:&v136 count:1];
    v114 = (void *)v71;
    id v77 = [v74 initWithContext:v71 resultsRequests:v76];
    [(STFamilyOrganizationController *)v111 setSettingsResultsController:v77];

    v78 = [(STFamilyOrganizationController *)v111 settingsResultsController];
    [v78 setDelegate:v111];

    v79 = [v110 me];
    v80 = [v79 memberType];
    if ([v80 isEqualToString:v54])
    {

      goto LABEL_66;
    }
    unsigned int v81 = [v80 isEqualToString:STFamilyMemberTypeTeen];

    if (v81)
    {
LABEL_66:
      v82 = +[STInstalledApp fetchRequest];
      v83 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"userDeviceState.localUser"];
      [v82 setPredicate:v83];

      v84 = +[NSSortDescriptor sortDescriptorWithKey:@"bundleIdentifier" ascending:1];
      v135 = v84;
      v85 = +[NSArray arrayWithObjects:&v135 count:1];
      [v82 setSortDescriptors:v85];

      id v86 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v82 managedObjectContext:v71 sectionNameKeyPath:0 cacheName:0];
      [v86 setDelegate:v111];
      [(STFamilyOrganizationController *)v111 setInstalledAppsFetchedResultsController:v86];
      v87 = [(STFamilyOrganizationController *)v111 installedAppsFetchedResultsController];
      id v122 = 0;
      unsigned __int8 v88 = [v87 performFetch:&v122];
      id v89 = v122;

      if ((v88 & 1) == 0)
      {
        v90 = +[STLog familyScreenTimeManager];
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
          sub_10025E870();
        }
      }
    }
    v91 = +[STUsageRequest fetchRequestForUsageRequestsThatAreForRemoteUsers];
    v92 = +[NSPredicate predicateWithFormat:@"%K != %K", @"requestedDate", @"acknowledgedDate"];
    v93 = [v91 predicate];
    v134[0] = v93;
    v134[1] = v92;
    v94 = +[NSArray arrayWithObjects:v134 count:2];
    v95 = +[NSCompoundPredicate andPredicateWithSubpredicates:v94];
    [v91 setPredicate:v95];

    v96 = +[NSSortDescriptor sortDescriptorWithKey:@"requestedDate" ascending:1];
    v133 = v96;
    v97 = +[NSArray arrayWithObjects:&v133 count:1];
    [v91 setSortDescriptors:v97];

    id v98 = [objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v91 managedObjectContext:v114 sectionNameKeyPath:0 cacheName:0];
    v99 = v111;
    [(STFamilyOrganizationController *)v111 setUsageRequestsFetchedResultsController:v98];
    [v98 setDelegate:v111];
    v100 = [(STFamilyOrganizationController *)v111 usageRequestsFetchedResultsController];
    id v121 = 0;
    LODWORD(v97) = [v100 performFetch:&v121];
    id v101 = v121;

    if (v97)
    {
      [(STFamilyOrganizationController *)v111 _sendOutUsageRequestsIfNeeded];
    }
    else
    {
      v102 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
        sub_10025E808();
      }

      v99 = v111;
    }
    v103 = [(STFamilyOrganizationController *)v99 familySettingsManager];
    v104 = [v110 members];
    [v103 registerFamilyMembers:v104];

    [(STFamilyOrganizationController *)v99 _startListeningForIDSAccountBecameActiveNotifications];
    v36 = v112;
    id v37 = v109;
  }
  else
  {
    v40 = +[STLog familyScreenTimeManager];
    v34 = v115;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      sub_10025E738();
    }
    id v7 = v110;
  }
LABEL_77:
}

- (void)sendFamilySettingsPayload
{
  objc_super v3 = [(STFamilyOrganizationController *)self familySettingsManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000343A8;
  v4[3] = &unk_1002FC620;
  v4[4] = self;
  [v3 prepareSettingsPayloadsWithCompletion:v4];
}

- (void)sendPayloads:(id)a3
{
  id v4 = a3;
  v5 = [(STFamilyOrganizationController *)self conduit];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "enqueueTransportPayload:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)conduit:(id)a3 didReceiveTransportPayload:(id)a4
{
  id v5 = a4;
  id v6 = [v5 payloadType];
  if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinRequest"])
  {
    id v7 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received checkin request payload", buf, 2u);
    }

    [(STFamilyOrganizationController *)self _handleCheckinRequestPayload:v5];
    goto LABEL_26;
  }
  if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinResponse"])
  {
    id v8 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received checkin response payload", buf, 2u);
    }

    [(STFamilyOrganizationController *)self _handleCheckinResponsePayload:v5];
    goto LABEL_26;
  }
  if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeFamilySettings"])
  {
    uint64_t v9 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received family settings payload", buf, 2u);
    }

    v10 = [(STFamilyOrganizationController *)self familySettingsManager];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100034A94;
    v18[3] = &unk_1002FC648;
    v18[4] = self;
    [v10 handleFamilySettingsPayload:v5 withCompletion:v18];

    goto LABEL_26;
  }
  if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeBlueprints"])
  {
    long long v11 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received blueprints", buf, 2u);
    }

    long long v12 = [(STFamilyOrganizationController *)self blueprintSourceDelegate];
    [v12 didReceiveBlueprintPayload:v5];
LABEL_17:

    goto LABEL_26;
  }
  if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageRequest"])
  {
    long long v13 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received usage request", buf, 2u);
    }

    [(STFamilyOrganizationController *)self _enqueueOperationToFetchUsageForRequestPayload:v5];
  }
  else
  {
    if (![v6 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageResponse"])
    {
      if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeAskForTimeRequest"])
      {
        dispatch_queue_t v15 = +[STLog familyScreenTimeManager];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received ask for time request", buf, 2u);
        }

        long long v12 = [(STFamilyOrganizationController *)self askForTimeManager];
        [v12 handleAskForTimeRequestPayload:v5];
      }
      else if ([v6 isEqualToString:@"RMUnifiedTransportPayloadTypeAskForTimeResponse"])
      {
        v16 = +[STLog familyScreenTimeManager];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received ask for time response", buf, 2u);
        }

        long long v12 = [(STFamilyOrganizationController *)self askForTimeManager];
        [v12 handleAskForTimeResponsePayload:v5];
      }
      else
      {
        if (![v6 isEqualToString:@"STUnifiedTransportPayloadTypeAskForTimeResponseV2"])goto LABEL_26; {
        uint64_t v17 = +[STLog familyScreenTimeManager];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received v2 ask for time response", buf, 2u);
        }

        long long v12 = [(STFamilyOrganizationController *)self askForTimeManager];
        [v12 handleV2AskForTimeResponsePayload:v5];
      }
      goto LABEL_17;
    }
    long long v14 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received usage response", buf, 2u);
    }

    [(STFamilyOrganizationController *)self _enqueueOperationToPersistUsageForResponsePayload:v5];
  }
LABEL_26:
}

- (void)conduit:(id)a3 didDeliverTransportPayload:(id)a4
{
  id v4 = a4;
  id v5 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    uint64_t v7 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Delivery acknowledgement of transport payload type: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)conduitDidInvalidate:(id)a3
{
  id v3 = a3;
  id v4 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Conduit did invalidate: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)groupResultsControllerDidChangeContents:(id)a3
{
  id v4 = a3;
  id v5 = [(STFamilyOrganizationController *)self settingsResultsController];

  if (v5 == v4)
  {
    [(STFamilyOrganizationController *)self sendFamilySettingsPayload];
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  [(STFamilyOrganizationController *)self installedAppsFetchedResultsController];

  id v5 = [(STFamilyOrganizationController *)self usageRequestsFetchedResultsController];

  if (v5 == v4)
  {
    [(STFamilyOrganizationController *)self _sendOutUsageRequestsIfNeeded];
  }
}

- (void)_sendCheckinRequestOnAccountOfReachabilityChange
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 valueForKey:@"LastCheckinDate"];

  if (v4)
  {
    id v5 = +[NSCalendar currentCalendar];
    id v6 = [v5 dateByAddingUnit:16 value:1 toDate:v4 options:0];

    uint64_t v7 = +[NSDate now];
    id v8 = [v7 compare:v6];

    if (v8 != (id)1) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v9 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sending checkin due to reachability change", v10, 2u);
  }

  [(STFamilyOrganizationController *)self _sendCheckinRequestPayloadToDestination:0];
LABEL_8:
}

- (void)sendCheckinRequest
{
}

- (void)sendCheckinResponseToDestination:(id)a3
{
}

- (void)_sendCheckinResponseToDestination:(id)a3 afterVersions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create();
  uint64_t v9 = [(STFamilyOrganizationController *)self persistenceController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100034F58;
  v13[3] = &unk_1002FC670;
  id v14 = v8;
  dispatch_queue_t v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [v9 performBackgroundTaskAndWait:v13];
}

- (void)_sendCheckinResponseToDestination:(id)a3 afterVersions:(id)a4 context:(id)a5
{
  id v75 = a3;
  id v8 = a4;
  id v91 = 0;
  uint64_t v9 = +[STCoreUser fetchLocalUserInContext:a5 error:&v91];
  id v10 = v91;
  if ([v9 unmodeledParticipatesInSharedLedger])
  {
    id v11 = +[STCoreUser fetchRequestForFamilyMembers];
    CFStringRef v101 = @"familySettings";
    id v12 = +[NSArray arrayWithObjects:&v101 count:1];
    [v11 setRelationshipKeyPathsForPrefetching:v12];

    id v90 = v10;
    long long v13 = [v11 execute:&v90];
    id v14 = v90;

    if (v13)
    {
      v70 = self;
      id v71 = v14;
      v72 = v11;
      v73 = v9;
      uint64_t v15 = objc_opt_new();
      id v16 = objc_opt_new();
      id v17 = v16;
      if (v75) {
        [v16 addObject:v75];
      }
      id v77 = v17;
      v78 = v15;
      id v74 = v8;
      v79 = objc_msgSend(v8, "objectForKeyedSubscript:");
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v69 = v13;
      id obj = v13;
      id v18 = [obj countByEnumeratingWithState:&v86 objects:v100 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v87;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v87 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            if (([v22 isParent] & 1) == 0)
            {
              v23 = [v22 familySettings];
              v24 = [v23 uniqueIdentifier];
              if (v24)
              {
                id v25 = objc_alloc((Class)STVersionVector);
                objc_super v26 = [v79 objectForKeyedSubscript:v24];
                v27 = [v25 initWithDataRepresentation:v26];

                id v28 = objc_alloc((Class)STVersionVector);
                id v29 = [v23 versionVector];
                id v30 = [v28 initWithDataRepresentation:v29];

                id v31 = [v27 evaluateCausality:v30];
                if (v31 == (id)3 || v31 == 0)
                {
                  v33 = [v23 dictionaryRepresentation];
                  [v78 addObject:v33];
                }
              }
              else
              {
                v27 = +[STLog familyScreenTimeManager];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                {
                  v38 = [v22 dsid];
                  *(_DWORD *)buf = 138543618;
                  v97 = v38;
                  __int16 v98 = 2114;
                  v99 = v23;
                  _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Can't send checkin response for user, missing family settings unique identifier: %{public}@ %{public}@", buf, 0x16u);
                }
              }
            }
            if (!v75)
            {
              v34 = [v22 localUserDeviceState];

              if (!v34)
              {
                id v35 = objc_alloc((Class)STUnifiedTransportPayloadDestination);
                v36 = [v22 dsid];
                id v37 = [v35 initWithDSID:v36];

                [v77 addObject:v37];
              }
            }
          }
          id v19 = [obj countByEnumeratingWithState:&v86 objects:v100 count:16];
        }
        while (v19);
      }

      v39 = [v73 familySettings];
      v40 = [v39 organization];

      id v41 = [v40 blueprints];
      +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v41 count]);
      id obja = (id)objc_claimAutoreleasedReturnValue();

      id v42 = objc_msgSend(v74, "objectForKeyedSubscript:");
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v76 = v40;
      uint64_t v43 = [v40 blueprints];
      id v44 = [v43 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v83;
        do
        {
          for (j = 0; j != v45; j = (char *)j + 1)
          {
            if (*(void *)v83 != v46) {
              objc_enumerationMutation(v43);
            }
            v48 = *(void **)(*((void *)&v82 + 1) + 8 * (void)j);
            id v49 = objc_alloc((Class)STVersionVector);
            v50 = [v48 identifier];
            uint64_t v51 = [v42 objectForKeyedSubscript:v50];
            id v52 = [v49 initWithDataRepresentation:v51];

            id v53 = objc_alloc((Class)STVersionVector);
            uint64_t v54 = [v48 versionVector];
            id v55 = [v53 initWithDataRepresentation:v54];

            id v56 = [v52 evaluateCausality:v55];
            if (v56 == (id)3 || v56 == 0)
            {
              v58 = [v48 dictionaryRepresentation];
              [obja addObject:v58];
            }
          }
          id v45 = [v43 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v45);
      }

      v59 = [v73 localUserDeviceState];
      uint64_t v60 = [v59 dictionaryRepresentation];
      v61 = (void *)v60;
      v62 = &__NSDictionary0__struct;
      if (v60) {
        v62 = (void *)v60;
      }
      id v63 = v62;

      v93[0] = @"Settings";
      v93[1] = @"Blueprints";
      v64 = v78;
      v94[0] = v78;
      v94[1] = obja;
      v93[2] = @"UserDeviceState";
      v94[2] = v63;
      unsigned int v65 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
      uint64_t v66 = [[STUnifiedTransportPayload alloc] initWithPayload:v65 type:@"RMUnifiedTransportPayloadTypeCheckinResponse"];
      [(STUnifiedTransportPayload *)v66 setDestinations:v77];
      v92 = v66;
      v67 = +[NSArray arrayWithObjects:&v92 count:1];

      [(STFamilyOrganizationController *)v70 sendPayloads:v67];
      uint64_t v9 = v73;

      id v8 = v74;
      v68 = v75;
      id v14 = v71;
      id v11 = v72;
      long long v13 = v69;
    }
    else
    {
      v64 = +[STLog familyScreenTimeManager];
      v68 = v75;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_10025E8D8();
      }
    }
  }
  else
  {
    id v11 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Local user cannot participate in sharing family settings", buf, 2u);
    }
    id v14 = v10;
    v68 = v75;
  }
}

- (void)_sendCheckinRequestPayloadToDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(STFamilyOrganizationController *)self persistenceController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035798;
  v7[3] = &unk_1002FB788;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBackgroundTask:v7];
}

- (void)_sendCheckinRequestPayloadToDestination:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035890;
  v11[3] = &unk_1002FC698;
  id v12 = (id)os_transaction_create();
  long long v13 = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v12;
  [v8 performBlockAndWait:v11];
}

- (void)_handleCheckinRequestPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 destinations];
  id v6 = [v5 firstObject];

  id v7 = STUnifiedTransportPayloadDestinationTypeDevice;
  id v8 = [v6 type];
  id v9 = (void *)STUnifiedTransportPayloadDestinationTypePairedDevice;
  unsigned int v10 = [v8 isEqualToString:STUnifiedTransportPayloadDestinationTypePairedDevice];

  if (v10)
  {
    id v11 = v9;

    id v7 = v11;
  }
  id v12 = [v4 userInfo];
  long long v13 = [v12 objectForKeyedSubscript:@"altURI"];

  id v14 = [objc_alloc((Class)STUnifiedTransportPayloadDestination) initWithAddress:v13 type:v7];
  [(STFamilyOrganizationController *)self _sendCheckinResponseToDestination:v14 afterVersions:0];
  id v15 = [(STFamilyOrganizationController *)self persistenceController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100036184;
  v17[3] = &unk_1002FC4B0;
  id v18 = v4;
  id v16 = v4;
  [v15 performBackgroundTask:v17];
}

- (void)_handleCheckinResponsePayload:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"FromID"];
    *(_DWORD *)buf = 138543874;
    id v17 = v4;
    __int16 v18 = 2160;
    uint64_t v19 = 1752392040;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling checkin response payload: %{public}@ FromID: %{mask.hash}@", buf, 0x20u);
  }
  id v9 = [(STFamilyOrganizationController *)self persistenceController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100036554;
  v12[3] = &unk_1002FC6C0;
  id v13 = v5;
  id v14 = v4;
  id v15 = self;
  id v10 = v4;
  id v11 = v5;
  [v9 performBackgroundTaskAndWait:v12];
}

- (BOOL)validateBlueprintDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"organization.class"];
  id v5 = +[STCoreOrganization internalClassForSerializableClassName:v4];
  if (v5)
  {
    if (![v5 isEqual:objc_opt_class()])
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }
    id v6 = +[STLog blueprint];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10025EE04(v3);
    }
  }
  else
  {
    id v6 = +[STLog blueprint];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10025EBDC((uint64_t)v4, v3);
    }
  }

  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (void)_enqueueOperationToFetchUsageForRequestPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"AppleID"];

  if ([v6 length])
  {
    BOOL v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"altURI"];

    if ([v8 length])
    {
      id v9 = [v4 payloadDictionary];
      id v10 = [v9 objectForKeyedSubscript:@"StartDate"];
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v11 = +[STLog familyScreenTimeManager];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_10025F0C4();
          }

          id v10 = 0;
        }
      }
      id v12 = +[STUsageManager usageGenesisDate];
      if (v12)
      {
        if (_os_feature_enabled_impl())
        {
          id v13 = [v9 objectForKeyedSubscript:@"AllDevicesAreNewUsage"];
          id v14 = +[STLog familyScreenTimeManager];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v25 = v6;
            __int16 v26 = 2114;
            v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ has all new_usage devices: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          id v13 = 0;
        }
        id v16 = [(STFamilyOrganizationController *)self persistenceController];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000372A0;
        v17[3] = &unk_1002FC710;
        id v18 = v6;
        id v19 = v13;
        __int16 v20 = self;
        uint64_t v21 = v8;
        id v22 = v10;
        id v23 = v12;
        id v15 = v13;
        [v16 performBackgroundTask:v17];
      }
      else
      {
        id v15 = +[STLog familyScreenTimeManager];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10025F084();
        }
      }
    }
    else
    {
      id v9 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10025F050();
      }
    }
  }
  else
  {
    id v8 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10025F01C();
    }
  }
}

- (void)_fetchUsageOperationDidFinish:(id)a3 requestingAltURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STFamilyOrganizationController *)self usageQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(STFamilyOrganizationController *)self fetchUsageOperationByAltURI];
  id v10 = [v9 objectForKeyedSubscript:v7];
  if (v10 == v6)
  {
    [v9 removeObjectForKey:v7];
    id v11 = [v6 error];
    if (v11)
    {
      id v12 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10025F444();
      }
    }
    else
    {
      id v12 = [v6 resultObject];
      id v32 = 0;
      v24 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v32];
      id v11 = v32;
      if (v24)
      {
        uint64_t v28 = 0;
        id v29 = &v28;
        uint64_t v30 = 0x2020000000;
        char v31 = 0;
        id v13 = [(STFamilyOrganizationController *)self persistenceController];
        id v21 = [v13 newBackgroundContext];

        if (_os_feature_enabled_impl())
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100037CAC;
          v25[3] = &unk_1002FC558;
          id v26 = v21;
          v27 = &v28;
          [v26 performBlockAndWait:v25];
        }
        id v23 = STGetDeviceUUID();
        if (_os_feature_enabled_impl())
        {
          v37[0] = @"DeviceIdentifier";
          v37[1] = @"FetchedUsageResults";
          v38[0] = v23;
          v38[1] = v24;
          v37[2] = @"AllDevicesAreNewUsage";
          id v14 = +[NSNumber numberWithBool:*((unsigned __int8 *)v29 + 24)];
          v38[2] = v14;
          id v22 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
        }
        else
        {
          v35[0] = @"DeviceIdentifier";
          v35[1] = @"FetchedUsageResults";
          v36[0] = v23;
          v36[1] = v24;
          id v22 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
        }
        id v16 = [[STUnifiedTransportPayload alloc] initWithPayload:v22 type:@"RMUnifiedTransportPayloadTypeUsageResponse"];
        id v17 = objc_alloc((Class)STUnifiedTransportPayloadDestination);
        id v18 = [v17 initWithAddress:v7 type:STUnifiedTransportPayloadDestinationTypeDevice];
        id v34 = v18;
        id v19 = +[NSArray arrayWithObjects:&v34 count:1];
        [(STUnifiedTransportPayload *)v16 setDestinations:v19];

        v33 = v16;
        __int16 v20 = +[NSArray arrayWithObjects:&v33 count:1];
        [(STFamilyOrganizationController *)self sendPayloads:v20];

        _Block_object_dispose(&v28, 8);
      }
      else
      {
        id v15 = +[STLog familyScreenTimeManager];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_10025F3D8();
        }
      }
    }
  }
}

- (void)_enqueueOperationToPersistUsageForResponsePayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"AppleID"];

  if ([v6 length])
  {
    id v7 = [v4 payloadDictionary];
    id v8 = [v7 objectForKeyedSubscript:@"DeviceIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v7 objectForKeyedSubscript:@"FetchedUsageResults"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = 0;
        id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:&v26];
        id v11 = v26;
        [v10 setClass:objc_opt_class() forClassName:@"RMFetchedUsageResults"];
        id v12 = [v10 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
        [v10 finishDecoding];
        if (v12)
        {
          id v18 = v12;
          id v17 = v11;
          if (_os_feature_enabled_impl())
          {
            id v13 = [v7 objectForKeyedSubscript:@"AllDevicesAreNewUsage"];
            id v14 = +[STLog familyScreenTimeManager];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v28 = v6;
              __int16 v29 = 2114;
              uint64_t v30 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ has all new_usage devices: %{public}@", buf, 0x16u);
            }
          }
          else
          {
            id v13 = 0;
          }
          id v16 = [(STFamilyOrganizationController *)self persistenceController];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100038148;
          v19[3] = &unk_1002FC710;
          id v20 = v6;
          id v21 = v8;
          id v22 = v4;
          id v23 = self;
          id v24 = v13;
          id v12 = v18;
          id v25 = v18;
          id v15 = v13;
          [v16 performBackgroundTask:v19];

          id v11 = v17;
        }
        else
        {
          id v15 = +[STLog familyScreenTimeManager];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            sub_10025F548();
          }
        }
      }
      else
      {
        id v11 = +[STLog familyScreenTimeManager];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_10025F5B0();
        }
      }
    }
    else
    {
      id v9 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10025F618();
      }
    }
  }
  else
  {
    id v7 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10025F514();
    }
  }
}

- (void)_sendOutUsageRequestsIfNeeded
{
  id v3 = [(STFamilyOrganizationController *)self usageRequestsFetchedResultsController];
  id v4 = [v3 fetchedObjects];

  id v5 = [v4 valueForKey:@"objectID"];
  if ([v5 count])
  {
    id v6 = [v4 valueForKey:@"forUserDSID"];
    id v7 = [(STFamilyOrganizationController *)self persistenceController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003882C;
    v9[3] = &unk_1002FC6C0;
    id v10 = v6;
    id v11 = v5;
    id v12 = self;
    id v8 = v6;
    [v7 performBackgroundTask:v9];
  }
}

- (void)loudlySendLegacyAskRequest:(id)a3 toSpecificDeviceIDSDestinations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Sending legacy ask request to specific IDS destinations %@", buf, 0xCu);
  }

  [v5 setDeliverQuietly:0];
  id v8 = [STUnifiedTransportPayload alloc];
  id v9 = [v5 payload];
  id v10 = [(STUnifiedTransportPayload *)v8 initWithPayload:v9 type:@"RMUnifiedTransportPayloadTypeAskForTimeRequest"];

  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    uint64_t v16 = STUnifiedTransportPayloadDestinationTypeDevice;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v18 = [objc_alloc((Class)STUnifiedTransportPayloadDestination) initWithAddress:*(void *)(*((void *)&v21 + 1) + 8 * (void)v17) type:v16];
        [v11 addObject:v18];

        id v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v14);
  }

  [(STUnifiedTransportPayload *)v10 setDestinations:v11];
  id v25 = v10;
  id v19 = +[NSArray arrayWithObjects:&v25 count:1];
  [(STFamilyOrganizationController *)self sendPayloads:v19];
}

- (void)sendAskRequestToParents:(id)a3 toParentsWithDSIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Sending ask request", buf, 2u);
  }

  id v9 = [STUnifiedTransportPayload alloc];
  id v10 = [v6 payload];
  id v11 = [(STUnifiedTransportPayload *)v9 initWithPayload:v10 type:@"RMUnifiedTransportPayloadTypeAskForTimeRequest"];

  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v17);
        id v19 = objc_alloc((Class)STUnifiedTransportPayloadDestination);
        id v20 = objc_msgSend(v19, "initWithDSID:", v18, (void)v22);
        [v12 addObject:v20];

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v15);
  }

  [(STUnifiedTransportPayload *)v11 setDestinations:v12];
  v27 = v11;
  long long v21 = +[NSArray arrayWithObjects:&v27 count:1];
  [(STFamilyOrganizationController *)self sendPayloads:v21];
}

- (void)sendAskResponse:(id)a3 toChildWithDSID:(id)a4 toParentsWithDSIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Sending ask response", buf, 2u);
  }

  id v12 = [v8 payload];
  id v13 = [objc_alloc((Class)STUnifiedTransportPayloadDestination) initWithDSID:v9];
  id v14 = [[STUnifiedTransportPayload alloc] initWithPayload:v12 type:@"RMUnifiedTransportPayloadTypeAskForTimeResponse"];
  __int16 v29 = v13;
  id v36 = v13;
  id v15 = +[NSArray arrayWithObjects:&v36 count:1];
  [(STUnifiedTransportPayload *)v14 setDestinations:v15];

  uint64_t v16 = +[NSMutableArray arrayWithCapacity:2];
  [v16 addObject:v14];
  if ([v10 count])
  {
    long long v25 = self;
    id v27 = v9;
    id v28 = v8;
    id v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v10;
    id v18 = v10;
    id v19 = [v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        long long v22 = 0;
        do
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [objc_alloc((Class)STUnifiedTransportPayloadDestination) initWithDSID:*(void *)(*((void *)&v30 + 1) + 8 * (void)v22)];
          [v17 addObject:v23];

          long long v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v20);
    }

    long long v24 = [[STUnifiedTransportPayload alloc] initWithPayload:v12 type:@"STUnifiedTransportPayloadTypeAskForTimeResponseV2"];
    [(STUnifiedTransportPayload *)v24 setDestinations:v17];
    [v16 addObject:v24];

    id v9 = v27;
    id v8 = v28;
    self = v25;
    id v10 = v26;
  }
  [(STFamilyOrganizationController *)self sendPayloads:v16];
}

- (void)_startListeningForIDSAccountBecameActiveNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleIDSAccountBecameActiveNotification:" name:@"com.apple.remotemanagementd.ids-account.didBecomeActive" object:0];
}

- (void)_stopListeningForIDSAccountBecameActiveNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.remotemanagementd.ids-account.didBecomeActive" object:0];
}

- (void)_handleIDSAccountBecameActiveNotification:(id)a3
{
  id v4 = +[STLog familyScreenTimeManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "IDS Account became active, sending checkin request.", v5, 2u);
  }

  [(STFamilyOrganizationController *)self sendCheckinRequest];
}

- (STRequestManagerBlueprintSourceDelegate)blueprintSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->blueprintSourceDelegate);
  return (STRequestManagerBlueprintSourceDelegate *)WeakRetained;
}

- (void)setBlueprintSourceDelegate:(id)a3
{
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (STFamily)cachedFamily
{
  return self->_cachedFamily;
}

- (void)setCachedFamily:(id)a3
{
}

- (STConduit)conduit
{
  return self->_conduit;
}

- (void)setConduit:(id)a3
{
}

- (STGroupFetchedResultsController)settingsResultsController
{
  return self->_settingsResultsController;
}

- (void)setSettingsResultsController:(id)a3
{
}

- (NSFetchedResultsController)installedAppsFetchedResultsController
{
  return self->_installedAppsFetchedResultsController;
}

- (void)setInstalledAppsFetchedResultsController:(id)a3
{
}

- (STFamilySettingsManager)familySettingsManager
{
  return self->_familySettingsManager;
}

- (void)setFamilySettingsManager:(id)a3
{
}

- (STAskForTimeManager)askForTimeManager
{
  return self->_askForTimeManager;
}

- (void)setAskForTimeManager:(id)a3
{
}

- (NSFetchedResultsController)usageRequestsFetchedResultsController
{
  return self->_usageRequestsFetchedResultsController;
}

- (void)setUsageRequestsFetchedResultsController:(id)a3
{
}

- (OS_dispatch_queue)usageQueue
{
  return self->_usageQueue;
}

- (void)setUsageQueue:(id)a3
{
}

- (NSOperationQueue)fetchUsageOperationQueue
{
  return self->_fetchUsageOperationQueue;
}

- (void)setFetchUsageOperationQueue:(id)a3
{
}

- (NSOperationQueue)persistUsageOperationQueue
{
  return self->_persistUsageOperationQueue;
}

- (void)setPersistUsageOperationQueue:(id)a3
{
}

- (NSMutableDictionary)fetchUsageOperationByAltURI
{
  return self->_fetchUsageOperationByAltURI;
}

- (void)setFetchUsageOperationByAltURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchUsageOperationByAltURI, 0);
  objc_storeStrong((id *)&self->_persistUsageOperationQueue, 0);
  objc_storeStrong((id *)&self->_fetchUsageOperationQueue, 0);
  objc_storeStrong((id *)&self->_usageQueue, 0);
  objc_storeStrong((id *)&self->_usageRequestsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_askForTimeManager, 0);
  objc_storeStrong((id *)&self->_familySettingsManager, 0);
  objc_storeStrong((id *)&self->_installedAppsFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_settingsResultsController, 0);
  objc_storeStrong((id *)&self->_conduit, 0);
  objc_storeStrong((id *)&self->_cachedFamily, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_destroyWeak((id *)&self->blueprintSourceDelegate);
}

@end