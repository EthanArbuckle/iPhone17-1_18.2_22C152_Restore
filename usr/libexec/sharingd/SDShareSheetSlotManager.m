@interface SDShareSheetSlotManager
+ (id)_bundleIdentifierForActivity:(id)a3;
+ (id)_groupActivitiesByBundleID:(id)a3;
+ (id)nonBreakingActivityTitle:(id)a3;
+ (id)sharedManager;
- ($EC76EA2E339756B4D2C49A1061DE0928)_createNameLabelSlotWithString:(SEL)a3 textColor:(id)a4 maximumNumberOfLines:(id)a5 isAirDrop:(unint64_t)a6 ignoreNameWrapping:(BOOL)a7 sessionConnection:(BOOL)a8 hostConfig:(id)a9;
- ($EC76EA2E339756B4D2C49A1061DE0928)_uploadSlotWithVectorData:(SEL)a3 cgImage:(id)a4 performCATransaction:(id)a5 hostConfiguration:(BOOL)a6;
- ($EC76EA2E339756B4D2C49A1061DE0928)_uploadSlotWithVectorData:(SEL)a3 sfCGImageData:(id)a4 performCATransaction:(id)a5 hostConfiguration:(BOOL)a6;
- (BOOL)_hasCollaborationEntitlementForConnection:(id)a3;
- (BOOL)_loadActionProxy:(id)a3 configuration:(id)a4;
- (BOOL)_loadAirDropProxy:(id)a3 forAirDropNode:(id)a4 configuration:(id)a5;
- (BOOL)_loadSharingProxy:(id)a3 configuration:(id)a4;
- (BOOL)activityHelper:(id)a3 matchingWithContext:(id)a4 shouldIncludeSystemActivityType:(id)a5 sessionID:(id)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)wantsToBlockPresentation;
- (CAContext)shareSheetContext;
- (CGImage)_createActivityTitleImageForActivity:(id)a3 foregroundColor:(id)a4 sessionConnection:(id)a5;
- (NSCache)slotIDToLabel;
- (NSMutableDictionary)activityTypeToLabelSlot;
- (NSMutableDictionary)activityTypeToLargeImageSlot;
- (NSMutableDictionary)bundleIDToSmallImageSlot;
- (NSMutableDictionary)personToImageSlot;
- (NSMutableDictionary)personToLabelSlot;
- (NSMutableDictionary)sessionIDToShareSheetSession;
- (NSNumber)sharingPolicyWantsToBlockShareSheet;
- (NSSet)_activeConnections;
- (NSXPCConnection)_currentConnection;
- (SDShareSheetAccessibilityCache)accessibilityCache;
- (SDShareSheetSlotManager)init;
- (_UIActivityUserDefaults)actionUserDefaults;
- (_UIActivityUserDefaults)shareUserDefaults;
- (id)_activityTitleImagesMapForActivities:(id)a3 session:(id)a4;
- (id)_activityWithActivityType:(id)a3 session:(id)a4;
- (id)_createActionProxiesFromActivities:(id)a3 withTintColor:(id)a4 session:(id)a5;
- (id)_createActivityTitlePerspectiveDataForActivity:(id)a3 foregroundColor:(id)a4 sessionConnection:(id)a5;
- (id)_createNameLabelPerspectiveDataForString:(id)a3 textColor:(id)a4 maximumNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 sessionConnection:(id)a8;
- (id)_createShareProxiesFromActivities:(id)a3 session:(id)a4;
- (id)_createShareSheetContext;
- (id)_fetchShortcutWorkflowsForMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleID:(id)a5 iconSize:(CGSize)a6 iconScale:(double)a7 error:(id *)a8;
- (id)_filterForSharableURLs:(id)a3;
- (id)_getMainActivityPerBundleID:(id)a3;
- (id)_moveDefaultApplicationToFrontForURL:(id)a3 activities:(id)a4;
- (id)_remoteObjectProxyForConnection:(id)a3;
- (id)_removeSecondaryActivities:(id)a3 bundleIDToActivities:(id)a4;
- (id)_shortcutActivitiesForMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleID:(id)a5 configuration:(id)a6;
- (id)accessibilityStringForSlotID:(unsigned int)a3;
- (id)activeConnections;
- (id)activityHelper:(id)a3 activitiesForActivityType:(id)a4 matchingContext:(id)a5 sessionID:(id)a6;
- (id)activityHelper:(id)a3 predictionContextForSessionID:(id)a4;
- (id)configurationForDataSourceUpdateWithSession:(id)a3;
- (id)currentConnection;
- (id)exportedInterface;
- (id)getShareSheetSessionForSessionID:(id)a3;
- (id)machServiceName;
- (id)recipientHandlesForSessionID:(id)a3;
- (id)remoteObjectInterface;
- (unsigned)createSlotForContext:(id)a3;
- (void)_clearSlotsForAirDropProxies:(id)a3;
- (void)_configureActionsSectionForSession:(id)a3;
- (void)_configurePeopleSuggestionsSectionForSession:(id)a3;
- (void)_configureSharingSectionsForSession:(id)a3;
- (void)_handleSelectedNode:(id)a3 session:(id)a4;
- (void)_instructHostToPerformAirDropActivityWithNoContentView:(BOOL)a3 session:(id)a4;
- (void)_instructHostToPerformExtensionActivity:(id)a3 session:(id)a4;
- (void)_instructHostToPerformHostActivity:(id)a3 session:(id)a4;
- (void)_instructHostToPerformShortcutActivity:(id)a3 singleUseToken:(id)a4 session:(id)a5;
- (void)_instructHostToPerformUserDefaultsActivityForCategory:(int64_t)a3 session:(id)a4;
- (void)_loadPresentableActivitiesForSession:(id)a3;
- (void)_performSelectedActivity:(id)a3 inSession:(id)a4;
- (void)_performServiceInitiatedActivityInServiceWithActivity:(id)a3 session:(id)a4;
- (void)actionActivityUserDefaultsDidChangeWithSession:(id)a3;
- (void)activate;
- (void)activateSuggestionBrowserForSession:(id)a3 withExtensionMatchingDictionaries:(id)a4 assetIdentifiers:(id)a5 urlsBeingShared:(id)a6 sandboxExtensionsByfileURLPath:(id)a7;
- (void)activityViewControllerDidAppearWithSessionID:(id)a3;
- (void)activityViewControllerDidDisappearWithSessionID:(id)a3;
- (void)activityViewControllerDidEnterBackgroundWithSessionID:(id)a3;
- (void)activityViewControllerPerformEditActionsWithSessionID:(id)a3;
- (void)activityViewControllerPerformedActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7;
- (void)activityViewControllerWillEnterForegroundWithSessionID:(id)a3;
- (void)activityViewControllerWithSessionID:(id)a3 didLongPressShareActivityWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 favoritedActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6;
- (void)activityViewControllerWithSessionID:(id)a3 findSupportedActivitiesWithCompletionHandler:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 performActivityWithType:(id)a4 completionHandler:(id)a5;
- (void)activityViewControllerWithSessionID:(id)a3 provideFeedbackForPeopleSuggestionWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 removedPersonWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 selectedActionWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 selectedActivityWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 selectedDefaultActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)activityViewControllerWithSessionID:(id)a3 selectedPersonWithIdentifier:(id)a4;
- (void)activityViewControllerWithSessionID:(id)a3 toggledActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)activityViewControllerWithSessionID:(id)a3 updatedFavoritesProxies:(id)a4 activityCategory:(int64_t)a5;
- (void)browser:(id)a3 didUpdatePeople:(id)a4 deletedContactIdentifiers:(id)a5;
- (void)configureAirDropNodesFromSuggestionNodes:(id)a3 shareUserDefaults:(id)a4 forSession:(id)a5;
- (void)connectToDaemonWithContext:(id)a3 completionHandler:(id)a4;
- (void)connectUIServiceToDaemonWithSessionID:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)createAirDropProxyForNode:(id)a3 session:(id)a4;
- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4;
- (void)dataSourceDidUpdateForSession:(id)a3 animated:(BOOL)a4;
- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
- (void)establishConnectionWithCompletionHandler:(id)a3;
- (void)handleAirDropNodesChanged:(id)a3 sessionID:(id)a4;
- (void)handleAirDropTransferUpdated:(id)a3;
- (void)invalidate;
- (void)invalidateShareSheetContext;
- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4;
- (void)notifySession:(id)a3 activitySelected:(id)a4;
- (void)notifySession:(id)a3 favoritesProxies:(id)a4 suggestionProxies:(id)a5 activityCategory:(int64_t)a6;
- (void)notifySession:(id)a3 personSelectedWithActivityType:(id)a4;
- (void)notifySession:(id)a3 shortcutSelectedWithBundleID:(id)a4 singleUseToken:(id)a5;
- (void)notifySession:(id)a3 withAirDropTransferChange:(id)a4;
- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5;
- (void)requestAirDropItemsForNode:(id)a3 endpointUUID:(id)a4 session:(id)a5;
- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestConfigurationWithSessionID:(id)a3 completion:(id)a4;
- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4;
- (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4;
- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4;
- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4;
- (void)sendAirDropUpdateForSessionWithID:(id)a3 realName:(id)a4 status:(int64_t)a5 progress:(double)a6;
- (void)sendConfiguration:(id)a3 completion:(id)a4;
- (void)session:(id)a3 didConnectNearbySharingInteractionWithEndpointUUID:(id)a4;
- (void)sessionDidChange:(id)a3;
- (void)setAccessibilityCache:(id)a3;
- (void)setActionUserDefaults:(id)a3;
- (void)setActiveConnections:(id)a3;
- (void)setActivityTypeToLabelSlot:(id)a3;
- (void)setActivityTypeToLargeImageSlot:(id)a3;
- (void)setBundleIDToSmallImageSlot:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)setPersonToImageSlot:(id)a3;
- (void)setPersonToLabelSlot:(id)a3;
- (void)setSessionIDToShareSheetSession:(id)a3;
- (void)setShareUserDefaults:(id)a3;
- (void)set_activeConnections:(id)a3;
- (void)set_currentConnection:(id)a3;
- (void)shareActivityUserDefaultsDidChangeWithSession:(id)a3;
- (void)shareStatusForFileURL:(id)a3 completionHandler:(id)a4;
- (void)suggestionBrowserDidUpdateSuggestions:(id)a3;
- (void)transferUpdated:(id)a3;
- (void)updateNearbyCountSlotIDForSession:(id)a3;
@end

@implementation SDShareSheetSlotManager

+ (id)sharedManager
{
  if (qword_1009800E0 != -1) {
    dispatch_once(&qword_1009800E0, &stru_1008CE898);
  }
  v2 = (void *)qword_1009800D8;

  return v2;
}

- (SDShareSheetSlotManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDShareSheetSlotManager;
  v2 = [(SDShareSheetSlotManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sessionIDToShareSheetSession = v2->_sessionIDToShareSheetSession;
    v2->_sessionIDToShareSheetSession = (NSMutableDictionary *)v3;

    v5 = objc_alloc_init(SDShareSheetAccessibilityCache);
    accessibilityCache = v2->_accessibilityCache;
    v2->_accessibilityCache = v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"transferUpdated:" name:@"TransferUpdated" object:0];

    v2->_contextLock._os_unfair_lock_opaque = 0;
    +[SDSuggestionBrowser initializeCache];
  }
  return v2;
}

- (id)_createShareSheetContext
{
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "creating new share sheet context", v7, 2u);
  }

  v8[0] = kCAContextIgnoresHitTest;
  v8[1] = kCAContextEnablePixelDoubling;
  v8[2] = kCAContextEnablePixelQuadrupling;
  v8[3] = kCAContextDisplayable;
  v9[2] = kCFBooleanTrue;
  v9[3] = kCFBooleanFalse;
  v9[0] = kCFBooleanTrue;
  v9[1] = kCFBooleanTrue;
  v8[4] = kCAContextDisableGroupOpacity;
  v9[4] = kCFBooleanTrue;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  v4 = +[CAContext remoteContextWithOptions:v3];
  if (([v4 valid] & 1) == 0)
  {
    v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100173F10();
    }
  }

  return v4;
}

- (id)getShareSheetSessionForSessionID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)currentConnection
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->__currentConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentConnection:(id)a3
{
  id v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentConnection = obj->__currentConnection;
  obj->__currentConnection = v4;

  objc_sync_exit(obj);
}

- (id)activeConnections
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSSet *)v2->__activeConnections copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveConnections:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = (NSSet *)[v7 copy];
  activeConnections = v4->__activeConnections;
  v4->__activeConnections = v5;

  objc_sync_exit(v4);
}

- (void)transferUpdated:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"SessionID"];
    if (v7)
    {
      v8 = [v6 objectForKeyedSubscript:@"RealName"];
      if (v8)
      {
        objc_super v9 = [v4 userInfo];
        v10 = [v9 objectForKeyedSubscript:@"TransferText"];
        id v11 = [v10 integerValue];

        v12 = [v6 objectForKeyedSubscript:@"TransferProgress"];
        v13 = v12;
        if (v12)
        {
          [v12 floatValue];
          double v15 = v14;
        }
        else
        {
          double v15 = 0.0;
        }
        [(SDShareSheetSlotManager *)self sendAirDropUpdateForSessionWithID:v7 realName:v8 status:v11 progress:v15];
      }
      else
      {
        v16 = share_sheet_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_100174014();
        }
      }
    }
    else
    {
      v8 = share_sheet_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_100173FAC();
      }
    }
  }
  else
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100173F44();
    }
  }
}

- (void)handleAirDropTransferUpdated:(id)a3
{
  id v4 = a3;
  id v9 = [v4 sessionID];
  v5 = [v4 realName];
  id v6 = [v4 state];
  [v4 progress];
  double v8 = v7;

  [(SDShareSheetSlotManager *)self sendAirDropUpdateForSessionWithID:v9 realName:v5 status:v6 progress:v8];
}

- (void)sendAirDropUpdateForSessionWithID:(id)a3 realName:(id)a4 status:(int64_t)a5 progress:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  v13 = [(NSMutableDictionary *)v12->_sessionIDToShareSheetSession objectForKeyedSubscript:v10];
  float v14 = v13;
  if (v13)
  {
    double v15 = [v13 airDropController];
    unsigned __int8 v16 = [v15 hasActiveNearbySharingInteraction];

    v17 = [v14 transferNodes];
    v18 = [v17 objectForKeyedSubscript:v11];

    if (v18) {
      char v19 = 1;
    }
    else {
      char v19 = v16;
    }
    if ((v19 & 1) == 0)
    {
      v25 = share_sheet_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_100174158();
      }
      goto LABEL_39;
    }
    v20 = [v14 hostConfiguration];
    v59 = +[SDShareSheetSession labelColorWithHostConfiguration:v20];

    v21 = [v14 hostConfiguration];
    v57 = +[SDShareSheetSession secondaryLabelColorWithHostConfiguration:v21];

    v22 = [v14 hostConfiguration];
    v23 = [v22 hostLocale];
    v58 = [v18 displayNameForLocale:v23];

    BOOL v24 = [v14 lastTransferEvent] == (id)3 || [v14 lastTransferEvent] == (id)11;
    [v14 setLastTransferEvent:a5];
    if ((a5 & 0xFFFFFFFFFFFFFFF7) == 3 && v24)
    {
      v25 = &stru_1008E7020;
LABEL_38:

LABEL_39:
      goto LABEL_40;
    }
    if (a5 == 15)
    {
      v25 = SFLocalizedStringForKey();
      id v27 = v57;

      CFStringRef v55 = @"Converting";
      uint64_t v28 = 1;
    }
    else
    {
      if ((a5 & 0xFFFFFFFFFFFFFFF7) != 3)
      {
        uint64_t v56 = 0;
        v25 = &stru_1008E7020;
        CFStringRef v55 = &stru_1008E7020;
        switch(a5)
        {
          case 4:
            v31 = [v14 notificationHaptic];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10015F76C;
            block[3] = &unk_1008CA4B8;
            block[4] = v31;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            v25 = SFLocalizedStringForKey();
            uint64_t v32 = +[UIColor systemRedColor];

            v33 = [v14 transferNodes];
            [v33 removeObjectForKey:v11];

            [v14 setFiredImpactHaptic:0];
            [v14 setTransferActive:0];

            CFStringRef v55 = @"Declined";
            uint64_t v34 = 5;
            goto LABEL_48;
          case 5:
          case 6:
          case 8:
            break;
          case 7:
            if (([v14 firedImpactHaptic] & 1) == 0)
            {
              v49 = [v14 impactHaptic];
              v63[0] = _NSConcreteStackBlock;
              v63[1] = 3221225472;
              v63[2] = sub_10015F758;
              v63[3] = &unk_1008CA4B8;
              v63[4] = v49;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, v63);
              [v14 setFiredImpactHaptic:1];
            }
            v25 = SFLocalizedStringForKey();
            id v27 = v57;

            CFStringRef v55 = @"Sending";
            uint64_t v28 = 3;
            goto LABEL_22;
          case 9:
            v47 = [v14 notificationHaptic];
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_10015F760;
            v62[3] = &unk_1008CA4B8;
            v62[4] = v47;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v62);
            v25 = SFLocalizedStringForKey();
            uint64_t v32 = +[UIColor systemBlueColor];

            v48 = [v14 transferNodes];
            [v48 removeObjectForKey:v11];

            [v14 setFiredImpactHaptic:0];
            [v14 setTransferActive:0];

            CFStringRef v55 = @"Sent";
            uint64_t v34 = 4;
            goto LABEL_48;
          case 10:
            v50 = [v14 notificationHaptic];
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_10015F778;
            v60[3] = &unk_1008CA4B8;
            v60[4] = v50;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v60);
            v25 = SFLocalizedStringForKey();
            uint64_t v32 = +[UIColor systemRedColor];

            v51 = [v14 transferNodes];
            [v51 removeObjectForKey:v11];

            [v14 setFiredImpactHaptic:0];
            [v14 setTransferActive:0];

            CFStringRef v55 = @"Failed";
            uint64_t v34 = 6;
LABEL_48:
            uint64_t v56 = v34;
            v59 = (void *)v32;
            break;
          default:
            CFStringRef v55 = &stru_1008E7020;
            break;
        }
LABEL_23:
        if (v16)
        {
          v29 = 0;
          id v30 = 0;
        }
        else if ([v14 skipSlotsRendering])
        {
          v29 = [objc_alloc((Class)SFProxyText) initWithText:v58];
          id v30 = [objc_alloc((Class)SFProxyText) initWithText:v25];
        }
        else
        {
          uint64_t v35 = [v14 xpcHelperCnx];
          if (!v35)
          {
            v29 = share_sheet_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
              sub_1001740F0();
            }
            goto LABEL_37;
          }
          v53 = (void *)v35;
          v36 = [v14 hostConfiguration];
          v52 = +[SDShareSheetSession labelColorWithHostConfiguration:v36];

          +[CATransaction begin];
          memset(buf, 0, sizeof(buf));
          v37 = [v14 hostConfiguration];
          [(SDShareSheetSlotManager *)v12 _createNameLabelSlotWithString:v58 textColor:v52 maximumNumberOfLines:1 isAirDrop:1 ignoreNameWrapping:0 sessionConnection:v53 hostConfig:v37];

          v38 = [v14 hostConfiguration];
          [(SDShareSheetSlotManager *)v12 _createNameLabelSlotWithString:v25 textColor:v59 maximumNumberOfLines:1 isAirDrop:1 ignoreNameWrapping:1 sessionConnection:v53 hostConfig:v38];

          v54 = +[NSMutableDictionary dictionary];
          v39 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
          [v54 setObject:v58 forKeyedSubscript:v39];

          v40 = +[NSNumber numberWithUnsignedInt:0];
          [v54 setObject:v25 forKeyedSubscript:v40];

          v41 = [(SDShareSheetSlotManager *)v12 accessibilityCache];
          [v41 addEntriesFromDictionary:v54];

          +[CATransaction commit];
          +[CATransaction flush];
          id v42 = objc_alloc((Class)SFProxyText);
          v29 = [v42 initWithSlotIdentifier:*(unsigned int *)buf];
          id v30 = [objc_alloc((Class)SFProxyText) initWithSlotIdentifier:0];
        }
        v43 = share_sheet_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v58;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v55;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Set status for %@ to %@", buf, 0x16u);
        }

        if (v16)
        {
          v44 = 0;
        }
        else
        {
          v45 = [v14 realNameToNodeID];
          v44 = [v45 objectForKeyedSubscript:v11];
        }
        id v46 = [objc_alloc((Class)SFAirDropTransferChange) initWithState:v56 progress:v44 proxyIdentifier:v29 displayName:v30 status:a6];
        [(SDShareSheetSlotManager *)v12 notifySession:v14 withAirDropTransferChange:v46];

LABEL_37:
        goto LABEL_38;
      }
      v25 = SFLocalizedStringForKey();
      id v27 = v57;

      CFStringRef v55 = @"Waiting";
      uint64_t v28 = 2;
    }
LABEL_22:
    uint64_t v56 = v28;
    v59 = v27;
    goto LABEL_23;
  }
  v18 = share_sheet_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10017407C();
  }
LABEL_40:

  objc_sync_exit(v12);
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_activateCalled)
  {
    id v3 = daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1001741C0();
    }
  }
  else
  {
    id v4 = daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(SDShareSheetSlotManager *)v2 machServiceName];
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v10, 0xCu);
    }
    v2->_activateCalled = 1;
    id v6 = objc_alloc((Class)NSXPCListener);
    double v7 = [(SDShareSheetSlotManager *)v2 machServiceName];
    double v8 = (NSXPCListener *)[v6 initWithMachServiceName:v7];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v8;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcListener resume];
    +[_UIActivityHelper registerContinuousExtensionsDiscoveryOnLaunch];
  }
  objc_sync_exit(v2);
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidateCalled)
  {
    v2->_invalidateCalled = 1;
    [(NSXPCListener *)v2->_xpcListener invalidate];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = [(SDShareSheetSlotManager *)v2 activeConnections];
    id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) invalidate];
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    v2->_invalidateDone = 1;
  }
  objc_sync_exit(v2);
}

- (id)_remoteObjectProxyForConnection:(id)a3
{
  id v3 = a3;
  id location = 0;
  objc_initWeak(&location, v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10015FB58;
  v6[3] = &unk_1008CE8C0;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)configurationForDataSourceUpdateWithSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ([v4 sharingExpanded])
  {
    id v6 = [v4 peopleNodes];
    id v7 = [v6 count];

    if (v7)
    {
      long long v8 = objc_opt_new();
      long long v9 = [v4 hostConfiguration];
      unsigned __int8 v10 = [v9 isCollaborative];

      if ((v10 & 1) == 0)
      {
        id v11 = [v4 airDropNodes];
        [v8 addObjectsFromArray:v11];
      }
      v12 = [v4 peopleNodes];
      [v8 addObjectsFromArray:v12];

      v13 = +[NSPredicate predicateWithFormat:@"isRestricted == NO"];
      float v14 = [v8 filteredArrayUsingPredicate:v13];
    }
    else
    {
      float v14 = 0;
    }
    unsigned __int8 v16 = [v4 hostShareActivityProxies];
    v17 = +[NSPredicate predicateWithFormat:@"isRestricted == NO"];
    double v15 = [v16 filteredArrayUsingPredicate:v17];
  }
  else
  {
    float v14 = 0;
    double v15 = 0;
  }
  v18 = objc_alloc_init(UISDShareSheetSessionConfiguration);
  [(UISDShareSheetSessionConfiguration *)v18 setPeopleProxies:v14];
  [(UISDShareSheetSessionConfiguration *)v18 setShareProxies:v15];
  char v19 = [v4 hostActionActivityProxies];
  [(UISDShareSheetSessionConfiguration *)v18 setActionProxies:v19];

  v20 = [v4 nearbyCountSlotID];
  [(UISDShareSheetSessionConfiguration *)v18 setNearbyCountSlotID:v20];

  v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 nearbyCountBadge]);
  [(UISDShareSheetSessionConfiguration *)v18 setNearbyCountBadge:v21];

  v22 = [v4 hostConfiguration];
  if ([v22 requestPeopleSuggestionsData])
  {
    unsigned __int8 v23 = [v4 hideSuggestions];

    if ((v23 & 1) == 0)
    {
      BOOL v24 = [v4 connection];
      v25 = [v24 valueForEntitlement:@"com.apple.sharesheet.allow-suggestions"];

      if (v25
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && [v25 BOOLValue])
      {
        v26 = [v4 suggestionBrowser];
        id v27 = [v26 peopleSuggestions];
        [(UISDShareSheetSessionConfiguration *)v18 setPeopleSuggestions:v27];
      }
      else
      {
        uint64_t v28 = share_sheet_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          uint64_t v35 = [v4 connection];
          v36[0] = 67109120;
          v36[1] = [v35 processIdentifier];
          _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "process %d tried to request people suggestions data, but it was not entitled!", (uint8_t *)v36, 8u);
        }
      }
    }
  }
  else
  {
  }
  v29 = [v4 screenTimeMonitor];
  id v30 = [v29 restrictedActivityTypes];

  v31 = [v4 connection];
  unsigned __int8 v32 = [(SDShareSheetSlotManager *)v5 _hasCollaborationEntitlementForConnection:v31];

  if ((v32 & 1) == 0)
  {
    uint64_t v33 = [v30 arrayByAddingObject:@"com.apple.Collaboration.Internal"];

    id v30 = (void *)v33;
  }
  [(UISDShareSheetSessionConfiguration *)v18 setRestrictedActivityTypes:v30];
  [(UISDShareSheetSessionConfiguration *)v18 setShouldBlockPresentation:[(SDShareSheetSlotManager *)v5 wantsToBlockPresentation]];

  objc_sync_exit(v5);

  return v18;
}

- (BOOL)_hasCollaborationEntitlementForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForEntitlement:@"com.apple.developer.shared-with-you.collaboration"];
  uint64_t v5 = [v3 valueForEntitlement:@"com.apple.developer.shared-with-you"];
  id v6 = [v3 valueForEntitlement:@"com.apple.private.sociallayer.highlights"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v7 = [v4 BOOLValue] ^ 1;
  }
  else {
    unsigned int v7 = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v8 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned __int8 v9 = 0;
    if (!v7) {
      goto LABEL_9;
    }
LABEL_11:
    char v10 = v8 | v9;
    goto LABEL_12;
  }
  unsigned __int8 v9 = [v6 BOOLValue];
  if (v7) {
    goto LABEL_11;
  }
LABEL_9:
  char v10 = 1;
LABEL_12:

  return v10;
}

- (void)dataSourceDidUpdateForSession:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = self;
  objc_sync_enter(v7);
  unsigned __int8 v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [v6 sessionID];
    [v6 remoteShareSheet];
    char v10 = NSStringFromBOOL();
    int v23 = 138412546;
    BOOL v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "data source did update for sessionID:%@ isRemoteShareSheet:%@", (uint8_t *)&v23, 0x16u);
  }
  id v11 = [(SDShareSheetSlotManager *)v7 configurationForDataSourceUpdateWithSession:v6];
  [v11 setWantsAnimation:v4];
  if ([v6 remoteShareSheet])
  {
    v12 = [v6 uiServiceConnection];
    v13 = [(SDShareSheetSlotManager *)v7 _remoteObjectProxyForConnection:v12];

    if (v13)
    {
      float v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        BOOL v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "update remote share sheet with configuration:%@", (uint8_t *)&v23, 0xCu);
      }

      double v15 = share_sheet_log();
      unsigned __int8 v16 = share_sheet_log();
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v7);

      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v23) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "UpdateUIService", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
      }

      [v13 dataSourceUpdatedWithSessionConfiguration:v11];
      v18 = share_sheet_log();
      char v19 = share_sheet_log();
      os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, v7);

      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        LOWORD(v23) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v20, "UpdateUIService", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
      }
    }
    else
    {
      v18 = share_sheet_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100174294();
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  v21 = [v6 connection];
  v13 = [(SDShareSheetSlotManager *)v7 _remoteObjectProxyForConnection:v21];

  if (!v13)
  {
    v18 = share_sheet_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001742C8();
    }
    goto LABEL_21;
  }
  v22 = share_sheet_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    BOOL v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "update host share sheet with configuration:%@", (uint8_t *)&v23, 0xCu);
  }

  [v13 dataSourceUpdatedWithSessionConfiguration:v11];
LABEL_22:

  objc_sync_exit(v7);
}

- (void)notifySession:(id)a3 favoritesProxies:(id)a4 suggestionProxies:(id)a5 activityCategory:(int64_t)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v21 remoteShareSheet]) {
    [v21 uiServiceConnection];
  }
  else {
  v12 = [v21 connection];
  }
  v13 = [(SDShareSheetSlotManager *)self _remoteObjectProxyForConnection:v12];
  if (a6 == 1)
  {
    float v14 = [v21 shareActivities];
    double v15 = [v14 valueForKey:@"activityUUID"];
    unsigned __int8 v16 = v13;
    id v17 = v10;
    id v18 = v11;
    char v19 = v15;
    int64_t v20 = 1;
  }
  else
  {
    float v14 = [v21 actionActivities];
    double v15 = [v14 valueForKey:@"activityUUID"];
    unsigned __int8 v16 = v13;
    id v17 = v10;
    id v18 = v11;
    char v19 = v15;
    int64_t v20 = a6;
  }
  [v16 performUserDefaultsWithFavoritesProxies:v17 suggestionProxies:v18 orderedUUIDs:v19 activityCategory:v20];
}

- (void)notifySession:(id)a3 activitySelected:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  unsigned int v7 = self;
  objc_sync_enter(v7);
  unsigned __int8 v8 = [v20 connection];
  unsigned __int8 v9 = [(SDShareSheetSlotManager *)v7 _remoteObjectProxyForConnection:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v6 activityUUID];
    [v9 performActivityInHostWithUUID:v10];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v10 = v6;
    id v11 = +[MCProfileConnection sharedConnection];
    v12 = [v20 hostAppBundleID];
    unsigned int v13 = [v11 isAppManaged:v12];

    float v14 = [v20 hostConfiguration];
    LODWORD(v12) = [v14 isContentManaged];

    unsigned int v15 = [v11 mayOpenFromManagedToUnmanaged];
    unsigned __int8 v16 = [v10 activityType];
    id v17 = +[UISUIActivityExtensionItemDataRequest requestForActivity:v10 activityType:v16 sourceAppIsManaged:(v13 | v12) & (v15 ^ 1)];

    id v18 = [v10 applicationExtension];
    char v19 = [v18 identifier];
    [v9 performExtensionActivityInHostWithBundleID:v19 request:v17];
  }
LABEL_6:

  objc_sync_exit(v7);
}

- (void)notifySession:(id)a3 shortcutSelectedWithBundleID:(id)a4 singleUseToken:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = [v13 connection];
  v12 = [(SDShareSheetSlotManager *)v10 _remoteObjectProxyForConnection:v11];

  [v12 performShortcutActivityInHostWithBundleID:v8 singleUseToken:v9];
  objc_sync_exit(v10);
}

- (void)notifySession:(id)a3 personSelectedWithActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [v6 connection];
  id v10 = [(SDShareSheetSlotManager *)v8 _remoteObjectProxyForConnection:v9];

  id v11 = [(SDShareSheetSlotManager *)v8 _activityWithActivityType:v7 session:v6];
  v12 = v11;
  if (v11)
  {
    id v13 = [v11 activityUUID];
    [v10 performActivityInHostWithUUID:v13];
  }
  else
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001742FC();
    }
  }

  objc_sync_exit(v8);
}

- (void)notifySession:(id)a3 withAirDropTransferChange:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [v10 connection];
  id v9 = [(SDShareSheetSlotManager *)v7 _remoteObjectProxyForConnection:v8];

  [v9 didUpdateAirDropTransferWithChange:v6];
  objc_sync_exit(v7);
}

- (void)requestAirDropItemsForNode:(id)a3 endpointUUID:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = [v9 endpointUUID];
    id v13 = v10;
    id v14 = v12;
    if (v14 == v13)
    {

      id v17 = v13;
LABEL_7:

      goto LABEL_8;
    }
    unsigned int v15 = v14;
    if ((v13 == 0) == (v14 != 0))
    {

LABEL_10:
      id v17 = +[NSAssertionHandler currentHandler];
      uint64_t v28 = [v9 endpointUUID];
      [v17 handleFailureInMethod:a2, self, @"SDShareSheetSlotManager.m", 1929, @"endpointUUID:%@ mismatching node.endpointUUID:%@", v13, v28 object file lineNumber description];
      id v13 = (id)v28;
      goto LABEL_7;
    }
    unsigned __int8 v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_10;
    }
  }
LABEL_8:
  id v18 = self;
  objc_sync_enter(v18);
  char v19 = objc_alloc_init(SDAirDropActivity);
  id v20 = [v11 hostAppBundleID];
  [(SDAirDropActivity *)v19 setSendingAppBundleID:v20];

  [(SDAirDropActivity *)v19 setMaxPreviews:3];
  [v11 setActiveAirDropActivity:v19];
  id v21 = +[UISUIActivityExtensionItemDataRequest requestForActivity:v19 activityType:UIActivityTypeAirDrop activitySpecificMetadata:0];
  objc_sync_exit(v18);

  v22 = [v11 connection];
  int v23 = [(SDShareSheetSlotManager *)v18 _remoteObjectProxyForConnection:v22];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100160DF8;
  v29[3] = &unk_1008CE910;
  id v30 = v19;
  id v31 = v11;
  id v32 = v10;
  id v33 = v9;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v27 = v19;
  [v23 willPerformInServiceActivityWithRequest:v21 completion:v29];
}

- (void)connectToDaemonWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [[SHSheetRemoteConnectionContext alloc] initWithDictionary:v6];
  id v9 = self;
  objc_sync_enter(v9);
  id v10 = [(SHSheetRemoteConnectionContext *)v8 urlsBeingShared];
  id v11 = [(SDShareSheetSlotManager *)v9 _filterForSharableURLs:v10];
  [(SHSheetRemoteConnectionContext *)v8 setUrlsBeingShared:v11];

  v51 = [(SHSheetRemoteConnectionContext *)v8 sessionIdentifier];
  v12 = [SDShareSheetSession alloc];
  id v13 = [(SDShareSheetSlotManager *)v9 currentConnection];
  BOOL v14 = [(SHSheetRemoteConnectionContext *)v8 instantShareSheet];
  uint64_t v15 = [(SHSheetRemoteConnectionContext *)v8 remoteShareSheet];
  unsigned __int8 v16 = [(SDShareSheetSession *)v12 initWithSessionID:v51 xpcConnection:v13 instantShareSheet:v14 remoteShareSheet:v15 xrRenderingMode:[(SHSheetRemoteConnectionContext *)v8 xrRenderingMode]];

  [(SDShareSheetSession *)v16 setDelegate:v9];
  [(SHSheetRemoteConnectionContext *)v8 peopleSuggestionsTimeout];
  [(SDShareSheetSession *)v16 setPeopleSuggestionsTimeout:"setPeopleSuggestionsTimeout:"];
  [(SDShareSheetSession *)v16 setShouldSuggestFamilyMembers:[(SHSheetRemoteConnectionContext *)v8 shouldSuggestFamilyMembers]];
  [(SDShareSheetSession *)v16 setHideSuggestions:[(SHSheetRemoteConnectionContext *)v8 hideSuggestions]];
  [(SDShareSheetSession *)v16 setIsSharePlayAvailable:[(SHSheetRemoteConnectionContext *)v8 isSharePlayAvailable]];
  unsigned int v17 = [(SHSheetRemoteConnectionContext *)v8 supportsCollaboration];
  if (v17)
  {
    uint64_t v15 = [(SDShareSheetSession *)v16 connection];
    BOOL v18 = [(SDShareSheetSlotManager *)v9 _hasCollaborationEntitlementForConnection:v15];
  }
  else
  {
    BOOL v18 = 0;
  }
  [(SDShareSheetSession *)v16 setSupportsCollaboration:v18];
  if (v17) {

  }
  char v19 = [(SHSheetRemoteConnectionContext *)v8 peopleSuggestionBundleIds];
  id v20 = [v19 copy];
  [(SDShareSheetSession *)v16 setPeopleSuggestionBundleIds:v20];

  id v21 = [(SHSheetRemoteConnectionContext *)v8 processedImageResultsData];
  [(SDShareSheetSession *)v16 setProcessedImageResultsData:v21];

  v22 = [(SHSheetRemoteConnectionContext *)v8 urlsBeingShared];
  id v23 = [v22 count];

  if (v23)
  {
    id v24 = [(SHSheetRemoteConnectionContext *)v8 urlsBeingShared];
    id v25 = [v24 firstObject];
    [(SDShareSheetSession *)v16 setUrlBeingShared:v25];
  }
  v50 = v7;
  if ([(SDShareSheetSession *)v16 skipSlotsRendering])
  {
    id v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "skipping slots image rendering.", buf, 2u);
    }
  }
  else
  {
    id v27 = share_sheet_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "setting-up SharingXPCHelper connection for slots image rendering.", buf, 2u);
    }

    id v26 = [(SDShareSheetSession *)v16 description];
    uint64_t v28 = [[SDXPCHelperConnection alloc] initWithQueue:0 xrRenderingMode:[(SDShareSheetSession *)v16 xrRenderingMode]];
    [(SDShareSheetSession *)v16 setXpcHelperCnx:v28];

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100161748;
    v63[3] = &unk_1008CA4B8;
    v63[4] = v26;
    v29 = [(SDShareSheetSession *)v16 xpcHelperCnx];
    [v29 setInvalidationHandler:v63];

    id v30 = [(SDShareSheetSession *)v16 xpcHelperCnx];
    [v30 activate];

    if (+[SDXPCHelperImageCache cacheIsEmpty])
    {
      id v31 = [(SDShareSheetSession *)v16 description];
      id v32 = +[NSString stringWithFormat:@"%@, cacheEmpty: %s", v31, "yes"];

      id v33 = [(SDShareSheetSession *)v16 xpcHelperCnx];
      [v33 setSessionKeepAliveTransactionIdentifier:v32];
    }
    uint64_t v34 = [(SDShareSheetSession *)v16 xpcHelperCnx];
    uint64_t v35 = [(SDShareSheetSession *)v16 airDropController];
    [v35 setHelperConnection:v34];
  }
  v49 = v6;

  *(void *)buf = 0;
  objc_initWeak((id *)buf, v9);
  id location = 0;
  objc_initWeak(&location, v16);
  id v36 = objc_alloc((Class)_UIActivityHelper);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100161794;
  v57[3] = &unk_1008CE938;
  v57[4] = v9;
  objc_copyWeak(&v59, (id *)buf);
  v37 = v8;
  v58 = v37;
  objc_copyWeak(&v60, &location);
  id v38 = [v36 initWithDelegate:v9 sessionID:v51 fetchShortcutsBlock:v57];
  [(SDShareSheetSession *)v16 setActivityHelper:v38];

  [(NSMutableDictionary *)v9->_sessionIDToShareSheetSession setObject:v16 forKeyedSubscript:v51];
  v39 = [(SHSheetRemoteConnectionContext *)v37 discoveryContext];
  if (v39)
  {
    v40 = [(SDShareSheetSession *)v16 activityHelper];
    [v40 primeWithDiscoveryContext:v39];

    v41 = [v39 activityItemValueExtensionMatchingDictionaries];
    id v42 = [(SHSheetRemoteConnectionContext *)v37 assetIdentifiers];
    v43 = [(SHSheetRemoteConnectionContext *)v37 urlsBeingShared];
    v44 = [(SHSheetRemoteConnectionContext *)v37 sandboxExtensionsByfileURLPath];
    [(SDShareSheetSlotManager *)v9 activateSuggestionBrowserForSession:v16 withExtensionMatchingDictionaries:v41 assetIdentifiers:v42 urlsBeingShared:v43 sandboxExtensionsByfileURLPath:v44];
  }
  v45 = [(SDShareSheetSession *)v16 peopleBrowser];
  [v45 setDiffableDelegate:v9];

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100161958;
  v55[3] = &unk_1008CE960;
  objc_copyWeak(&v56, (id *)buf);
  id v46 = [(SDShareSheetSession *)v16 airDropController];
  [v46 setTransferUpdateChangedHandler:v55];

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001619B4;
  v52[3] = &unk_1008CE6E8;
  objc_copyWeak(&v54, (id *)buf);
  id v47 = v51;
  id v53 = v47;
  v48 = [(SDShareSheetSession *)v16 airDropController];
  [v48 setAvailableNodesChangedHandler:v52];

  [(SDShareSheetSession *)v16 activate];
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  objc_sync_exit(v9);
  v50[2](v50);
}

- (void)connectUIServiceToDaemonWithSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  if (v6)
  {
    id v7 = [(SDShareSheetSlotManager *)v5 currentConnection];
    [v6 setUiServiceConnection:v7];

    if ([v6 sentInitialConfiguration]) {
      [(SDShareSheetSlotManager *)v5 dataSourceDidUpdateForSession:v6 animated:0];
    }
  }
  else
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10017443C();
    }
  }
  objc_sync_exit(v5);
}

- (id)_filterForSharableURLs:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isFileURL", (void)v16))
        {
          v12 = [(SDShareSheetSlotManager *)self currentConnection];
          unsigned int v13 = [v12 sd_connectionCanShareURL:v11];

          if (!v13) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (id)_fetchShortcutWorkflowsForMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleID:(id)a5 iconSize:(CGSize)a6 iconScale:(double)a7 error:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = share_sheet_log();
  long long v19 = share_sheet_log();
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);

  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "FetchShortcuts", " enableTelemetry=YES ", buf, 2u);
  }

  id v21 = +[VCVoiceShortcutClient standardClient];
  v22 = [v21 shareSheetWorkflowsForExtensionMatchingDictionaries:v17 resolvedActivityItems:v16 hostBundleIdentifier:v15 iconSize:width iconScale:height error:a7];

  id v23 = share_sheet_log();
  id v24 = share_sheet_log();
  os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, self);

  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)id v27 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v25, "FetchShortcuts", " enableTelemetry=YES ", v27, 2u);
  }

  return v22;
}

- (id)_shortcutActivitiesForMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleID:(id)a5 configuration:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [v10 iconSize];
  double v15 = v14;
  double v17 = v16;
  [v10 iconScale];
  double v19 = v18;

  id v35 = 0;
  os_signpost_id_t v20 = -[SDShareSheetSlotManager _fetchShortcutWorkflowsForMatchingDictionaries:resolvedActivityItems:hostBundleID:iconSize:iconScale:error:](self, "_fetchShortcutWorkflowsForMatchingDictionaries:resolvedActivityItems:hostBundleID:iconSize:iconScale:error:", v13, v12, v11, &v35, v15, v17, v19);

  id v21 = v35;
  v22 = share_sheet_log();
  id v23 = share_sheet_log();
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, self);

  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v24, "FetchShortcuts", " enableTelemetry=YES ", buf, 2u);
  }

  if (!v20 && v21)
  {
    os_signpost_id_t v25 = share_sheet_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_1001744A4();
    }
  }
  +[NSExtension extensionWithIdentifier:@"com.apple.shortcuts.Run-Workflow" error:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001620CC;
  v31[3] = &unk_1008CE988;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v20 count]];
  id v33 = v26;
  id v27 = v32;
  [v20 enumerateObjectsUsingBlock:v31];
  uint64_t v28 = v33;
  id v29 = v26;

  return v29;
}

- (void)_configureSharingSectionsForSession:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 hostConfiguration];
  if (v6)
  {
    id v7 = objc_alloc((Class)_UIActivityUserDefaults);
    id v8 = +[NSUserDefaults standardUserDefaults];
    id v9 = [v7 initWithUnderlyingUserDefaults:v8 activityDefaultsKey:@"UIActivityCategoryShare"];
    [(SDShareSheetSlotManager *)v5 setShareUserDefaults:v9];

    id v10 = [v4 orderedPresentableActivities];
    id v11 = sub_10016285C(v10, 1);

    [v4 setShareActivities:v11];
    id v12 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)[v11 count] + 1);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v55;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v13);
          }
          double v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          double v18 = [v17 activityUUID];
          [v12 setObject:v17 forKeyedSubscript:v18];
        }
        id v14 = [v13 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v14);
    }

    [v4 setShareActivitiesByUUID:v12];
    if (_os_feature_enabled_impl())
    {
      double v19 = +[SDShareSheetSlotManager _groupActivitiesByBundleID:v13];
      [v4 setBundleIDToActivities:v19];

      os_signpost_id_t v20 = [v4 bundleIDToActivities];
      uint64_t v21 = [(SDShareSheetSlotManager *)v5 _removeSecondaryActivities:v13 bundleIDToActivities:v20];

      id v13 = v21;
    }
    v22 = [(SDShareSheetSlotManager *)v5 shareUserDefaults];
    if (v22)
    {
      BOOL v23 = [v13 count] == 0;

      if (!v23)
      {
        os_signpost_id_t v24 = [(SDShareSheetSlotManager *)v5 shareUserDefaults];
        os_signpost_id_t v25 = [v24 activitiesOrderedByUserActivityOrderForActivities:v13];

        [v4 setShareActivitiesInUserOrder:v25];
        id v26 = share_sheet_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Discovered Share Activities:", buf, 2u);
        }

        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10016292C;
        v53[3] = &unk_1008CE9B0;
        v53[4] = v5;
        id v27 = +[NSPredicate predicateWithBlock:v53];
        uint64_t v28 = [v25 filteredArrayUsingPredicate:v27];

        if (_os_feature_enabled_impl())
        {
          id v29 = [v6 urlsBeingShared];
          id v30 = [v29 firstObject];
          [v4 setUrlBeingShared:v30];

          id v31 = [v4 urlBeingShared];
          uint64_t v32 = [(SDShareSheetSlotManager *)v5 _moveDefaultApplicationToFrontForURL:v31 activities:v28];

          uint64_t v28 = (void *)v32;
        }
        id v33 = [v28 count];
        uint64_t v34 = [(SDShareSheetSlotManager *)v5 shareUserDefaults];
        id v35 = [v34 activityIdentifiersInUserOrder];
        id v36 = [v35 count];

        unint64_t v37 = 12;
        if ((unint64_t)v36 > 0xC) {
          unint64_t v37 = (unint64_t)v36;
        }
        if ((unint64_t)v33 >= v37) {
          id v38 = (id)v37;
        }
        else {
          id v38 = v33;
        }
        v39 = [v28 subarrayWithRange:0, v38];

        v40 = [_UIUserDefaultsActivity alloc];
        v41 = [(SDShareSheetSlotManager *)v5 shareUserDefaults];
        id v42 = [(_UIUserDefaultsActivity *)v40 initWithUserDefaults:v41 activityCategory:1];

        id v13 = [v39 arrayByAddingObject:v42];

        v43 = [(_UIUserDefaultsActivity *)v42 activityUUID];
        [v12 setObject:v42 forKeyedSubscript:v43];

        [v4 setShareUserDefaultsActivity:v42];
      }
    }
    [v4 setVisibleShareActivities:v13];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v4);
    id v46 = _NSConcreteStackBlock;
    uint64_t v47 = 3221225472;
    v48 = sub_100162A2C;
    v49 = &unk_1008CA580;
    v50 = v5;
    objc_copyWeak(&v51, (id *)buf);
    [v4 setDisabledNodesUpdatedHandler:&v46];
    v44 = [v4 visibleShareActivities:v46, v47, v48, v49, v50];
    v45 = [(SDShareSheetSlotManager *)v5 _createShareProxiesFromActivities:v44 session:v4];

    [(SDShareSheetSlotManager *)v5 _configurePeopleSuggestionsSectionForSession:v4];
    [v4 setHostShareActivityProxies:v45];

    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10017450C();
    }
  }

  objc_sync_exit(v5);
}

- (void)_configurePeopleSuggestionsSectionForSession:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 hostConfiguration];
  id v7 = v6;
  if (v6)
  {
    if ([v6 shouldSkipPeopleSuggestions])
    {
      id v8 = [v7 initialPhotosAssetDetails];
      if (v8)
      {

        goto LABEL_6;
      }
    }
    if ([v4 hideSuggestions])
    {
LABEL_6:
      id v9 = share_sheet_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = [v7 shouldSkipPeopleSuggestions];
        uint64_t v11 = [v7 initialPhotosAssetDetails];
        id v12 = (void *)v11;
        id v13 = "no";
        if (v10) {
          id v13 = "yes";
        }
        int v28 = 136315394;
        id v29 = v13;
        __int16 v30 = 2112;
        uint64_t v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SDShareSheetSlotManager: Should skip people suggestions %s with asset details %@", (uint8_t *)&v28, 0x16u);
      }
      goto LABEL_25;
    }
    id v14 = share_sheet_log();
    uint64_t v15 = share_sheet_log();
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v7);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PeopleSuggestions", "", (uint8_t *)&v28, 2u);
    }

    double v17 = [v4 suggestionBrowser];
    id v9 = [v17 peopleSuggestionNodes];

    double v18 = share_sheet_log();
    double v19 = share_sheet_log();
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, v7);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v20, "PeopleSuggestions", "", (uint8_t *)&v28, 2u);
    }

    uint64_t v21 = share_sheet_log();
    v22 = share_sheet_log();
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v7);

    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ConfigureAirDropNodesFromSuggestions", "", (uint8_t *)&v28, 2u);
    }

    os_signpost_id_t v24 = [(SDShareSheetSlotManager *)v5 shareUserDefaults];
    [(SDShareSheetSlotManager *)v5 configureAirDropNodesFromSuggestionNodes:v9 shareUserDefaults:v24 forSession:v4];

    os_signpost_id_t v25 = share_sheet_log();
    id v26 = share_sheet_log();
    os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v26, v7);

    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v27, "ConfigureAirDropNodesFromSuggestions", "", (uint8_t *)&v28, 2u);
    }
  }
  else
  {
    id v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100174540();
    }
  }
LABEL_25:

  objc_sync_exit(v5);
}

- (void)_configureActionsSectionForSession:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 hostConfiguration];
  if (v6)
  {
    id v7 = objc_alloc((Class)_UIActivityUserDefaults);
    id v8 = +[NSUserDefaults standardUserDefaults];
    id v9 = [v7 initWithUnderlyingUserDefaults:v8 activityDefaultsKey:@"UIActivityCategoryAction"];
    [(SDShareSheetSlotManager *)v5 setActionUserDefaults:v9];

    unsigned int v10 = [v4 orderedPresentableActivities];
    uint64_t v11 = sub_10016285C(v10, 0);

    [v4 setActionActivities:v11];
    id v12 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v11 count]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v35;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v13);
          }
          double v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          double v18 = [v17 activityUUID];
          [v12 setObject:v17 forKeyedSubscript:v18];
        }
        id v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v14);
    }

    double v19 = [(SDShareSheetSlotManager *)v5 actionUserDefaults];

    if (v19)
    {
      os_signpost_id_t v20 = [(SDShareSheetSlotManager *)v5 actionUserDefaults];
      uint64_t v21 = [v20 activitiesOrderedByUserActivityOrderForActivities:v13];

      [v4 setActionActivitiesInUserOrder:v21];
      v22 = share_sheet_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Discovered Action Activities:", buf, 2u);
      }

      os_signpost_id_t v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      id v29 = sub_100163280;
      __int16 v30 = &unk_1008CE9D8;
      uint64_t v31 = v5;
      id v32 = v4;
      os_signpost_id_t v23 = +[NSPredicate predicateWithBlock:&v27];
      id v13 = [v21 filteredArrayUsingPredicate:v23, v27, v28, v29, v30, v31];
    }
    [v4 setActionActivitiesByUUID:v12];
    [v4 setVisibleActionActivities:v13];
    os_signpost_id_t v24 = [v4 visibleActionActivities];
    os_signpost_id_t v25 = [v6 hostTintColor];
    id v26 = [(SDShareSheetSlotManager *)v5 _createActionProxiesFromActivities:v24 withTintColor:v25 session:v4];

    [v4 setHostActionActivityProxies:v26];
  }
  else
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100174574();
    }
  }

  objc_sync_exit(v5);
}

- (void)requestConfigurationWithSessionID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSObject *))a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  if (v9)
  {
    unsigned int v10 = [(SDShareSheetSlotManager *)v8 configurationForDataSourceUpdateWithSession:v9];
    v7[2](v7, v10);
  }
  else
  {
    unsigned int v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1001745A8();
    }
  }

  objc_sync_exit(v8);
}

- (void)sendConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSObject *))a4;
  v81 = [v6 sessionID];
  if (v81)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v9 = share_sheet_log();
    unsigned int v10 = share_sheet_log();
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v6);

    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SetConfiguration", "", buf, 2u);
    }

    id v12 = self;
    objc_sync_enter(v12);
    id v13 = [(NSMutableDictionary *)v12->_sessionIDToShareSheetSession objectForKeyedSubscript:v81];
    if (v13)
    {
      id v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "processing configuration: %@", buf, 0xCu);
      }

      uint64_t v15 = +[NSBundle mainBundle];
      os_signpost_id_t v16 = [v15 preferredLocalizations];
      [v6 setPreferredLocalizations:v16];

      double v17 = [v6 urlsBeingShared];
      double v18 = [(SDShareSheetSlotManager *)v12 _filterForSharableURLs:v17];
      [v6 setUrlsBeingShared:v18];

      double v19 = [v13 hostConfiguration];
      os_signpost_id_t v20 = [v19 hostTraitCollection];
      uint64_t v21 = [v6 hostTraitCollection];
      id v22 = v20;
      id v23 = v21;
      os_signpost_id_t v24 = v23;
      if (v22 == v23)
      {
        unsigned int v76 = 1;
      }
      else if ((v22 == 0) == (v23 != 0))
      {
        unsigned int v76 = 0;
      }
      else
      {
        unsigned int v76 = [v22 isEqual:v23];
      }

      v78 = [v13 hostConfiguration];

      unsigned int v26 = +[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled];
      if (v78) {
        unsigned int v27 = 0;
      }
      else {
        unsigned int v27 = v26;
      }
      if (v27 == 1)
      {
        uint64_t v28 = [v13 airDropController];
        id v29 = [v13 hostAppBundleID];
        [v28 activateWithBundleID:v29];
      }
      __int16 v30 = [v13 hostConfiguration];
      v79 = [v30 securityScopedURLsForMatching];

      [v13 setHostConfiguration:v6];
      uint64_t v31 = [v13 xpcHelperCnx];
      [v31 updateShareSheetHostConfiguration:v6];

      id v32 = [v13 hostConfiguration];
      v80 = [v32 securityScopedURLsForMatching];

      if (v80)
      {
        [v13 _activateSecurityContext:v80];
        if (v79 != v80) {
          [v13 _deactivateSecurityContext:v79];
        }
      }
      id v33 = +[SDStatusMonitor sharedMonitor];
      unsigned int v34 = [v33 isAirDropAllowed];

      v77 = [v13 hostAppBundleID];
      long long v35 = +[MCProfileConnection sharedConnection];
      unsigned int v36 = [v35 isClassroomEnabled];

      id v37 = [v6 isContentManaged];
      id v38 = +[MCProfileConnection sharedConnection];
      unsigned int v39 = [v38 mayShareToAirDropForOriginatingAppBundleID:v77 originatingAccountIsManaged:v37];

      int v40 = (v34 | v36) & v39;
      if (v40 == 1)
      {
        id v38 = [v6 excludedActivityTypes];
        uint64_t v41 = [v38 containsObject:UIActivityTypeAirDrop] ^ 1;
      }
      else
      {
        uint64_t v41 = 0;
      }
      [v13 setAirDropAllowed:v41];
      if (v40) {

      }
      id v42 = share_sheet_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413570;
        *(void *)&buf[4] = v13;
        __int16 v86 = 1024;
        unsigned int v87 = v34;
        __int16 v88 = 1024;
        unsigned int v89 = v36;
        __int16 v90 = 2112;
        v91 = v77;
        __int16 v92 = 1024;
        int v93 = (int)v37;
        __int16 v94 = 1024;
        unsigned int v95 = v39;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@, airdropGloballyAllowed: %i, classroomEnabled: %i, hostBundleID: %@, isContentManaged: %i, mayShare: %i", buf, 0x2Eu);
      }

      if (([v6 excludedActivityCategories] & 2) != 0
        || [v6 sharingStyle] == (id)2)
      {
        char v43 = 1;
        BOOL v44 = 1;
      }
      else
      {
        char v43 = 0;
        BOOL v44 = [v6 sharingStyle] == (id)1;
      }
      [v13 setSharingExpanded:[v13 sharingExpanded] | !v44];
      [v13 setIsCollaborative:[v6 isCollaborative]];
      v45 = [v6 recipients];
      [v13 setRecipients:v45];

      id v46 = [(SDShareSheetSlotManager *)v12 currentConnection];

      if (v46)
      {
        uint64_t v47 = share_sheet_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [(SDShareSheetSlotManager *)v12 currentConnection];
          v49 = [v48 sd_connectionBundleID];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v49;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "current connection bundle ID: %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v47 = share_sheet_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_1001746E0();
        }
      }

      v50 = share_sheet_log();
      id v51 = share_sheet_log();
      os_signpost_id_t v52 = os_signpost_id_make_with_pointer(v51, v6);

      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_BEGIN, v52, "LoadPresentableActivitiesForSession", " enableTelemetry=YES ", buf, 2u);
      }

      id v53 = [v6 hostHiddenActivityConfigurations];
      long long v54 = +[SUIHostActivityProxy activitiesForConfigurations:v53];
      [v13 setHiddenActivities:v54];

      [(SDShareSheetSlotManager *)v12 _loadPresentableActivitiesForSession:v13];
      long long v55 = share_sheet_log();
      long long v56 = share_sheet_log();
      os_signpost_id_t v57 = os_signpost_id_make_with_pointer(v56, v6);

      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, v57, "LoadPresentableActivitiesForSession", " enableTelemetry=YES ", buf, 2u);
      }

      if ((v43 & 1) == 0)
      {
        if ([v13 sharingExpanded])
        {
          v58 = share_sheet_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "fetching sharing sections synchronously…", buf, 2u);
          }

          [(SDShareSheetSlotManager *)v12 _configureSharingSectionsForSession:v13];
        }
        else
        {
          id v59 = share_sheet_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "fetching sharing sections asynchronously…", buf, 2u);
          }

          *(void *)buf = 0;
          objc_initWeak((id *)buf, v12);
          id v60 = [v13 connection];
          v61 = [v60 _queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10016418C;
          block[3] = &unk_1008CA248;
          objc_copyWeak(&v84, (id *)buf);
          id v83 = v13;
          dispatch_async(v61, block);

          objc_destroyWeak(&v84);
          objc_destroyWeak((id *)buf);
        }
      }
      [(SDShareSheetSlotManager *)v12 _configureActionsSectionForSession:v13];
      if (!v78 || v76 != 1)
      {
        if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled])
        {
          v62 = [v13 airDropController];
          v63 = [v62 availableNodes];
          v64 = [v13 sessionID];
          [(SDShareSheetSlotManager *)v12 handleAirDropNodesChanged:v63 sessionID:v64];
        }
        else
        {
          v62 = [v13 peopleBrowser];
          v63 = [v13 peopleBrowser];
          v64 = [v63 people];
          [(SDShareSheetSlotManager *)v12 browser:v62 didUpdatePeople:v64 deletedContactIdentifiers:0];
        }
      }
      v65 = [v13 selectedNode];
      [v65 setSelectionReason:2];

      v66 = [v13 selectedNode];
      [(SDShareSheetSlotManager *)v12 createAirDropProxyForNode:v66 session:v13];

      [(SDShareSheetSlotManager *)v12 updateNearbyCountSlotIDForSession:v13];
      v67 = share_sheet_log();
      v68 = share_sheet_log();
      os_signpost_id_t v69 = os_signpost_id_make_with_pointer(v68, v6);

      if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_END, v69, "SetConfiguration", "", buf, 2u);
      }

      if ([v13 remoteShareSheet])
      {
        os_signpost_id_t v25 = 0;
      }
      else
      {
        os_signpost_id_t v25 = [(SDShareSheetSlotManager *)v12 configurationForDataSourceUpdateWithSession:v13];
        [v25 setReloadData:1];
      }
      [v13 setSentInitialConfiguration:1];
      [v13 reportCurrentInvocationForDuration:(uint64_t)((CFAbsoluteTimeGetCurrent() - Current) * 1000.0)];
      v70 = [v13 uiServiceConnection];

      if (v70) {
        [(SDShareSheetSlotManager *)v12 dataSourceDidUpdateForSession:v13 animated:0];
      }
      v71 = [v13 findSupportedActivitiesCompletionHandler];

      if (v71)
      {
        v72 = [v13 findSupportedActivitiesCompletionHandler];
        [v13 setFindSupportedActivitiesCompletionHandler:0];
        [(SDShareSheetSlotManager *)v12 activityViewControllerWithSessionID:v81 findSupportedActivitiesWithCompletionHandler:v72];
      }
      v73 = [v13 performActivityType];

      if (v73)
      {
        v74 = [v13 performActivityType];
        [v13 setPerformActivityType:0];
        v75 = [v13 performActivityCompletionHandler];
        [v13 setPerformActivityCompletionHandler:0];
        [(SDShareSheetSlotManager *)v12 activityViewControllerWithSessionID:v81 performActivityWithType:v74 completionHandler:v75];
      }
    }
    else
    {
      v79 = share_sheet_log();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT)) {
        sub_100174678();
      }
      os_signpost_id_t v25 = 0;
    }

    objc_sync_exit(v12);
    if (v13) {
      v7[2](v7, v25);
    }
  }
  else
  {
    os_signpost_id_t v25 = share_sheet_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_100174610();
    }
  }
}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001642A0;
  v7[3] = &unk_1008CEA28;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  +[SFCollaborationUtilities createSharingURLForCollaborationRequest:v6 completionHandler:v7];
}

- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, id, id))a4;
  id v6 = a3;
  id v13 = 0;
  id v7 = [objc_alloc((Class)LSClaimBinding) initWithURL:v6 error:&v13];

  id v8 = v13;
  id v9 = [v7 claimRecord];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    os_signpost_id_t v11 = [v7 claimRecord];
    id v12 = [v11 defaultShareModeCollaboration];
  }
  else
  {
    id v12 = 0;
  }
  v5[2](v5, v12, v8);
}

- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v7 = +[SFCollaborationUserDefaults sharedDefaults];
  id v8 = [v7 existingCollaborativeModeForContentIdentifier:v6];

  v5[2](v5, v8);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[SFCollaborationUserDefaults sharedDefaults];
  id v7 = [v6 BOOLValue];

  [v8 setCollaborativeMode:v7 contentIdentifier:v5];
}

- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
}

- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
}

- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
}

- (void)shareStatusForFileURL:(id)a3 completionHandler:(id)a4
{
}

- (id)_moveDefaultApplicationToFrontForURL:(id)a3 activities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFileURL])
  {
    id v8 = +[UIDocumentInteractionController interactionControllerWithURL:v6];
    uint64_t v9 = [v8 _defaultApplication];
    if (!v9)
    {
      id v19 = v7;

      goto LABEL_33;
    }
    char v10 = (void *)v9;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v7 = v7;
    id v11 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v11)
    {
      id v12 = v11;
      id v38 = v8;
      uint64_t v13 = *(void *)v45;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          os_signpost_id_t v16 = [v15 applicationProxy];
          unsigned int v17 = [v16 isEqual:v10];

          if (v17)
          {
            id v18 = v15;
            goto LABEL_13;
          }
        }
        id v12 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      id v18 = 0;
LABEL_13:
      id v8 = v38;
    }
    else
    {
      id v18 = 0;
    }

    os_signpost_id_t v20 = [(SDShareSheetSlotManager *)self shareUserDefaults];
    uint64_t v21 = [v20 activityIdentifiersInUserOrder];

    if (v18)
    {
      id v22 = [v18 _activityTypeUsingFallbackActivityTypeIfNecessary];
      unsigned __int8 v23 = [v21 containsObject:v22];

      if ((v23 & 1) == 0)
      {
        os_signpost_id_t v24 = [(SDShareSheetSlotManager *)self shareUserDefaults];
        unsigned int v25 = [v24 hasUserEditedActivityOrder];

        if (v25)
        {
          id v36 = v18;
          id v37 = v6;
          unsigned int v39 = v8;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v26 = v7;
          id v27 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = 0;
            uint64_t v30 = *(void *)v41;
            do
            {
              for (j = 0; j != v28; j = (char *)j + 1)
              {
                if (*(void *)v41 != v30) {
                  objc_enumerationMutation(v26);
                }
                id v32 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)j) _activityTypeUsingFallbackActivityTypeIfNecessary];
                unsigned int v33 = [v21 containsObject:v32];

                v29 += v33;
              }
              id v28 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v28);
          }
          else
          {
            uint64_t v29 = 0;
          }

          id v34 = [v26 mutableCopy];
          id v18 = v36;
          [v34 removeObject:v36];
          [v34 insertObject:v36 atIndex:v29];
          id v6 = v37;
          id v8 = v39;
        }
        else
        {
          id v34 = [v7 mutableCopy];
          [v34 removeObject:v18];
          [v34 insertObject:v18 atIndex:1];
        }

        id v7 = v34;
      }
    }
  }
  id v19 = v7;
LABEL_33:

  return v19;
}

+ (id)_bundleIdentifierForActivity:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 containingAppBundleIdentifier];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v9 = [v4 applicationExtension];
      id v7 = [v9 identifier];
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 {
         && ([v3 applicationIdentifier],
  }
             id v8 = objc_claimAutoreleasedReturnValue(),
             v8,
             v8))
  {
    id v7 = [v3 applicationIdentifier];
  }
  else
  {
    id v7 = @"noBundleID";
  }

  return v7;
}

+ (id)_groupActivitiesByBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = +[SDShareSheetSlotManager _bundleIdentifierForActivity:](SDShareSheetSlotManager, "_bundleIdentifierForActivity:", v10, (void)v17);
        id v12 = [v4 objectForKeyedSubscript:v11];
        uint64_t v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = +[NSMutableArray array];
        }
        uint64_t v15 = v14;

        [v15 addObject:v10];
        [v4 setObject:v15 forKeyedSubscript:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_removeSecondaryActivities:(id)a3 bundleIDToActivities:(id)a4
{
  id v6 = a3;
  id v7 = [(SDShareSheetSlotManager *)self _getMainActivityPerBundleID:a4];
  uint64_t v8 = +[NSMutableIndexSet indexSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v7, "indexOfObject:", v14, (void)v17) == (id)0x7FFFFFFFFFFFFFFFLL) {
          [v8 addIndex:[v9 indexOfObject:v14]];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = [v9 mutableCopy];
  [v15 removeObjectsAtIndexes:v8];

  return v15;
}

- (id)_getMainActivityPerBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [v3 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    id v23 = v3;
    do
    {
      uint64_t v8 = 0;
      id v24 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v8);
        id v10 = [v3 objectForKeyedSubscript:v9, v22, v23];
        if ([v9 isEqualToString:@"noBundleID"])
        {
          [v4 addObjectsFromArray:v10];
        }
        else
        {
          id v11 = v4;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v12 = [v3 objectForKeyedSubscript:v9];
          id v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            id v14 = v13;
            id v15 = 0;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v12);
                }
                long long v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                if (v15)
                {
                  id v19 = [*(id *)(*((void *)&v26 + 1) + 8 * i) _defaultSortGroup];
                  if ((uint64_t)v19 < (uint64_t)[v15 _defaultSortGroup])
                  {
                    id v20 = v18;

                    id v15 = v20;
                  }
                }
                else
                {
                  id v15 = v18;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v14);
          }
          else
          {
            id v15 = 0;
          }

          id v4 = v11;
          [v11 addObject:v15];

          uint64_t v7 = v22;
          id v3 = v23;
          id v6 = v24;
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)updateNearbyCountSlotIDForSession:(id)a3
{
  id v4 = a3;
  if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))id v5 = [v4 airDropNearbyCount]; {
  else
  }
    id v5 = 0;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v4 peopleNodes];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found nearby count %u people nodes %u", buf, 0xEu);
  }
  id v9 = [(SDShareSheetSlotManager *)v6 shareSheetContext];
  if ((unint64_t)v5 <= 1)
  {
    if (v5 == (id)1)
    {
      id v11 = [v4 peopleNodes];
      BOOL v10 = [v11 count] == 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }
  if ([v4 skipSlotsRendering])
  {
    if (v10) {
      id v12 = v5;
    }
    else {
      id v12 = 0;
    }
    [v4 setNearbyCountBadge:v12];
  }
  else if (v10)
  {
    *(void *)buf = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001653A4;
    v22[3] = &unk_1008CEA50;
    id v23 = v4;
    id v24 = v5;
    id v13 = v23;
    id v20 = v13;
    id v21 = v5;
    id v14 = [v13 hostConfiguration:_NSConcreteStackBlock withOptions:3221225472 usingBlock:sub_1001653FC andContext:&unk_1008CEA78];
    [(SDShareSheetSlotManager *)v6 _uploadSlotWithVectorData:v22 cgImage:&v19 performCATransaction:1 hostConfiguration:v14];

    if (*(_DWORD *)buf)
    {
      id v15 = [v13 nearbyCountSlotID];
      [v9 deleteSlot:[v15 unsignedIntValue]];

      uint64_t v16 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
      [v13 setNearbyCountSlotID:v16];
    }
  }
  else
  {
    long long v17 = [v4 nearbyCountSlotID];

    if (v17)
    {
      long long v18 = [v4 nearbyCountSlotID];
      [v9 deleteSlot:[v18 unsignedIntValue]];

      [v4 setNearbyCountSlotID:0];
    }
  }

  objc_sync_exit(v6);
}

- (id)_createShareProxiesFromActivities:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSMutableArray array];
  val = self;
  objc_sync_enter(val);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v9)
  {
    uint64_t v50 = UIActivityTypeUserDefaults;
    uint64_t v51 = *(void *)v64;
    id v46 = v7;
    do
    {
      id v52 = v9;
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v64 != v51) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        id v12 = [v7 screenTimeMonitor:v46];
        id v13 = [v11 activityType];
        id v14 = [v12 cachedPolicyForActivityType:v13];

        id v15 = [[_UIHostActivityProxy alloc] initWithActivity:v11];
        [(_UIHostActivityProxy *)v15 setIsDisabled:v14 != 0];
        uint64_t v16 = [v11 activityType];
        -[_UIHostActivityProxy setIsUserDefaultsActivity:](v15, "setIsUserDefaultsActivity:", [v16 isEqualToString:v50]);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || [(_UIHostActivityProxy *)v15 isUserDefaultsActivity])
        {
          long long v17 = [v11 activityType];
          long long v18 = UIActivityTypeAirDrop;
          uint64_t v19 = v17;
          if (v18 == v19)
          {
          }
          else
          {
            id v20 = v19;
            if ((UIActivityTypeAirDrop == 0) == (v19 != 0))
            {

              goto LABEL_17;
            }
            unsigned int v21 = [(NSString *)v18 isEqual:v19];

            if (!v21)
            {
LABEL_17:
              unsigned int v25 = share_sheet_log();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v26 = [v11 activityUUID];
                uint64_t v27 = [v11 activityType];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v26;
                __int16 v69 = 2112;
                v70 = v27;
                _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Skipping slot creation for host activity %@ with activity type %@", buf, 0x16u);
              }
              goto LABEL_32;
            }
          }
          -[_UIHostActivityProxy setIsRestricted:](v15, "setIsRestricted:", [v7 airDropAllowed] ^ 1);
          goto LABEL_17;
        }
        uint64_t v22 = [v7 hostConfiguration];
        id v23 = [v22 preferredLocalizations];
        [v11 setPreferredLocalizations:v23];

        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100165C08;
        v61[3] = &unk_1008CEAA0;
        v49 = v15;
        p_super = &v49->super;
        id v24 = objc_retainBlock(v61);
        id v53 = +[SDShareSheetSlotManager _bundleIdentifierForActivity:v11];
        if ([v53 isEqualToString:@"noBundleID"])
        {
          ((void (*)(void *, void *))v24[2])(v24, v11);
        }
        else
        {
          long long v28 = [v7 bundleIDToActivities];
          long long v29 = [v28 objectForKeyedSubscript:v53];

          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v30 = v29;
          id v31 = [v30 countByEnumeratingWithState:&v57 objects:v67 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v58;
            do
            {
              for (j = 0; j != v31; j = (char *)j + 1)
              {
                if (*(void *)v58 != v32) {
                  objc_enumerationMutation(v30);
                }
                ((void (*)(void *, void))v24[2])(v24, *(void *)(*((void *)&v57 + 1) + 8 * (void)j));
              }
              id v31 = [v30 countByEnumeratingWithState:&v57 objects:v67 count:16];
            }
            while (v31);
          }

          id v7 = v46;
        }
        if ([v7 skipSlotsRendering])
        {
          id v34 = objc_alloc((Class)SFProxyText);
          long long v35 = [v11 activityTitle];
          id v36 = [v34 initWithText:v35];
          [(_UIHostActivityProxy *)v49 setActivityTitle:v36];

          if (([v53 isEqualToString:@"noBundleID"] & 1) == 0) {
            [(_UIHostActivityProxy *)v49 setApplicationBundleIdentifier:v53];
          }
        }
        else
        {
          id v37 = [v7 hostConfiguration];
          id v38 = +[SDShareSheetSession labelColorWithHostConfiguration:v37];

          unsigned int v39 = objc_alloc_init(SDShareSheetLoadingConfiguration);
          long long v40 = [v7 xpcHelperCnx];
          [(SDShareSheetLoadingConfiguration *)v39 setHelperConnection:v40];

          [(SDShareSheetLoadingConfiguration *)v39 setTextColor:v38];
          -[SDShareSheetLoadingConfiguration setInstantShareSheet:](v39, "setInstantShareSheet:", [v7 skipSlotsRendering]);
          long long v41 = [v7 hostConfiguration];
          [(SDShareSheetLoadingConfiguration *)v39 setHostConfiguration:v41];

          *(void *)buf = 0;
          objc_initWeak((id *)buf, val);
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_100165D00;
          v54[3] = &unk_1008CEAC8;
          objc_copyWeak(&v56, (id *)buf);
          long long v42 = v39;
          long long v55 = v42;
          [(_UIHostActivityProxy *)v49 setLoadHandler:v54];

          objc_destroyWeak(&v56);
          objc_destroyWeak((id *)buf);
        }
        unsigned int v25 = p_super;
LABEL_32:

        long long v43 = share_sheet_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          long long v44 = [v11 activityType];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v15;
          __int16 v69 = 2112;
          v70 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Created share activity proxy %@ for activity type %@", buf, 0x16u);
        }
        [v8 addObject:v15];
      }
      id v9 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v9);
  }

  objc_sync_exit(val);

  return v8;
}

- (id)_createActionProxiesFromActivities:(id)a3 withTintColor:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v42 = a4;
  id v9 = a5;
  id v45 = +[NSMutableArray array];
  BOOL v10 = self;
  objc_sync_enter(v10);
  val = v10;
  id v11 = [(SDShareSheetSlotManager *)v10 actionUserDefaults];
  id v12 = [v11 activityIdentifiersInUserOrder];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v8;
  id v13 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v50;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v17 = [[_UIHostActivityProxy alloc] initWithActivity:v16];
        long long v18 = [v16 activityType];
        -[_UIHostActivityProxy setIsFavorite:](v17, "setIsFavorite:", [v12 containsObject:v18]);

        uint64_t v19 = [v16 _activityFooterText];

        if (v19)
        {
          id v20 = [v16 _activityFooterText];
          [(_UIHostActivityProxy *)v17 setActivityFooter:v20];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v21 = share_sheet_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v22 = [v16 activityUUID];
            id v23 = [v16 activityType];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v22;
            __int16 v54 = 2112;
            long long v55 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Skipping slot creation for host activity %@ with activity type %@", buf, 0x16u);
          }
        }
        else
        {
          id v24 = [v9 hostConfiguration];
          unsigned int v25 = [v24 hostTraitCollection];
          uint64_t v26 = [v25 preferredContentSizeCategory];
          [v16 setContentSizeCategory:v26];

          uint64_t v27 = [v9 hostConfiguration];
          long long v28 = [v27 preferredLocalizations];
          [v16 setPreferredLocalizations:v28];

          id v29 = [v9 skipSlotsRendering];
          if (v29)
          {
            id v30 = [v16 activityTitle];
            id v31 = +[SDShareSheetSlotManager nonBreakingActivityTitle:v30];

            id v32 = [objc_alloc((Class)SFProxyText) initWithText:v31];
            [(_UIHostActivityProxy *)v17 setActivityTitle:v32];
          }
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (v29
            && !(isKindOfClass & 1 | (([v16 isMemberOfClass:objc_opt_class()] & 1) == 0)))
          {
            unsigned int v21 = v16;
            id v37 = [v21 applicationExtension];
            id v38 = [v37 identifier];
            [(_UIHostActivityProxy *)v17 setApplicationBundleIdentifier:v38];
          }
          else
          {
            id v34 = objc_alloc_init(SDShareSheetLoadingConfiguration);
            [(SDShareSheetLoadingConfiguration *)v34 setTintColor:v42];
            long long v35 = [v9 xpcHelperCnx];
            [(SDShareSheetLoadingConfiguration *)v34 setHelperConnection:v35];

            [(SDShareSheetLoadingConfiguration *)v34 setInstantShareSheet:v29];
            id v36 = [v9 hostConfiguration];
            [(SDShareSheetLoadingConfiguration *)v34 setHostConfiguration:v36];

            *(void *)buf = 0;
            objc_initWeak((id *)buf, val);
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_10016636C;
            v46[3] = &unk_1008CEAC8;
            objc_copyWeak(&v48, (id *)buf);
            unsigned int v21 = v34;
            long long v47 = v21;
            [(_UIHostActivityProxy *)v17 setLoadHandler:v46];

            objc_destroyWeak(&v48);
            objc_destroyWeak((id *)buf);
          }
        }

        unsigned int v39 = share_sheet_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          long long v40 = [v16 activityType];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v17;
          __int16 v54 = 2112;
          long long v55 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Created action activity proxy %@ for activity type %@", buf, 0x16u);
        }
        [v45 addObject:v17];
      }
      id v13 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v13);
  }

  objc_sync_exit(val);

  return v45;
}

- (CGImage)_createActivityTitleImageForActivity:(id)a3 foregroundColor:(id)a4 sessionConnection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174714();
    }
    BOOL v10 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [v7 activityTitle];
    id v11 = v12;
    if (v12)
    {
      uint64_t v16 = v12;
      id v13 = +[NSArray arrayWithObjects:&v16 count:1];
      uint64_t v14 = [v9 CGImgForUIActivityTitles:v13 foregroundColor:v8 processOppositeColor:1];

      BOOL v10 = [v14 objectForKeyedSubscript:v11];
    }
    else
    {
      uint64_t v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100174748();
      }
      BOOL v10 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (id)_activityTitleImagesMapForActivities:(id)a3 session:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 xpcHelperCnx];
  id v8 = (void *)v7;
  if (v7)
  {
    unsigned int v25 = (void *)v7;
    id v9 = [v6 hostConfiguration];
    uint64_t v24 = +[SDShareSheetSession labelColorWithHostConfiguration:v9];

    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v17 = [v6 hostConfiguration];
            long long v18 = [v17 preferredLocalizations];
            [v16 setPreferredLocalizations:v18];

            uint64_t v19 = [v16 activityTitle];
            if (v19)
            {
              [v10 addObject:v19];
            }
            else
            {
              id v20 = share_sheet_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v32 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Couldn't retrieve an activity title for %@", buf, 0xCu);
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v13);
    }

    unsigned int v21 = v24;
    id v8 = v25;
    uint64_t v22 = [v25 CGImgForUIActivityTitles:v10 foregroundColor:v24 processOppositeColor:1];

    id v5 = v26;
  }
  else
  {
    unsigned int v21 = share_sheet_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_1001747B0();
    }
    uint64_t v22 = &__NSDictionary0__struct;
  }

  return v22;
}

- (BOOL)_loadAirDropProxy:(id)a3 forAirDropNode:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 helperConnection];
  id v12 = share_sheet_log();
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = share_sheet_log();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "LoadSuggestionUIAirdropNode", "", buf, 2u);
    }
    __int16 v54 = v11;

    uint64_t v16 = [v9 transportBundleID];
    long long v17 = +[_UIActivityHelper transportImageForBundleIdentifier:v16];

    id v13 = v17;
    id v57 = [v13 CGImage];
    long long v58 = v8;
    long long v18 = [v8 suggestionNode];
    uint64_t v19 = [v18 iconData];
    if (v19)
    {
      id v20 = (const void *)SFCreateCGImageFromData();
      [v9 setDisplayIcon:v20];
      if (v20) {
        CFRelease(v20);
      }
    }
    unsigned int v21 = self;

    id v22 = [v18 icon];
    if (v22) {
      [v9 setDisplayIcon:v22];
    }
    id v23 = [v9 displayIcon];
    id v56 = v18;
    id v24 = [v18 hasGroupImage];
    unsigned int v25 = [v10 hostLocale];
    uint64_t v26 = [v9 displayNameForLocale:v25];

    +[CATransaction begin];
    *(void *)buf = 0;
    uint64_t v61 = 0;
    double v62 = 0.0;
    long long v27 = [v10 textColor];
    if (v24) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = 2;
    }
    long long v29 = [v10 hostConfiguration];
    long long v30 = v21;
    long long v55 = (void *)v26;
    uint64_t v31 = v26;
    id v32 = v21;
    id v11 = v54;
    [(SDShareSheetSlotManager *)v30 _createNameLabelSlotWithString:v31 textColor:v27 maximumNumberOfLines:v28 isAirDrop:0 ignoreNameWrapping:v24 sessionConnection:v54 hostConfig:v29];

    long long v33 = [v9 formattedHandles];
    id v34 = [v33 count];

    long long v35 = SFLocalizedStringForKey();
    id v36 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v35, v34);

    id v37 = v57;
    id v8 = v58;
    if (v23 || v57 || *(_DWORD *)buf)
    {
      id v38 = [(SDShareSheetSlotManager *)v32 shareSheetContext];
      id v53 = +[NSMutableDictionary dictionary];
      if (v23)
      {
        unsigned int v39 = share_sheet_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v59 = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "create slot for people proxy icon image", v59, 2u);
        }

        id v40 = (id)[(SDShareSheetSlotManager *)v32 createSlotForContext:v38];
        [v38 setObject:v23 forSlot:v40];
        id v8 = v58;
        [v58 setAvatarImageSlotID:v40];
        id v37 = v57;
      }
      if (v37)
      {
        long long v41 = share_sheet_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v59 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "create slot for people proxy transport image", v59, 2u);
        }

        id v42 = (id)[(SDShareSheetSlotManager *)v32 createSlotForContext:v38];
        [v38 setObject:v37 forSlot:v42];
        long long v43 = [v9 transportBundleID];
        long long v44 = +[NSNumber numberWithUnsignedInt:v42];
        [v53 setObject:v43 forKey:v44];

        id v8 = v58;
        [v58 setTransportImageSlotID:v42];
      }
      if (*(_DWORD *)buf)
      {
        id v45 = share_sheet_log();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v59 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "create slot for people proxy text image", v59, 2u);
        }

        id v46 = [v9 displayName];
        long long v47 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
        [v53 setObject:v46 forKey:v47];

        [v8 setMainLabelSlotID:*(unsigned int *)buf];
        [v8 setMainLabelSlotHeight:v62];
      }
      id v48 = [(SDShareSheetSlotManager *)v32 accessibilityCache];
      [v48 addEntriesFromDictionary:v53];
    }
    +[CATransaction commit];
    long long v49 = share_sheet_log();
    long long v50 = share_sheet_log();
    os_signpost_id_t v51 = os_signpost_id_make_with_pointer(v50, v32);

    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)long long v59 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v51, "LoadSuggestionUIAirdropNode", "", v59, 2u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    sub_100174818();
  }

  return v11 != 0;
}

- (BOOL)_loadSharingProxy:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = share_sheet_log();
  id v10 = share_sheet_log();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LoadSharingActivityProxy", "", buf, 2u);
  }

  id v12 = [v7 activity];
  if (!v12)
  {
    long long v49 = +[NSAssertionHandler currentHandler];
    [v49 handleFailureInMethod:a2, self, @"SDShareSheetSlotManager.m", 2914, @"Invalid parameter not satisfying: %@", @"activity" object file lineNumber description];
  }
  id v13 = share_sheet_log();
  uint64_t v14 = share_sheet_log();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v16 = [v12 activityTitle];
    *(_DWORD *)buf = 138543362;
    double v62 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "UIActivityImageLoad", "%{public}@", buf, 0xCu);
  }
  long long v17 = [v12 _activityImage];
  long long v18 = share_sheet_log();
  uint64_t v19 = share_sheet_log();
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);

  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v20, "UIActivityImageLoad", " enableTelemetry=YES ", buf, 2u);
  }

  id v21 = v17;
  id v22 = [v21 CGImage];
  if (!v22)
  {
    id v23 = share_sheet_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v12 activityTitle];
      *(_DWORD *)buf = 138412546;
      double v62 = v24;
      __int16 v63 = 2112;
      id v64 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: imageRef is nil for %@ ", buf, 0x16u);
    }
  }
  +[CATransaction begin];
  if ([v8 instantShareSheet])
  {
    uint64_t v25 = 0;
    if (!v22) {
      goto LABEL_36;
    }
LABEL_35:
    id v37 = [(SDShareSheetSlotManager *)self shareSheetContext];
    uint64_t v38 = [(SDShareSheetSlotManager *)self createSlotForContext:v37];

    unsigned int v39 = [(SDShareSheetSlotManager *)self shareSheetContext];
    [v39 setObject:v22 forSlot:v38];

    [v7 setIconImageSlotID:v38];
    goto LABEL_36;
  }
  long long v52 = v8;
  uint64_t v26 = [v8 helperConnection];
  long long v27 = share_sheet_log();
  uint64_t v28 = v27;
  if (v26)
  {
    id v51 = v7;
    long long v29 = share_sheet_log();
    os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, self);

    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "UIActivityTitleDrawing", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v31 = [v52 textColor];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10016750C;
    v57[3] = &unk_1008CEAF0;
    v57[4] = self;
    id v58 = v12;
    id v59 = v31;
    id v60 = v26;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10016751C;
    v53[3] = &unk_1008CEB18;
    v53[4] = self;
    id v50 = v58;
    id v54 = v50;
    uint64_t v28 = v59;
    long long v55 = v28;
    id v56 = v60;
    id v32 = [v52 hostConfiguration];
    [(SDShareSheetSlotManager *)self _uploadSlotWithVectorData:v57 cgImage:v53 performCATransaction:0 hostConfiguration:v32];
    uint64_t v25 = *(unsigned int *)buf;

    long long v33 = share_sheet_log();
    id v34 = share_sheet_log();
    os_signpost_id_t v35 = os_signpost_id_make_with_pointer(v34, self);

    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v35, "UIActivityTitleDrawing", " enableTelemetry=YES ", buf, 2u);
    }

    id v7 = v51;
    if (!v25)
    {
      id v36 = share_sheet_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        sub_100174880(v50, (uint64_t)v28, v36);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      sub_10017484C();
    }
    uint64_t v25 = 0;
  }

  id v8 = v52;
  if (v22) {
    goto LABEL_35;
  }
LABEL_36:
  +[CATransaction commit];
  if (v25)
  {
    id v40 = [(SDShareSheetSlotManager *)self accessibilityCache];
    long long v41 = [v12 activityTitle];
    id v42 = +[NSNumber numberWithUnsignedInt:v25];
    [v40 setLabel:v41 forSlotID:v42];

    [v7 setLabelSlotID:v25];
  }
  long long v43 = share_sheet_log();
  long long v44 = share_sheet_log();
  os_signpost_id_t v45 = os_signpost_id_make_with_pointer(v44, self);

  if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v45, "LoadSharingActivityProxy", "", buf, 2u);
  }

  if (v22) {
    BOOL v46 = 0;
  }
  else {
    BOOL v46 = v25 == 0;
  }
  BOOL v47 = !v46;

  return v47;
}

- (BOOL)_loadActionProxy:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = share_sheet_log();
  id v10 = share_sheet_log();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LoadActionActivityProxy", "", buf, 2u);
  }

  id v12 = [v7 activity];
  if (!v12)
  {
    id v54 = +[NSAssertionHandler currentHandler];
    [v54 handleFailureInMethod:a2, self, @"SDShareSheetSlotManager.m", 2972, @"activity is nil for proxy:%@", v7 object file lineNumber description];
  }
  id v13 = share_sheet_log();
  uint64_t v14 = share_sheet_log();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    uint64_t v16 = [v12 activityTitle];
    *(_DWORD *)buf = 138543362;
    long long v66 = v16;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "UIActivityActionImageLoad", "%{public}@", buf, 0xCu);
  }
  long long v17 = [v12 _actionImage];
  long long v18 = share_sheet_log();
  uint64_t v19 = share_sheet_log();
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);

  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v20, "UIActivityActionImageLoad", " enableTelemetry=YES ", buf, 2u);
  }

  id v21 = v17;
  id v22 = [v21 CGImage];
  if (!v22)
  {
    id v23 = share_sheet_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v12 activityTitle];
      *(_DWORD *)buf = 138412546;
      long long v66 = v24;
      __int16 v67 = 2112;
      *(void *)v68 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: imageRef is nil for %@ ", buf, 0x16u);
    }
  }
  uint64_t v25 = &NSCalendarIdentifierGregorian_ptr;
  +[CATransaction begin];
  id v56 = v8;
  if ([v8 instantShareSheet])
  {
    uint64_t v26 = 0;
    double v27 = 0.0;
  }
  else
  {
    uint64_t v28 = [v8 helperConnection];
    if (v28)
    {
      long long v29 = [v12 activityTitle];
      os_signpost_id_t v30 = +[SDShareSheetSlotManager nonBreakingActivityTitle:v29];

      uint64_t v31 = [v8 tintColor];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_100167C30;
      v61[3] = &unk_1008CEB40;
      id v62 = v28;
      id v63 = v30;
      id v64 = v31;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100167C40;
      v57[3] = &unk_1008CEB68;
      id v58 = v62;
      id v32 = v63;
      id v59 = v32;
      id v33 = v64;
      id v60 = v33;
      id v34 = [v8 hostConfiguration];
      [(SDShareSheetSlotManager *)self _uploadSlotWithVectorData:v61 cgImage:v57 performCATransaction:0 hostConfiguration:v34];
      uint64_t v26 = *(unsigned int *)buf;
      double v27 = *(double *)&v68[2];

      if (!v26)
      {
        os_signpost_id_t v35 = share_sheet_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          long long v66 = v32;
          __int16 v67 = 2112;
          *(void *)v68 = v12;
          *(_WORD *)&v68[8] = 2112;
          id v69 = v33;
          _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "returned nil: CGImgForActionPlatterWithTitle:%@, in: %@, tintColor:%@", buf, 0x20u);
        }
      }
      uint64_t v25 = &NSCalendarIdentifierGregorian_ptr;
    }
    else
    {
      id v32 = share_sheet_log();
      double v27 = 0.0;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_100174930();
      }
      uint64_t v26 = 0;
    }
  }
  id v36 = [(SDShareSheetSlotManager *)self shareSheetContext];
  if (v22)
  {
    uint64_t v37 = [(SDShareSheetSlotManager *)self createSlotForContext:v36];
    [v36 setObject:v22 forSlot:v37];
    [v7 setIconImageSlotID:v37];
  }
  if (v26)
  {
    uint64_t v38 = [(SDShareSheetSlotManager *)self accessibilityCache];
    unsigned int v39 = [v12 activityTitle];
    +[NSNumber numberWithUnsignedInt:v26];
    long long v55 = v36;
    uint64_t v40 = v26;
    id v41 = v21;
    id v42 = self;
    id v43 = v22;
    long long v44 = v12;
    id v45 = v7;
    v47 = BOOL v46 = v25;
    [v38 setLabel:v39 forSlotID:v47];

    uint64_t v25 = v46;
    id v7 = v45;
    id v12 = v44;
    id v22 = v43;
    self = v42;
    id v21 = v41;
    uint64_t v26 = v40;
    id v36 = v55;

    [v7 setSlotTextHeight:v27];
    [v7 setLabelSlotID:v26];
  }
  [(NSCalendarIdentifier *)(id)v25[71] commit];
  id v48 = share_sheet_log();
  long long v49 = share_sheet_log();
  os_signpost_id_t v50 = os_signpost_id_make_with_pointer(v49, self);

  if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, v50, "LoadActionActivityProxy", "", buf, 2u);
  }

  if (v22) {
    BOOL v51 = 0;
  }
  else {
    BOOL v51 = v26 == 0;
  }
  BOOL v52 = !v51;

  return v52;
}

+ (id)nonBreakingActivityTitle:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = v3;
  if (!v3) {
    id v3 = &stru_1008E7020;
  }
  id v5 = [(__CFString *)v3 mutableCopy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [&off_1009070A0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(&off_1009070A0);
        }
        [v5 replaceOccurrencesOfString:*(void *)(*((void *)&v11 + 1) + 8 * i) withString:&stru_1008E7020 options:2 range:objc_msgSend(v5, "length")];
      }
      id v7 = [&off_1009070A0 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [v5 replaceOccurrencesOfString:@"\n" withString:@" " options:2 range:NSMakeRange([v5 length], 0)];

  return v5;
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActivityWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  id v10 = v9;
  if (v9)
  {
    long long v11 = [v9 shareActivitiesByUUID];
    long long v12 = [v11 objectForKeyedSubscript:v7];

    long long v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Selected activity %@", buf, 0xCu);
    }

    long long v14 = [v10 recipients];
    BOOL v15 = [v14 count] == 0;

    if (v15)
    {
      id v21 = [v10 suggestionBrowser];
      id v22 = [v12 activityType];
      [v21 provideFeedbackForNodeAtIndex:0 bundleID:v22 selectedActionBundleID:0 abandoned:0];

      [(SDShareSheetSlotManager *)v8 _performSelectedActivity:v12 inSession:v10];
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, v8);
      uint64_t v16 = share_sheet_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [v10 recipients];
        long long v18 = [v12 activityType];
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        os_signpost_id_t v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating suggestion from provided recipients %@ and activity %@", buf, 0x16u);
      }
      uint64_t v19 = [v10 recipients];
      os_signpost_id_t v20 = [v12 activityType];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10016817C;
      v23[3] = &unk_1008CEB90;
      v23[4] = v10;
      long long v12 = v12;
      id v24 = v12;
      objc_copyWeak(&v25, &location);
      +[SDSuggestionCreationUtilities retrieveSuggestionForRecipients:v19 inActivityType:v20 completionHandler:v23];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    long long v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100174964();
    }
  }

  objc_sync_exit(v8);
}

- (void)_performSelectedActivity:(id)a3 inSession:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [v13 activityType];
  unsigned int v9 = [v8 isEqualToString:UIActivityTypeUserDefaults];

  if (v9)
  {
    [(SDShareSheetSlotManager *)v7 _instructHostToPerformUserDefaultsActivityForCategory:1 session:v6];
    goto LABEL_11;
  }
  if (objc_msgSend(v13, "ss_shouldExecuteInShareSheet"))
  {
    [(SDShareSheetSlotManager *)v7 _performServiceInitiatedActivityInServiceWithActivity:v13 session:v6];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v13;
    [(SDShareSheetSlotManager *)v7 _instructHostToPerformExtensionActivity:v10 session:v6];
LABEL_9:

    goto LABEL_11;
  }
  long long v11 = [v13 activityType];
  unsigned int v12 = [v11 isEqualToString:UIActivityTypeAirDrop];

  if (v12)
  {
    id v10 = [v6 airDropPeople];
    -[SDShareSheetSlotManager _instructHostToPerformAirDropActivityWithNoContentView:session:](v7, "_instructHostToPerformAirDropActivityWithNoContentView:session:", [v10 count] == 0, v6);
    goto LABEL_9;
  }
  [(SDShareSheetSlotManager *)v7 _instructHostToPerformHostActivity:v13 session:v6];
LABEL_11:
  objc_sync_exit(v7);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SDShareSheetSlotManager *)self getShareSheetSessionForSessionID:v6];
  unsigned int v9 = self;
  objc_sync_enter(v9);
  if (!v8)
  {
    long long v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174AA0();
    }
    goto LABEL_8;
  }
  id v10 = [v8 actionActivitiesByUUID];
  long long v11 = [v10 objectForKeyedSubscript:v7];

  unsigned int v12 = [v8 suggestionBrowser];
  id v13 = [v11 activityType];
  [v12 provideFeedbackForNodeAtIndex:0 bundleID:0 selectedActionBundleID:v13 abandoned:0];

  long long v14 = [v11 activityType];
  if ([v14 isEqualToString:UIActivityTypeUserDefaults])
  {

LABEL_7:
    [(SDShareSheetSlotManager *)v9 _instructHostToPerformUserDefaultsActivityForCategory:0 session:v8];
    goto LABEL_8;
  }
  BOOL v15 = [v11 activityType];
  unsigned int v16 = [v15 isEqualToString:@"com.apple.UIKit.activity.ActionDefaults"];

  if (v16) {
    goto LABEL_7;
  }
  id v21 = [v11 activityType];
  unsigned int v22 = [v21 isEqualToString:@"com.apple.UIKit.activity.Share"];

  if (v22)
  {
    id v23 = [v8 visibleActionActivities];
    id v24 = [v23 mutableCopy];

    id v25 = [v24 indexOfObject:v11];
    [v24 removeObject:v11];
    uint64_t v26 = [v8 hostActionActivityProxies];
    id v27 = [v26 mutableCopy];

    [v27 removeObjectAtIndex:v25];
    [v8 setHostActionActivityProxies:v27];
    [v8 setVisibleActionActivities:v24];
    [v8 setSharingExpanded:1];
    uint64_t v28 = share_sheet_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "did expand sharing", buf, 2u);
    }

    [(SDShareSheetSlotManager *)v9 dataSourceDidUpdateForSession:v8 animated:1];
  }
  else if (([v11 ss_shouldExecuteInShareSheet] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v11 = v11;
      int v17 = 1;
      long long v18 = v11;
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v11 = v11;
      [(SDShareSheetSlotManager *)v9 _instructHostToPerformExtensionActivity:v11 session:v8];
    }
    else
    {
      [(SDShareSheetSlotManager *)v9 _instructHostToPerformHostActivity:v11 session:v8];
    }
  }
LABEL_8:
  int v17 = 0;
  long long v18 = 0;
LABEL_9:

  objc_sync_exit(v9);
  if (v8 && v17 && v18)
  {
    uint64_t v19 = +[VCVoiceShortcutClient standardClient];
    os_signpost_id_t v20 = [v18 identifier];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100168888;
    v29[3] = &unk_1008CEBB8;
    os_signpost_id_t v30 = v18;
    uint64_t v31 = v9;
    id v32 = v8;
    [v19 generateSingleUseTokenForWorkflowIdentifier:v20 completion:v29];
  }
}

- (void)activityViewControllerWithSessionID:(id)a3 performActivityWithType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v43 = a4;
  id v42 = (void (**)(id, uint64_t, void))a5;
  unsigned int v9 = self;
  objc_sync_enter(v9);
  id v41 = v8;
  id v10 = [(NSMutableDictionary *)v9->_sessionIDToShareSheetSession objectForKeyedSubscript:v8];
  long long v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 connection];
    uint64_t v40 = [v12 valueForEntitlement:@"com.apple.sharing.sharesheet.perform-activity"];

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v40 BOOLValue])
    {
      if ([v11 sentInitialConfiguration])
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v13 = [v11 shareActivitiesByUUID];
        long long v14 = [v13 allKeys];

        id v15 = [v14 countByEnumeratingWithState:&v48 objects:v55 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v49;
LABEL_7:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v49 != v16) {
              objc_enumerationMutation(v14);
            }
            long long v18 = *(void **)(*((void *)&v48 + 1) + 8 * v17);
            uint64_t v19 = [v11 shareActivitiesByUUID];
            os_signpost_id_t v20 = [v19 objectForKeyedSubscript:v18];

            id v21 = [v20 activityType];
            unsigned __int8 v22 = [v21 isEqualToString:v43];

            if (v22) {
              break;
            }

            if (v15 == (id)++v17)
            {
              id v15 = [v14 countByEnumeratingWithState:&v48 objects:v55 count:16];
              if (v15) {
                goto LABEL_7;
              }
              goto LABEL_13;
            }
          }
          id v26 = v18;

          if (v26) {
            goto LABEL_38;
          }
          int v39 = 1;
        }
        else
        {
LABEL_13:

          int v39 = 0;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v27 = [v11 actionActivitiesByUUID];
        uint64_t v28 = [v27 allKeys];

        id v29 = [v28 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v45;
LABEL_29:
          uint64_t v31 = 0;
          while (1)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v28);
            }
            id v32 = *(void **)(*((void *)&v44 + 1) + 8 * v31);
            id v33 = [v11 actionActivitiesByUUID];
            id v34 = [v33 objectForKeyedSubscript:v32];

            os_signpost_id_t v35 = [v34 activityType];
            unsigned __int8 v36 = [v35 isEqualToString:v43];

            if (v36) {
              break;
            }

            if (v29 == (id)++v31)
            {
              id v29 = [v28 countByEnumeratingWithState:&v44 objects:v54 count:16];
              if (v29) {
                goto LABEL_29;
              }
              goto LABEL_35;
            }
          }
          id v26 = v32;

          if (!v26) {
            goto LABEL_40;
          }
          if (!v39)
          {
            [(SDShareSheetSlotManager *)v9 activityViewControllerWithSessionID:v41 selectedActionWithIdentifier:v26];
            goto LABEL_39;
          }
LABEL_38:
          [(SDShareSheetSlotManager *)v9 activityViewControllerWithSessionID:v41 selectedActivityWithIdentifier:v26];
LABEL_39:
          uint64_t v37 = 1;
        }
        else
        {
LABEL_35:

LABEL_40:
          uint64_t v38 = share_sheet_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_100174C08();
          }

          uint64_t v37 = 0;
          id v26 = 0;
        }
        v42[2](v42, v37, 0);
      }
      else
      {
        id v25 = share_sheet_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v43;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Waiting to perform activity with type:%@ until configuration is done...", buf, 0xCu);
        }

        [v11 setPerformActivityType:v43];
        [v11 setPerformActivityCompletionHandler:v42];
      }
    }
    else
    {
      id v23 = share_sheet_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100174C3C();
      }

      v42[2](v42, 0, 0);
    }
  }
  else
  {
    id v24 = share_sheet_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_100174BA0();
    }

    v42[2](v42, 0, 0);
  }

  objc_sync_exit(v9);
}

- (void)activityViewControllerWithSessionID:(id)a3 findSupportedActivitiesWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v23 = (void (**)(id, void *, void))a4;
  id v7 = self;
  objc_sync_enter(v7);
  unsigned __int8 v22 = v6;
  id v8 = [(NSMutableDictionary *)v7->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  id v25 = v8;
  if (v8)
  {
    unsigned int v9 = [v8 connection];
    id v24 = [v9 valueForEntitlement:@"com.apple.sharing.sharesheet.perform-activity"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v24 BOOLValue] & 1) == 0)
    {
      uint64_t v19 = share_sheet_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100174C3C();
      }

      id v10 = +[NSArray array];
      v23[2](v23, v10, 0);
      goto LABEL_16;
    }
    if ([v25 sentInitialConfiguration])
    {
      id v10 = +[NSMutableArray array];
      [v25 orderedPresentableActivities];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v28;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v16 = [v15 activityType];
            uint64_t v17 = +[SFShareSheetRemoteActivity sharingServiceWithIdentifier:v16];

            long long v18 = [v15 activityTitle];
            [v17 setTitle:v18];

            [v10 addObject:v17];
          }
          id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }

      v23[2](v23, v10, 0);
LABEL_16:

      goto LABEL_20;
    }
    id v21 = share_sheet_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Waiting to find supported activities until configuration is done...", buf, 2u);
    }

    [v25 setFindSupportedActivitiesCompletionHandler:v23];
  }
  else
  {
    os_signpost_id_t v20 = share_sheet_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_100174C70();
    }

    id v24 = +[NSArray array];
    v23[2](v23, v24, 0);
  }
LABEL_20:

  objc_sync_exit(v7);
}

- (void)activityViewControllerWithSessionID:(id)a3 provideFeedbackForPeopleSuggestionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  unsigned int v9 = [(NSMutableDictionary *)v8->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 suggestionBrowser];
    [v11 provideFeedbackForPeopleSuggestionIdentifier:v7];
  }
  else
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174CD8();
    }
  }

  objc_sync_exit(v8);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedPersonWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  unsigned int v9 = [(NSMutableDictionary *)v8->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  if (v9)
  {
    objc_sync_exit(v8);

    uint64_t v10 = [v9 airdropNodeForIdentifier:v7];
    if (v10)
    {
      [(SDShareSheetSlotManager *)v8 _handleSelectedNode:v10 session:v9];
    }
    else
    {
      id v12 = share_sheet_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100174D40();
      }
    }
    id v8 = (SDShareSheetSlotManager *)v10;
  }
  else
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174CD8();
    }

    objc_sync_exit(v8);
  }
}

- (void)_handleSelectedNode:(id)a3 session:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v79 = [v5 transportBundleID];
  if ([v5 isSuggestion])
  {
    id obj = self;
    objc_sync_enter(obj);
    [v6 setSelectedRecipient:v5];
    v75 = [v5 suggestionIndex];
    id v7 = +[_UIActivityHelper activityTypeForBundleIdentifier:v79];
    unsigned int v76 = v7;
    if (v7)
    {
      if (v7 == UIActivityTypeMessage)
      {
        id v8 = share_sheet_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v28 = [v5 realName];
          long long v29 = [v5 displayName];
          long long v30 = [v5 formattedHandles];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v29;
          *(_WORD *)&buf[22] = 2112;
          id v89 = v30;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Messages recipient selected with GUID %@, group name %@, and handles %@", buf, 0x20u);
        }
      }
      else
      {
        id v8 = share_sheet_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v5 formattedHandles];
          uint64_t v10 = (void *)v9;
          if (v76 == UIActivityTypeMail) {
            CFStringRef v11 = @"Mail";
          }
          else {
            CFStringRef v11 = @"SharePlay";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ recipient selected with handles %@", buf, 0x16u);
        }
      }

      uint64_t v31 = [v6 suggestionBrowser];
      [v31 provideFeedbackForNodeAtIndex:v75 bundleID:v79 selectedActionBundleID:0 abandoned:0];

      [(SDShareSheetSlotManager *)obj notifySession:v6 personSelectedWithActivityType:v76];
LABEL_46:

      objc_sync_exit(obj);
      goto LABEL_52;
    }
    id v85 = 0;
    id v27 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v79 allowPlaceholder:1 error:&v85];
    id v70 = v85;
    v73 = v27;
    if (v27)
    {
      id v72 = 0;
      id v69 = 0;
    }
    else
    {
      id v84 = 0;
      id v72 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v79 requireValid:0 platform:dyld_get_active_platform() error:&v84];
      id v69 = v84;
      if (!v72)
      {
        id v42 = share_sheet_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v79;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v70;
          *(_WORD *)&buf[22] = 2112;
          id v89 = v69;
          _os_log_fault_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "Got no application or extension record for %@ with errors %@ and %@", buf, 0x20u);
        }
        id v72 = 0;
        id v43 = 0;
        id v49 = 0;
LABEL_43:

        long long v50 = share_sheet_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          long long v51 = [v5 displayName];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v43;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v51;
          *(_WORD *)&buf[22] = 2112;
          id v89 = v79;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%@ recipient %@ selected for corresponding bundleID %@", buf, 0x20u);
        }
        BOOL v52 = [v6 suggestionBrowser];
        [v52 provideFeedbackForNodeAtIndex:v75 bundleID:v43 selectedActionBundleID:0 abandoned:0];

        [(SDShareSheetSlotManager *)obj notifySession:v6 activitySelected:v49];
        goto LABEL_46;
      }
    }
    unsigned __int8 v36 = [v6 shareActivitiesInUserOrder];
    uint64_t v37 = [v6 hiddenActivities];
    uint64_t v38 = [v36 arrayByAddingObjectsFromArray:v37];

    int v39 = [v73 applicationExtensionRecords];
    uint64_t v40 = v39;
    if (v39)
    {
      id v71 = v39;
    }
    else
    {
      id v71 = +[NSSet setWithObject:v72];
    }

    id v41 = [v71 valueForKey:@"effectiveBundleIdentifier"];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v42 = v38;
    id v43 = [v42 countByEnumeratingWithState:&v80 objects:v87 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v81;
      while (2)
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v81 != v44) {
            objc_enumerationMutation(v42);
          }
          long long v46 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          long long v47 = [v46 activityType];
          unsigned int v48 = [v41 containsObject:v47];

          if (v48)
          {
            id v43 = [v46 activityType];
            id v49 = v46;
            goto LABEL_42;
          }
        }
        id v43 = [v42 countByEnumeratingWithState:&v80 objects:v87 count:16];
        if (v43) {
          continue;
        }
        break;
      }
    }
    id v49 = 0;
LABEL_42:

    goto LABEL_43;
  }
  id v12 = share_sheet_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v5 displayName];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AirDrop node with display name %@ selected", buf, 0xCu);
  }
  long long v14 = +[SDStatusMonitor sharedMonitor];
  unsigned __int8 v15 = [v14 wirelessEnabled];

  if (v15)
  {
    uint64_t v16 = [v6 transferNodes];
    uint64_t v17 = [v5 realName];
    id v18 = [v16 objectForKeyedSubscript:v17];

    uint64_t v19 = self;
    objc_sync_enter(v19);
    if (v18 == v5)
    {
      id v32 = share_sheet_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Transfer to this node already in progress, cancelling.", buf, 2u);
      }

      [v6 cancelAirDropForNode:v5];
      id v33 = [v6 hostConfiguration];
      id v34 = [v33 hostLocale];
      v77 = [v5 displayNameForLocale:v34];

      if ([v6 skipSlotsRendering])
      {
        id v35 = [objc_alloc((Class)SFProxyText) initWithText:v77];
      }
      else
      {
        id v53 = [v6 hostConfiguration];
        id v54 = +[SDShareSheetSession labelColorWithHostConfiguration:v53];

        +[CATransaction begin];
        memset(buf, 0, sizeof(buf));
        id v55 = [v5 isClassroom];
        id v56 = [v6 xpcHelperCnx];
        id v57 = [v6 hostConfiguration];
        [(SDShareSheetSlotManager *)v19 _createNameLabelSlotWithString:v77 textColor:v54 maximumNumberOfLines:2 isAirDrop:0 ignoreNameWrapping:v55 sessionConnection:v56 hostConfig:v57];

        +[CATransaction commit];
        id v58 = [v5 displayName];

        if (v58)
        {
          id v59 = [(SDShareSheetSlotManager *)v19 accessibilityCache];
          id v60 = [v5 displayName];
          uint64_t v61 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
          [v59 setLabel:v60 forSlotID:v61];
        }
        id v62 = objc_alloc((Class)SFProxyText);
        id v35 = [v62 initWithSlotIdentifier:*(unsigned int *)buf];
      }
      id v63 = [v6 realNameToNodeID];
      id v64 = [v5 realName];
      long long v65 = [v63 objectForKeyedSubscript:v64];

      id v66 = [objc_alloc((Class)SFAirDropTransferChange) initWithState:5 progress:v65 proxyIdentifier:v35 displayName:0 status:0.0];
      [(SDShareSheetSlotManager *)v19 notifySession:v6 withAirDropTransferChange:v66];
      __int16 v67 = [v6 transferNodes];
      v68 = [v5 realName];
      [v67 removeObjectForKey:v68];

      [v6 setFiredImpactHaptic:0];
      [v6 setTransferActive:0];
      [v6 setLastTransferEvent:4];

      objc_sync_exit(v19);
    }
    else
    {
      [v6 setTransferActive:1];
      os_signpost_id_t v20 = [v6 selectionHaptic];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100169FDC;
      block[3] = &unk_1008CA4B8;
      void block[4] = v20;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      id v21 = [v5 realName];

      if (v21)
      {
        unsigned __int8 v22 = [v6 transferNodes];
        id v23 = [v5 realName];
        [v22 setObject:v5 forKeyedSubscript:v23];
      }
      [v6 setSelectedRecipient:0];
      id v24 = [v6 suggestionBrowser];
      [v24 provideFeedbackForNodeAtIndex:&off_100902CD0 bundleID:v79 selectedActionBundleID:0 abandoned:0];

      objc_sync_exit(v19);
      uint64_t v25 = [v5 endpointUUID];
      [(SDShareSheetSlotManager *)v19 requestAirDropItemsForNode:v5 endpointUUID:v25 session:v6];
      uint64_t v19 = (SDShareSheetSlotManager *)v25;
    }
  }
  else
  {
    id v26 = share_sheet_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "WiFi is Off. Presenting AirDrop UI to request WiFi access.", buf, 2u);
    }

    [(SDShareSheetSlotManager *)self _instructHostToPerformAirDropActivityWithNoContentView:0 session:v6];
  }
LABEL_52:
}

- (void)activityViewControllerWithSessionID:(id)a3 removedPersonWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id obj = v8;
  int v39 = v6;
  uint64_t v9 = [(NSMutableDictionary *)v8->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  uint64_t v40 = v9;
  if (v9)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v10 = [v9 suggestedPeople];
    CFStringRef v11 = [v10 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v42;
      while (2)
      {
        for (i = 0; i != v11; i = ((char *)i + 1))
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unsigned __int8 v15 = [v14 nodeIdentifier];
          unsigned int v16 = [v15 isEqual:v7];

          if (v16)
          {
            CFStringRef v11 = v14;
            goto LABEL_12;
          }
        }
        CFStringRef v11 = [v10 countByEnumeratingWithState:&v41 objects:v55 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    uint64_t v17 = [v40 suggestionBrowser];
    id v18 = [v11 realName];
    [v17 suggestLessPeopleSuggestionIdentifier:v18];

    uint64_t v19 = share_sheet_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v20 = [v11 nodeIdentifier];
      *(_DWORD *)buf = 138412546;
      long long v46 = v11;
      __int16 v47 = 2112;
      unsigned int v48 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Asked to remove node:%@ with identifier:%@", buf, 0x16u);
    }
    id v21 = share_sheet_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v22 = [v11 transportBundleID];
      id v23 = [v11 realName];
      id v24 = [v11 actualHandles];
      uint64_t v25 = [v11 contactIDs];
      id v26 = [v11 derivedIntentIdentifier];
      *(_DWORD *)buf = 138413314;
      long long v46 = v22;
      __int16 v47 = 2112;
      unsigned int v48 = v23;
      __int16 v49 = 2112;
      long long v50 = v24;
      __int16 v51 = 2112;
      BOOL v52 = v25;
      __int16 v53 = 2112;
      id v54 = v26;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "bundleIDs:%@, conversationID:%@, handles:%@, contactIDs:%@, derivedIntentIdentifier:%@", buf, 0x34u);
    }
    uint64_t v37 = +[_PSSuggesterConfiguration defaultConfiguration];
    id v36 = [objc_alloc((Class)_PSSuggester) initWithDaemonUsingConfiguration:v37];
    id v27 = objc_alloc((Class)_PSShareSheetSuggestLessFeedback);
    long long v28 = [v11 transportBundleID];
    long long v29 = [v11 realName];
    long long v30 = [v11 derivedIntentIdentifier];
    uint64_t v31 = [v11 actualHandles];
    id v32 = [v31 anyObject];
    id v33 = [v11 contactIDs];
    id v34 = [v33 anyObject];
    id v35 = [v27 initWithBundleId:v28 conversationId:v29 derivedIntentId:v30 handle:v32 contactId:v34];

    [v36 provideSuggestLessFeedbackForShareSheetSuggestion:v35];
  }
  else
  {
    CFStringRef v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174CD8();
    }
  }

  objc_sync_exit(obj);
}

- (void)activityViewControllerWithSessionID:(id)a3 didLongPressShareActivityWithIdentifier:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id obj = v7;
  id v26 = v6;
  id v8 = [(NSMutableDictionary *)v7->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v10 = [v8 shareActivities];
    CFStringRef v11 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v11; i = ((char *)i + 1))
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          unsigned __int8 v15 = [v14 activityUUID];
          unsigned int v16 = [v15 isEqual:v27];

          if (v16)
          {
            CFStringRef v11 = v14;
            goto LABEL_12;
          }
        }
        CFStringRef v11 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v17 = [v9 bundleIDToActivities];
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v29;
LABEL_14:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
        unsigned __int8 v22 = [v9 bundleIDToActivities];
        id v23 = [v22 objectForKeyedSubscript:v21];

        if ([v23 containsObject:v11])
        {
          if (([v21 isEqualToString:@"noBundleID"] & 1) == 0) {
            break;
          }
        }

        if (v18 == (id)++v20)
        {
          id v18 = [v17 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v18) {
            goto LABEL_14;
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      id v23 = 0;
    }

    id v24 = share_sheet_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Should present activities %@", buf, 0xCu);
    }
  }
  else
  {
    CFStringRef v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174CD8();
    }
  }

  objc_sync_exit(obj);
}

- (void)_performServiceInitiatedActivityInServiceWithActivity:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [v6 ss_activityTypeToReportToHost];
  uint64_t v10 = [v6 ss_activitySpecificExtensionItemDataRequestInfo];
  CFStringRef v11 = +[UISUIActivityExtensionItemDataRequest requestForActivity:v6 activityType:v9 activitySpecificMetadata:v10];

  uint64_t v12 = [v7 connection];
  uint64_t v13 = [(SDShareSheetSlotManager *)v8 _remoteObjectProxyForConnection:v12];

  long long v14 = [v6 didFinishPerformingActivityHandler];
  unsigned __int8 v15 = [v6 activityUUID];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10016A9C0;
  v22[3] = &unk_1008CEBE0;
  id v16 = v14;
  id v25 = v16;
  id v17 = v13;
  id v23 = v17;
  id v18 = v15;
  id v24 = v18;
  [v6 setDidFinishPerformingActivityHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10016AA54;
  v20[3] = &unk_1008CEC08;
  id v19 = v6;
  id v21 = v19;
  [v17 willPerformInServiceActivityWithRequest:v11 completion:v20];

  objc_sync_exit(v8);
}

- (id)_activityWithActivityType:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v7 shareActivitiesInUserOrder];
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      long long v14 = [v13 activityType];
      unsigned __int8 v15 = [v14 isEqualToString:v6];

      if (v15) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v7 hiddenActivities];
    id v16 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (!v16) {
      goto LABEL_19;
    }
    uint64_t v17 = *(void *)v23;
LABEL_11:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
      id v19 = [v13 activityType];
      unsigned __int8 v20 = [v19 isEqualToString:v6];

      if (v20) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v16) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
  }
  id v16 = v13;
LABEL_19:

  objc_sync_exit(v8);

  return v16;
}

- (void)activityViewControllerWithSessionID:(id)a3 toggledActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(NSMutableDictionary *)v10->_sessionIDToShareSheetSession objectForKeyedSubscript:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    if (a5 == 1)
    {
      uint64_t v13 = [v11 shareActivitiesByUUID];
      long long v14 = [v13 objectForKeyedSubscript:v9];

      unsigned __int8 v15 = [(SDShareSheetSlotManager *)v10 shareUserDefaults];
      LODWORD(v13) = [v15 activityIsHidden:v14];

      id v16 = [(SDShareSheetSlotManager *)v10 shareUserDefaults];
      [v16 setActivity:v14 asHidden:v13 ^ 1];

      [(SDShareSheetSlotManager *)v10 shareActivityUserDefaultsDidChangeWithSession:v12];
    }
    else
    {
      uint64_t v17 = [v11 actionActivitiesByUUID];
      long long v14 = [v17 objectForKeyedSubscript:v9];

      uint64_t v18 = [(SDShareSheetSlotManager *)v10 actionUserDefaults];
      LODWORD(v17) = [v18 activityIsHidden:v14];

      id v19 = [(SDShareSheetSlotManager *)v10 actionUserDefaults];
      [v19 setActivity:v14 asHidden:v17 ^ 1];

      [(SDShareSheetSlotManager *)v10 actionActivityUserDefaultsDidChangeWithSession:v12];
    }
  }
  else
  {
    long long v14 = share_sheet_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100174E3C();
    }
  }

  objc_sync_exit(v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 favoritedActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  uint64_t v12 = [(NSMutableDictionary *)v11->_sessionIDToShareSheetSession objectForKeyedSubscript:v9];
  uint64_t v13 = v12;
  if (v12)
  {
    if (a6 == 1)
    {
      long long v14 = [v12 shareActivitiesByUUID];
      unsigned __int8 v15 = [v14 objectForKeyedSubscript:v10];

      id v16 = [v13 favoriteApps];
      id v17 = [v16 mutableCopy];
      if ([v16 containsObject:v15])
      {
        [v17 removeObject:v15];
        uint64_t v18 = [(SDShareSheetSlotManager *)v11 shareUserDefaults];
        id v19 = [v15 activityType];
        [v18 removeActivityTypeFromDefaults:v19];
      }
      else
      {
        [v17 addObject:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v23 = [(SDShareSheetSlotManager *)v11 shareUserDefaults];
          [v23 setActivity:v15 asHidden:0];
        }
        uint64_t v18 = [(SDShareSheetSlotManager *)v11 shareUserDefaults];
        [v18 updateUserActivityOrderWithOrderedPartialActivities:v17];
      }

      [v13 setFavoriteApps:v17];
      [(SDShareSheetSlotManager *)v11 shareActivityUserDefaultsDidChangeWithSession:v13];
    }
    else
    {
      unsigned __int8 v20 = [v12 actionActivitiesByUUID];
      unsigned __int8 v15 = [v20 objectForKeyedSubscript:v10];

      id v16 = [v13 favoriteActions];
      id v17 = [v16 mutableCopy];
      if ([v16 containsObject:v15])
      {
        [v17 removeObject:v15];
        id v21 = [(SDShareSheetSlotManager *)v11 actionUserDefaults];
        long long v22 = [v15 activityType];
        [v21 removeActivityTypeFromDefaults:v22];
      }
      else
      {
        [v17 addObject:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v24 = [(SDShareSheetSlotManager *)v11 actionUserDefaults];
          [v24 setActivity:v15 asHidden:0];
        }
        id v21 = [(SDShareSheetSlotManager *)v11 actionUserDefaults];
        [v21 updateUserActivityOrderWithOrderedPartialActivities:v17];
      }

      [v13 setFavoriteActions:v17];
      [(SDShareSheetSlotManager *)v11 actionActivityUserDefaultsDidChangeWithSession:v13];
    }
  }
  else
  {
    unsigned __int8 v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100174EA4();
    }
  }

  objc_sync_exit(v11);
}

- (void)activityViewControllerWithSessionID:(id)a3 updatedFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v31 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  long long v30 = v8;
  id v10 = [(NSMutableDictionary *)v9->_sessionIDToShareSheetSession objectForKeyedSubscript:v8];
  if (v10)
  {
    if (a5 == 1)
    {
      uint64_t v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v31 count]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = v31;
      id v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v37;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v37 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v17 = [v10 shareActivitiesByUUID];
            uint64_t v18 = [v16 identifier];
            id v19 = [v17 objectForKeyedSubscript:v18];
            [v11 addObject:v19];
          }
          id v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v13);
      }

      [v10 setFavoriteApps:v11];
      unsigned __int8 v20 = [(SDShareSheetSlotManager *)v9 shareUserDefaults];
      [v20 updateUserActivityOrderWithOrderedPartialActivities:v11];

      [(SDShareSheetSlotManager *)v9 shareActivityUserDefaultsDidChangeWithSession:v10];
    }
    else
    {
      uint64_t v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v31 count]);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v21 = v31;
      id v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v33;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(v21);
            }
            long long v25 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
            long long v26 = [v10 actionActivitiesByUUID];
            long long v27 = [v25 identifier];
            long long v28 = [v26 objectForKeyedSubscript:v27];
            [v11 addObject:v28];
          }
          id v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v22);
      }

      [v10 setFavoriteActions:v11];
      long long v29 = [(SDShareSheetSlotManager *)v9 actionUserDefaults];
      [v29 updateUserActivityOrderWithOrderedPartialActivities:v11];

      [(SDShareSheetSlotManager *)v9 actionActivityUserDefaultsDidChangeWithSession:v10];
    }
  }
  else
  {
    uint64_t v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174F0C();
    }
  }

  objc_sync_exit(v9);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedDefaultActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SDShareSheetSlotManager *)self getShareSheetSessionForSessionID:v8];
  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (!v10)
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100174F74();
    }
    goto LABEL_7;
  }
  if (a5 != 1)
  {
    uint64_t v18 = [v10 actionActivitiesByUUID];
    id v19 = [v18 objectForKeyedSubscript:v9];

    unsigned __int8 v20 = [v19 activityType];
    if ([v20 isEqualToString:UIActivityTypeUserDefaults])
    {
    }
    else
    {
      id v21 = [v19 activityType];
      unsigned int v22 = [v21 isEqualToString:@"com.apple.UIKit.activity.ActionDefaults"];

      if (!v22)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v19;
          int v16 = 1;
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = v19;
          [(SDShareSheetSlotManager *)v11 _instructHostToPerformExtensionActivity:v28 session:v10];
        }
        else
        {
          [(SDShareSheetSlotManager *)v11 _instructHostToPerformHostActivity:v19 session:v10];
        }
LABEL_14:
        int v16 = 0;
        id v17 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    [(SDShareSheetSlotManager *)v11 _instructHostToPerformUserDefaultsActivityForCategory:0 session:v10];
    goto LABEL_14;
  }
  id v12 = [v10 shareActivitiesByUUID];
  id v13 = [v12 objectForKeyedSubscript:v9];

  uint64_t v14 = [v13 activityType];
  unsigned int v15 = [v14 isEqualToString:UIActivityTypeUserDefaults];

  if (v15)
  {
    [(SDShareSheetSlotManager *)v11 _instructHostToPerformUserDefaultsActivityForCategory:1 session:v10];
  }
  else if ([v13 ss_shouldExecuteInShareSheet])
  {
    [(SDShareSheetSlotManager *)v11 _performServiceInitiatedActivityInServiceWithActivity:v13 session:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = v13;
      [(SDShareSheetSlotManager *)v11 _instructHostToPerformExtensionActivity:v25 session:v10];
    }
    else
    {
      long long v26 = [v13 activityType];
      unsigned int v27 = [v26 isEqualToString:UIActivityTypeAirDrop];

      if (!v27)
      {
        [(SDShareSheetSlotManager *)v11 _instructHostToPerformHostActivity:v13 session:v10];
        goto LABEL_7;
      }
      long long v25 = [v10 airDropPeople];
      [(SDShareSheetSlotManager *)v11 _instructHostToPerformAirDropActivityWithNoContentView:[v25 count] == 0 session:v10];
    }
  }
LABEL_7:

  int v16 = 0;
  id v17 = 0;
LABEL_16:
  objc_sync_exit(v11);

  if (v10 && v16 && v17)
  {
    uint64_t v23 = +[VCVoiceShortcutClient standardClient];
    long long v24 = [v17 identifier];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10016B994;
    v29[3] = &unk_1008CEBB8;
    id v30 = v17;
    id v31 = v11;
    id v32 = v10;
    [v23 generateSingleUseTokenForWorkflowIdentifier:v24 completion:v29];
  }
}

- (void)activityViewControllerPerformedActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = self;
  objc_sync_enter(v14);
  unsigned int v15 = [(NSMutableDictionary *)v14->_sessionIDToShareSheetSession objectForKeyedSubscript:v12];
  int v16 = v15;
  if (v15)
  {
    [v15 setEngagedWithSheet:v7];
    [v16 setSelectedRecipient:0];
    id v17 = objc_alloc_init((Class)SFShareSheetCompletedEvent);
    [v17 setSessionID:v12];
    [v17 setPresentationMs:a4];
    [v17 setTotalShareTimeMs:a5];
    [v17 setActivityType:v13];
    uint64_t v18 = [v16 hostConfiguration];
    -[NSObject setIsCollaborative:](v17, "setIsCollaborative:", [v18 isCollaborative]);

    [v17 setSuccess:v7];
    id v19 = share_sheet_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v20 = [v17 eventPayload];
      int v21 = 138412290;
      unsigned int v22 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Report activity: %@", (uint8_t *)&v21, 0xCu);
    }
    [v17 submitEvent];
  }
  else
  {
    id v17 = share_sheet_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100175074();
    }
  }

  objc_sync_exit(v14);
}

- (void)activityViewControllerDidAppearWithSessionID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  if (v6)
  {
    objc_sync_exit(v5);

    BOOL v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "activityViewControllerDidAppear: for session ID %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016BE00;
    block[3] = &unk_1008CA4B8;
    id v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v5 = v10;
  }
  else
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1001750DC();
    }

    objc_sync_exit(v5);
  }
}

- (void)activityViewControllerDidDisappearWithSessionID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  if (v6)
  {
    objc_sync_exit(v5);

    BOOL v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "activityViewControllerDidDisappear: for session ID %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016C038;
    block[3] = &unk_1008CA4B8;
    id v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v5 = v10;
  }
  else
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100175144();
    }

    objc_sync_exit(v5);
  }
}

- (void)activityViewControllerDidEnterBackgroundWithSessionID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  if (v6)
  {
    objc_sync_exit(v5);

    BOOL v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "activityViewControllerDidEnterBackground: for session ID %@", buf, 0xCu);
    }

    id v8 = [v6 xpcHelperCnx];
    [v8 setSessionKeepAliveTransactionIdentifier:0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016C270;
    block[3] = &unk_1008CA4B8;
    uint64_t v11 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v5 = v11;
  }
  else
  {
    id v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1001751AC();
    }

    objc_sync_exit(v5);
  }
}

- (void)activityViewControllerWillEnterForegroundWithSessionID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  if (v6)
  {
    objc_sync_exit(v5);

    BOOL v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "activityViewControllerWillEnterForeground: for session ID %@", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016C48C;
    block[3] = &unk_1008CA4B8;
    id v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v5 = v10;
  }
  else
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100175214();
    }

    objc_sync_exit(v5);
  }
}

- (void)activityViewControllerPerformEditActionsWithSessionID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  if (v6)
  {
    [(SDShareSheetSlotManager *)v5 _instructHostToPerformUserDefaultsActivityForCategory:0 session:v6];
  }
  else
  {
    BOOL v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10017527C();
    }
  }
  objc_sync_exit(v5);
}

- (void)shareActivityUserDefaultsDidChangeWithSession:(id)a3
{
  id v39 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id obj = v4;
  id v5 = [(SDShareSheetSlotManager *)v4 shareUserDefaults];
  id v6 = [v39 shareActivities];
  BOOL v7 = [v5 activitiesOrderedByUserActivityOrderForActivities:v6];

  [v39 setShareActivitiesInUserOrder:v7];
  if (_os_feature_enabled_impl())
  {
    id v8 = +[SDShareSheetSlotManager _groupActivitiesByBundleID:v7];
    [v39 setBundleIDToActivities:v8];

    id v9 = [v39 bundleIDToActivities];
    id v10 = [(SDShareSheetSlotManager *)v4 _removeSecondaryActivities:v7 bundleIDToActivities:v9];

    uint64_t v11 = [v39 urlBeingShared];
    BOOL v7 = [(SDShareSheetSlotManager *)v4 _moveDefaultApplicationToFrontForURL:v11 activities:v10];
  }
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10016CB10;
  v44[3] = &unk_1008CE9B0;
  v44[4] = v4;
  id v12 = +[NSPredicate predicateWithBlock:v44];
  id v13 = [v7 filteredArrayUsingPredicate:v12];

  id v14 = [v13 count];
  unsigned int v15 = [(SDShareSheetSlotManager *)v4 shareUserDefaults];
  int v16 = [v15 activityIdentifiersInUserOrder];
  id v17 = [v16 count];

  unint64_t v18 = 12;
  if ((unint64_t)v17 > 0xC) {
    unint64_t v18 = (unint64_t)v17;
  }
  if ((unint64_t)v14 >= v18) {
    id v19 = (id)v18;
  }
  else {
    id v19 = v14;
  }
  unsigned __int8 v20 = [v13 subarrayWithRange:0, v19];

  int v21 = [v39 shareUserDefaultsActivity];
  long long v37 = [v20 arrayByAddingObject:v21];

  [v39 setVisibleShareActivities:v37];
  long long v36 = [(SDShareSheetSlotManager *)v4 _createShareProxiesFromActivities:v37 session:v39];
  unsigned int v22 = [(SDShareSheetSlotManager *)v4 shareSheetContext];
  uint64_t v23 = [v39 hostShareActivityProxies];
  long long v24 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v25 = v23;
  id v26 = [v25 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      id v28 = 0;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v25);
        }
        long long v29 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v28);
        id v30 = share_sheet_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v46 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Deleting slots for share proxy %@", buf, 0xCu);
        }

        id v31 = [v29 iconImageSlotID];
        id v32 = [v29 labelSlotID];
        if (v31) {
          [v22 deleteSlot:v31];
        }
        if (v32)
        {
          [v22 deleteSlot:v32];
          long long v33 = +[NSNumber numberWithUnsignedInt:v32];
          [v24 addObject:v33];
        }
        id v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [v25 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v26);
  }

  long long v34 = [(SDShareSheetSlotManager *)obj accessibilityCache];
  [v34 removeLabelsForSlotIDs:v24];

  [v39 setHostShareActivityProxies:v36];
  +[CATransaction flush];
  long long v35 = share_sheet_log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "share user defaults did change", buf, 2u);
  }

  [(SDShareSheetSlotManager *)obj dataSourceDidUpdateForSession:v39 animated:0];
  objc_sync_exit(obj);
}

- (void)actionActivityUserDefaultsDidChangeWithSession:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id obj = v5;
  id v6 = [(SDShareSheetSlotManager *)v5 actionUserDefaults];
  BOOL v7 = [v4 actionActivities];
  id v8 = [v6 activitiesOrderedByUserActivityOrderForActivities:v7];

  [v4 setActionActivitiesInUserOrder:v8];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10016CFA4;
  v34[3] = &unk_1008CE9D8;
  v34[4] = v5;
  id v29 = v4;
  id v35 = v29;
  id v9 = +[NSPredicate predicateWithBlock:v34];
  uint64_t v27 = [v8 filteredArrayUsingPredicate:v9];

  [v29 setVisibleActionActivities:v27];
  id v25 = [v29 hostConfiguration];
  id v10 = [v25 hostTintColor];
  id v26 = [(SDShareSheetSlotManager *)v5 _createActionProxiesFromActivities:v27 withTintColor:v10 session:v29];

  uint64_t v11 = [(SDShareSheetSlotManager *)v5 shareSheetContext];
  id v12 = [v29 hostActionActivityProxies];
  id v13 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v17);
        id v19 = share_sheet_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v37 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Deleting slots for action proxy %@", buf, 0xCu);
        }

        id v20 = [v18 iconImageSlotID];
        id v21 = [v18 labelSlotID];
        if (v20) {
          [v11 deleteSlot:v20];
        }
        if (v21)
        {
          [v11 deleteSlot:v21];
          unsigned int v22 = +[NSNumber numberWithUnsignedInt:v21];
          [v13 addObject:v22];
        }
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v15);
  }

  uint64_t v23 = [(SDShareSheetSlotManager *)obj accessibilityCache];
  [v23 removeLabelsForSlotIDs:v13];

  [v29 setHostActionActivityProxies:v26];
  +[CATransaction flush];
  long long v24 = share_sheet_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "action user defaults did change", buf, 2u);
  }

  [(SDShareSheetSlotManager *)obj dataSourceDidUpdateForSession:v29 animated:0];
  objc_sync_exit(obj);
}

- ($EC76EA2E339756B4D2C49A1061DE0928)_uploadSlotWithVectorData:(SEL)a3 sfCGImageData:(id)a4 performCATransaction:(id)a5 hostConfiguration:(BOOL)a6
{
  BOOL v8 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10016D104;
  v13[3] = &unk_1008CEC30;
  id v14 = a5;
  id v11 = v14;
  [(SDShareSheetSlotManager *)self _uploadSlotWithVectorData:a4 cgImage:v13 performCATransaction:v8 hostConfiguration:a7];

  return result;
}

- ($EC76EA2E339756B4D2C49A1061DE0928)_uploadSlotWithVectorData:(SEL)a3 cgImage:(id)a4 performCATransaction:(id)a5 hostConfiguration:(BOOL)a6
{
  BOOL v8 = a6;
  id v12 = (void (**)(void))a4;
  id v13 = (uint64_t (**)(void))a5;
  id v14 = a7;
  retstr->var1.double width = 0.0;
  retstr->var1.double height = 0.0;
  *(void *)&retstr->var0 = 0;
  if (!+[SDStatusMonitor enableShareSheetVectorSlots]
    || [v14 hostIdiom] != (id)6)
  {
    uint64_t v16 = (CGImage *)v13[2](v13);
    if (!v16) {
      goto LABEL_16;
    }
    char v17 = 0;
    goto LABEL_7;
  }
  uint64_t v15 = v12[2](v12);
  if (v15)
  {
    uint64_t v16 = (CGImage *)v15;
    char v17 = 1;
LABEL_7:
    if (v8) {
      +[CATransaction begin];
    }
    unint64_t v18 = [(SDShareSheetSlotManager *)self shareSheetContext];
    uint64_t v19 = [(SDShareSheetSlotManager *)self createSlotForContext:v18];

    if ((v17 & 1) == 0)
    {
      id v20 = [(SDShareSheetSlotManager *)self shareSheetContext];
      [v20 setObject:v16 forSlot:v19];

      CGFloat Width = (double)CGImageGetWidth(v16);
      CGFloat Height = (double)CGImageGetHeight(v16);
      retstr->var1.double width = Width;
      retstr->var1.double height = Height;
      retstr->var0 = v19;
    }
    if (v8)
    {
      +[CATransaction commit];
      +[CATransaction flush];
    }
    goto LABEL_16;
  }
  uint64_t v23 = share_sheet_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_1001752E4(v23);
  }

  uint64_t v16 = 0;
LABEL_16:

  return result;
}

- (void)_instructHostToPerformUserDefaultsActivityForCategory:(int64_t)a3 session:(id)a4
{
  id v6 = a4;
  id v85 = objc_opt_new();
  id v84 = objc_opt_new();
  __int16 v88 = objc_opt_new();
  unsigned int v95 = self;
  objc_sync_enter(v95);
  int64_t v89 = a3;
  __int16 v94 = v6;
  if (a3 == 1)
  {
    BOOL v7 = [v6 shareActivitiesInUserOrder];
    BOOL v8 = [(SDShareSheetSlotManager *)v95 shareUserDefaults];
    unsigned int v87 = [v8 activityIdentifiersInUserOrder];

    [v6 hostShareActivityProxies];
  }
  else
  {
    BOOL v7 = [v6 actionActivitiesInUserOrder];
    id v9 = [(SDShareSheetSlotManager *)v95 actionUserDefaults];
    unsigned int v87 = [v9 activityIdentifiersInUserOrder];

    [v6 hostActionActivityProxies];
  id v10 = };
  id v11 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v10, "count")];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = v10;
  id v12 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v113;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v113 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        [v11 setObject:v15 forKeyedSubscript:v16];
      }
      id v12 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
    }
    while (v12);
  }

  unsigned int v91 = [v94 skipSlotsRendering];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v90 = v7;
  id v17 = [v90 countByEnumeratingWithState:&v108 objects:v121 count:16];
  if (v17)
  {
    uint64_t v92 = *(void *)v109;
    *(void *)&long long v18 = 138412802;
    long long v83 = v18;
LABEL_13:
    id v93 = v17;
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v109 != v92) {
        objc_enumerationMutation(v90);
      }
      id v20 = *(void **)(*((void *)&v108 + 1) + 8 * v19);
      id v21 = [v20 activityType:v83];
      unsigned int v22 = UIActivityTypeMessage;
      uint64_t v23 = v21;
      long long v24 = v23;
      if (v22 == v23)
      {
      }
      else
      {
        if ((UIActivityTypeMessage == 0) == (v23 != 0))
        {

LABEL_24:
          goto LABEL_25;
        }
        unsigned int v25 = [(NSString *)v22 isEqual:v23];

        if (!v25) {
          goto LABEL_24;
        }
      }
      id v26 = +[SDStatusMonitor sharedMonitor];
      uint64_t v27 = [v26 effectiveBlockedAppBundleIDs];
      unsigned __int8 v28 = [v27 containsObject:@"com.apple.MobileSMS"];

      if (v28) {
        goto LABEL_66;
      }
LABEL_25:
      id v29 = [v20 activityType];
      long long v30 = UIActivityTypeMail;
      long long v31 = v29;
      long long v32 = v31;
      if (v30 == v31)
      {
      }
      else
      {
        if ((UIActivityTypeMail == 0) == (v31 != 0))
        {

LABEL_33:
          goto LABEL_34;
        }
        unsigned int v33 = [(NSString *)v30 isEqual:v31];

        if (!v33) {
          goto LABEL_33;
        }
      }
      long long v34 = +[SDStatusMonitor sharedMonitor];
      id v35 = [v34 effectiveBlockedAppBundleIDs];
      unsigned __int8 v36 = [v35 containsObject:@"com.apple.mobilemail"];

      if (v36) {
        goto LABEL_66;
      }
LABEL_34:
      long long v37 = [v20 activityType];
      long long v38 = UIActivityTypeAirDrop;
      id v39 = v37;
      long long v40 = v39;
      v96 = v38;
      if (v38 == v39)
      {

LABEL_39:
        unsigned __int8 v42 = [v94 airDropAllowed];

        if ((v42 & 1) == 0) {
          goto LABEL_66;
        }
        goto LABEL_43;
      }
      if ((UIActivityTypeAirDrop == 0) != (v39 != 0))
      {
        unsigned int v41 = [(NSString *)v38 isEqual:v39];

        if (v41) {
          goto LABEL_39;
        }
      }
      else
      {
      }
LABEL_43:
      if (v91)
      {
        uint64_t v43 = 0;
        id v44 = 0;
        double v45 = 0.0;
      }
      else
      {
        long long v46 = [v94 xpcHelperCnx];
        if (!v46)
        {
          long long v82 = share_sheet_log();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT)) {
            sub_100175384();
          }

          goto LABEL_75;
        }
        id v47 = [v20 _activitySettingsImage];
        id v86 = [v47 CGImage];

        unsigned int v48 = [v20 activityTitle];
        __int16 v49 = +[UIColor whiteColor];
        +[CATransaction begin];
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_10016DEB4;
        v103[3] = &unk_1008CEC58;
        id v50 = v46;
        id v104 = v50;
        id v51 = v48;
        id v105 = v51;
        id v52 = v49;
        id v106 = v52;
        int64_t v107 = v89;
        v98[0] = _NSConcreteStackBlock;
        v98[1] = 3221225472;
        v98[2] = sub_10016DEC4;
        v98[3] = &unk_1008CEC80;
        id v53 = v50;
        id v99 = v53;
        id v54 = v51;
        id v100 = v54;
        id v55 = v52;
        id v101 = v55;
        int64_t v102 = v89;
        id v56 = [v94 hostConfiguration];
        [(SDShareSheetSlotManager *)v95 _uploadSlotWithVectorData:v103 sfCGImageData:v98 performCATransaction:0 hostConfiguration:v56];
        uint64_t v43 = *(unsigned int *)buf;
        double v45 = *(double *)&v119[2];

        if (v43)
        {
          id v57 = [(SDShareSheetSlotManager *)v95 accessibilityCache];
          id v58 = [v20 activityTitle];
          id v59 = +[NSNumber numberWithUnsignedInt:v43];
          [v57 setLabel:v58 forSlotID:v59];

          id v60 = [(SDShareSheetSlotManager *)v95 shareSheetContext];
          id v44 = (id)[(SDShareSheetSlotManager *)v95 createSlotForContext:v60];
          [v60 setObject:v86 forSlot:v44];
          +[CATransaction commit];

          int v61 = 0;
        }
        else
        {
          id v62 = share_sheet_log();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v83;
            id v117 = v54;
            __int16 v118 = 2112;
            *(void *)v119 = v20;
            *(_WORD *)&v119[8] = 2112;
            id v120 = v55;
            _os_log_fault_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_FAULT, "returned nil: CGImgDataForActivityMoreListEntryForActivityTitle:%@, in: %@, labelColor:%@", buf, 0x20u);
          }

          +[CATransaction commit];
          id v44 = 0;
          int v61 = 5;
        }

        if (v61) {
          goto LABEL_66;
        }
      }
      id v63 = objc_alloc((Class)_UIUserDefaultsActivityProxy);
      id v64 = [v20 activityUUID];
      id v65 = [v63 initWithIdentifier:v64];

      if (v91)
      {
        id v66 = objc_alloc((Class)SFProxyText);
        __int16 v67 = [v20 activityTitle];
        id v68 = [v66 initWithText:v67];
      }
      else
      {
        id v68 = [objc_alloc((Class)SFProxyText) initWithSlotIdentifier:v43 slotTextHeight:v45];
      }
      [v65 setActivityTitle:v68];
      if (v91)
      {
        id v69 = +[SDShareSheetSlotManager _bundleIdentifierForActivity:v20];
        if (([v69 isEqualToString:@"noBundleID"] & 1) == 0) {
          [v65 setApplicationBundleIdentifier:v69];
        }
      }
      else
      {
        [v65 setIconImageSlotID:v44];
      }
      id v70 = [v94 screenTimeMonitor];
      id v71 = [v20 activityType];
      BOOL v72 = [v70 cachedPolicyForActivityType:v71] != 0;

      [v65 setIsDisabled:v72];
      if (v89 == 1)
      {
        v73 = [(SDShareSheetSlotManager *)v95 shareUserDefaults];
        [v65 setCanHide:[v73 canHideActivity:v20]];

        [(SDShareSheetSlotManager *)v95 shareUserDefaults];
      }
      else
      {
        v75 = [(SDShareSheetSlotManager *)v95 actionUserDefaults];
        [v65 setCanHide:[v75 canHideActivity:v20]];

        [(SDShareSheetSlotManager *)v95 actionUserDefaults];
      v74 = };
      [v65 setIsHidden:[v74 activityIsHidden:v20]];

      unsigned int v76 = [v20 activityType];
      [v65 setCanEdit:[v76 isEqualToString:v96] ^ 1];

      v77 = [v20 activityType];
      [v65 setCanMove:[v77 isEqualToString:v96] ^ 1];

      v78 = [v20 activityType];
      unsigned int v79 = [v87 containsObject:v78];

      long long v80 = v88;
      id v81 = v65;
      if (v79)
      {
        [v84 addObject:v65];
        long long v80 = v85;
        id v81 = v20;
      }
      [v80 addObject:v81];

LABEL_66:
      if (v93 == (id)++v19)
      {
        id v17 = [v90 countByEnumeratingWithState:&v108 objects:v121 count:16];
        if (v17) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  if (v89 == 1) {
    [v94 setFavoriteApps:v85];
  }
  else {
    [v94 setFavoriteActions:v85];
  }
  +[CATransaction flush];
  [(SDShareSheetSlotManager *)v95 notifySession:v94 favoritesProxies:v84 suggestionProxies:v88 activityCategory:v89];
LABEL_75:

  objc_sync_exit(v95);
}

- (void)_instructHostToPerformExtensionActivity:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  objc_sync_enter(v8);
  id v9 = share_sheet_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 activityType];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Performing extension %@", (uint8_t *)&v11, 0xCu);
  }
  [(SDShareSheetSlotManager *)v8 notifySession:v7 activitySelected:v6];
  objc_sync_exit(v8);
}

- (void)_instructHostToPerformShortcutActivity:(id)a3 singleUseToken:(id)a4 session:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  [(SDShareSheetSlotManager *)v10 notifySession:v9 shortcutSelectedWithBundleID:@"com.apple.shortcuts.Run-Workflow" singleUseToken:v8];
  objc_sync_exit(v10);
}

- (void)_instructHostToPerformHostActivity:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  id v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v7 activityType];
    int v13 = 138412290;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing host %@", (uint8_t *)&v13, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v7;
    [(SDShareSheetSlotManager *)v9 notifySession:v8 activitySelected:v12];
  }
  else
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:v9 file:@"SDShareSheetSlotManager.m" lineNumber:4096 description:@"attempt to perform an activity in-host that is not an in-host activity"];
  }

  objc_sync_exit(v9);
}

- (void)_instructHostToPerformAirDropActivityWithNoContentView:(BOOL)a3 session:(id)a4
{
  BOOL v4 = a3;
  id v6 = [a4 connection];
  id v7 = [(SDShareSheetSlotManager *)self _remoteObjectProxyForConnection:v6];

  [v7 performAirDropActivityInHostWithNoContentView:v4];
}

- (void)_loadPresentableActivitiesForSession:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = a3;
  id v5 = [(SDShareSheetSlotManager *)self currentConnection];
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }

  v7[0] = v8;
  v7[1] = v9;
  [v4 _loadPresentableActivitiesForAuditToken:v7];
}

- (void)activateSuggestionBrowserForSession:(id)a3 withExtensionMatchingDictionaries:(id)a4 assetIdentifiers:(id)a5 urlsBeingShared:(id)a6 sandboxExtensionsByfileURLPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = self;
  objc_sync_enter(v17);
  if ([v12 hideSuggestions])
  {
    long long v18 = share_sheet_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not activating suggestion browser because hideSuggestions is true", buf, 2u);
    }
  }
  else
  {
    uint64_t v19 = share_sheet_log();
    id v20 = share_sheet_log();
    os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, v17);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)unsigned int v41 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "ConfigurePeopleSuggester", " enableTelemetry=YES ", v41, 2u);
    }

    long long v18 = sub_1002337B0(v13);
    id v39 = v13;
    unsigned int v22 = objc_alloc_init(SDSuggestionBrowserContext);
    uint64_t v23 = [(SDShareSheetSlotManager *)v17 currentConnection];
    long long v24 = [v23 sd_connectionBundleID];
    [(SDSuggestionBrowserContext *)v22 setBundleID:v24];

    unsigned int v25 = [v18 array];
    [(SDSuggestionBrowserContext *)v22 setTypeIdentifiersBeingShared:v25];

    [(SDSuggestionBrowserContext *)v22 setPhotosAssetIDs:v14];
    [(SDSuggestionBrowserContext *)v22 setUrlsBeingShared:v15];
    [(SDSuggestionBrowserContext *)v22 setSandboxExtensionsByfileURLPath:v16];
    -[SDSuggestionBrowserContext setShouldSuggestFamilyMembers:](v22, "setShouldSuggestFamilyMembers:", [v12 shouldSuggestFamilyMembers]);
    -[SDSuggestionBrowserContext setIsSharePlayAvailable:](v22, "setIsSharePlayAvailable:", [v12 isSharePlayAvailable]);
    -[SDSuggestionBrowserContext setSupportsCollaboration:](v22, "setSupportsCollaboration:", [v12 supportsCollaboration]);
    id v26 = [v12 peopleSuggestionBundleIds];
    [(SDSuggestionBrowserContext *)v22 setPeopleSuggestionBundleIds:v26];

    uint64_t v27 = [v12 processedImageResultsData];
    [(SDSuggestionBrowserContext *)v22 setProcessedImageResultsData:v27];
    id v38 = v16;
    id v28 = v15;
    id v29 = v14;

    long long v30 = [v12 sessionID];
    long long v31 = [(SDShareSheetSlotManager *)v17 currentConnection];
    long long v32 = [v31 _queue];
    [v12 peopleSuggestionsTimeout];
    unsigned int v33 = +[SDSuggestionBrowser asyncBrowserWithSessionID:context:queue:timeout:](SDSuggestionBrowser, "asyncBrowserWithSessionID:context:queue:timeout:", v30, v22, v32);

    [v33 setDelegate:v17];
    long long v34 = [v12 xpcHelperCnx];
    [v33 setHelperConnection:v34];

    [v12 setSuggestionBrowser:v33];
    id v35 = share_sheet_log();
    unsigned __int8 v36 = share_sheet_log();
    os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, v17);

    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)long long v40 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, v37, "ConfigurePeopleSuggester", " enableTelemetry=YES ", v40, 2u);
    }

    id v14 = v29;
    id v15 = v28;
    id v16 = v38;
    id v13 = v39;
  }

  objc_sync_exit(v17);
}

- (void)suggestionBrowserDidUpdateSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  sessionIDToShareSheetSession = v5->_sessionIDToShareSheetSession;
  id v7 = [v4 sessionID];
  long long v8 = [(NSMutableDictionary *)sessionIDToShareSheetSession objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v11 = [0 sessionID];
      sub_1001753EC(v11, (uint8_t *)&v13, v10);
    }
    goto LABEL_8;
  }
  long long v9 = [v8 hostConfiguration];

  if (!v9)
  {
    id v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = [v8 sessionID];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "suggestionBrowserDidUpdateSuggestions: initial configuration hasn't happened yet for ID %@", (uint8_t *)&v13, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  [(SDShareSheetSlotManager *)v5 _configurePeopleSuggestionsSectionForSession:v8];
  [(SDShareSheetSlotManager *)v5 dataSourceDidUpdateForSession:v8 animated:0];
LABEL_9:

  objc_sync_exit(v5);
}

- (void)sessionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session did change", v6, 2u);
  }

  [(SDShareSheetSlotManager *)self dataSourceDidUpdateForSession:v4 animated:1];
}

- (void)session:(id)a3 didConnectNearbySharingInteractionWithEndpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "did connect nearby sharing interaction with endpointUUID:%@", (uint8_t *)&v12, 0xCu);
  }

  long long v9 = [v6 hostConfiguration];
  unsigned int v10 = [v9 isCollaborative];

  if (v10)
  {
    id v11 = [objc_alloc((Class)SFAirDropTransferChange) initWithState:7 progress:0 proxyIdentifier:0 displayName:0 status:0.0];
    [(SDShareSheetSlotManager *)self notifySession:v6 withAirDropTransferChange:v11];
  }
  else
  {
    [(SDShareSheetSlotManager *)self requestAirDropItemsForNode:0 endpointUUID:v7 session:v6];
  }
}

- (BOOL)activityHelper:(id)a3 matchingWithContext:(id)a4 shouldIncludeSystemActivityType:(id)a5 sessionID:(id)a6
{
  return 1;
}

- (id)activityHelper:(id)a3 activitiesForActivityType:(id)a4 matchingContext:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v14);
  id v15 = [(NSMutableDictionary *)self->_sessionIDToShareSheetSession objectForKeyedSubscript:v13];
  if (v15)
  {
    if (!_UIActivityOpenInApplicationTypeForActivityType())
    {
      uint64_t v23 = 0;
      goto LABEL_14;
    }
    id v31 = v10;
    id v16 = [(SDShareSheetSlotManager *)self sessionIDToShareSheetSession];
    id v17 = [v16 objectForKeyedSubscript:v13];
    long long v18 = [v17 hostConfiguration];
    unsigned int v32 = [v18 _unitTest_disableExcludingSourceApplicationFromOpenActivities];

    uint64_t v19 = [v12 activityItemValueClasses];
    id v20 = [v19 count];

    if (v20 == (id)1)
    {
      os_signpost_id_t v21 = [v12 activityItemValueExtensionMatchingDictionaries];
      unsigned int v22 = sub_100233A24(v21);
    }
    else
    {
      unsigned int v22 = 0;
    }
    long long v24 = [v12 activityItemValues];
    id v25 = [v12 isContentManaged];
    id v26 = [v12 hostAuditTokenData];
    uint64_t v23 = +[SUIOpenInAppActivity openInActivitiesForItems:v24 isContentManaged:v25 sourceApplicationAuditTokenData:v26 includeSourceApplicationInResults:v32 supportedTypeIdentifiers:v22];

    if (_UIActivityOpenInApplicationTypeForActivityType() != 1)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100173CB4;
      v33[3] = &unk_1008CEE18;
      id v34 = v11;
      id v27 = v34;
      id v28 = v23;
      id v29 = [v28 indexesOfObjectsPassingTest:v33];
      uint64_t v23 = [v28 objectsAtIndexes:v29];
    }
    id v10 = v31;
  }
  else
  {
    unsigned int v22 = share_sheet_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_100175444();
    }
    uint64_t v23 = 0;
  }

LABEL_14:
  objc_sync_exit(v14);

  return v23;
}

- (id)activityHelper:(id)a3 predictionContextForSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = +[SDShareSheetSlotManager sharedManager];
  objc_sync_enter(v8);
  long long v9 = [(NSMutableDictionary *)self->_sessionIDToShareSheetSession objectForKeyedSubscript:v7];
  if (!v9)
  {
    id v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_1001754AC();
    }
    id v10 = 0;
    goto LABEL_12;
  }
  id v10 = objc_alloc_init(off_1009686D0());
  id v11 = [v9 hostAppBundleID];
  [v10 setBundleID:v11];

  id v12 = +[NSDate date];
  [v10 setSuggestionDate:v12];

  [v10 setShowPotentialFamilyMembers:[v9 shouldSuggestFamilyMembers]];
  id v13 = [v9 peopleSuggestionBundleIds];
  [v10 setSuggestionsFilteredByBundleIds:v13];

  [v10 setIsSharePlayAvailable:[v9 isSharePlayAvailable]];
  [v10 setSessionID:v7];
  if (objc_opt_respondsToSelector())
  {
    if ([v9 supportsCollaboration]) {
      uint64_t v14 = _os_feature_enabled_impl();
    }
    else {
      uint64_t v14 = 0;
    }
    [v10 setIsCollaborationAvailable:v14];
  }
  id v16 = [v9 processedImageResultsData];

  if (v16)
  {
    id v17 = objc_alloc(off_1009686D8());
    long long v18 = [v9 urlBeingShared];
    uint64_t v19 = [v9 processedImageResultsData];
    id v15 = [v17 initWithCreationDate:0 UTI:@"SDShareSheetImageAnalysisIdentifier" photoLocalIdentifier:0 identifier:0 cloudIdentifier:0 contentURL:v18 contentText:0 imageData:v19];

    unsigned int v22 = v15;
    id v20 = +[NSArray arrayWithObjects:&v22 count:1];
    [v10 setAttachments:v20];

LABEL_12:
  }

  objc_sync_exit(v8);

  return v10;
}

- (unsigned)createSlotForContext:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 createSlot];
  if (!v4)
  {
    do
    {
      [v3 deleteSlot:0];
      unsigned int v5 = [v3 createSlot];
    }
    while (!v5);
    unsigned int v4 = v5;
  }

  return v4;
}

- (CAContext)shareSheetContext
{
  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  p_shareSheetContext = &self->_shareSheetContext;
  unsigned int v5 = self->_shareSheetContext;
  id v6 = v5;
  if (!v5 || ([(CAContext *)v5 valid] & 1) == 0)
  {
    if (([(CAContext *)v6 valid] & 1) == 0)
    {
      id v7 = share_sheet_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100175514();
      }
    }
    long long v8 = [(SDShareSheetSlotManager *)self _createShareSheetContext];

    objc_storeStrong((id *)p_shareSheetContext, v8);
    id v6 = (CAContext *)v8;
  }
  os_unfair_lock_unlock(p_contextLock);

  return v6;
}

- (void)invalidateShareSheetContext
{
  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  [(CAContext *)self->_shareSheetContext invalidate];
  shareSheetContext = self->_shareSheetContext;
  self->_shareSheetContext = 0;

  os_unfair_lock_unlock(p_contextLock);
}

- (void)configureAirDropNodesFromSuggestionNodes:(id)a3 shareUserDefaults:(id)a4 forSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v95 = a5;
  id v10 = [v95 shareActivitiesInUserOrder];
  int64_t v89 = [v10 valueForKey:@"activityType"];

  id v86 = objc_opt_new();
  id v93 = objc_opt_new();
  val = self;
  objc_sync_enter(val);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
  if (v11)
  {
    uint64_t v90 = *(void *)v113;
    do
    {
      id v92 = v11;
      for (i = 0; i != v92; i = (char *)i + 1)
      {
        if (*(void *)v113 != v90) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        uint64_t v14 = [v13 bundleID];
        id v15 = v14;
        UIActivityType v16 = UIActivityTypeMessage;
        if (v14 == @"com.apple.MobileSMS") {
          goto LABEL_11;
        }
        if (!v14) {
          goto LABEL_29;
        }
        unsigned __int8 v17 = [(__CFString *)v14 isEqual:@"com.apple.MobileSMS"];

        UIActivityType v16 = UIActivityTypeMessage;
        if ((v17 & 1) != 0
          || (v18 = v15, UIActivityType v16 = UIActivityTypeMail, v18 == @"com.apple.mobilemail")
          || (uint64_t v19 = v18,
              unsigned int v20 = [(__CFString *)v18 isEqual:@"com.apple.mobilemail"],
              v19,
              UIActivityType v16 = UIActivityTypeMail,
              v20))
        {
LABEL_11:
          unsigned __int8 v21 = [v89 containsObject:v16];
        }
        else
        {
          uint64_t v23 = v19;
          long long v24 = v23;
          if (v23 == @"com.apple.InCallService.ShareExtension"
            || (unsigned int v25 = [(__CFString *)v23 isEqual:@"com.apple.InCallService.ShareExtension"], v24, v25))
          {
            if (![v95 isCollaborative])
            {
LABEL_13:
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
            id v26 = [v95 hiddenActivities];
            id v27 = [v26 valueForKey:@"activityType"];

            long long v110 = 0u;
            long long v111 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            id v28 = v27;
            id v22 = [v28 countByEnumeratingWithState:&v108 objects:v121 count:16];
            if (v22)
            {
              uint64_t v29 = *(void *)v109;
              while (2)
              {
                for (j = 0; j != v22; j = (char *)j + 1)
                {
                  if (*(void *)v109 != v29) {
                    objc_enumerationMutation(v28);
                  }
                  if ([*(id *)(*((void *)&v108 + 1) + 8 * (void)j) hasPrefix:v24])
                  {

                    goto LABEL_39;
                  }
                }
                id v22 = [v28 countByEnumeratingWithState:&v108 objects:v121 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }
            goto LABEL_50;
          }
          id v31 = v24;
          if (v31 != @"com.apple.telephonyutilities.callservicesd")
          {
            unsigned int v32 = v31;
            unsigned int v33 = [(__CFString *)v31 isEqual:@"com.apple.telephonyutilities.callservicesd"];

            if (!v33)
            {
LABEL_29:
              long long v106 = 0u;
              long long v107 = 0u;
              long long v105 = 0u;
              long long v104 = 0u;
              id v28 = v89;
              id v22 = [v28 countByEnumeratingWithState:&v104 objects:v120 count:16];
              if (v22)
              {
                uint64_t v34 = *(void *)v105;
                while (2)
                {
                  for (k = 0; k != v22; k = (char *)k + 1)
                  {
                    if (*(void *)v105 != v34) {
                      objc_enumerationMutation(v28);
                    }
                    if ([*(id *)(*((void *)&v104 + 1) + 8 * (void)k) hasPrefix:v15])
                    {
LABEL_39:

                      goto LABEL_40;
                    }
                  }
                  id v22 = [v28 countByEnumeratingWithState:&v104 objects:v120 count:16];
                  if (v22) {
                    continue;
                  }
                  break;
                }
              }
              goto LABEL_51;
            }
          }
          unsigned __int8 v21 = [v95 isSharePlayAvailable];
        }
        if ((v21 & 1) == 0) {
          goto LABEL_13;
        }
LABEL_40:
        unsigned __int8 v36 = [v95 bundleIDToActivities];
        os_signpost_id_t v37 = [v36 objectForKeyedSubscript:v15];

        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v28 = v37;
        id v38 = [v28 countByEnumeratingWithState:&v100 objects:v119 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v101;
          while (2)
          {
            for (m = 0; m != v38; m = (char *)m + 1)
            {
              if (*(void *)v101 != v39) {
                objc_enumerationMutation(v28);
              }
              if ([v9 activityIsHidden:*(void *)(*((void *)&v100 + 1) + 8 * (void)m)])
              {
                LODWORD(v22) = 0;
                goto LABEL_50;
              }
            }
            id v38 = [v28 countByEnumeratingWithState:&v100 objects:v119 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }
        LODWORD(v22) = 1;
LABEL_50:

LABEL_51:
LABEL_52:
        unsigned int v41 = v15;
        unsigned __int8 v42 = @"SDSuggestionTransportIdentifierPlaceholder";
        uint64_t v43 = v42;
        __int16 v94 = v41;
        if (v41 == v42)
        {

          unsigned int v44 = 1;
        }
        else
        {
          if ((v41 == 0) == (@"SDSuggestionTransportIdentifierPlaceholder" != 0)) {
            unsigned int v44 = 0;
          }
          else {
            unsigned int v44 = [(__CFString *)v41 isEqual:v42];
          }

          if (((v22 | v44) & 1) == 0)
          {
            long long v46 = share_sheet_log();
            if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_79;
            }
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v13;
            v75 = v46;
            unsigned int v76 = "Rejecting people row proxy %@ due to not visible activity type";
            goto LABEL_71;
          }
        }
        id v45 = [v93 count];
        if (v45 >= (id)+[SDStatusMonitor shareSheetMaxSuggestions])
        {
          long long v46 = share_sheet_log();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_79;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v13;
          v75 = v46;
          unsigned int v76 = "Rejecting people row proxy %@ because we are over the max number of suggestions";
LABEL_71:
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, v76, buf, 0xCu);
          goto LABEL_79;
        }
        long long v46 = objc_alloc_init((Class)SFAirDropNode);
        [v46 setTransportBundleID:v41];
        id v47 = [v13 displayName];
        [v46 setDisplayName:v47];

        unsigned int v48 = [v13 identifier];
        [v46 setRealName:v48];

        [v46 setSuggestion:1];
        __int16 v49 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [obj indexOfObject:v13]);
        [v46 setSuggestionIndex:v49];

        id v50 = [v13 formattedHandles];
        id v51 = +[NSSet setWithArray:v50];
        [v46 setFormattedHandles:v51];

        id v52 = [v13 actualHandles];
        id v53 = +[NSSet setWithArray:v52];
        [v46 setActualHandles:v53];

        id v54 = [v13 contactIDs];
        id v55 = +[NSSet setWithArray:v54];
        [v46 setContactIDs:v55];

        id v56 = [v13 derivedIntentIdentifier];
        [v46 setDerivedIntentIdentifier:v56];

        [v93 addObject:v46];
        id v57 = [v95 realNameToNodeID];
        id v58 = [v46 realName];
        id v59 = [v57 objectForKeyedSubscript:v58];

        if (!v59)
        {
          id v59 = +[NSUUID UUID];
          id v60 = [v95 realNameToNodeID];
          int v61 = [v46 realName];
          [v60 setObject:v59 forKeyedSubscript:v61];
        }
        [v46 setNodeIdentifier:v59];
        id v62 = +[UIAirDropNode nodeWithIdentifier:v59 suggestionNode:v13];
        id v63 = [v95 hostConfiguration];
        unsigned int v91 = [v63 hostLocale];

        id v64 = [v95 hostConfiguration];
        unsigned int v87 = +[SDShareSheetSession labelColorWithHostConfiguration:v64];

        if (([v95 skipSlotsRendering] & 1) != 0
          || ([v95 hostConfiguration],
              id v65 = objc_claimAutoreleasedReturnValue(),
              unsigned int v66 = [v65 requestPeopleSuggestionsData],
              v65,
              v66))
        {
          __int16 v67 = [v13 suggestion];
          id v68 = [v67 createPeopleSuggestion];
          [v62 setPeopleSuggestion:v68];
        }
        if (([v95 skipSlotsRendering] | v44) == 1)
        {
          id v69 = [v46 displayNameForLocale:v91];
          id v70 = [objc_alloc((Class)SFProxyText) initWithText:v69];
          [v62 setDisplayName:v70];

          if ([v13 hasGroupImage])
          {
            id v71 = SFLocalizedStringForKey();
            BOOL v72 = [v46 formattedHandles];
            v73 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v71, [v72 count]);

            id v74 = [objc_alloc((Class)SFProxyText) initWithText:v73];
            [v62 setSubtitle:v74];
          }
        }
        else
        {
          v77 = objc_alloc_init(SDShareSheetLoadingConfiguration);
          [(SDShareSheetLoadingConfiguration *)v77 setTextColor:v87];
          [(SDShareSheetLoadingConfiguration *)v77 setHostLocale:v91];
          v78 = [v95 xpcHelperCnx];
          [(SDShareSheetLoadingConfiguration *)v77 setHelperConnection:v78];

          -[SDShareSheetLoadingConfiguration setInstantShareSheet:](v77, "setInstantShareSheet:", [v95 skipSlotsRendering]);
          unsigned int v79 = [v95 hostConfiguration];
          [(SDShareSheetLoadingConfiguration *)v77 setHostConfiguration:v79];

          *(void *)buf = 0;
          objc_initWeak((id *)buf, val);
          v96[0] = _NSConcreteStackBlock;
          v96[1] = 3221225472;
          v96[2] = sub_10016FF98;
          v96[3] = &unk_1008CECA8;
          objc_copyWeak(&v99, (id *)buf);
          v97 = v46;
          id v69 = v77;
          v98 = v69;
          [v62 setLoadHandler:v96];

          objc_destroyWeak(&v99);
          objc_destroyWeak((id *)buf);
        }

        if ([v13 isIntentsBased]) {
          uint64_t v80 = [v13 isGroup] ^ 1;
        }
        else {
          uint64_t v80 = 0;
        }
        [v62 setHasSquareImage:v80];
        [v62 setIsDisabled:-[NSObject isDisabled](v46, "isDisabled")];
        [v86 addObject:v62];
        id v81 = share_sheet_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v13;
          __int16 v117 = 2112;
          __int16 v118 = v59;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Share Sheet accepted people suggestion:%@ for identifier:%@", buf, 0x16u);
        }

LABEL_79:
      }
      id v11 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
    }
    while (v11);
  }

  if ([v86 count] && IsAppleInternalBuild())
  {
    long long v82 = share_sheet_log();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "adding tap-to-radar airdrop node to people suggestions.", buf, 2u);
    }

    long long v83 = +[UIAirDropNode TTRAirDropNode];
    [v86 addObject:v83];
  }
  id v84 = [v95 peopleNodes];
  [(SDShareSheetSlotManager *)val _clearSlotsForAirDropProxies:v84];
  [v95 setSuggestedPeople:v93];
  [v95 setPeopleNodes:v86];
  +[CATransaction flush];

  objc_sync_exit(val);
}

- (void)_clearSlotsForAirDropProxies:(id)a3
{
  id v4 = a3;
  unsigned __int8 v21 = self;
  unsigned int v5 = [(SDShareSheetSlotManager *)self shareSheetContext];
  id v6 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
        id v12 = share_sheet_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Deleting slots for people row proxy %@", buf, 0xCu);
        }

        id v13 = [v11 avatarImageSlotID];
        id v14 = [v11 mainLabelSlotID];
        id v15 = [v11 transportImageSlotID];
        id v16 = [v11 bottomLabelSlotID];
        if (v13) {
          [v5 deleteSlot:v13];
        }
        if (v14)
        {
          [v5 deleteSlot:v14];
          unsigned __int8 v17 = +[NSNumber numberWithUnsignedInt:v14];
          [v6 addObject:v17];
        }
        if (v15)
        {
          [v5 deleteSlot:v15];
          long long v18 = +[NSNumber numberWithUnsignedInt:v15];
          [v6 addObject:v18];
        }
        if (v16)
        {
          [v5 deleteSlot:v16];
          uint64_t v19 = +[NSNumber numberWithUnsignedInt:v16];
          [v6 addObject:v19];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }

  unsigned int v20 = [(SDShareSheetSlotManager *)v21 accessibilityCache];
  [v20 removeLabelsForSlotIDs:v6];
}

- (void)handleAirDropNodesChanged:(id)a3 sessionID:(id)a4
{
  id v46 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  unsigned int v44 = v6;
  id v45 = v7;
  id v8 = [(NSMutableDictionary *)v7->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    long long v24 = share_sheet_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_100175548();
    }
    goto LABEL_49;
  }
  id v10 = [v8 airDropPeople];
  id v11 = [v10 count];
  id v12 = [v46 count];

  if (v11 != v12) {
    [(SDShareSheetSlotManager *)v7 updateNearbyCountSlotIDForSession:v9];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v46;
  id v13 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v53;
    char v15 = 1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v53 != v14) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        long long v18 = [v9 realNameToNodeID];
        uint64_t v19 = [v17 realName];
        unsigned int v20 = [v18 objectForKeyedSubscript:v19];
        [v17 setNodeIdentifier:v20];

        unsigned __int8 v21 = [v17 realName];
        id v22 = [v9 selectedNode];
        long long v23 = [v22 realName];
        LOBYTE(v19) = [v21 isEqualToString:v23];

        v15 &= v19 ^ 1;
      }
      id v13 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v13);

    if ((v15 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  [v9 setSelectedNode:0];
LABEL_17:
  [v9 setAirDropPeople:obj];
  long long v25 = [v9 selectedNode];
  if (v25)
  {
    long long v24 = 0;
  }
  else
  {
    long long v24 = [obj firstObject];
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v26 = obj;
  id v27 = [v26 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v49;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(v26);
        }
        long long v30 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
        id v31 = [v9 selectedNode];
        BOOL v32 = v31 == 0;

        if (v32)
        {
          unsigned int v33 = v30;

          long long v24 = v33;
        }
        else if ([v30 selectionReason])
        {
          uint64_t v34 = v30;

          long long v24 = v34;
          goto LABEL_31;
        }
      }
      id v27 = [v26 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v27);
  }
LABEL_31:

  id v35 = [v9 peopleNodes];
  if ([v35 count]) {
    unsigned int v36 = [v9 sentInitialConfiguration];
  }
  else {
    unsigned int v36 = 0;
  }

  if (!v24) {
    goto LABEL_52;
  }
  os_signpost_id_t v37 = [v24 nodeIdentifier];
  id v38 = [v9 selectedNode];
  uint64_t v39 = [v38 nodeIdentifier];
  unsigned __int8 v40 = [v37 isEqual:v39];

  if ((v40 & 1) == 0)
  {
    unsigned __int8 v42 = share_sheet_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v24;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "people row AirDrop slot changing to %@", buf, 0xCu);
    }

    if (![v24 selectionReason]) {
      [v24 setSelectionReason:2];
    }
    [v9 setSelectedNode:v24];
    [(SDShareSheetSlotManager *)v45 createAirDropProxyForNode:v24 session:v9];
  }
  else
  {
LABEL_52:
    if ([v26 count]) {
      goto LABEL_49;
    }
    unsigned int v41 = share_sheet_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "no AirDrop nodes discovered", buf, 2u);
    }

    [v9 setAirDropNodes:&__NSArray0__struct];
    [v9 setSelectedNode:0];
  }
  if (v36)
  {
    uint64_t v43 = share_sheet_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "AirDrop suggestion node did change", buf, 2u);
    }

    [(SDShareSheetSlotManager *)v45 dataSourceDidUpdateForSession:v9 animated:1];
  }
LABEL_49:

  objc_sync_exit(v45);
}

- (void)browser:(id)a3 didUpdatePeople:(id)a4 deletedContactIdentifiers:(id)a5
{
  id v8 = a3;
  id v48 = a4;
  id v49 = a5;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  id v46 = v8;
  id obj = v9;
  sessionIDToShareSheetSession = v9->_sessionIDToShareSheetSession;
  id v11 = [v8 sessionID];
  id v12 = [(NSMutableDictionary *)sessionIDToShareSheetSession objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = [v12 airDropPeople];
    id v14 = [v13 count];
    id v15 = [v48 count];

    if (v14 != v15) {
      [(SDShareSheetSlotManager *)v9 updateNearbyCountSlotIDForSession:v12];
    }
    [v12 setAirDropPeople:v48];
    id v16 = [v12 selectedNode];
    if (v16)
    {
      unsigned __int8 v17 = 0;
    }
    else
    {
      unsigned __int8 v17 = [v48 firstObject];
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v19 = v48;
    id v20 = [v19 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v19);
          }
          long long v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          long long v24 = [v12 selectedNode];
          BOOL v25 = v24 == 0;

          if (v25)
          {
            uint64_t v29 = [v23 rangingMeasurement];
            [v29 ptsScore];
            double v31 = v30;
            BOOL v32 = [v17 rangingMeasurement];
            [v32 ptsScore];
            BOOL v34 = v31 > v33;

            if (v34)
            {
              id v35 = v23;

              unsigned __int8 v17 = v35;
            }
          }
          else if ([v23 selectionReason] {
                 || ([v12 selectedNode],
          }
                     id v26 = objc_claimAutoreleasedReturnValue(),
                     [v26 contactIdentifier],
                     id v27 = objc_claimAutoreleasedReturnValue(),
                     unsigned __int8 v28 = [v49 containsObject:v27],
                     v27,
                     v26,
                     (v28 & 1) != 0))
          {
            unsigned int v36 = v23;

            unsigned __int8 v17 = v36;
            goto LABEL_24;
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_24:

    os_signpost_id_t v37 = [v12 peopleNodes];
    if ([v37 count]) {
      unsigned int v38 = [v12 sentInitialConfiguration];
    }
    else {
      unsigned int v38 = 0;
    }

    if (!v17) {
      goto LABEL_45;
    }
    uint64_t v39 = [v17 nodeIdentifier];
    unsigned __int8 v40 = [v12 selectedNode];
    unsigned int v41 = [v40 nodeIdentifier];
    unsigned __int8 v42 = [v39 isEqual:v41];

    if ((v42 & 1) == 0)
    {
      unsigned int v44 = share_sheet_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v17;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "people row AirDrop slot changing to %@", buf, 0xCu);
      }

      if (![v17 selectionReason]) {
        [v17 setSelectionReason:2];
      }
      [v12 setSelectedNode:v17];
      [(SDShareSheetSlotManager *)obj createAirDropProxyForNode:v17 session:v12];
    }
    else
    {
LABEL_45:
      if ([v19 count]) {
        goto LABEL_42;
      }
      uint64_t v43 = share_sheet_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "no AirDrop nodes discovered", buf, 2u);
      }

      [v12 setAirDropNodes:&__NSArray0__struct];
      [v12 setSelectedNode:0];
    }
    if (v38)
    {
      id v45 = share_sheet_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "AirDrop suggestion node did change", buf, 2u);
      }

      [(SDShareSheetSlotManager *)obj dataSourceDidUpdateForSession:v12 animated:1];
    }
  }
  else
  {
    unsigned __int8 v17 = share_sheet_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      long long v18 = [v8 sessionID];
      sub_1001755B0(v18, buf, v17);
    }
  }
LABEL_42:

  objc_sync_exit(obj);
}

- (void)createAirDropProxyForNode:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (!v6) {
    goto LABEL_17;
  }
  long long v50 = SFLocalizedStringForKey();
  uint64_t v9 = [v7 hostConfiguration];
  id v10 = [v9 hostLocale];
  long long v51 = [v6 displayNameForLocale:v10];

  id v11 = [v7 realNameToNodeID];
  id v12 = [v6 realName];
  id v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    id v13 = +[NSUUID UUID];
    id v14 = [v7 realNameToNodeID];
    id v15 = [v6 realName];
    [v14 setObject:v13 forKeyedSubscript:v15];
  }
  [v6 setNodeIdentifier:v13];
  if (![v7 skipSlotsRendering])
  {
    id v27 = [v6 displayIcon];
    unsigned __int8 v28 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v29 = +[UIImage imageNamed:@"AirDropBadge" inBundle:v28];
    double v30 = [v29 _applicationIconImageForFormat:5 precomposed:0];

    id v31 = v30;
    id v32 = [v31 CGImage];
    +[CATransaction begin];
    double v33 = [v7 hostConfiguration];
    id v49 = +[SDShareSheetSession labelColorWithHostConfiguration:v33];
    id v47 = v31;

    id v34 = [v6 isClassroom];
    id v35 = [v7 xpcHelperCnx];
    unsigned int v36 = [v7 hostConfiguration];
    [(SDShareSheetSlotManager *)v8 _createNameLabelSlotWithString:v51 textColor:v49 maximumNumberOfLines:2 isAirDrop:0 ignoreNameWrapping:v34 sessionConnection:v35 hostConfig:v36];

    os_signpost_id_t v37 = [(SDShareSheetSlotManager *)v8 shareSheetContext];
    unsigned int v38 = +[NSMutableDictionary dictionary];
    if (v27)
    {
      unsigned int v48 = [(SDShareSheetSlotManager *)v8 createSlotForContext:v37];
      [v37 setObject:v27 forSlot:v48];
      if (v32) {
        goto LABEL_8;
      }
    }
    else
    {
      unsigned int v48 = 0;
      if (v32)
      {
LABEL_8:
        id v39 = (id)[(SDShareSheetSlotManager *)v8 createSlotForContext:v37];
        [v37 setObject:v32 forSlot:v39];
        unsigned __int8 v40 = +[NSNumber numberWithUnsignedInt:v39];
        [v38 setObject:v50 forKey:v40];

        if (!v52) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    id v39 = 0;
    if (!v52)
    {
LABEL_13:
      uint64_t v43 = [(SDShareSheetSlotManager *)v8 accessibilityCache];
      [v43 addEntriesFromDictionary:v38];

      +[CATransaction commit];
      id v44 = [objc_alloc((Class)SFProxyText) initWithSlotIdentifier:v52];
      long long v23 = +[UIAirDropNode nodeWithIdentifier:v13 displayName:v44 subtitle:0 avatarImageSlotID:v48 transportImageSlotID:v39];

      goto LABEL_14;
    }
LABEL_12:
    unsigned int v41 = [v6 displayName];
    unsigned __int8 v42 = +[NSNumber numberWithUnsignedInt:v52];
    [v38 setObject:v41 forKey:v42];

    goto LABEL_13;
  }
  id v16 = objc_alloc((Class)SFPeopleSuggestion);
  unsigned __int8 v17 = [v13 UUIDString];
  long long v18 = [v6 displayName];
  id v19 = [v6 transportBundleID];
  id v20 = [v6 contact];
  uint64_t v21 = [v6 model];
  id v22 = [v16 initWithIdentifier:v17 displayName:v18 transportBundleIdentifier:v19 contact:v20 deviceModelIdentifier:v21];

  long long v23 = +[UIAirDropNode nodeWithIdentifier:v13 peopleSuggestion:v22];
  id v24 = objc_alloc((Class)SFProxyText);
  BOOL v25 = [v6 displayName];
  id v26 = [v24 initWithText:v25];
  [v23 setDisplayName:v26];

LABEL_14:
  [v23 setIsDisabled:[v6 isDisabled]];
  [v23 setHasSquareImage:[v6 isClassroom]];
  if (GestaltGetBoolean()) {
    [v23 setSelectionReason:[v6 selectionReason]];
  }
  id v45 = [v7 airDropNodes];
  [(SDShareSheetSlotManager *)v8 _clearSlotsForAirDropProxies:v45];
  long long v53 = v23;
  id v46 = +[NSArray arrayWithObjects:&v53 count:1];
  [v7 setAirDropNodes:v46];

  +[CATransaction flush];
LABEL_17:
  objc_sync_exit(v8);
}

- (id)_createActivityTitlePerspectiveDataForActivity:(id)a3 foregroundColor:(id)a4 sessionConnection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100174714();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    goto LABEL_13;
  }
  id v11 = [v7 activityTitle];
  if (!v11)
  {
    id v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100174748();
    }

LABEL_11:
    id v10 = 0;
    goto LABEL_12;
  }
  id v10 = [v9 perspectiveDataForUIActivityTitle:v11 textColor:v8];
LABEL_12:

LABEL_13:

  return v10;
}

- (id)_createNameLabelPerspectiveDataForString:(id)a3 textColor:(id)a4 maximumNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 sessionConnection:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  id v16 = v15;
  if (v15)
  {
    if (v13)
    {
      unsigned __int8 v17 = [v15 perspectiveDataForNameLabelWithString:v13 textColor:v14 maxNumberOfLines:a5 isAirDrop:v10 ignoreNameWrapping:v9];
      goto LABEL_8;
    }
  }
  else
  {
    long long v18 = share_sheet_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_100174714();
    }
  }
  unsigned __int8 v17 = 0;
LABEL_8:

  return v17;
}

- ($EC76EA2E339756B4D2C49A1061DE0928)_createNameLabelSlotWithString:(SEL)a3 textColor:(id)a4 maximumNumberOfLines:(id)a5 isAirDrop:(unint64_t)a6 ignoreNameWrapping:(BOOL)a7 sessionConnection:(BOOL)a8 hostConfig:(id)a9
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  retstr->var1.double width = 0.0;
  retstr->var1.double height = 0.0;
  *(void *)&retstr->var0 = 0;
  if (v19)
  {
    unsigned int v31 = [v17 length];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1001718A0;
    v40[3] = &unk_1008CECD0;
    unsigned int v41 = v19;
    id v21 = v17;
    id v22 = v18;
    id v23 = v21;
    id v42 = v21;
    id v32 = v22;
    id v43 = v22;
    unint64_t v44 = a6;
    BOOL v45 = v12;
    BOOL v46 = v11;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001718B8;
    v33[3] = &unk_1008CECF8;
    id v34 = v41;
    id v24 = v23;
    id v35 = v24;
    id v25 = v43;
    id v36 = v25;
    unint64_t v37 = a6;
    BOOL v38 = v12;
    BOOL v39 = v11;
    [(SDShareSheetSlotManager *)self _uploadSlotWithVectorData:v40 cgImage:v33 performCATransaction:0 hostConfiguration:v20];
    *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
    retstr->var1.double height = *(CGFloat *)&buf[16];
    if (!retstr->var0)
    {
      id v26 = share_sheet_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413570;
        uint64_t v29 = "no";
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&unsigned char buf[12] = 1024;
        if (v12) {
          double v30 = "yes";
        }
        else {
          double v30 = "no";
        }
        *(_DWORD *)&buf[14] = v31;
        *(_WORD *)&buf[18] = 2112;
        if (v11) {
          uint64_t v29 = "yes";
        }
        *(void *)&buf[20] = v25;
        __int16 v48 = 1024;
        int v49 = a6;
        __int16 v50 = 2080;
        long long v51 = v30;
        __int16 v52 = 2080;
        long long v53 = v29;
        _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "returned nil: CGImgForNameLabelWithString:'%@', length: %i, textColor:%@, maxNumberOfLines: %i, isAirDrop: %s, ignoreNameWrapping: %s", buf, 0x36u);
      }
    }
    id v27 = v41;
    id v18 = v32;
  }
  else
  {
    id v27 = share_sheet_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      sub_100175608();
    }
  }

  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SDShareSheetSlotManager *)self shouldAcceptNewConnection:v7];
  BOOL v9 = daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 sd_description];
    BOOL v11 = (void *)v10;
    BOOL v12 = "no";
    if (v8) {
      BOOL v12 = "yes";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    __int16 v23 = 2080;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection from %@ accepted %s", buf, 0x16u);
  }
  if (v8)
  {
    [v7 setDelegate:self];
    [v7 setExportedObject:self];
    id v13 = [(SDShareSheetSlotManager *)self exportedInterface];
    [v7 setExportedInterface:v13];

    id v14 = [(SDShareSheetSlotManager *)self remoteObjectInterface];
    [v7 setRemoteObjectInterface:v14];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id location = 0;
    objc_initWeak(&location, v7);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100171BB8;
    v18[3] = &unk_1008CED20;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, (id *)buf);
    [v7 setInvalidationHandler:v18];
    [v7 resume];
    id v15 = [(SDShareSheetSlotManager *)self activeConnections];
    id v16 = +[NSMutableSet setWithSet:v15];

    [v16 addObject:v7];
    [(SDShareSheetSlotManager *)self setActiveConnections:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7 = a4;
  [(SDShareSheetSlotManager *)self setCurrentConnection:a3];
  [v7 invoke];
}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  id v4 = [(SDShareSheetSlotManager *)self currentConnection];
  unsigned int v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sd_description];
    int v7 = 138412290;
    BOOL v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New connection established to %@", (uint8_t *)&v7, 0xCu);
  }
  [(SDShareSheetSlotManager *)self connectionEstablished:v4];
}

- (id)machServiceName
{
  return @"com.apple.sharing.sharesheet";
}

- (id)exportedInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SDShareSheetSlotManagerProtocol];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  BOOL v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:"connectToDaemonWithContext:completionHandler:" argumentIndex:0 ofReply:0];

  [v2 setClass:objc_opt_class() forSelector:"connectUIServiceToDaemonWithSessionID:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"sendConfiguration:completion:" argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:"requestConfigurationWithSessionID:completion:" argumentIndex:0 ofReply:1];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:selectedPersonWithIdentifier:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:selectedPersonWithIdentifier:" argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:removedPersonWithIdentifier:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:removedPersonWithIdentifier:" argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:" argumentIndex:1 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:" argumentIndex:1 ofReply:0];
  uint64_t v10 = objc_opt_class();
  BOOL v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:"activityViewControllerWithSessionID:updatedFavoritesProxies:activityCategory:" argumentIndex:1 ofReply:0];

  uint64_t v12 = objc_opt_class();
  id v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:"activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:" argumentIndex:0 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:"createSharingURLForCollaborationRequest:completionHandler:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"createSharingURLForCollaborationRequest:completionHandler:" argumentIndex:0 ofReply:1];

  return v2;
}

- (id)remoteObjectInterface
{
  unint64_t v44 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFShareSheetSlotObserverProtocol];
  uint64_t v45 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v45, v42, v40, v38, v36, v34, v33, v32, v2, v3, v4, v5, v6, v7, v8, v9, v10,
    objc_opt_class(),
  BOOL v11 = 0);
  [v44 setClasses:v11 forSelector:"willPerformInServiceActivityWithRequest:completion:" argumentIndex:0 ofReply:1];

  uint64_t v46 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v46, v43, v41, v39, v37, v35, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(),
  id v22 = 0);
  [v44 setClasses:v22 forSelector:"didPerformInServiceActivityWithIdentifier:completed:items:error:" argumentIndex:1 ofReply:0];

  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  id v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, v24, objc_opt_class(), 0);
  [v44 setClasses:v25 forSelector:"performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:" argumentIndex:0 ofReply:0];

  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  unsigned __int8 v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  [v44 setClasses:v28 forSelector:"performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:" argumentIndex:1 ofReply:0];

  uint64_t v29 = objc_opt_class();
  double v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, objc_opt_class(), 0);
  [v44 setClasses:v30 forSelector:"performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:" argumentIndex:2 ofReply:0];

  [v44 setClass:objc_opt_class() forSelector:"didUpdateAirDropTransferWithChange:" argumentIndex:0 ofReply:0];
  [v44 setClass:objc_opt_class() forSelector:"dataSourceUpdatedWithSessionConfiguration:" argumentIndex:0 ofReply:0];

  return v44;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v3 = a3;
  uint64_t v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 sd_description];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "New connection established %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 sd_description];
    *(_DWORD *)buf = 138412290;
    id v53 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection %@ invalidated", buf, 0xCu);
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(SDShareSheetSlotManager *)v7 activeConnections];
  id v40 = [v8 mutableCopy];

  [v40 removeObject:v4];
  [(SDShareSheetSlotManager *)v7 setActiveConnections:v40];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)v7->_sessionIDToShareSheetSession allValues];
  id v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v14 = [v13 connection];
        BOOL v15 = v14 == v4;

        if (v15)
        {
          id v10 = v13;
          uint64_t v16 = daemon_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v10;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session matched to connection %@", buf, 0xCu);
          }

          goto LABEL_15;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  uint64_t v17 = [(SDShareSheetSlotManager *)v7 shareSheetContext];
  uint64_t v18 = +[NSMutableArray array];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100172CD4;
  v44[3] = &unk_1008CED48;
  id v19 = v17;
  id v45 = v19;
  id v20 = v18;
  id v46 = v20;
  uint64_t v21 = objc_retainBlock(v44);
  +[CATransaction begin];
  uint64_t v22 = [v10 hostShareActivityProxies];
  ((void (*)(void *, uint64_t))v21[2])(v21, v22);
  uint64_t v38 = (void *)v22;
  uint64_t v23 = [v10 hostActionActivityProxies];
  ((void (*)(void *, uint64_t))v21[2])(v21, v23);
  uint64_t v36 = v23;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100172E98;
  v41[3] = &unk_1008CED48;
  id v39 = v19;
  id v42 = v39;
  id v24 = v20;
  id v43 = v24;
  id v25 = objc_retainBlock(v41);
  uint64_t v26 = [v10 airDropNodes];
  ((void (*)(void *, void *))v25[2])(v25, v26);
  uint64_t v27 = [v10 peopleNodes];
  ((void (*)(void *, void *))v25[2])(v25, v27);
  unsigned __int8 v28 = [(SDShareSheetSlotManager *)v7 accessibilityCache];
  [v28 removeLabelsForSlotIDs:v24];

  uint64_t v29 = [v10 nearbyCountSlotID];

  if (v29)
  {
    double v30 = [v10 nearbyCountSlotID:v36];
    [v39 deleteSlot:[v30 unsignedIntValue]];
  }
  if ((objc_msgSend(v10, "engagedWithSheet", v36) & 1) == 0)
  {
    unsigned int v31 = [v10 suggestionBrowser];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      uint64_t v33 = [v10 suggestionBrowser];
      [v33 provideFeedbackForNodeAtIndex:0 bundleID:0 selectedActionBundleID:0 abandoned:1];
    }
  }
  uint64_t v34 = [v10 peopleBrowser];
  uint64_t v35 = [v34 sessionID];

  [v10 invalidate];
  if (v35) {
    [(NSMutableDictionary *)v7->_sessionIDToShareSheetSession removeObjectForKey:v35];
  }
  if (![(NSMutableDictionary *)v7->_sessionIDToShareSheetSession count]) {
    [(SDShareSheetSlotManager *)v7 invalidateShareSheetContext];
  }
  +[CATransaction commit];
  +[CATransaction flush];

  objc_sync_exit(v7);
}

- (id)accessibilityStringForSlotID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SDShareSheetSlotManager *)self accessibilityCache];
  uint64_t v5 = +[NSNumber numberWithUnsignedInt:v3];
  int v6 = [v4 labelForSlotID:v5];

  uint64_t v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning accessibility label %@ for slotID %u", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)recipientHandlesForSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v26 = v4;
  int v6 = [(NSMutableDictionary *)v5->_sessionIDToShareSheetSession objectForKeyedSubscript:v4];
  uint64_t v27 = [v6 selectedRecipient];
  if (v27)
  {
    id v7 = [objc_alloc((Class)SFShareSheetRecipient) initWithNode:v27];
    id v42 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v42 count:1];

    [v6 setSelectedRecipient:0];
  }
  else
  {
    int v9 = [v6 recipients];
    id v10 = [v9 count];

    if (v10)
    {
      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      int v12 = [v6 recipients];
      id v13 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v33;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = [objc_alloc((Class)SFShareSheetRecipient) initWithPerson:*(void *)(*((void *)&v32 + 1) + 8 * i) handleValidationBlock:&stru_1008CED88];
            [v11 addObject:v16];
          }
          id v13 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v13);
      }

      id v17 = [v11 copy];
    }
    else
    {
      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v18 = [v6 transferNodes];
      id v19 = [v18 allValues];

      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v29;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v19);
            }
            id v23 = [objc_alloc((Class)SFShareSheetRecipient) initWithNode:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
            [v11 addObject:v23];
          }
          id v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v20);
      }

      id v17 = [v11 copy];
    }
    uint64_t v8 = v17;
  }
  objc_sync_exit(v5);

  if (IsAppleInternalBuild())
  {
    id v24 = share_sheet_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v8;
      __int16 v38 = 2112;
      id v39 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Returning recipients %@ for session ID %@", buf, 0x16u);
    }
  }

  return v8;
}

- (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = [(NSMutableDictionary *)v8->_sessionIDToShareSheetSession objectForKeyedSubscript:v6];
  id v10 = [v9 selectedRecipient];

  if (v10)
  {
    id v11 = objc_alloc((Class)SFShareSheetRecipient);
    int v12 = [v9 selectedRecipient];
    id v13 = [v11 initWithNode:v12];

LABEL_3:
    [v9 setSelectedRecipient:0];
    int v14 = 1;
    goto LABEL_6;
  }
  BOOL v15 = [v9 recipients];
  id v16 = [v15 count];

  if (!v16)
  {
    id v13 = 0;
    goto LABEL_3;
  }
  id v17 = [v9 recipients];
  uint64_t v18 = [v9 connection];
  id v19 = [v18 _queue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100173890;
  v21[3] = &unk_1008CEDB0;
  id v22 = v6;
  id v23 = v7;
  sub_1001ACA9C(v17, v19, v21);

  id v13 = 0;
  int v14 = 0;
LABEL_6:

  objc_sync_exit(v8);
  if (v14)
  {
    if (IsAppleInternalBuild())
    {
      id v20 = share_sheet_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v13;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Returning Messages recipient %@ for session ID %@", buf, 0x16u);
      }
    }
    (*((void (**)(id, id))v7 + 2))(v7, v13);
  }
}

- (BOOL)wantsToBlockPresentation
{
  return 0;
}

- (NSMutableDictionary)personToImageSlot
{
  return self->_personToImageSlot;
}

- (void)setPersonToImageSlot:(id)a3
{
}

- (NSMutableDictionary)personToLabelSlot
{
  return self->_personToLabelSlot;
}

- (void)setPersonToLabelSlot:(id)a3
{
}

- (NSMutableDictionary)bundleIDToSmallImageSlot
{
  return self->_bundleIDToSmallImageSlot;
}

- (void)setBundleIDToSmallImageSlot:(id)a3
{
}

- (NSMutableDictionary)activityTypeToLargeImageSlot
{
  return self->_activityTypeToLargeImageSlot;
}

- (void)setActivityTypeToLargeImageSlot:(id)a3
{
}

- (NSMutableDictionary)activityTypeToLabelSlot
{
  return self->_activityTypeToLabelSlot;
}

- (void)setActivityTypeToLabelSlot:(id)a3
{
}

- (NSMutableDictionary)sessionIDToShareSheetSession
{
  return self->_sessionIDToShareSheetSession;
}

- (void)setSessionIDToShareSheetSession:(id)a3
{
}

- (_UIActivityUserDefaults)shareUserDefaults
{
  return self->_shareUserDefaults;
}

- (void)setShareUserDefaults:(id)a3
{
}

- (_UIActivityUserDefaults)actionUserDefaults
{
  return self->_actionUserDefaults;
}

- (void)setActionUserDefaults:(id)a3
{
}

- (NSCache)slotIDToLabel
{
  return self->_slotIDToLabel;
}

- (NSXPCConnection)_currentConnection
{
  return self->__currentConnection;
}

- (void)set_currentConnection:(id)a3
{
}

- (NSSet)_activeConnections
{
  return self->__activeConnections;
}

- (void)set_activeConnections:(id)a3
{
}

- (SDShareSheetAccessibilityCache)accessibilityCache
{
  return (SDShareSheetAccessibilityCache *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccessibilityCache:(id)a3
{
}

- (NSNumber)sharingPolicyWantsToBlockShareSheet
{
  return self->_sharingPolicyWantsToBlockShareSheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityCache, 0);
  objc_storeStrong((id *)&self->__activeConnections, 0);
  objc_storeStrong((id *)&self->__currentConnection, 0);
  objc_storeStrong((id *)&self->_slotIDToLabel, 0);
  objc_storeStrong((id *)&self->_actionUserDefaults, 0);
  objc_storeStrong((id *)&self->_shareUserDefaults, 0);
  objc_storeStrong((id *)&self->_sessionIDToShareSheetSession, 0);
  objc_storeStrong((id *)&self->_activityTypeToLabelSlot, 0);
  objc_storeStrong((id *)&self->_activityTypeToLargeImageSlot, 0);
  objc_storeStrong((id *)&self->_bundleIDToSmallImageSlot, 0);
  objc_storeStrong((id *)&self->_personToLabelSlot, 0);
  objc_storeStrong((id *)&self->_personToImageSlot, 0);
  objc_storeStrong((id *)&self->_sharingPolicyWantsToBlockShareSheet, 0);
  objc_storeStrong((id *)&self->_shareSheetContext, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end