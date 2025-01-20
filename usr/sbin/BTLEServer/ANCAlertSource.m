@interface ANCAlertSource
- (ANCAlertSource)initWithDelegate:(id)a3 queue:(id)a4;
- (ANCAlertSourceDelegate)delegate;
- (BBObserver)bbObserver;
- (BOOL)isAlertSilent:(id)a3;
- (BOOL)isSpecialSectionID:(id)a3;
- (CHManager)chManager;
- (CNContactStore)contactStore;
- (DNDEventBehaviorResolutionService)behaviorResolutionService;
- (NSDictionary)firstPartyAppIdentifierToCategoryMap;
- (NSMapTable)tuActiveCallAlerts;
- (NSMapTable)tuIncomingCallAlerts;
- (NSMapTable)vvVoicemailAlerts;
- (NSMutableArray)chUnreadMissedCalls;
- (NSMutableArray)tuActiveCalls;
- (NSMutableArray)tuIncomingCalls;
- (NSMutableArray)vvUnreadVoicemails;
- (NSMutableDictionary)alerts;
- (NSMutableDictionary)appIdentifierToCategoryCache;
- (NSMutableDictionary)bbBulletinAlerts;
- (NSMutableDictionary)chMissedCallAlerts;
- (OS_dispatch_queue)queue;
- (TUCallCenter)tuCallCenter;
- (VMVoicemailManager)vvManager;
- (id)alertsForCategoryID:(unsigned __int8)a3;
- (id)displayNameForAppIdentifier:(id)a3;
- (id)lazyContactStore;
- (unint64_t)genreIDForGenre:(id)a3;
- (unsigned)categoryIDForAppIdentifier:(id)a3;
- (unsigned)categoryIDForGenreID:(unint64_t)a3;
- (void)addAlert:(id)a3 isPreExisting:(BOOL)a4;
- (void)callHistoryChanged:(BOOL)a3;
- (void)callHistoryChangedNotification;
- (void)callIdentificationChanged:(id)a3;
- (void)callStatusChanged;
- (void)combineCurrentArray:(id)a3 withNewArray:(id)a4 maxCount:(unint64_t)a5 objectRemoved:(id)a6 objectAdded:(id)a7;
- (void)invalidate;
- (void)modifyAlert:(id)a3;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)removeAlert:(id)a3;
- (void)setAlerts:(id)a3;
- (void)setAppIdentifierToCategoryCache:(id)a3;
- (void)setBbBulletinAlerts:(id)a3;
- (void)setBbObserver:(id)a3;
- (void)setBehaviorResolutionService:(id)a3;
- (void)setChManager:(id)a3;
- (void)setChMissedCallAlerts:(id)a3;
- (void)setChUnreadMissedCalls:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstPartyAppIdentifierToCategoryMap:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTuActiveCallAlerts:(id)a3;
- (void)setTuActiveCalls:(id)a3;
- (void)setTuCallCenter:(id)a3;
- (void)setTuIncomingCallAlerts:(id)a3;
- (void)setTuIncomingCalls:(id)a3;
- (void)setVvManager:(id)a3;
- (void)setVvUnreadVoicemails:(id)a3;
- (void)setVvVoicemailAlerts:(id)a3;
- (void)voicemailsChanged:(BOOL)a3;
- (void)voicemailsChangedNotification;
@end

@implementation ANCAlertSource

- (ANCAlertSource)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)ANCAlertSource;
  v8 = [(ANCAlertSource *)&v64 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    alerts = v9->_alerts;
    v9->_alerts = v10;

    firstPartyAppIdentifierToCategoryMap = v9->_firstPartyAppIdentifierToCategoryMap;
    v9->_firstPartyAppIdentifierToCategoryMap = (NSDictionary *)&off_1000B7D30;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    appIdentifierToCategoryCache = v9->_appIdentifierToCategoryCache;
    v9->_appIdentifierToCategoryCache = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bbBulletinAlerts = v9->_bbBulletinAlerts;
    v9->_bbBulletinAlerts = v15;

    v17 = (BBObserver *)[objc_alloc((Class)BBObserver) initWithQueue:v9->_queue];
    bbObserver = v9->_bbObserver;
    v9->_bbObserver = v17;

    [(BBObserver *)v9->_bbObserver setDelegate:v9];
    [(BBObserver *)v9->_bbObserver setObserverFeed:1];
    v19 = v9->_bbObserver;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10005B520;
    v62[3] = &unk_1000B2390;
    v20 = v9;
    v63 = v20;
    [(BBObserver *)v19 getSectionInfoWithCompletion:v62];
    uint64_t v21 = +[DNDEventBehaviorResolutionService serviceForClientIdentifier:@"com.apple.BTLEServer.ANCS"];
    behaviorResolutionService = v20->_behaviorResolutionService;
    v20->_behaviorResolutionService = (DNDEventBehaviorResolutionService *)v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tuIncomingCalls = v20->_tuIncomingCalls;
    v20->_tuIncomingCalls = v23;

    uint64_t v25 = +[NSMapTable strongToStrongObjectsMapTable];
    tuIncomingCallAlerts = v20->_tuIncomingCallAlerts;
    v20->_tuIncomingCallAlerts = (NSMapTable *)v25;

    v27 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tuActiveCalls = v20->_tuActiveCalls;
    v20->_tuActiveCalls = v27;

    uint64_t v29 = +[NSMapTable strongToStrongObjectsMapTable];
    tuActiveCallAlerts = v20->_tuActiveCallAlerts;
    v20->_tuActiveCallAlerts = (NSMapTable *)v29;

    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v20 selector:"callStatusChanged" name:TUCallCenterCallStatusChangedNotification object:0];

    v32 = +[NSNotificationCenter defaultCenter];
    [v32 addObserver:v20 selector:"callStatusChanged" name:TUCallCenterVideoCallStatusChangedNotification object:0];

    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v20 selector:"callIdentificationChanged:" name:TUCallCenterCallerIDChangedNotification object:0];

    uint64_t v34 = +[TUCallCenter callCenterWithQueue:v9->_queue];
    tuCallCenter = v20->_tuCallCenter;
    v20->_tuCallCenter = (TUCallCenter *)v34;

    queue = v9->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005B644;
    block[3] = &unk_1000B1268;
    v37 = v20;
    v61 = v37;
    dispatch_async(queue, block);
    v38 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    chUnreadMissedCalls = v37->_chUnreadMissedCalls;
    v37->_chUnreadMissedCalls = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    chMissedCallAlerts = v37->_chMissedCallAlerts;
    v37->_chMissedCallAlerts = v40;

    v42 = +[NSNotificationCenter defaultCenter];
    [v42 addObserver:v37 selector:"callHistoryChangedNotification" name:kCallHistoryDatabaseChangedNotification object:0];

    v43 = (CHManager *)objc_alloc_init((Class)CHManager);
    chManager = v37->_chManager;
    v37->_chManager = v43;

    v45 = v9->_queue;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10005B64C;
    v58[3] = &unk_1000B1268;
    v46 = v37;
    v59 = v46;
    dispatch_async(v45, v58);
    v47 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    vvUnreadVoicemails = v46->_vvUnreadVoicemails;
    v46->_vvUnreadVoicemails = v47;

    uint64_t v49 = +[NSMapTable strongToStrongObjectsMapTable];
    vvVoicemailAlerts = v46->_vvVoicemailAlerts;
    v46->_vvVoicemailAlerts = (NSMapTable *)v49;

    v51 = (VMVoicemailManager *)objc_alloc_init((Class)VMVoicemailManager);
    vvManager = v46->_vvManager;
    v46->_vvManager = v51;

    v53 = +[NSNotificationCenter defaultCenter];
    [v53 addObserver:v46 selector:"voicemailsChangedNotification" name:VMVoicemailVoicemailsChangedNotification object:0];

    v54 = v9->_queue;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10005B658;
    v56[3] = &unk_1000B1268;
    v57 = v46;
    dispatch_async(v54, v56);
  }
  return v9;
}

- (void)invalidate
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(ANCAlertSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B774;
  block[3] = &unk_1000B1268;
  void block[4] = self;
  dispatch_sync(v4, block);

  v5 = [(ANCAlertSource *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005B7B8;
  v6[3] = &unk_1000B1268;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

- (id)alertsForCategoryID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = [(ANCAlertSource *)self alerts];
  v5 = +[NSNumber numberWithUnsignedChar:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)displayNameForAppIdentifier:(id)a3
{
  uint64_t v3 = +[LSApplicationProxy applicationProxyForIdentifier:a3];
  v4 = [v3 localizedName];

  return v4;
}

- (BOOL)isAlertSilent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)DNDMutableClientEventDetails);
  id v6 = [v4 appIdentifier];
  [v5 setBundleIdentifier:v6];

  id v7 = [v4 updateDNDEventDetails:v5];

  v8 = [(ANCAlertSource *)self behaviorResolutionService];
  id v22 = 0;
  v9 = [v8 resolveBehaviorForEventDetails:v7 error:&v22];
  id v10 = v22;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v14 = [v9 interruptionSuppression];
    BOOL v13 = v14 != 0;
    v15 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = [v4 appIdentifier];
      [v9 interruptionSuppression];
      uint64_t v18 = DNDStringFromInterruptionSuppression();
      v19 = (void *)v18;
      v20 = "N";
      *(_DWORD *)buf = 138412802;
      v24 = v17;
      if (v14) {
        v20 = "Y";
      }
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      __int16 v27 = 2080;
      v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "appIdentifier %@ DNDSuppress=%@ isSilent=%s", buf, 0x20u);
    }
  }
  else
  {
    v12 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100075BA8((uint64_t)v10, v12);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)addAlert:(id)a3 isPreExisting:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(ANCAlertSource *)self alerts];
  id v7 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v15 categoryID]);
  v8 = [v6 objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSMutableArray array];
  }
  BOOL v11 = v10;

  [v11 addObject:v15];
  if ([v11 count] == (id)1)
  {
    v12 = [(ANCAlertSource *)self alerts];
    BOOL v13 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v15 categoryID]);
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
  [v15 setSilent:-[ANCAlertSource isAlertSilent:](self, "isAlertSilent:", v15)];
  id v14 = [(ANCAlertSource *)self delegate];
  [v14 alertAdded:v15 isPreExisting:v4];
}

- (void)modifyAlert:(id)a3
{
  id v4 = a3;
  id v5 = [(ANCAlertSource *)self alerts];
  id v6 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v4 categoryID]);
  id v8 = [v5 objectForKeyedSubscript:v6];

  [v8 exchangeObjectAtIndex:[v8 indexOfObject:v4] withObjectAtIndex:[v8 count] - 1];
  [v4 setSilent:-[ANCAlertSource isAlertSilent:](self, "isAlertSilent:", v4)];
  id v7 = [(ANCAlertSource *)self delegate];
  [v7 alertModified:v4];
}

- (void)removeAlert:(id)a3
{
  id v10 = a3;
  id v4 = [(ANCAlertSource *)self alerts];
  id v5 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v10 categoryID]);
  id v6 = [v4 objectForKeyedSubscript:v5];

  [v6 removeObject:v10];
  if (![v6 count])
  {
    id v7 = [(ANCAlertSource *)self alerts];
    id v8 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v10 categoryID]);
    [v7 removeObjectForKey:v8];
  }
  [v10 setSilent:-[ANCAlertSource isAlertSilent:](self, "isAlertSilent:", v10)];
  v9 = [(ANCAlertSource *)self delegate];
  [v9 alertRemoved:v10];
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(ANCAlertSource *)self bbBulletinAlerts];
  id v10 = [v8 bulletinID];
  BOOL v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    if ([v8 contentPreviewSetting] == (id)3)
    {
      v12 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134217984;
        uint64_t v25 = 3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dropping notification setting type (%ld)", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      BOOL v13 = [v8 sectionID];
      unsigned __int8 v14 = [(ANCAlertSource *)self isSpecialSectionID:v13];

      if ((v14 & 1) == 0)
      {
        id v15 = [v8 sectionID];
        uint64_t v16 = [(ANCAlertSource *)self categoryIDForAppIdentifier:v15];

        v17 = [[ANCBulletinAlert alloc] initWithBulletin:v8 observer:v7 categoryID:v16];
        uint64_t v18 = +[NSDate date];
        v19 = [v8 publicationDate];
        [v18 timeIntervalSinceDate:v19];
        BOOL v21 = v20 > 30.0;

        id v22 = [(ANCAlertSource *)self bbBulletinAlerts];
        v23 = [v8 bulletinID];
        [v22 setObject:v17 forKeyedSubscript:v23];

        [(ANCAlertSource *)self addAlert:v17 isPreExisting:v21];
      }
    }
  }
}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v9 = a4;
  id v6 = [(ANCAlertSource *)self bbBulletinAlerts];
  id v7 = [v9 bulletinID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    [v8 setBulletin:v9];
    [(ANCAlertSource *)self modifyAlert:v8];
  }
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v11 = a4;
  id v6 = [(ANCAlertSource *)self bbBulletinAlerts];
  id v7 = [v11 bulletinID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    [(ANCAlertSource *)self removeAlert:v8];
    id v9 = [(ANCAlertSource *)self bbBulletinAlerts];
    id v10 = [v11 bulletinID];
    [v9 removeObjectForKey:v10];
  }
}

- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4
{
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v11 = [(ANCAlertSource *)self bbBulletinAlerts];
        v12 = [v11 objectForKeyedSubscript:v10];

        if (v12)
        {
          [(ANCAlertSource *)self removeAlert:v12];
          BOOL v13 = [(ANCAlertSource *)self bbBulletinAlerts];
          [v13 removeObjectForKey:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (BOOL)isSpecialSectionID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.mobilephone"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.facetime"];
  }

  return v4;
}

- (unsigned)categoryIDForAppIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ANCAlertSource *)self appIdentifierToCategoryCache];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    goto LABEL_16;
  }
  id v7 = [(ANCAlertSource *)self firstPartyAppIdentifierToCategoryMap];
  id v6 = [v7 objectForKeyedSubscript:v4];

  if (v6)
  {
LABEL_15:
    uint64_t v18 = [(ANCAlertSource *)self appIdentifierToCategoryCache];
    [v18 setObject:v6 forKeyedSubscript:v4];

    goto LABEL_16;
  }
  uint64_t v8 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  id v9 = [v8 bundleContainerURL];
  uint64_t v10 = [v9 path];

  id v11 = [v10 stringByAppendingPathComponent:@"Info.plist"];
  v12 = +[NSDictionary dictionaryWithContentsOfFile:v11];
  BOOL v13 = [v12 objectForKeyedSubscript:@"SBMatchingApplicationGenres"];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v13 count]) {
      goto LABEL_13;
    }
    long long v14 = [v13 firstObject];
    id v15 = [(ANCAlertSource *)self genreIDForGenre:v14];
  }
  else
  {
    BOOL v21 = v8;
    long long v14 = [v10 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
    long long v16 = +[NSDictionary dictionaryWithContentsOfFile:v14];
    long long v17 = [v16 objectForKeyedSubscript:@"genreId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = [v17 unsignedIntegerValue];
    }
    else {
      id v15 = 0;
    }

    uint64_t v8 = v21;
  }

  if (v15)
  {
    id v6 = +[NSNumber numberWithUnsignedChar:[(ANCAlertSource *)self categoryIDForGenreID:v15]];
    goto LABEL_14;
  }
LABEL_13:
  id v6 = 0;
LABEL_14:

  if (v6) {
    goto LABEL_15;
  }
LABEL_16:
  unsigned __int8 v19 = [v6 unsignedCharValue];

  return v19;
}

- (void)callStatusChanged
{
  id v3 = [(ANCAlertSource *)self tuCallCenter];
  id v4 = [v3 audioAndVideoCallsWithStatus:4];

  id v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 134217984;
    id v19 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "# incoming calls: %lu", buf, 0xCu);
  }
  id v7 = [(ANCAlertSource *)self tuIncomingCalls];
  v16[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005C8F0;
  v17[3] = &unk_1000B23B8;
  v17[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005C990;
  v16[3] = &unk_1000B23B8;
  [(ANCAlertSource *)self combineCurrentArray:v7 withNewArray:v4 maxCount:-1 objectRemoved:v17 objectAdded:v16];

  uint64_t v8 = [(ANCAlertSource *)self tuCallCenter];
  id v9 = [v8 audioAndVideoCallsWithStatus:1];

  uint64_t v10 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v4 count];
    *(_DWORD *)buf = 134217984;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "# active calls: %lu", buf, 0xCu);
  }
  BOOL v13 = [(ANCAlertSource *)self tuActiveCalls];
  v14[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005CA4C;
  v15[3] = &unk_1000B23B8;
  v15[4] = self;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005CAEC;
  v14[3] = &unk_1000B23B8;
  [(ANCAlertSource *)self combineCurrentArray:v13 withNewArray:v9 maxCount:-1 objectRemoved:v15 objectAdded:v14];
}

- (void)callIdentificationChanged:(id)a3
{
  id v12 = [a3 object];
  id v4 = [(ANCAlertSource *)self tuIncomingCalls];
  unsigned int v5 = [v4 containsObject:v12];

  if (v5)
  {
    id v6 = [(ANCAlertSource *)self tuIncomingCallAlerts];
    id v7 = [v6 objectForKey:v12];

    uint64_t v8 = [(ANCAlertSource *)self tuIncomingCalls];
    id v9 = [(ANCAlertSource *)self tuIncomingCalls];
    id v10 = [v9 indexOfObject:v12];
    id v11 = [(ANCAlertSource *)self tuIncomingCalls];
    [v8 exchangeObjectAtIndex:v10 withObjectAtIndex:[v11 count] - 1];

    [(ANCAlertSource *)self modifyAlert:v7];
  }
}

- (void)callHistoryChangedNotification
{
  id v3 = [(ANCAlertSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CD40;
  block[3] = &unk_1000B1268;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)callHistoryChanged:(BOOL)a3
{
  unsigned int v5 = +[CHRecentCall predicateForCallsWithStatus:kCHCallStatusMissed];
  v15[0] = v5;
  id v6 = +[CHRecentCall predicateForCallsWithStatusRead:0];
  v15[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v15 count:2];
  uint64_t v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  id v9 = [(ANCAlertSource *)self chManager];
  id v10 = [v9 callsWithPredicate:v8 limit:0 offset:0 batchSize:0];

  id v11 = [(ANCAlertSource *)self chUnreadMissedCalls];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005CF28;
  v14[3] = &unk_1000B23E0;
  v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005CFF8;
  v12[3] = &unk_1000B2408;
  v12[4] = self;
  BOOL v13 = a3;
  [(ANCAlertSource *)self combineCurrentArray:v11 withNewArray:v10 maxCount:5 objectRemoved:v14 objectAdded:v12];
}

- (void)voicemailsChangedNotification
{
  id v3 = [(ANCAlertSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D174;
  block[3] = &unk_1000B1268;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)voicemailsChanged:(BOOL)a3
{
  unsigned int v5 = [(ANCAlertSource *)self vvManager];
  id v6 = [v5 voicemailsPassingTest:&stru_1000B2448];

  id v7 = [(ANCAlertSource *)self vvUnreadVoicemails];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005D2F8;
  v10[3] = &unk_1000B2470;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005D398;
  v8[3] = &unk_1000B2498;
  v8[4] = self;
  BOOL v9 = a3;
  [(ANCAlertSource *)self combineCurrentArray:v7 withNewArray:v6 maxCount:5 objectRemoved:v10 objectAdded:v8];
}

- (id)lazyContactStore
{
  id v3 = [(ANCAlertSource *)self contactStore];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)CNContactStore);
    [(ANCAlertSource *)self setContactStore:v4];
  }

  return [(ANCAlertSource *)self contactStore];
}

- (void)combineCurrentArray:(id)a3 withNewArray:(id)a4 maxCount:(unint64_t)a5 objectRemoved:(id)a6 objectAdded:(id)a7
{
  id v23 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  BOOL v13 = (void (**)(id, void *))a7;
  id v14 = [v23 count];
  id v15 = v23;
  if (v14)
  {
    long long v16 = 0;
    do
    {
      long long v17 = [v15 objectAtIndexedSubscript:v16];
      if ([v11 containsObject:v17]
        && (unint64_t)[v11 indexOfObject:v17] < a5)
      {
        ++v16;
      }
      else
      {
        v12[2](v12, v17);
        [v23 removeObjectAtIndex:v16];
      }

      uint64_t v18 = (char *)[v23 count];
      id v15 = v23;
    }
    while (v16 != v18);
  }
  id v19 = [v11 count];
  if ((unint64_t)v19 >= a5) {
    unint64_t v20 = a5;
  }
  else {
    unint64_t v20 = (unint64_t)v19;
  }
  if (v20)
  {
    unint64_t v21 = v20 - 1;
    do
    {
      id v22 = [v11 objectAtIndexedSubscript:v21];
      if (([v23 containsObject:v22] & 1) == 0)
      {
        [v23 addObject:v22];
        v13[2](v13, v22);
      }

      --v21;
    }
    while (v21 != -1);
  }
}

- (unint64_t)genreIDForGenre:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Business"])
  {
    unint64_t v4 = 6000;
  }
  else if ([v3 isEqualToString:@"Weather"])
  {
    unint64_t v4 = 6001;
  }
  else if ([v3 isEqualToString:@"Utilities"])
  {
    unint64_t v4 = 6002;
  }
  else if ([v3 isEqualToString:@"Travel"])
  {
    unint64_t v4 = 6003;
  }
  else if ([v3 isEqualToString:@"Sports"])
  {
    unint64_t v4 = 6004;
  }
  else if ([v3 isEqualToString:@"Social Networking"])
  {
    unint64_t v4 = 6005;
  }
  else if ([v3 isEqualToString:@"Reference"])
  {
    unint64_t v4 = 6006;
  }
  else if ([v3 isEqualToString:@"Productivity"])
  {
    unint64_t v4 = 6007;
  }
  else if ([v3 isEqualToString:@"Photo & Video"])
  {
    unint64_t v4 = 6008;
  }
  else if ([v3 isEqualToString:@"News"])
  {
    unint64_t v4 = 6009;
  }
  else if ([v3 isEqualToString:@"Navigation"])
  {
    unint64_t v4 = 6010;
  }
  else if ([v3 isEqualToString:@"Music"])
  {
    unint64_t v4 = 6011;
  }
  else if ([v3 isEqualToString:@"Lifestyle"])
  {
    unint64_t v4 = 6012;
  }
  else if ([v3 isEqualToString:@"Health & Fitness"])
  {
    unint64_t v4 = 6013;
  }
  else if ([v3 isEqualToString:@"Games"])
  {
    unint64_t v4 = 6014;
  }
  else if ([v3 isEqualToString:@"Finance"])
  {
    unint64_t v4 = 6015;
  }
  else if ([v3 isEqualToString:@"Entertainment"])
  {
    unint64_t v4 = 6016;
  }
  else if ([v3 isEqualToString:@"Education"])
  {
    unint64_t v4 = 6017;
  }
  else if ([v3 isEqualToString:@"Books"])
  {
    unint64_t v4 = 6018;
  }
  else if ([v3 isEqualToString:@"Medical"])
  {
    unint64_t v4 = 6020;
  }
  else if ([v3 isEqualToString:@"Newsstand"])
  {
    unint64_t v4 = 6021;
  }
  else if ([v3 isEqualToString:@"Catalogs"])
  {
    unint64_t v4 = 6022;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)categoryIDForGenreID:(unint64_t)a3
{
  if (a3 - 6000 > 0x15) {
    return 0;
  }
  else {
    return byte_10008A8E8[a3 - 6000];
  }
}

- (ANCAlertSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANCAlertSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSMutableDictionary)alerts
{
  return self->_alerts;
}

- (void)setAlerts:(id)a3
{
}

- (NSDictionary)firstPartyAppIdentifierToCategoryMap
{
  return self->_firstPartyAppIdentifierToCategoryMap;
}

- (void)setFirstPartyAppIdentifierToCategoryMap:(id)a3
{
}

- (NSMutableDictionary)appIdentifierToCategoryCache
{
  return self->_appIdentifierToCategoryCache;
}

- (void)setAppIdentifierToCategoryCache:(id)a3
{
}

- (NSMutableDictionary)bbBulletinAlerts
{
  return self->_bbBulletinAlerts;
}

- (void)setBbBulletinAlerts:(id)a3
{
}

- (BBObserver)bbObserver
{
  return self->_bbObserver;
}

- (void)setBbObserver:(id)a3
{
}

- (DNDEventBehaviorResolutionService)behaviorResolutionService
{
  return self->_behaviorResolutionService;
}

- (void)setBehaviorResolutionService:(id)a3
{
}

- (NSMutableArray)tuIncomingCalls
{
  return self->_tuIncomingCalls;
}

- (void)setTuIncomingCalls:(id)a3
{
}

- (NSMapTable)tuIncomingCallAlerts
{
  return self->_tuIncomingCallAlerts;
}

- (void)setTuIncomingCallAlerts:(id)a3
{
}

- (NSMutableArray)tuActiveCalls
{
  return self->_tuActiveCalls;
}

- (void)setTuActiveCalls:(id)a3
{
}

- (NSMapTable)tuActiveCallAlerts
{
  return self->_tuActiveCallAlerts;
}

- (void)setTuActiveCallAlerts:(id)a3
{
}

- (TUCallCenter)tuCallCenter
{
  return self->_tuCallCenter;
}

- (void)setTuCallCenter:(id)a3
{
}

- (NSMutableArray)chUnreadMissedCalls
{
  return self->_chUnreadMissedCalls;
}

- (void)setChUnreadMissedCalls:(id)a3
{
}

- (NSMutableDictionary)chMissedCallAlerts
{
  return self->_chMissedCallAlerts;
}

- (void)setChMissedCallAlerts:(id)a3
{
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
}

- (NSMutableArray)vvUnreadVoicemails
{
  return self->_vvUnreadVoicemails;
}

- (void)setVvUnreadVoicemails:(id)a3
{
}

- (NSMapTable)vvVoicemailAlerts
{
  return self->_vvVoicemailAlerts;
}

- (void)setVvVoicemailAlerts:(id)a3
{
}

- (VMVoicemailManager)vvManager
{
  return self->_vvManager;
}

- (void)setVvManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vvManager, 0);
  objc_storeStrong((id *)&self->_vvVoicemailAlerts, 0);
  objc_storeStrong((id *)&self->_vvUnreadVoicemails, 0);
  objc_storeStrong((id *)&self->_chManager, 0);
  objc_storeStrong((id *)&self->_chMissedCallAlerts, 0);
  objc_storeStrong((id *)&self->_chUnreadMissedCalls, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
  objc_storeStrong((id *)&self->_tuActiveCallAlerts, 0);
  objc_storeStrong((id *)&self->_tuActiveCalls, 0);
  objc_storeStrong((id *)&self->_tuIncomingCallAlerts, 0);
  objc_storeStrong((id *)&self->_tuIncomingCalls, 0);
  objc_storeStrong((id *)&self->_behaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_bbObserver, 0);
  objc_storeStrong((id *)&self->_bbBulletinAlerts, 0);
  objc_storeStrong((id *)&self->_appIdentifierToCategoryCache, 0);
  objc_storeStrong((id *)&self->_firstPartyAppIdentifierToCategoryMap, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end