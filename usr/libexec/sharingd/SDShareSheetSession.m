@interface SDShareSheetSession
+ (id)labelColorWithHostConfiguration:(id)a3;
+ (id)secondaryLabelColorWithHostConfiguration:(id)a3;
- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8;
- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7;
- (BOOL)airDropAllowed;
- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9;
- (BOOL)engagedWithSheet;
- (BOOL)firedImpactHaptic;
- (BOOL)hideSuggestions;
- (BOOL)instantShareSheet;
- (BOOL)invalidateCalled;
- (BOOL)isCollaborative;
- (BOOL)isSharePlayAvailable;
- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5;
- (BOOL)itemsReady;
- (BOOL)itemsRequested;
- (BOOL)remoteShareSheet;
- (BOOL)sentInitialConfiguration;
- (BOOL)sharingExpanded;
- (BOOL)shouldSuggestFamilyMembers;
- (BOOL)skipSlotsRendering;
- (BOOL)supportsCollaboration;
- (BOOL)transferActive;
- (NSArray)actionActivities;
- (NSArray)actionActivitiesInUserOrder;
- (NSArray)airDropNodes;
- (NSArray)airDropPeople;
- (NSArray)favoriteActions;
- (NSArray)favoriteApps;
- (NSArray)hiddenActivities;
- (NSArray)hostActionActivityProxies;
- (NSArray)hostShareActivityProxies;
- (NSArray)orderedPresentableActivities;
- (NSArray)peopleNodes;
- (NSArray)peopleSuggestionBundleIds;
- (NSArray)recipients;
- (NSArray)shareActivities;
- (NSArray)shareActivitiesInUserOrder;
- (NSArray)suggestedPeople;
- (NSArray)visibleActionActivities;
- (NSArray)visibleShareActivities;
- (NSData)processedImageResultsData;
- (NSDictionary)actionActivitiesByUUID;
- (NSDictionary)bundleIDToActivities;
- (NSDictionary)shareActivitiesByUUID;
- (NSMutableArray)activeSecurityContexts;
- (NSMutableDictionary)actionActivityToID;
- (NSMutableDictionary)realNameToNodeID;
- (NSMutableDictionary)shareActivityToID;
- (NSMutableDictionary)sharedItemsMap;
- (NSMutableDictionary)sharedItemsRequestIDToPreviewPhoto;
- (NSMutableDictionary)transferNodes;
- (NSMutableOrderedSet)cachedSharedItems;
- (NSNumber)nearbyCountSlotID;
- (NSOperationQueue)operationQueue;
- (NSString)description;
- (NSString)hostAppBundleID;
- (NSString)hostAppProcessName;
- (NSString)performActivityType;
- (NSString)sessionID;
- (NSURL)urlBeingShared;
- (NSXPCConnection)_connection;
- (NSXPCConnection)_uiServiceConnection;
- (SDAirDropActivity)activeAirDropActivity;
- (SDPeopleBrowser)peopleBrowser;
- (SDScreenTimeMonitor)screenTimeMonitor;
- (SDShareSheetAirDropController)airDropController;
- (SDShareSheetProxyLoaderManager)proxyLoaderManager;
- (SDShareSheetSession)initWithSessionID:(id)a3 xpcConnection:(id)a4 instantShareSheet:(BOOL)a5 remoteShareSheet:(BOOL)a6 xrRenderingMode:(unint64_t)a7;
- (SDShareSheetSessionDelegate)delegate;
- (SDSuggestionBrowser)suggestionBrowser;
- (SDXPCHelperConnection)xpcHelperCnx;
- (SFAirDropNode)selectedRecipient;
- (SFAirDropNodeProtocol)selectedNode;
- (UIImpactFeedbackGenerator)impactHaptic;
- (UINotificationFeedbackGenerator)notificationHaptic;
- (UISUIActivityViewControllerConfiguration)hostConfiguration;
- (UISelectionFeedbackGenerator)selectionHaptic;
- (_UIActivityHelper)activityHelper;
- (_UIUserDefaultsActivity)shareUserDefaultsActivity;
- (double)peopleSuggestionsTimeout;
- (id)_orderedActivitiesIncludingUserDisabledExtensionsForAuditToken:(id *)a3;
- (id)_orderedAvailableActivitiesForAuditToken:(id *)a3 WithMatchingContextCustomizationBlock:(id)a4;
- (id)_proxySectionForType:(int64_t)a3;
- (id)airdropNodeForIdentifier:(id)a3;
- (id)connection;
- (id)disabledNodesUpdatedHandler;
- (id)findSupportedActivitiesCompletionHandler;
- (id)minimumVisibleShareActivities;
- (id)performActivityCompletionHandler;
- (id)uiServiceConnection;
- (int)sharedItemsCount;
- (int64_t)attachmentCount;
- (int64_t)generatedPreviews;
- (int64_t)lastTransferEvent;
- (int64_t)nearbyCountBadge;
- (int64_t)sharedItemsRequestID;
- (unint64_t)airDropNearbyCount;
- (unint64_t)xrRenderingMode;
- (void)_activateSecurityContext:(id)a3;
- (void)_deactivateSecurityContext:(id)a3;
- (void)_loadPresentableActivitiesForAuditToken:(id *)a3;
- (void)_loadProxySectionWithType:(int64_t)a3;
- (void)_removeFailedIndexes:(id)a3 forProxySection:(id)a4;
- (void)_updateProxiesWithChangeDetails:(id)a3;
- (void)activate;
- (void)addStatusMonitorObservers;
- (void)cancelAirDropForNode:(id)a3;
- (void)checkPolicyForAirDropPeople;
- (void)checkPolicyForSuggestedPeople;
- (void)didConnectNearbySharingInteractionWithEndpointUUID:(id)a3;
- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3;
- (void)invalidate;
- (void)nodesPotentiallyUpdated;
- (void)proxyLoaderManager:(id)a3 didLoadProxiesWithChangeDetails:(id)a4;
- (void)proxyLoaderManagerDidFinishLoadingProxySection:(id)a3 cancelled:(BOOL)a4;
- (void)removeStatusMonitorObservers;
- (void)reportCurrentInvocationForDuration:(int64_t)a3;
- (void)resetAfterAirDropTransferWithItemData:(id)a3;
- (void)sendItems:(id)a3 itemData:(id)a4 toEndpointUUID:(id)a5 withNode:(id)a6;
- (void)setActionActivities:(id)a3;
- (void)setActionActivitiesByUUID:(id)a3;
- (void)setActionActivitiesInUserOrder:(id)a3;
- (void)setActionActivityToID:(id)a3;
- (void)setActiveAirDropActivity:(id)a3;
- (void)setActiveSecurityContexts:(id)a3;
- (void)setActivityHelper:(id)a3;
- (void)setAirDropAllowed:(BOOL)a3;
- (void)setAirDropController:(id)a3;
- (void)setAirDropNearbyCount:(unint64_t)a3;
- (void)setAirDropNodes:(id)a3;
- (void)setAirDropPeople:(id)a3;
- (void)setAttachmentCount:(int64_t)a3;
- (void)setBundleIDToActivities:(id)a3;
- (void)setCachedSharedItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledNodesUpdatedHandler:(id)a3;
- (void)setEngagedWithSheet:(BOOL)a3;
- (void)setFavoriteActions:(id)a3;
- (void)setFavoriteApps:(id)a3;
- (void)setFindSupportedActivitiesCompletionHandler:(id)a3;
- (void)setFiredImpactHaptic:(BOOL)a3;
- (void)setGeneratedPreviews:(int64_t)a3;
- (void)setHiddenActivities:(id)a3;
- (void)setHideSuggestions:(BOOL)a3;
- (void)setHostActionActivityProxies:(id)a3;
- (void)setHostConfiguration:(id)a3;
- (void)setHostShareActivityProxies:(id)a3;
- (void)setImpactHaptic:(id)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsSharePlayAvailable:(BOOL)a3;
- (void)setItemsReady:(BOOL)a3;
- (void)setItemsRequested:(BOOL)a3;
- (void)setLastTransferEvent:(int64_t)a3;
- (void)setNearbyCountBadge:(int64_t)a3;
- (void)setNearbyCountSlotID:(id)a3;
- (void)setNotificationHaptic:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOrderedPresentableActivities:(id)a3;
- (void)setPeopleBrowser:(id)a3;
- (void)setPeopleNodes:(id)a3;
- (void)setPeopleSuggestionBundleIds:(id)a3;
- (void)setPeopleSuggestionsTimeout:(double)a3;
- (void)setPerformActivityCompletionHandler:(id)a3;
- (void)setPerformActivityType:(id)a3;
- (void)setProcessedImageResultsData:(id)a3;
- (void)setProxyLoaderManager:(id)a3;
- (void)setRealNameToNodeID:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setScreenTimeMonitor:(id)a3;
- (void)setSelectedNode:(id)a3;
- (void)setSelectedRecipient:(id)a3;
- (void)setSelectionHaptic:(id)a3;
- (void)setSentInitialConfiguration:(BOOL)a3;
- (void)setShareActivities:(id)a3;
- (void)setShareActivitiesByUUID:(id)a3;
- (void)setShareActivitiesInUserOrder:(id)a3;
- (void)setShareActivityToID:(id)a3;
- (void)setShareUserDefaultsActivity:(id)a3;
- (void)setSharedItemsCount:(int)a3;
- (void)setSharedItemsMap:(id)a3;
- (void)setSharedItemsRequestID:(int64_t)a3;
- (void)setSharedItemsRequestIDToPreviewPhoto:(id)a3;
- (void)setSharingExpanded:(BOOL)a3;
- (void)setShouldSuggestFamilyMembers:(BOOL)a3;
- (void)setSuggestedPeople:(id)a3;
- (void)setSuggestionBrowser:(id)a3;
- (void)setSupportsCollaboration:(BOOL)a3;
- (void)setTransferActive:(BOOL)a3;
- (void)setTransferNodes:(id)a3;
- (void)setUiServiceConnection:(id)a3;
- (void)setUrlBeingShared:(id)a3;
- (void)setVisibleActionActivities:(id)a3;
- (void)setVisibleShareActivities:(id)a3;
- (void)setXpcHelperCnx:(id)a3;
- (void)set_uiServiceConnection:(id)a3;
- (void)systemRestrictionsChanged:(id)a3;
- (void)updateRestrictedActivityTypes:(id)a3;
@end

@implementation SDShareSheetSession

- (SDShareSheetSession)initWithSessionID:(id)a3 xpcConnection:(id)a4 instantShareSheet:(BOOL)a5 remoteShareSheet:(BOOL)a6 xrRenderingMode:(unint64_t)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SDShareSheetSession;
  v15 = [(SDShareSheetSession *)&v61 init];
  if (v15)
  {
    v16 = +[SDShareSheetSlotManager sharedManager];
    objc_sync_enter(v16);
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v15->__connection, a4);
    if (v9)
    {
      v17 = [v14 valueForEntitlement:@"com.apple.sharesheet.allow-custom-view"];
      if (v17
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v17 BOOLValue] & 1) != 0)
      {
        char v18 = 1;
      }
      else
      {
        v19 = share_sheet_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          sub_100173D7C(buf, (int)[v14 processIdentifier], v19);
        }

        char v18 = 0;
      }
      v15->_instantShareSheet = v18;
    }
    v15->_remoteShareSheet = a6;
    uint64_t v20 = objc_opt_new();
    airDropNodes = v15->_airDropNodes;
    v15->_airDropNodes = (NSArray *)v20;

    uint64_t v22 = objc_opt_new();
    peopleNodes = v15->_peopleNodes;
    v15->_peopleNodes = (NSArray *)v22;

    uint64_t v24 = objc_opt_new();
    realNameToNodeID = v15->_realNameToNodeID;
    v15->_realNameToNodeID = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    shareActivityToID = v15->_shareActivityToID;
    v15->_shareActivityToID = (NSMutableDictionary *)v26;

    uint64_t v28 = objc_opt_new();
    actionActivityToID = v15->_actionActivityToID;
    v15->_actionActivityToID = (NSMutableDictionary *)v28;

    v15->_attachmentCount = 0;
    v15->_sharedItemsCount = 0;
    uint64_t v30 = +[NSMutableDictionary dictionary];
    sharedItemsMap = v15->_sharedItemsMap;
    v15->_sharedItemsMap = (NSMutableDictionary *)v30;

    uint64_t v32 = +[NSMutableDictionary dictionary];
    sharedItemsRequestIDToPreviewPhoto = v15->_sharedItemsRequestIDToPreviewPhoto;
    v15->_sharedItemsRequestIDToPreviewPhoto = (NSMutableDictionary *)v32;

    v34 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    cachedSharedItems = v15->_cachedSharedItems;
    v15->_cachedSharedItems = v34;

    v36 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v15->_operationQueue;
    v15->_operationQueue = v36;

    [(NSOperationQueue *)v15->_operationQueue setMaxConcurrentOperationCount:1];
    uint64_t v38 = +[NSMutableDictionary dictionary];
    transferNodes = v15->_transferNodes;
    v15->_transferNodes = (NSMutableDictionary *)v38;

    uint64_t v40 = +[NSMutableArray array];
    activeSecurityContexts = v15->_activeSecurityContexts;
    v15->_activeSecurityContexts = (NSMutableArray *)v40;

    v15->_xrRenderingMode = a7;
    v42 = objc_alloc_init(SDPeopleBrowser);
    peopleBrowser = v15->_peopleBrowser;
    v15->_peopleBrowser = v42;

    v44 = [v14 sd_connectionBundleID];
    [(SDPeopleBrowser *)v15->_peopleBrowser setBundleID:v44];

    [(SDPeopleBrowser *)v15->_peopleBrowser setSessionID:v13];
    if (SFDeviceSupportsRapportOnlyAirDropDiscovery())
    {
      uint64_t v62 = kSFBrowserOptionsDelayBonjourUntilTransferKey;
      v63 = &__kCFBooleanTrue;
      v45 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      [(SDPeopleBrowser *)v15->_peopleBrowser setOptions:v45];
    }
    if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled])
    {
      v46 = [SDShareSheetAirDropController alloc];
      v47 = [v14 _queue];
      v48 = [(SDShareSheetAirDropController *)v46 initWithSessionID:v13 queue:v47];
      airDropController = v15->_airDropController;
      v15->_airDropController = v48;

      [(SDShareSheetAirDropController *)v15->_airDropController setDelegate:v15];
    }
    v50 = [SDShareSheetProxyLoaderManager alloc];
    v51 = [(SDShareSheetSession *)v15 sessionID];
    v52 = [(SDShareSheetProxyLoaderManager *)v50 initWithSessionIdentifier:v51];

    [(SDShareSheetProxyLoaderManager *)v52 setDelegate:v15];
    [(SDShareSheetSession *)v15 setProxyLoaderManager:v52];
    id location = 0;
    objc_initWeak(&location, v15);
    v53 = [SDScreenTimeMonitor alloc];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100157BA4;
    v57[3] = &unk_1008CE6E8;
    objc_copyWeak(&v59, &location);
    id v58 = v14;
    v54 = [(SDScreenTimeMonitor *)v53 initWithPoliciesChangedHandler:v57];
    screenTimeMonitor = v15->_screenTimeMonitor;
    v15->_screenTimeMonitor = v54;

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);

    objc_sync_exit(v16);
  }

  return v15;
}

- (unint64_t)airDropNearbyCount
{
  if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled])
  {
    v3 = [(SDShareSheetSession *)self airDropController];
    [v3 availableNodes];
  }
  else
  {
    v3 = [(SDShareSheetSession *)self peopleBrowser];
    [v3 people];
  v4 = };
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)activate
{
  v3 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v3);
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    [(SDShareSheetSession *)self addStatusMonitorObservers];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100157E58;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_sync_exit(v3);
}

- (void)invalidate
{
  v3 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v3);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    [(SDShareSheetSession *)self removeStatusMonitorObservers];
    v4 = [(SDShareSheetSession *)self peopleBrowser];
    [v4 setDiffableDelegate:0];

    id v5 = [(SDShareSheetSession *)self peopleBrowser];
    [(SDShareSheetSession *)self setPeopleBrowser:0];
    v6 = [(SDShareSheetSession *)self airDropController];
    [v6 invalidate];

    [(SDShareSheetSession *)self setAirDropController:0];
    v7 = [(SDShareSheetSession *)self screenTimeMonitor];
    [v7 invalidate];

    [(SDShareSheetSession *)self setScreenTimeMonitor:0];
    [(SDShareSheetSession *)self setDisabledNodesUpdatedHandler:0];
    [(SDShareSheetSession *)self setProxyLoaderManager:0];
    v8 = [(SDShareSheetSession *)self xpcHelperCnx];
    [v8 invalidate];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001580E8;
    block[3] = &unk_1008CA4B8;
    id v11 = v5;
    id v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_sync_exit(v3);
}

- (void)setAirDropAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  if (self->_airDropAllowed != v3)
  {
    self->_airDropAllowed = v3;
    if (v3
      && +[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled])
    {
      id v5 = [(SDShareSheetSession *)self airDropController];

      if (!v5)
      {
        v6 = [SDShareSheetAirDropController alloc];
        v7 = [(SDShareSheetSession *)self sessionID];
        v8 = [(SDShareSheetSession *)self connection];
        id v9 = [v8 _queue];
        v10 = [(SDShareSheetAirDropController *)v6 initWithSessionID:v7 queue:v9];
        [(SDShareSheetSession *)self setAirDropController:v10];

        id v11 = [(SDShareSheetSession *)self airDropController];
        [v11 setDelegate:self];

        v12 = [(SDShareSheetSession *)self xpcHelperCnx];
        id v13 = [(SDShareSheetSession *)self airDropController];
        [v13 setHelperConnection:v12];

        if (self->_activateCalled)
        {
          id v14 = [(SDShareSheetSession *)self airDropController];
          v15 = [(SDShareSheetSession *)self hostAppBundleID];
          [v14 activateWithBundleID:v15];
        }
      }
    }
    else
    {
      v16 = [(SDShareSheetSession *)self airDropController];
      [v16 invalidate];

      [(SDShareSheetSession *)self setAirDropController:0];
    }
  }
  objc_sync_exit(obj);
}

- (BOOL)skipSlotsRendering
{
  if ([(SDShareSheetSession *)self instantShareSheet]) {
    return 1;
  }

  return [(SDShareSheetSession *)self remoteShareSheet];
}

- (NSString)description
{
  BOOL v3 = [(SDShareSheetSession *)self sessionID];
  v4 = [(SDShareSheetSession *)self hostAppBundleID];
  id v5 = +[NSString stringWithFormat:@"<SDShareSheetSession: %p, sessionID: %@, hostAppBundleID: %@, airdropAllowed: %i>", self, v3, v4, [(SDShareSheetSession *)self airDropAllowed]];

  return (NSString *)v5;
}

- (id)connection
{
  BOOL v3 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v3);
  v4 = self->__connection;
  objc_sync_exit(v3);

  return v4;
}

- (id)uiServiceConnection
{
  BOOL v3 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v3);
  v4 = self->__uiServiceConnection;
  objc_sync_exit(v3);

  return v4;
}

- (void)setUiServiceConnection:(id)a3
{
  v4 = (NSXPCConnection *)a3;
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  uiServiceConnection = self->__uiServiceConnection;
  self->__uiServiceConnection = v4;

  objc_sync_exit(obj);
}

- (void)_activateSecurityContext:(id)a3
{
  id v5 = a3;
  v4 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v4);
  if (([(NSMutableArray *)self->_activeSecurityContexts containsObject:v5] & 1) == 0)
  {
    [v5 activate];
    [(NSMutableArray *)self->_activeSecurityContexts addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)_deactivateSecurityContext:(id)a3
{
  id v5 = a3;
  v4 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v4);
  if ([(NSMutableArray *)self->_activeSecurityContexts containsObject:v5])
  {
    [v5 deactivate];
    [(NSMutableArray *)self->_activeSecurityContexts removeObject:v5];
  }
  objc_sync_exit(v4);
}

- (id)airdropNodeForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SDShareSheetSession *)self airDropPeople];
  v6 = [(SDShareSheetSession *)self suggestedPeople];
  v7 = v6;
  if (v5)
  {
    id v8 = [v5 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    id v8 = v6;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 nodeIdentifier:v17];
        unsigned int v15 = [v14 isEqual:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_14;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v10;
}

- (void)addStatusMonitorObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"systemRestrictionsChanged:" name:@"com.apple.sharingd.AirDropAllowedChanged" object:0];
  [v3 addObserver:self selector:"systemRestrictionsChanged:" name:@"com.apple.sharingd.BlacklistedAppsChanged" object:0];
}

- (void)removeStatusMonitorObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)systemRestrictionsChanged:(id)a3
{
  id v5 = a3;
  id v4 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v4);
  if (![(SDShareSheetSession *)self invalidateCalled])
  {
    [(SDShareSheetSession *)self updateRestrictedActivityTypes:&__NSArray0__struct];
    [(SDShareSheetSession *)self nodesPotentiallyUpdated];
  }
  objc_sync_exit(v4);
}

- (void)setHostShareActivityProxies:(id)a3
{
  id v5 = a3;
  v6 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v6);
  v7 = self->_hostShareActivityProxies;
  id v8 = (NSArray *)v5;
  id v14 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  if ((v8 != 0) != (v7 == 0))
  {
    unsigned __int8 v9 = [(NSArray *)v7 isEqual:v8];

    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_hostShareActivityProxies, a3);
  if (![(SDShareSheetSession *)self sentInitialConfiguration])
  {
    id v10 = [(SDShareSheetSession *)self screenTimeMonitor];
    uint64_t v11 = [(SDShareSheetSession *)self minimumVisibleShareActivities];
    [v10 requestPoliciesForActivities:v11];
  }
  v12 = [(SDShareSheetSession *)self screenTimeMonitor];
  id v13 = [(SDShareSheetSession *)self shareActivitiesInUserOrder];
  [v12 updateWithActivities:v13];

  [(SDShareSheetSession *)self _loadProxySectionWithType:1];
  [(SDShareSheetSession *)self updateRestrictedActivityTypes:&__NSArray0__struct];
LABEL_10:
  objc_sync_exit(v6);
}

- (void)setHostActionActivityProxies:(id)a3
{
  id v5 = a3;
  v6 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v6);
  v7 = self->_hostActionActivityProxies;
  id v8 = (NSArray *)v5;
  id v10 = v8;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  if ((v8 != 0) == (v7 == 0))
  {

    goto LABEL_7;
  }
  unsigned __int8 v9 = [(NSArray *)v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_hostActionActivityProxies, a3);
    [(SDShareSheetSession *)self _loadProxySectionWithType:2];
  }
LABEL_8:
  objc_sync_exit(v6);
}

- (void)setSuggestedPeople:(id)a3
{
  id v5 = a3;
  v6 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v6);
  v7 = self->_suggestedPeople;
  id v8 = (NSArray *)v5;
  id v10 = v8;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  if ((v8 != 0) == (v7 == 0))
  {

    goto LABEL_7;
  }
  unsigned __int8 v9 = [(NSArray *)v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_suggestedPeople, a3);
    [(SDShareSheetSession *)self checkPolicyForSuggestedPeople];
  }
LABEL_8:
  objc_sync_exit(v6);
}

- (void)setPeopleNodes:(id)a3
{
  id v5 = a3;
  v6 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v6);
  v7 = self->_peopleNodes;
  id v8 = (NSArray *)v5;
  id v10 = v8;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  if ((v8 != 0) == (v7 == 0))
  {

    goto LABEL_7;
  }
  unsigned __int8 v9 = [(NSArray *)v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_peopleNodes, a3);
    [(SDShareSheetSession *)self checkPolicyForSuggestedPeople];
    [(SDShareSheetSession *)self _loadProxySectionWithType:0];
  }
LABEL_8:
  objc_sync_exit(v6);
}

- (void)setAirDropNodes:(id)a3
{
  id v5 = a3;
  v6 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v6);
  v7 = self->_airDropNodes;
  id v8 = (NSArray *)v5;
  id v10 = v8;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  if ((v8 != 0) == (v7 == 0))
  {

    goto LABEL_7;
  }
  unsigned __int8 v9 = [(NSArray *)v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_airDropNodes, a3);
    [(SDShareSheetSession *)self checkPolicyForAirDropPeople];
  }
LABEL_8:
  objc_sync_exit(v6);
}

- (void)nodesPotentiallyUpdated
{
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  id v3 = [(SDShareSheetSession *)self disabledNodesUpdatedHandler];

  if (v3)
  {
    id v4 = [(SDShareSheetSession *)self disabledNodesUpdatedHandler];
    v4[2]();
  }
  objc_sync_exit(obj);
}

- (void)updateRestrictedActivityTypes:(id)a3
{
  id v35 = a3;
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v35;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "update restricted activity types:%@", buf, 0xCu);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = [(SDShareSheetSession *)self hostShareActivityProxies];
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v5)
  {
    uint64_t v38 = *(void *)v40;
    id v37 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v40 != v38) {
          objc_enumerationMutation(v37);
        }
        v7 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v6);
        id v8 = [v7 activity];
        if (!v8)
        {
          v31 = +[NSAssertionHandler currentHandler];
          [v31 handleFailureInMethod:a2, self, @"SDShareSheetSlotManager.m", 637, @"activity is nil for proxy:%@", v7 object file lineNumber description];
        }
        unsigned __int8 v9 = [v8 activityType];
        id v10 = UIActivityTypeMessage;
        uint64_t v11 = v9;
        if (v10 == v11)
        {

LABEL_15:
          id v14 = +[SDStatusMonitor sharedMonitor];
          unsigned int v15 = [v14 effectiveBlockedAppBundleIDs];
          [v7 setIsRestricted:[v15 containsObject:@"com.apple.MobileSMS"]];
          goto LABEL_23;
        }
        v12 = v11;
        if ((UIActivityTypeMessage == 0) != (v11 != 0))
        {
          unsigned int v13 = [(NSString *)v10 isEqual:v11];

          if (v13) {
            goto LABEL_15;
          }
        }
        else
        {
        }
        v16 = [v8 activityType];
        long long v17 = UIActivityTypeMail;
        long long v18 = v16;
        if (v17 == v18)
        {

LABEL_22:
          id v14 = +[SDStatusMonitor sharedMonitor];
          unsigned int v15 = [v14 effectiveBlockedAppBundleIDs];
          [v7 setIsRestricted:[v15 containsObject:@"com.apple.mobilemail"]];
LABEL_23:

          goto LABEL_24;
        }
        long long v19 = v18;
        if ((UIActivityTypeMail == 0) != (v18 != 0))
        {
          unsigned int v20 = [(NSString *)v17 isEqual:v18];

          if (v20) {
            goto LABEL_22;
          }
        }
        else
        {
        }
        uint64_t v22 = [v8 activityType];
        v23 = UIActivityTypeAirDrop;
        uint64_t v24 = v22;
        if (v23 == v24)
        {

LABEL_34:
          [v7 setIsRestricted:-[SDShareSheetSession airDropAllowed](self, "airDropAllowed") ^ 1];
          goto LABEL_24;
        }
        v25 = v24;
        if ((UIActivityTypeAirDrop == 0) != (v24 != 0))
        {
          unsigned int v26 = [(NSString *)v23 isEqual:v24];

          if (v26) {
            goto LABEL_34;
          }
        }
        else
        {
        }
        v27 = [v8 activityType];
        id v28 = [v35 containsObject:v27];

        [v7 setIsDisabled:v28];
LABEL_24:
        v21 = share_sheet_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v29 = [v8 activityType];
          uint64_t v30 = [v8 activityUUID];
          *(_DWORD *)buf = 138412802;
          id v44 = v29;
          __int16 v45 = 2112;
          v46 = v30;
          __int16 v47 = 2112;
          v48 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "updating policy for %@/%@, proxy: %@", buf, 0x20u);
        }
        v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      id v4 = v37;
      id v32 = [v37 countByEnumeratingWithState:&v39 objects:v49 count:16];
      id v5 = v32;
    }
    while (v32);
  }

  [(SDShareSheetSession *)self checkPolicyForSuggestedPeople];
  [(SDShareSheetSession *)self checkPolicyForAirDropPeople];
  objc_sync_exit(obj);
}

- (void)checkPolicyForSuggestedPeople
{
  id v3 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v3);
  id v4 = [(SDShareSheetSession *)self suggestedPeople];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001596C4;
  v10[3] = &unk_1008CE710;
  v10[4] = self;
  [v4 enumerateObjectsUsingBlock:v10];

  id v5 = [(SDShareSheetSession *)self hostConfiguration];
  unsigned int v6 = [v5 requestPeopleSuggestionsData];

  if (v6)
  {
    v7 = [(SDShareSheetSession *)self suggestionBrowser];
    id v8 = [v7 peopleSuggestions];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100159A70;
    v9[3] = &unk_1008CE738;
    v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
  objc_sync_exit(v3);
}

- (void)checkPolicyForAirDropPeople
{
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v2 = [(SDShareSheetSession *)self airDropPeople];
  id v3 = [v2 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v3)
  {
    uint64_t v22 = *(void *)v32;
    id v21 = v2;
    do
    {
      id v23 = v3;
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v21);
        }
        unsigned int v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unsigned int v24 = [(SDShareSheetSession *)self airDropAllowed];
        id v5 = [(SDShareSheetSession *)self realNameToNodeID];
        unsigned int v6 = [v26 realName];
        v7 = [v5 objectForKeyedSubscript:v6];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = [(SDShareSheetSession *)self airDropNodes];
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v28;
          while (2)
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v28 != v10) {
                objc_enumerationMutation(v8);
              }
              v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
              unsigned int v13 = [v12 identifier];
              id v14 = v7;
              id v15 = v13;
              if (v14 == v15)
              {

LABEL_20:
                [v12 setIsRestricted:v24 ^ 1];
                goto LABEL_21;
              }
              v16 = v15;
              if ((v7 == 0) != (v15 != 0))
              {
                unsigned int v17 = [v14 isEqual:v15];

                if (v17) {
                  goto LABEL_20;
                }
              }
              else
              {
              }
            }
            id v9 = [v8 countByEnumeratingWithState:&v27 objects:v41 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        long long v18 = share_sheet_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          long long v19 = "yes";
          if (v24) {
            long long v19 = "no";
          }
          v36 = v26;
          __int16 v37 = 2112;
          uint64_t v38 = v7;
          __int16 v39 = 2080;
          long long v40 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Updating policy for %@/%@, isDisabled: %s", buf, 0x20u);
        }
      }
      v2 = v21;
      id v3 = [v21 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v3);
  }

  objc_sync_exit(obj);
}

- (void)setHostConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_hostConfiguration, a3);
  id v4 = a3;
  id v6 = +[UIDevice currentDevice];
  id v5 = [v4 hostIdiom];

  [v6 setSh_hostUserInterfaceIdiom:v5];
}

- (id)_orderedAvailableActivitiesForAuditToken:(id *)a3 WithMatchingContextCustomizationBlock:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  v7 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v7);
  id v8 = [(SDShareSheetSession *)self hostConfiguration];
  id v9 = [v8 contextForMatchingByActivityItemValueClasses];
  id v10 = [v9 copy];

  uint64_t v11 = [v8 activityTypesToCreateInShareService];
  [v10 setAllowMatchingExtensionActivities:[v11 containsObject:@"com.apple.UIKit.activity.RemoteExtension"]];

  [v10 setAllowMatchingBuiltInActivities:0];
  v12 = [v8 hostActivityConfigurations];
  unsigned int v13 = +[SUIHostActivityProxy activitiesForConfigurations:v12];
  [v10 setExternalMatchBuiltinOrderedActivities:v13];

  [v10 setHostAuditToken:a3];
  [v10 setIsCollaborative:[v8 isCollaborative]];
  id v14 = [v8 activityTypesToCreateInShareService];
  id v15 = [v14 mutableCopy];

  [v15 removeObject:@"com.apple.UIKit.activity.RemoteExtension"];
  [v10 setActivityTypesGeneratedByDelegate:v15];
  if (v6) {
    v6[2](v6, v10);
  }
  v16 = [(SDShareSheetSession *)self activityHelper];
  unsigned int v17 = [v16 orderedAvailableActivitiesForMatchingContext:v10];

  long long v18 = [v17 hiddenActivities];
  id v19 = [v18 count];

  if (v19)
  {
    unsigned int v20 = [(SDShareSheetSession *)self hiddenActivities];
    id v21 = [v20 count];

    if (v21)
    {
      uint64_t v22 = [(SDShareSheetSession *)self hiddenActivities];
      id v23 = [v17 hiddenActivities];
      unsigned int v24 = [v22 arrayByAddingObjectsFromArray:v23];
      [(SDShareSheetSession *)self setHiddenActivities:v24];
    }
    else
    {
      uint64_t v22 = [v17 hiddenActivities];
      id v23 = [v22 copy];
      [(SDShareSheetSession *)self setHiddenActivities:v23];
    }
  }
  v25 = [v17 orderedActivities];

  objc_sync_exit(v7);

  return v25;
}

- (void)_loadPresentableActivitiesForAuditToken:(id *)a3
{
  id v5 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v5);
  long long v6 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v6;
  v7 = [(SDShareSheetSession *)self _orderedAvailableActivitiesForAuditToken:v8 WithMatchingContextCustomizationBlock:&stru_1008CE778];
  [(SDShareSheetSession *)self setOrderedPresentableActivities:v7];

  objc_sync_exit(v5);
}

- (id)_orderedActivitiesIncludingUserDisabledExtensionsForAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v3;
  id v4 = [(SDShareSheetSession *)self _orderedAvailableActivitiesForAuditToken:v6 WithMatchingContextCustomizationBlock:&stru_1008CE798];

  return v4;
}

- (NSString)hostAppBundleID
{
  v2 = [(SDShareSheetSession *)self connection];
  long long v3 = [v2 sd_connectionBundleID];

  return (NSString *)v3;
}

- (NSString)hostAppProcessName
{
  v2 = [(SDShareSheetSession *)self connection];
  long long v3 = [v2 sd_connectionProcessName];

  return (NSString *)v3;
}

- (void)sendItems:(id)a3 itemData:(id)a4 toEndpointUUID:(id)a5 withNode:(id)a6
{
  id v11 = a3;
  id v74 = a4;
  id v68 = a5;
  id v67 = a6;
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v12 = [v74 securityContexts];
  id v13 = [v12 countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v84;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v84 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v83 + 1) + 8 * i) activate];
      }
      id v13 = [v12 countByEnumeratingWithState:&v83 objects:v89 count:16];
    }
    while (v13);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v69 = v11;
  id v16 = [v69 countByEnumeratingWithState:&v79 objects:v88 count:16];
  unsigned int v17 = 0;
  if (v16)
  {
    uint64_t v18 = 0;
    uint64_t v70 = *(void *)v80;
    do
    {
      id v72 = v16;
      for (j = 0; j != v72; j = (char *)j + 1)
      {
        if (*(void *)v80 != v70) {
          objc_enumerationMutation(v69);
        }
        id v20 = *(id *)(*((void *)&v79 + 1) + 8 * (void)j);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          id v22 = v20;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_23;
          }
          long long v6 = [v20 string];
          id v22 = v6;
        }
        id v23 = +[NSURL URLWithString:v22];
        if ((isKindOfClass & 1) == 0) {

        }
        if (v23)
        {
          unsigned int v24 = [v23 scheme];
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            id v26 = v23;

            id v20 = v26;
          }
        }

LABEL_23:
        long long v27 = [v74 attachmentNameForItem:v20];
        long long v28 = [v74 subjectForItem:v20];
        long long v29 = [v74 dataTypeForItem:v20];
        if (v18 <= 2)
        {
          uint64_t v30 = [v74 previewImageForItem:v20];

          if (!v30)
          {
            long long v31 = [v74 previewImageDataForItem:v20];
            if (v31)
            {
              uint64_t v30 = +[UIImage imageWithData:v31];
            }
            else
            {
              uint64_t v30 = 0;
            }
          }
          if (v30) {
            ++v18;
          }
          unsigned int v17 = (void *)v30;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ++self->_sharedItemsCount;
          -[SDShareSheetSession addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v20, v27, v28, v17);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            ++self->_sharedItemsCount;
            -[SDShareSheetSession addAttributedString:withAttachmentName:description:previewImage:itemIndex:](self, "addAttributedString:withAttachmentName:description:previewImage:itemIndex:", v20, v27, v28, v17);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = v20;
              if (![v32 isFileURL]
                || [v74 canAccessFileURL:v32])
              {
                ++self->_sharedItemsCount;
                -[SDShareSheetSession addURL:withAttachmentName:description:previewImage:itemIndex:](self, "addURL:withAttachmentName:description:previewImage:itemIndex:", v32, v27, v28, v17);
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                ++self->_sharedItemsCount;
                -[SDShareSheetSession addImage:withAttachmentName:description:previewImage:itemIndex:](self, "addImage:withAttachmentName:description:previewImage:itemIndex:", v20, v27, v28, v17);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  ++self->_sharedItemsCount;
                  -[SDShareSheetSession addData:ofType:withAttachmentName:description:previewImage:itemIndex:](self, "addData:ofType:withAttachmentName:description:previewImage:itemIndex:", v20, v29, v27, v28, v17);
                }
              }
            }
          }
        }
      }
      id v16 = [v69 countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v16);
  }

  [(NSOperationQueue *)self->_operationQueue waitUntilAllOperationsAreFinished];
  if (self->_sharedItemsCount >= 1)
  {
    uint64_t v33 = 0;
    do
    {
      cachedSharedItems = self->_cachedSharedItems;
      sharedItemsMap = self->_sharedItemsMap;
      v36 = +[NSNumber numberWithInt:v33];
      __int16 v37 = [(NSMutableDictionary *)sharedItemsMap objectForKeyedSubscript:v36];
      [(NSMutableOrderedSet *)cachedSharedItems addObject:v37];

      uint64_t v33 = (v33 + 1);
    }
    while ((int)v33 < self->_sharedItemsCount);
  }
  [(SDShareSheetSession *)self generateSpecialPreviewPhotoForRequestID:self->_sharedItemsRequestID];
  v71 = +[NSMutableArray array];
  sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
  __int16 v39 = +[NSNumber numberWithInteger:self->_sharedItemsRequestID];
  v73 = [(NSMutableDictionary *)sharedItemsRequestIDToPreviewPhoto objectForKeyedSubscript:v39];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v40 = self->_cachedSharedItems;
  long long v41 = 0;
  char v42 = 0;
  char v43 = 0;
  id v44 = [(NSMutableOrderedSet *)v40 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v76;
    do
    {
      for (k = 0; k != v44; k = (char *)k + 1)
      {
        if (*(void *)v76 != v45) {
          objc_enumerationMutation(v40);
        }
        __int16 v47 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
        if ([v47 identifer] == self->_sharedItemsRequestID)
        {
          v48 = [v47 URL];
          BOOL v49 = v48 == 0;

          if (!v49)
          {
            if (!v73)
            {
              v73 = [v47 previewImage];
            }
            if (!v41)
            {
              long long v41 = [v47 payloadDescription];
            }
            unsigned __int8 v50 = [v47 wasString];
            [v71 addObject:v47];
            v42 |= v50;
            v43 |= v50 ^ 1;
          }
        }
      }
      id v44 = [(NSMutableOrderedSet *)v40 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v44);
  }

  v51 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v71 count]);
  unint64_t v52 = 0;
  char v53 = v42 & v43;
  while (v52 < (unint64_t)[v71 count])
  {
    v54 = [v71 objectAtIndexedSubscript:v52];
    v55 = v54;
    if ((v53 & 1) == 0 || ([v54 wasString] & 1) == 0)
    {
      v56 = [v55 URL];
      [v51 addObject:v56];
    }
    ++v52;
  }

  objc_sync_exit(obj);
  if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled])
  {
    if (!v68)
    {
      id v68 = [v67 endpointUUID];
      if (!v68)
      {
        v64 = +[NSAssertionHandler currentHandler];
        [v64 handleFailureInMethod:a2, self, @"SDShareSheetSlotManager.m", 898, @"endpointUUID is nil for node:%@", v67 object file lineNumber description];

        id v68 = 0;
      }
    }
    SFScaleAndRotateImage();
    id v57 = objc_claimAutoreleasedReturnValue();
    id v58 = [v57 CGImage];

    if (v58)
    {
      SFDataFromCGImage();
      id v58 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v59 = [(SDShareSheetSession *)self airDropController];
    v60 = [(SDShareSheetSession *)self connection];
    [v60 sd_connectionBundleID];
    id v61 = (id)objc_claimAutoreleasedReturnValue();
    [v59 send:v51 to:v68 itemPreviewData:v58 requestSource:v61];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v63 = +[NSAssertionHandler currentHandler];
      [v63 handleFailureInMethod:a2, self, @"SDShareSheetSlotManager.m", 904, @"node is not SFAirDropNode: %@", v67 object file lineNumber description];
    }
    id v62 = v67;
    id v58 = [(SDShareSheetSession *)self connection];
    id v59 = [v58 sd_connectionBundleID];
    v60 = [(SDPeopleBrowser *)self->_peopleBrowser sessionID];
    SFScaleAndRotateImage();
    id v61 = objc_claimAutoreleasedReturnValue();
    [v62 startSendForBundleID:v59 sessionID:v60 items:v51 description:0 previewImage:[v61 CGImage] fromShareSheet:1];
  }
  [(SDShareSheetSession *)self resetAfterAirDropTransferWithItemData:v74];
}

- (void)cancelAirDropForNode:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 cancelSend];
  }
  else
  {
    id v4 = [(SDShareSheetSession *)self airDropController];
    [v4 cancelCurrentSend];
  }
}

- (void)resetAfterAirDropTransferWithItemData:(id)a3
{
  id v4 = a3;
  id v5 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v5);
  self->_attachmentCount = 0;
  self->_sharedItemsCount = 0;
  long long v6 = +[NSMutableDictionary dictionary];
  sharedItemsMap = self->_sharedItemsMap;
  self->_sharedItemsMap = v6;

  id v8 = +[NSMutableDictionary dictionary];
  sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
  self->_sharedItemsRequestIDToPreviewPhoto = v8;

  id v10 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  cachedSharedItems = self->_cachedSharedItems;
  self->_cachedSharedItems = v10;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v12 = [v4 securityContexts];
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) deactivate];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  objc_sync_exit(v5);
}

- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  SFFakeFilesAndItemsArrayForURLs();
  id v8 = 0;
  id v9 = 0;
  __int16 v70 = 0;
  uint64_t v69 = 0;
  id v57 = SFContentTypes();
  id v55 = 0;
  v56 = v9;
  if (([v7 supportsPasses] & 1) == 0)
  {
    id v58 = v7;
    id v53 = v6;
    id v54 = v8;
    id v20 = [v8 firstObject];
    id v21 = [v20 objectForKeyedSubscript:kSFOperationFileNameKey];
    id v12 = [v21 pathExtension];

    [v57 allKeys];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v22 = (char *)[obj countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v66;
      char v25 = 1;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(obj);
          }
          if (SFIsPass())
          {
            unsigned int v27 = [v58 isUnknown];
            long long v28 = @"TRANSFER_TO_PERSON_NO_WALLET_TEXT";
            if (v27) {
              long long v28 = @"TRANSFER_TO_DEVICE_NO_WALLET_TEXT";
            }
            long long v29 = v28;
            uint64_t v30 = SFLocalizedStringForKey();
            SFLocalizedStringForKey();
            id v32 = v31 = v12;

            uint64_t v33 = [v58 displayName];
            long long v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33);
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v34);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            id v12 = v31;
            char v25 = 0;
          }
        }
        id v23 = (char *)[obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      }
      while (v23);
    }
    else
    {
      char v25 = 1;
    }

    id v6 = v53;
    goto LABEL_27;
  }
  if ([v7 supportsFMF])
  {
    if (![v7 supportsCredentials] || objc_msgSend(v7, "isUnknown"))
    {
      id v10 = [v9 firstObject];
      id v11 = [v10 scheme];
      id v12 = [v11 lowercaseString];

      int MyFriendsLink = SFIsCredential();
      if (MyFriendsLink)
      {
        uint64_t v14 = [v56 firstObject];
        SFIsPasskeyCredentialLink();

        id v15 = SFLocalizedStringForKey();
        long long v16 = SFLocalizedStringForKeyInStringsFileNamed();
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v74[0] = @"supportsCredentials";
        long long v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsCredentials]);
        v74[1] = @"unknownPeer";
        v75[0] = v17;
        long long v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isUnknown]);
        v75[1] = v18;
        long long v19 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];

        SFMetricsLog();
LABEL_23:

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v12 = v6;
    id v45 = [v12 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (!v45)
    {
      char v25 = 1;
      goto LABEL_28;
    }
    id v46 = v45;
    id v54 = v8;
    id v58 = v7;
    uint64_t v47 = *(void *)v62;
    while (2)
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(v12);
        }
        uint64_t v49 = *(void *)(*((void *)&v61 + 1) + 8 * (void)j);
        unsigned __int8 v50 = +[LSApplicationWorkspace defaultWorkspace];
        if ([v50 isApplicationAvailableToOpenURL:v49 error:0])
        {
        }
        else
        {
          v51 = +[LSApplicationWorkspace defaultWorkspace];
          unsigned int v52 = [v51 isApplicationAvailableToOpenURL:v49 includePrivateURLSchemes:1 error:0];

          if (v52)
          {
            [v12 count];
            SFLocalizedStringForKey();
            char v25 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
        }
      }
      id v46 = [v12 countByEnumeratingWithState:&v61 objects:v73 count:16];
      char v25 = 1;
      if (v46) {
        continue;
      }
      break;
    }
LABEL_27:
    id v7 = v58;
    id v8 = v54;
    goto LABEL_28;
  }
  id v35 = [v9 firstObject];
  v36 = [v35 scheme];
  id v12 = [v36 lowercaseString];

  int MyFriendsLink = SFIsFindMyFriendsLink();
  if (MyFriendsLink)
  {
    unsigned int v37 = [v7 isUnknown];
    uint64_t v38 = @"TRANSFER_TO_PERSON_NO_FMF_TEXT";
    if (v37) {
      uint64_t v38 = @"TRANSFER_TO_DEVICE_NO_FMF_TEXT";
    }
    id v39 = v12;
    long long v40 = v38;
    long long v19 = SFLocalizedStringForKey();
    long long v41 = SFLocalizedStringForKey();

    char v42 = [v7 displayName];
    char v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v41, v42);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v43);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = v39;
    goto LABEL_23;
  }
LABEL_24:
  char v25 = MyFriendsLink ^ 1;
LABEL_28:

  return v25 & 1;
}

- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v16);
  long long v17 = airdrop_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    char v25 = NSStringFromCGSize(v47);
    *(_DWORD *)buf = 138413314;
    id v38 = v12;
    __int16 v39 = 2112;
    id v40 = v13;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2112;
    id v46 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "addURL:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  long long v18 = [v12 scheme];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    id v22 = airdrop_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100173DC4();
    }
  }
  else
  {
    self->_itemsReady = 0;
    if (v15 || (int64_t generatedPreviews = self->_generatedPreviews, generatedPreviews > 2))
    {
      operationQueue = self->_operationQueue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10015BB9C;
      v26[3] = &unk_1008CE7E8;
      unsigned int v27 = v12;
      id v28 = v14;
      id v29 = v15;
      uint64_t v30 = self;
      int v31 = a7;
      [(NSOperationQueue *)operationQueue addOperationWithBlock:v26];

      id v22 = v27;
    }
    else
    {
      self->_int64_t generatedPreviews = generatedPreviews + 1;
      id v21 = self->_operationQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10015BA38;
      v32[3] = &unk_1008CE7C0;
      uint64_t v33 = v12;
      id v34 = v14;
      id v35 = self;
      int v36 = a7;
      [(NSOperationQueue *)v21 addOperationWithBlock:v32];

      id v22 = v33;
    }
  }

  objc_sync_exit(v16);
  return 1;
}

- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  id v15 = airdrop_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    [v11 size];
    NSStringFromCGSize(v52);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    [v14 size];
    uint64_t v30 = NSStringFromCGSize(v53);
    *(_DWORD *)buf = 138413570;
    id v41 = v11;
    __int16 v42 = 2112;
    id v43 = v29;
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v46 = 2112;
    id v47 = v13;
    __int16 v48 = 2112;
    id v49 = v14;
    __int16 v50 = 2112;
    v51 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "addImage:[%@]-size:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x3Eu);
  }
  self->_itemsReady = 0;
  if (!v14) {
    id v14 = v11;
  }
  sessionID = self->_sessionID;
  int64_t v17 = self->_attachmentCount + 1;
  self->_attachmentCount = v17;
  long long v18 = +[NSString stringWithFormat:@"IMG_%@-%ld", sessionID, v17];
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
  id v20 = NSTemporaryDirectory();
  id v21 = v12;
  id v22 = [v20 stringByAppendingPathComponent:SuggestedFilename];
  operationQueue = self->_operationQueue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10015BF24;
  v33[3] = &unk_1008CE810;
  id v24 = v11;
  id v34 = v24;
  id v25 = v22;
  id v35 = v25;
  id v26 = v13;
  id v36 = v26;
  id v27 = v14;
  id v37 = v27;
  id v38 = self;
  int v39 = a7;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v33];

  objc_sync_exit(obj);
  return 1;
}

- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = (__CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  BOOL v19 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v19);
  id v20 = airdrop_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v27 = [v14 length];
    [v18 size];
    id v26 = NSStringFromCGSize(v42);
    *(_DWORD *)buf = 134219522;
    id v29 = v14;
    __int16 v30 = 2048;
    id v31 = v27;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2112;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v17;
    __int16 v38 = 2112;
    id v39 = v18;
    __int16 v40 = 2112;
    id v41 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "addData:[%p]-length:[%lu] ofType:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x48u);
  }
  self->_itemsReady = 0;
  id v21 = v18;
  id v22 = v21;
  if (!v21)
  {
    if (UTTypeConformsTo(v15, kUTTypeImage))
    {
      id v22 = +[UIImage imageWithData:v14];
    }
    else
    {
      id v22 = 0;
    }
  }
  if (v16) {
    id v23 = v16;
  }
  else {
    id v23 = v17;
  }
  BOOL v24 = [(SDShareSheetSession *)self createURLPayloadForData:v14 ofType:v15 withAttachmentName:v23 description:v17 previewImage:v22 itemIndex:v8 completion:0];

  objc_sync_exit(v19);
  return v24;
}

- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9
{
  id v14 = a3;
  CFStringRef v15 = (const __CFString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v40 = a7;
  id v41 = a9;
  id v18 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v18);
  id v43 = v16;
  if (![v16 length])
  {
    CFStringRef v25 = UTTypeCopyPreferredTagWithClass(v15, kUTTagClassFilenameExtension);
    if (v25) {
      id v20 = (__CFString *)v25;
    }
    else {
      id v20 = @"data";
    }
    id v21 = (void *)UTTypeCopyDescription(v15);
    sessionID = self->_sessionID;
    int64_t v27 = self->_attachmentCount + 1;
    self->_attachmentCount = v27;
    uint64_t v28 = +[NSString stringWithFormat:@"%@-%@-%ld.%@", v21, sessionID, v27, v20, v40];
    goto LABEL_11;
  }
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename();
  id v20 = (__CFString *)[SuggestedFilename mutableCopy];

  [(__CFString *)v20 replaceOccurrencesOfString:@"/", @"-", 0, 0, [(__CFString *)v20 length] withString options range];
  [(__CFString *)v20 replaceOccurrencesOfString:@":", @"-", 0, 0, [(__CFString *)v20 length] withString options range];
  if (self->_attachmentCount)
  {
    id v21 = [(__CFString *)v20 pathExtension];
    if ([v21 length])
    {
      id v22 = [(__CFString *)v20 stringByDeletingPathExtension];
      int64_t v23 = self->_attachmentCount + 1;
      self->_attachmentCount = v23;
      BOOL v24 = +[NSString stringWithFormat:@"%@-%ld.%@", v22, v23, v21];

LABEL_12:
      goto LABEL_13;
    }
    int64_t v29 = self->_attachmentCount + 1;
    self->_attachmentCount = v29;
    uint64_t v28 = +[NSString stringWithFormat:@"%@-%ld.%@", v20, v29, v21];
LABEL_11:
    BOOL v24 = (void *)v28;
    goto LABEL_12;
  }
  id v20 = v20;
  ++self->_attachmentCount;
  BOOL v24 = v20;
LABEL_13:

  __int16 v30 = NSTemporaryDirectory();
  id v31 = (__CFString *)v15;
  __int16 v32 = [v30 stringByAppendingPathComponent:v24];
  operationQueue = self->_operationQueue;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10015C5DC;
  v44[3] = &unk_1008CE838;
  id v34 = v14;
  id v45 = v34;
  id v35 = v32;
  id v46 = v35;
  id v36 = v17;
  id v47 = v36;
  id v37 = v40;
  id v48 = v37;
  id v49 = self;
  int v51 = a8;
  id v38 = v41;
  id v50 = v38;
  [(NSOperationQueue *)operationQueue addOperationWithBlock:v44];

  objc_sync_exit(v18);
  return 1;
}

- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = airdrop_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    [v16 size];
    int64_t v23 = NSStringFromCGSize(v34);
    *(_DWORD *)buf = 138413314;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    uint64_t v33 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "addString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  id v18 = [v13 dataUsingEncoding:4];
  if (v15)
  {
    BOOL v19 = airdrop_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ discarding description", buf, 0xCu);
    }
  }
  BOOL v21 = [(SDShareSheetSession *)self createURLPayloadForData:v18 ofType:kUTTypePlainText withAttachmentName:v14 description:v15 previewImage:v16 itemIndex:v7 completion:&stru_1008CE878];

  return v21;
}

- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = airdrop_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v15 size];
    __int16 v26 = NSStringFromCGSize(v40);
    *(_DWORD *)buf = 138413314;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    id v39 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "addAttributedString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);
  }
  id v17 = [v12 length];
  NSAttributedStringDocumentAttributeKey v28 = NSDocumentTypeDocumentAttribute;
  NSAttributedStringDocumentType v29 = NSHTMLTextDocumentType;
  id v18 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v27 = 0;
  BOOL v19 = [v12 dataFromRange:0 documentAttributes:v17 error:&v27];
  id v20 = v27;

  if (v20)
  {
    BOOL v21 = airdrop_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100173E94();
    }

    id v22 = [v12 string];
  }
  else
  {
    id v22 = [objc_alloc((Class)NSString) initWithData:v19 encoding:4];
  }
  int64_t v23 = v22;
  BOOL v24 = [(SDShareSheetSession *)self addString:v22 withAttachmentName:v13 description:v14 previewImage:v15 itemIndex:v7];

  return v24;
}

- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3
{
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  id v4 = +[NSMutableArray array];
  id v5 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = self->_cachedSharedItems;
  id v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v10 identifer] == (id)a3)
        {
          id v11 = [v10 URL];
          if (v11)
          {
            id v12 = [v10 previewImage];
            BOOL v13 = v12 == 0;

            if (!v13)
            {
              id v14 = [v10 previewImage];
              [v4 addObject:v14];

              id v15 = [v10 URL];
              [v5 addObject:v15];
            }
          }
        }
      }
      id v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  if ((unint64_t)[v4 count] >= 2)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v5;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v27;
      while (2)
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) pathExtension];
          PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v20, 0);
          if ((SFIsImage() & 1) == 0 && (SFIsVideo() & 1) == 0 && (SFIsLivePhotos() & 1) == 0)
          {

            goto LABEL_25;
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v22 = +[UIScreen mainScreen];
    [v22 scale];

    SFImageStackFromImages();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
    id v20 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)sharedItemsRequestIDToPreviewPhoto setObject:v16 forKeyedSubscript:v20];
LABEL_25:
  }
  objc_sync_exit(obj);
}

+ (id)labelColorWithHostConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 linkedBeforeYukon])
  {
    id v4 = +[UIColor blackColor];
  }
  else
  {
    id v5 = [v3 hostTraitCollection];
    if (!v5)
    {
      id v6 = share_sheet_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(Label color) Creating dummy trait collection because host's is nil on config: %@", (uint8_t *)&v9, 0xCu);
      }

      id v5 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
    }
    id v7 = +[UIColor labelColor];
    id v4 = [v7 resolvedColorWithTraitCollection:v5];
  }

  return v4;
}

+ (id)secondaryLabelColorWithHostConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 linkedBeforeYukon])
  {
    id v4 = +[UIColor colorWithRed:0.235294118 green:0.235294118 blue:0.262745098 alpha:0.6];
  }
  else
  {
    id v5 = [v3 hostTraitCollection];
    if (!v5)
    {
      id v6 = share_sheet_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(Secondary label color) Creating dummy trait collection because host's is nil on config: %@", (uint8_t *)&v9, 0xCu);
      }

      id v5 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
    }
    id v7 = +[UIColor secondaryLabelColor];
    id v4 = [v7 resolvedColorWithTraitCollection:v5];
  }

  return v4;
}

- (id)minimumVisibleShareActivities
{
  v2 = self;
  id v3 = [(SDShareSheetSession *)self hostConfiguration];
  id v4 = [v3 numberOfVisibleSharingActivities];

  id v5 = +[NSMutableSet set];
  id v6 = [(SDShareSheetSession *)v2 hostShareActivityProxies];
  id v7 = v4;
  if ([v6 count] < v4)
  {
    uint64_t v8 = [(SDShareSheetSession *)v2 hostShareActivityProxies];
    id v7 = [v8 count];
  }
  int v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v7);
  id v10 = [(SDShareSheetSession *)v2 hostShareActivityProxies];
  id v11 = [v10 objectsAtIndexes:v9];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = [*(id *)(*((void *)&v41 + 1) + 8 * i) activity];
        if (v16) {
          [v5 addObject:v16];
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }

  id v17 = [(SDShareSheetSession *)v2 peopleNodes];
  if ([v17 count] < v4)
  {
    uint64_t v18 = [(SDShareSheetSession *)v2 peopleNodes];
    id v4 = [v18 count];
  }
  uint64_t v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v4);

  id v20 = [(SDShareSheetSession *)v2 peopleNodes];
  id v35 = (void *)v19;
  BOOL v21 = [v20 objectsAtIndexes:v19];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) suggestionNode];
        long long v28 = v27;
        if (v27)
        {
          long long v29 = [v27 bundleID];
          long long v30 = [(SDShareSheetSession *)v2 bundleIDToActivities];
          [v30 objectForKeyedSubscript:v29];
          long long v32 = v31 = v2;

          [v5 addObjectsFromArray:v32];
          v2 = v31;
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v24);
  }

  long long v33 = [v5 allObjects];

  return v33;
}

- (id)_proxySectionForType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v6 = [(SDShareSheetSession *)self hostActionActivityProxies];
      id v7 = [(SDShareSheetSession *)self hostConfiguration];
      id v8 = [v7 numberOfVisibleActionActivities];
LABEL_8:
      id v9 = v8;

      goto LABEL_10;
    case 1:
      uint64_t v5 = [(SDShareSheetSession *)self hostShareActivityProxies];
      goto LABEL_7;
    case 0:
      uint64_t v5 = [(SDShareSheetSession *)self peopleNodes];
LABEL_7:
      id v6 = (void *)v5;
      id v7 = [(SDShareSheetSession *)self hostConfiguration];
      id v8 = [v7 numberOfVisibleSharingActivities];
      goto LABEL_8;
  }
  id v6 = 0;
  id v9 = 0;
LABEL_10:
  if ([v6 count])
  {
    id v10 = [[SDShareSheetProxySection alloc] initWithType:a3 proxies:v6];
    [(SDShareSheetProxySection *)v10 setInitialBatchSize:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_loadProxySectionWithType:(int64_t)a3
{
  id obj = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(obj);
  uint64_t v5 = [(SDShareSheetSession *)self _proxySectionForType:a3];
  if (v5)
  {
    id v6 = [(SDShareSheetSession *)self proxyLoaderManager];
    [v6 loadProxySection:v5];
  }
  objc_sync_exit(obj);
}

- (void)reportCurrentInvocationForDuration:(int64_t)a3
{
  id v4 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v4);
  uint64_t v5 = [(SDShareSheetSession *)self activityHelper];
  id v22 = [v5 reportExtensionsCacheResult];

  id v6 = [(SDShareSheetSession *)self hostAppBundleID];
  if (!v6)
  {
    id v6 = [(SDShareSheetSession *)self hostAppProcessName];
  }
  id v7 = [(SDShareSheetSession *)self hostConfiguration];
  id v8 = [v7 hostTraitCollection];
  id v20 = [v8 userInterfaceStyle];

  id v9 = [(SDShareSheetSession *)self hostConfiguration];
  unsigned __int8 v10 = [v9 isCollaborative];

  id v11 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = [(SDShareSheetSession *)self suggestedPeople];
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v15) displayName];
        if (v16) {
          [v11 addObject:v16];
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  id v17 = [(SDShareSheetSession *)self xpcHelperCnx];
  uint64_t v18 = [(SDShareSheetSession *)self suggestedPeople];
  LOBYTE(v19) = v10;
  [v17 sendShareSheetInvocationMetricsWithAppBundleID:v6 numSuggestions:objc_msgSend(v18, "count") suggestionDisplayNames:v11 extensionsCacheResult:v22 isDarkMode:v20 == (id)2 duration:a3 isCollaborative:v19];

  objc_sync_exit(v4);
}

- (void)_removeFailedIndexes:(id)a3 forProxySection:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v7);
  id v8 = [v6 type];
  if (!v8)
  {
    id v9 = [(SDShareSheetSession *)self peopleNodes];
    id v10 = [v9 mutableCopy];
    goto LABEL_7;
  }
  if (v8 == (id)1)
  {
    id v9 = [(SDShareSheetSession *)self hostShareActivityProxies];
    id v10 = [v9 mutableCopy];
    goto LABEL_7;
  }
  if (v8 == (id)2)
  {
    id v9 = [(SDShareSheetSession *)self hostActionActivityProxies];
    id v10 = [v9 mutableCopy];
LABEL_7:
    id v11 = v10;

    goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:
  id v12 = [v6 proxies];
  id v13 = [v12 objectsAtIndexes:v19];

  [v11 removeObjectsInArray:v13];
  id v14 = [v6 type];
  if (v14)
  {
    if (v14 == (id)1)
    {
      uint64_t v18 = (NSArray *)[v11 copy];
      hostShareActivityProxies = self->_hostShareActivityProxies;
      self->_hostShareActivityProxies = v18;
    }
    else
    {
      if (v14 != (id)2) {
        goto LABEL_16;
      }
      id v15 = (NSArray *)[v11 copy];
      hostShareActivityProxies = self->_hostActionActivityProxies;
      self->_hostActionActivityProxies = v15;
    }
  }
  else
  {
    id v17 = (NSArray *)[v11 copy];
    hostShareActivityProxies = self->_peopleNodes;
    self->_peopleNodes = v17;
  }

LABEL_16:
  objc_sync_exit(v7);
}

- (void)_updateProxiesWithChangeDetails:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 changedProxySections];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = [v4 failedIndexesForProxySection:v10];
        if ([v11 count]) {
          [(SDShareSheetSession *)self _removeFailedIndexes:v11 forProxySection:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)proxyLoaderManager:(id)a3 didLoadProxiesWithChangeDetails:(id)a4
{
  [(SDShareSheetSession *)self _updateProxiesWithChangeDetails:a4];
  id v5 = [(SDShareSheetSession *)self delegate];
  [v5 sessionDidChange:self];
}

- (void)proxyLoaderManagerDidFinishLoadingProxySection:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    int v9 = 138412802;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    id v12 = v6;
    __int16 v13 = 2112;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ did finish loading proxySection:%@ cancelled:%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)didConnectNearbySharingInteractionWithEndpointUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(SDShareSheetSession *)self delegate];
  [v5 session:self didConnectNearbySharingInteractionWithEndpointUUID:v4];
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (NSXPCConnection)_uiServiceConnection
{
  return self->__uiServiceConnection;
}

- (void)set_uiServiceConnection:(id)a3
{
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (BOOL)remoteShareSheet
{
  return self->_remoteShareSheet;
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (SDShareSheetSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDShareSheetSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)airDropAllowed
{
  return self->_airDropAllowed;
}

- (BOOL)engagedWithSheet
{
  return self->_engagedWithSheet;
}

- (void)setEngagedWithSheet:(BOOL)a3
{
  self->_engagedWithSheet = a3;
}

- (BOOL)sentInitialConfiguration
{
  return self->_sentInitialConfiguration;
}

- (void)setSentInitialConfiguration:(BOOL)a3
{
  self->_sentInitialConfiguration = a3;
}

- (BOOL)sharingExpanded
{
  return self->_sharingExpanded;
}

- (void)setSharingExpanded:(BOOL)a3
{
  self->_sharingExpanded = a3;
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (int64_t)sharedItemsRequestID
{
  return self->_sharedItemsRequestID;
}

- (void)setSharedItemsRequestID:(int64_t)a3
{
  self->_sharedItemsRequestID = a3;
}

- (int64_t)attachmentCount
{
  return self->_attachmentCount;
}

- (void)setAttachmentCount:(int64_t)a3
{
  self->_attachmentCount = a3;
}

- (NSMutableOrderedSet)cachedSharedItems
{
  return self->_cachedSharedItems;
}

- (void)setCachedSharedItems:(id)a3
{
}

- (BOOL)itemsRequested
{
  return self->_itemsRequested;
}

- (void)setItemsRequested:(BOOL)a3
{
  self->_itemsRequested = a3;
}

- (BOOL)itemsReady
{
  return self->_itemsReady;
}

- (void)setItemsReady:(BOOL)a3
{
  self->_itemsReady = a3;
}

- (BOOL)firedImpactHaptic
{
  return self->_firedImpactHaptic;
}

- (void)setFiredImpactHaptic:(BOOL)a3
{
  self->_firedImpactHaptic = a3;
}

- (BOOL)transferActive
{
  return self->_transferActive;
}

- (void)setTransferActive:(BOOL)a3
{
  self->_transferActive = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (int64_t)generatedPreviews
{
  return self->_generatedPreviews;
}

- (void)setGeneratedPreviews:(int64_t)a3
{
  self->_int64_t generatedPreviews = a3;
}

- (int)sharedItemsCount
{
  return self->_sharedItemsCount;
}

- (void)setSharedItemsCount:(int)a3
{
  self->_sharedItemsCount = a3;
}

- (NSMutableDictionary)sharedItemsMap
{
  return self->_sharedItemsMap;
}

- (void)setSharedItemsMap:(id)a3
{
}

- (NSMutableDictionary)sharedItemsRequestIDToPreviewPhoto
{
  return self->_sharedItemsRequestIDToPreviewPhoto;
}

- (void)setSharedItemsRequestIDToPreviewPhoto:(id)a3
{
}

- (int64_t)lastTransferEvent
{
  return self->_lastTransferEvent;
}

- (void)setLastTransferEvent:(int64_t)a3
{
  self->_lastTransferEvent = a3;
}

- (UINotificationFeedbackGenerator)notificationHaptic
{
  return self->_notificationHaptic;
}

- (void)setNotificationHaptic:(id)a3
{
}

- (UISelectionFeedbackGenerator)selectionHaptic
{
  return self->_selectionHaptic;
}

- (void)setSelectionHaptic:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactHaptic
{
  return self->_impactHaptic;
}

- (void)setImpactHaptic:(id)a3
{
}

- (SDAirDropActivity)activeAirDropActivity
{
  return self->_activeAirDropActivity;
}

- (void)setActiveAirDropActivity:(id)a3
{
}

- (_UIUserDefaultsActivity)shareUserDefaultsActivity
{
  return self->_shareUserDefaultsActivity;
}

- (void)setShareUserDefaultsActivity:(id)a3
{
}

- (SDScreenTimeMonitor)screenTimeMonitor
{
  return self->_screenTimeMonitor;
}

- (void)setScreenTimeMonitor:(id)a3
{
}

- (SFAirDropNodeProtocol)selectedNode
{
  return self->_selectedNode;
}

- (void)setSelectedNode:(id)a3
{
}

- (NSMutableDictionary)transferNodes
{
  return self->_transferNodes;
}

- (void)setTransferNodes:(id)a3
{
}

- (SFAirDropNode)selectedRecipient
{
  return self->_selectedRecipient;
}

- (void)setSelectedRecipient:(id)a3
{
}

- (SDPeopleBrowser)peopleBrowser
{
  return self->_peopleBrowser;
}

- (void)setPeopleBrowser:(id)a3
{
}

- (SDSuggestionBrowser)suggestionBrowser
{
  return self->_suggestionBrowser;
}

- (void)setSuggestionBrowser:(id)a3
{
}

- (double)peopleSuggestionsTimeout
{
  return self->_peopleSuggestionsTimeout;
}

- (void)setPeopleSuggestionsTimeout:(double)a3
{
  self->_peopleSuggestionsTimeout = a3;
}

- (SDXPCHelperConnection)xpcHelperCnx
{
  return self->_xpcHelperCnx;
}

- (void)setXpcHelperCnx:(id)a3
{
}

- (_UIActivityHelper)activityHelper
{
  return self->_activityHelper;
}

- (void)setActivityHelper:(id)a3
{
}

- (UISUIActivityViewControllerConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (NSArray)orderedPresentableActivities
{
  return self->_orderedPresentableActivities;
}

- (void)setOrderedPresentableActivities:(id)a3
{
}

- (NSArray)hiddenActivities
{
  return self->_hiddenActivities;
}

- (void)setHiddenActivities:(id)a3
{
}

- (NSDictionary)bundleIDToActivities
{
  return self->_bundleIDToActivities;
}

- (void)setBundleIDToActivities:(id)a3
{
}

- (NSArray)airDropPeople
{
  return self->_airDropPeople;
}

- (void)setAirDropPeople:(id)a3
{
}

- (NSArray)suggestedPeople
{
  return self->_suggestedPeople;
}

- (NSArray)shareActivities
{
  return self->_shareActivities;
}

- (void)setShareActivities:(id)a3
{
}

- (NSDictionary)shareActivitiesByUUID
{
  return self->_shareActivitiesByUUID;
}

- (void)setShareActivitiesByUUID:(id)a3
{
}

- (NSArray)shareActivitiesInUserOrder
{
  return self->_shareActivitiesInUserOrder;
}

- (void)setShareActivitiesInUserOrder:(id)a3
{
}

- (NSArray)visibleShareActivities
{
  return self->_visibleShareActivities;
}

- (void)setVisibleShareActivities:(id)a3
{
}

- (NSArray)actionActivities
{
  return self->_actionActivities;
}

- (void)setActionActivities:(id)a3
{
}

- (NSDictionary)actionActivitiesByUUID
{
  return self->_actionActivitiesByUUID;
}

- (void)setActionActivitiesByUUID:(id)a3
{
}

- (NSArray)actionActivitiesInUserOrder
{
  return self->_actionActivitiesInUserOrder;
}

- (void)setActionActivitiesInUserOrder:(id)a3
{
}

- (NSArray)visibleActionActivities
{
  return self->_visibleActionActivities;
}

- (void)setVisibleActionActivities:(id)a3
{
}

- (NSArray)favoriteApps
{
  return self->_favoriteApps;
}

- (void)setFavoriteApps:(id)a3
{
}

- (NSArray)favoriteActions
{
  return self->_favoriteActions;
}

- (void)setFavoriteActions:(id)a3
{
}

- (NSArray)airDropNodes
{
  return self->_airDropNodes;
}

- (NSArray)peopleNodes
{
  return self->_peopleNodes;
}

- (NSArray)hostShareActivityProxies
{
  return self->_hostShareActivityProxies;
}

- (NSArray)hostActionActivityProxies
{
  return self->_hostActionActivityProxies;
}

- (NSMutableDictionary)realNameToNodeID
{
  return self->_realNameToNodeID;
}

- (void)setRealNameToNodeID:(id)a3
{
}

- (NSMutableDictionary)shareActivityToID
{
  return self->_shareActivityToID;
}

- (void)setShareActivityToID:(id)a3
{
}

- (NSMutableDictionary)actionActivityToID
{
  return self->_actionActivityToID;
}

- (void)setActionActivityToID:(id)a3
{
}

- (NSNumber)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(id)a3
{
}

- (int64_t)nearbyCountBadge
{
  return self->_nearbyCountBadge;
}

- (void)setNearbyCountBadge:(int64_t)a3
{
  self->_nearbyCountBadge = a3;
}

- (NSURL)urlBeingShared
{
  return self->_urlBeingShared;
}

- (void)setUrlBeingShared:(id)a3
{
}

- (NSMutableArray)activeSecurityContexts
{
  return self->_activeSecurityContexts;
}

- (void)setActiveSecurityContexts:(id)a3
{
}

- (SDShareSheetProxyLoaderManager)proxyLoaderManager
{
  return self->_proxyLoaderManager;
}

- (void)setProxyLoaderManager:(id)a3
{
}

- (void)setAirDropNearbyCount:(unint64_t)a3
{
  self->_airDropNearbyCount = a3;
}

- (SDShareSheetAirDropController)airDropController
{
  return self->_airDropController;
}

- (void)setAirDropController:(id)a3
{
}

- (id)disabledNodesUpdatedHandler
{
  return self->_disabledNodesUpdatedHandler;
}

- (void)setDisabledNodesUpdatedHandler:(id)a3
{
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
}

- (NSData)processedImageResultsData
{
  return self->_processedImageResultsData;
}

- (void)setProcessedImageResultsData:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSString)performActivityType
{
  return self->_performActivityType;
}

- (void)setPerformActivityType:(id)a3
{
}

- (id)performActivityCompletionHandler
{
  return self->_performActivityCompletionHandler;
}

- (void)setPerformActivityCompletionHandler:(id)a3
{
}

- (id)findSupportedActivitiesCompletionHandler
{
  return self->_findSupportedActivitiesCompletionHandler;
}

- (void)setFindSupportedActivitiesCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_findSupportedActivitiesCompletionHandler, 0);
  objc_storeStrong(&self->_performActivityCompletionHandler, 0);
  objc_storeStrong((id *)&self->_performActivityType, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_processedImageResultsData, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong(&self->_disabledNodesUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_airDropController, 0);
  objc_storeStrong((id *)&self->_proxyLoaderManager, 0);
  objc_storeStrong((id *)&self->_activeSecurityContexts, 0);
  objc_storeStrong((id *)&self->_urlBeingShared, 0);
  objc_storeStrong((id *)&self->_nearbyCountSlotID, 0);
  objc_storeStrong((id *)&self->_actionActivityToID, 0);
  objc_storeStrong((id *)&self->_shareActivityToID, 0);
  objc_storeStrong((id *)&self->_realNameToNodeID, 0);
  objc_storeStrong((id *)&self->_hostActionActivityProxies, 0);
  objc_storeStrong((id *)&self->_hostShareActivityProxies, 0);
  objc_storeStrong((id *)&self->_peopleNodes, 0);
  objc_storeStrong((id *)&self->_airDropNodes, 0);
  objc_storeStrong((id *)&self->_favoriteActions, 0);
  objc_storeStrong((id *)&self->_favoriteApps, 0);
  objc_storeStrong((id *)&self->_visibleActionActivities, 0);
  objc_storeStrong((id *)&self->_actionActivitiesInUserOrder, 0);
  objc_storeStrong((id *)&self->_actionActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_actionActivities, 0);
  objc_storeStrong((id *)&self->_visibleShareActivities, 0);
  objc_storeStrong((id *)&self->_shareActivitiesInUserOrder, 0);
  objc_storeStrong((id *)&self->_shareActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_shareActivities, 0);
  objc_storeStrong((id *)&self->_suggestedPeople, 0);
  objc_storeStrong((id *)&self->_airDropPeople, 0);
  objc_storeStrong((id *)&self->_bundleIDToActivities, 0);
  objc_storeStrong((id *)&self->_hiddenActivities, 0);
  objc_storeStrong((id *)&self->_orderedPresentableActivities, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_activityHelper, 0);
  objc_storeStrong((id *)&self->_xpcHelperCnx, 0);
  objc_storeStrong((id *)&self->_suggestionBrowser, 0);
  objc_storeStrong((id *)&self->_peopleBrowser, 0);
  objc_storeStrong((id *)&self->_selectedRecipient, 0);
  objc_storeStrong((id *)&self->_transferNodes, 0);
  objc_storeStrong((id *)&self->_selectedNode, 0);
  objc_storeStrong((id *)&self->_screenTimeMonitor, 0);
  objc_storeStrong((id *)&self->_shareUserDefaultsActivity, 0);
  objc_storeStrong((id *)&self->_activeAirDropActivity, 0);
  objc_storeStrong((id *)&self->_impactHaptic, 0);
  objc_storeStrong((id *)&self->_selectionHaptic, 0);
  objc_storeStrong((id *)&self->_notificationHaptic, 0);
  objc_storeStrong((id *)&self->_sharedItemsRequestIDToPreviewPhoto, 0);
  objc_storeStrong((id *)&self->_sharedItemsMap, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cachedSharedItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__uiServiceConnection, 0);
  objc_storeStrong((id *)&self->__connection, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end