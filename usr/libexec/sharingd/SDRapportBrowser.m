@interface SDRapportBrowser
+ (BOOL)deviceIsEligibleForAirDrop:(id)a3;
+ (BOOL)personHasAirDropEligibleDevice:(id)a3;
+ (SDRapportBrowser)sharedRapportBrowser;
+ (id)deviceTypeFromModelIdentifier:(id)a3;
+ (id)identifiersForPerson:(id)a3;
+ (unint64_t)defaultSFNodeFlags;
+ (void)updateRangingMeasurementForDevice:(id)a3 inNode:(__SFNode *)a4;
+ (void)updateRangingMeasurementForPerson:(id)a3 inNode:(__SFNode *)a4;
- (BOOL)shouldStopHandoffAdvertising;
- (NSArray)nodes;
- (SDRapportBrowser)init;
- (SDXPCHelperConnection)helperConnection;
- (__SFNode)createSFNodeFromCNContacts:(id)a3 identifier:(id)a4 device:(id)a5;
- (__SFNode)createSFNodeFromMyRPDevice:(id)a3;
- (__SFNode)createSFNodeFromRPPerson:(id)a3;
- (id)assertionIdentifier;
- (unint64_t)ultraWideBandState;
- (void)_start;
- (void)_stop;
- (void)addObservers;
- (void)addOrUpdateNodesForPerson:(id)a3 withChanges:(unsigned int)a4;
- (void)contactsChanged:(id)a3;
- (void)removeNodesForPerson:(id)a3;
- (void)removeObservers;
- (void)resumeHandoffAdvertisingIfAppropriate;
- (void)setHelperConnection:(id)a3;
- (void)start;
- (void)stop;
- (void)stopHandoffAdvertisingIfAppropriate;
- (void)updateUltraWideBandStateTo:(unint64_t)a3;
@end

@implementation SDRapportBrowser

+ (SDRapportBrowser)sharedRapportBrowser
{
  if (qword_10097FDB0 != -1) {
    dispatch_once(&qword_10097FDB0, &stru_1008CC5A0);
  }
  v2 = (void *)qword_10097FDB8;

  return (SDRapportBrowser *)v2;
}

- (SDRapportBrowser)init
{
  v5.receiver = self;
  v5.super_class = (Class)SDRapportBrowser;
  v2 = [(SDRapportBrowser *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SDRapportBrowser *)v2 updateUltraWideBandStateTo:0];
  }
  return v3;
}

- (void)start
{
  v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t startCount = self->_startCount;
    v6[0] = 67109120;
    v6[1] = startCount;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rapport Browser start, current request count %d", (uint8_t *)v6, 8u);
  }

  int64_t v5 = self->_startCount;
  if (!v5)
  {
    [(SDRapportBrowser *)self _start];
    int64_t v5 = self->_startCount;
  }
  self->_int64_t startCount = v5 + 1;
}

- (void)stop
{
  int64_t startCount = self->_startCount;
  if (startCount <= 1) {
    int64_t startCount = 1;
  }
  self->_int64_t startCount = startCount - 1;
  v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = self->_startCount;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rapport Browser stop, current request count %d", (uint8_t *)v6, 8u);
  }

  if (!self->_startCount) {
    [(SDRapportBrowser *)self _stop];
  }
}

- (void)_start
{
  v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rapport Browser start", buf, 2u);
  }

  [(SDRapportBrowser *)self stopHandoffAdvertisingIfAppropriate];
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  cachedNodes = self->_cachedNodes;
  self->_cachedNodes = v4;

  v6 = (RPPeopleDiscovery *)objc_alloc_init((Class)RPPeopleDiscovery);
  peopleDiscovery = self->_peopleDiscovery;
  self->_peopleDiscovery = v6;

  [(RPPeopleDiscovery *)self->_peopleDiscovery setChangeFlags:0xFFFFFFFFLL];
  [(RPPeopleDiscovery *)self->_peopleDiscovery setDiscoveryFlags:16];
  [(RPPeopleDiscovery *)self->_peopleDiscovery setDiscoveryFlags:[(RPPeopleDiscovery *)self->_peopleDiscovery discoveryFlags] | 4];
  [(RPPeopleDiscovery *)self->_peopleDiscovery setDiscoveryFlags:[(RPPeopleDiscovery *)self->_peopleDiscovery discoveryFlags] | 8];
  [(RPPeopleDiscovery *)self->_peopleDiscovery setDiscoveryFlags:[(RPPeopleDiscovery *)self->_peopleDiscovery discoveryFlags] | 0x80];
  v8 = +[SDStatusMonitor sharedMonitor];
  unsigned int v9 = [v8 enableStrangers];

  if (v9)
  {
    v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling Stranger Discovery", buf, 2u);
    }

    [(RPPeopleDiscovery *)self->_peopleDiscovery setDiscoveryFlags:[(RPPeopleDiscovery *)self->_peopleDiscovery discoveryFlags] | 0x400];
  }
  [(RPPeopleDiscovery *)self->_peopleDiscovery setDiscoveryMode:1];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000BA160;
  v19[3] = &unk_1008CC5C8;
  objc_copyWeak(&v20, (id *)buf);
  [(RPPeopleDiscovery *)self->_peopleDiscovery setPersonFoundHandler:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BA268;
  v17[3] = &unk_1008CC5F0;
  objc_copyWeak(&v18, (id *)buf);
  [(RPPeopleDiscovery *)self->_peopleDiscovery setPersonChangedHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000BA320;
  v15[3] = &unk_1008CC5C8;
  objc_copyWeak(&v16, (id *)buf);
  [(RPPeopleDiscovery *)self->_peopleDiscovery setPersonLostHandler:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BA424;
  v13[3] = &unk_1008CA3B0;
  objc_copyWeak(&v14, (id *)buf);
  [(RPPeopleDiscovery *)self->_peopleDiscovery setStatusChangedHandler:v13];
  [(RPPeopleDiscovery *)self->_peopleDiscovery setInterruptionHandler:&stru_1008CC610];
  [(RPPeopleDiscovery *)self->_peopleDiscovery setInvalidationHandler:&stru_1008CC630];
  v11 = self->_peopleDiscovery;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BA550;
  v12[3] = &unk_1008CA5A8;
  v12[4] = self;
  [(RPPeopleDiscovery *)v11 activateWithCompletion:v12];
  [(SDRapportBrowser *)self addObservers];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)_stop
{
  v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rapport Browser stop", v5, 2u);
  }

  [(SDRapportBrowser *)self updateUltraWideBandStateTo:0];
  [(SDRapportBrowser *)self removeObservers];
  [(RPPeopleDiscovery *)self->_peopleDiscovery invalidate];
  peopleDiscovery = self->_peopleDiscovery;
  self->_peopleDiscovery = 0;

  [(SDRapportBrowser *)self resumeHandoffAdvertisingIfAppropriate];
}

- (void)updateUltraWideBandStateTo:(unint64_t)a3
{
  if (self->_ultraWideBandState != a3)
  {
    self->_ultraWideBandState = a3;
    v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 2) {
        int64_t v5 = "?";
      }
      else {
        int64_t v5 = off_1008CC678[a3];
      }
      int v7 = 136315138;
      v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UWB state changed to %s", (uint8_t *)&v7, 0xCu);
    }

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"com.apple.sharingd.RapportStatusChanged" object:0 userInfo:0];
  }
}

- (void)contactsChanged:(id)a3
{
  [(NSMutableDictionary *)self->_cachedNodes removeAllObjects];
  v4 = [(RPPeopleDiscovery *)self->_peopleDiscovery discoveredPeople];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SDRapportBrowser *)self addOrUpdateNodesForPerson:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) withChanges:0];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  unsigned int v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"com.apple.sharingd.RapportChanged" object:0 userInfo:0];
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"contactsChanged:" name:@"com.apple.sharingd.ContactsChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (NSArray)nodes
{
  return (NSArray *)[(NSMutableDictionary *)self->_cachedNodes allValues];
}

- (void)addOrUpdateNodesForPerson:(id)a3 withChanges:(unsigned int)a4
{
  id v6 = a3;
  if ([v6 flags])
  {
    uint64_t v7 = [v6 devices];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BACC0;
    v14[3] = &unk_1008CC658;
    v14[4] = self;
    unsigned int v15 = a4;
    [v7 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    uint64_t v7 = [v6 identifier];
    v8 = [(NSMutableDictionary *)self->_cachedNodes objectForKeyedSubscript:v7];

    if ([(id)objc_opt_class() personHasAirDropEligibleDevice:v6])
    {
      if (v8)
      {
        if ((a4 & 8) != 0) {
          [(id)objc_opt_class() updateRangingMeasurementForPerson:v6 inNode:v8];
        }
      }
      else if (v7 || ([v6 flags] & 0x100) != 0)
      {
        long long v11 = [(SDRapportBrowser *)self createSFNodeFromRPPerson:v6];
        long long v12 = airdrop_log();
        long long v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v17 = v11;
            __int16 v18 = 2112;
            id v19 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Adding SFNode %@ for %@", buf, 0x16u);
          }

          [(NSMutableDictionary *)self->_cachedNodes setObject:v11 forKeyedSubscript:v7];
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000BC388();
          }
        }
      }
      else
      {
        long long v10 = airdrop_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_1000BC314();
        }
      }
    }
    else if (v8)
    {
      unsigned int v9 = airdrop_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Removing SFNode %@ for RPPerson %@", buf, 0x16u);
      }

      [(NSMutableDictionary *)self->_cachedNodes setObject:0 forKeyedSubscript:v7];
    }
  }
}

- (void)removeNodesForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() identifiersForPerson:v4];

  [(NSMutableDictionary *)self->_cachedNodes removeObjectsForKeys:v5];
}

- (id)assertionIdentifier
{
  return (id)NSPrintF();
}

- (BOOL)shouldStopHandoffAdvertising
{
  return GestaltGetBoolean() != 0;
}

- (void)stopHandoffAdvertisingIfAppropriate
{
  if ([(SDRapportBrowser *)self shouldStopHandoffAdvertising])
  {
    id v4 = +[SDActivityAdvertiser sharedAdvertiser];
    id v3 = [(SDRapportBrowser *)self assertionIdentifier];
    [v4 stopForReason:v3];
  }
}

- (void)resumeHandoffAdvertisingIfAppropriate
{
  if ([(SDRapportBrowser *)self shouldStopHandoffAdvertising])
  {
    id v4 = +[SDActivityAdvertiser sharedAdvertiser];
    id v3 = [(SDRapportBrowser *)self assertionIdentifier];
    [v4 resumeForReason:v3];
  }
}

+ (void)updateRangingMeasurementForPerson:(id)a3 inNode:(__SFNode *)a4
{
  id v5 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [v5 devices];
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    v32 = a4;
    id v33 = v5;
    int v9 = 0;
    long long v10 = 0;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unsigned int v14 = [(id)objc_opt_class() deviceIsEligibleForAirDrop:v13];
        unsigned int v15 = magic_head_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            v17 = [v13 relativeLocation];
            *(_DWORD *)buf = 138412546;
            id v40 = v13;
            __int16 v41 = 2112;
            v42 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Device %@ with location %@ eligible for AirDrop", buf, 0x16u);
          }
          __int16 v18 = [v13 relativeLocation];
          unsigned int v15 = v18;
          if (v18)
          {
            [v18 ptsScore];
            double v20 = v19;
            [v10 ptsScore];
            if (v20 > v21 || v10 == 0)
            {
              unsigned int v15 = v15;

              long long v10 = v15;
            }
          }
        }
        else if (v16)
        {
          v23 = [v13 relativeLocation];
          [v23 ptsScore];
          *(_DWORD *)buf = 138412546;
          id v40 = v13;
          __int16 v41 = 2048;
          v42 = v24;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Device %@ with score %f not eligible for AirDrop", buf, 0x16u);
        }
        v9 |= ([v13 flags] & 0x100) >> 8;
      }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v8);

    if (v10)
    {
      id v34 = 0;
      v25 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v34];
      v26 = v34;
      [v10 timestampTicks];
      v27 = SFUpTicksDiffFromNowToString();
      v28 = magic_head_log();
      id v5 = v33;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v40 = v33;
        __int16 v41 = 2112;
        v42 = v10;
        __int16 v43 = 2112;
        v44 = v27;
        __int16 v45 = 2112;
        v46 = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Setting ranging measurement for person %@ to %@ - %@ (%@)", buf, 0x2Au);
      }

      goto LABEL_29;
    }
    id v5 = v33;
  }
  else
  {

    LOBYTE(v9) = 0;
  }
  v26 = magic_head_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No highest ranging measurement found for %@", buf, 0xCu);
  }
  long long v10 = 0;
  v25 = 0;
LABEL_29:

  SFNodeSetRangingData();
  v29 = (void *)SFNodeCopyFlags();
  unint64_t v30 = (unint64_t)[v29 longValue];
  if (v9) {
    uint64_t v31 = v30 | 0x400;
  }
  else {
    uint64_t v31 = v30 & 0x400;
  }
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v31, v32);
  SFNodeSetFlags();
}

+ (void)updateRangingMeasurementForDevice:(id)a3 inNode:(__SFNode *)a4
{
  id v4 = a3;
  id v5 = [v4 relativeLocation];
  if (v5)
  {
    id v14 = 0;
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
    id v7 = v14;
    [v5 timestampTicks];
    id v8 = SFUpTicksDiffFromNowToString();
    int v9 = magic_head_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v16 = v4;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      __int16 v19 = 2112;
      double v20 = v8;
      __int16 v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting ranging measurement for device %@ to %@ - %@ (%@)", buf, 0x2Au);
    }
  }
  else
  {
    id v7 = magic_head_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No highest ranging measurement found for %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  SFNodeSetRangingData();
  unsigned __int16 v10 = (unsigned __int16)[v4 flags];
  uint64_t v11 = (void *)SFNodeCopyFlags();
  unint64_t v12 = (unint64_t)[v11 longValue];
  if ((v10 & 0x100) != 0) {
    uint64_t v13 = v12 | 0x400;
  }
  else {
    uint64_t v13 = v12 & 0x400;
  }
  +[NSNumber numberWithUnsignedInteger:v13];
  SFNodeSetFlags();
}

+ (unint64_t)defaultSFNodeFlags
{
  return 999;
}

- (__SFNode)createSFNodeFromCNContacts:(id)a3 identifier:(id)a4 device:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (__SFNode *)SFNodeCreate();
  if ([v6 count])
  {
    int v9 = +[SDStatusMonitor sharedMonitor];
    unsigned __int16 v10 = [v9 contactWithPreferredIdentifierForContacts:v6];
    id v11 = objc_alloc_init((Class)CNContactFormatter);
    id v12 = [v10 mutableCopy];
    [v12 setMiddleName:&stru_1008E7020];
    id v33 = v11;
    uint64_t v13 = [v11 stringFromContact:v12];
    id v14 = [v10 identifier];
    SFNodeSetContactIdentifier();

    sub_1001AC630(v6);
    SFNodeSetContactIdentifiers();
    SFNodeSetDisplayName();
    unsigned int v15 = [v10 givenName];
    SFNodeSetFirstName();

    id v16 = [v10 familyName];
    SFNodeSetLastName();

    __int16 v17 = [v10 nickname];
    SFNodeSetNickName();

    __int16 v18 = [v9 meCard];
    LODWORD(v14) = [v18 isEqual:v10];

    if (v14)
    {
      SFNodeAddKind();
      __int16 v19 = [v9 myAppleID];
      SFNodeSetAppleID();

      if ([v7 idsDeviceIdentifierConflict])
      {
        double v20 = airdrop_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v7;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: IDS device info for %@ may be inaccurate. Don't use it for AirDrop", buf, 0xCu);
        }
      }
      else
      {
        v22 = [v7 name];
        SFNodeSetComputerName();

        double v20 = [v7 idsDeviceIdentifier];
        SFNodeSetIDSDeviceIdentifier();
      }

      v23 = objc_opt_class();
      v24 = [v7 model];
      v25 = [v23 deviceTypeFromModelIdentifier:v24];

      SFNodeSetSecondaryName();
      v26 = [v7 model];
      v27 = SFDeviceImageFromDeviceModel();

      id v28 = v27;
      if ([v28 CGImage])
      {
        id v29 = v28;
        [v29 CGImage];
        unint64_t v30 = SFDataFromCGImage();

        if (v30)
        {
LABEL_14:
          SFNodeSetIconData();

          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    buf[0] = 0;
    uint64_t v31 = [(SDRapportBrowser *)self helperConnection];
    unint64_t v30 = sub_1000509EC(v10, 1, (uint64_t)buf, v31);

    if (!buf[0]) {
      SFNodeAddKind();
    }
    goto LABEL_14;
  }
  SFNodeAddKind();
  __int16 v21 = [v7 bleAuthTag];
  [v21 base64EncodedStringWithOptions:0];
  SFNodeSetUserName();

LABEL_15:
  SFNodeAddKind();
  SFNodeAddKind();
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [(id)objc_opt_class() defaultSFNodeFlags]);
  SFNodeSetFlags();

  return v8;
}

- (__SFNode)createSFNodeFromRPPerson:(id)a3
{
  id v4 = a3;
  id v5 = +[SDStatusMonitor sharedMonitor];
  id v6 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v16[0] = v6;
  v16[1] = CNContactThumbnailImageDataKey;
  v16[2] = CNContactPhoneNumbersKey;
  v16[3] = CNContactEmailAddressesKey;
  id v7 = +[NSArray arrayWithObjects:v16 count:4];

  id v8 = [v4 identifier];
  int v9 = [v5 contactsWithPhoneNumberOrEmail:v8 keys:v7];

  if ([v9 count] || (objc_msgSend(v4, "flags") & 0x100) != 0)
  {
    id v12 = [v4 identifier];
    uint64_t v13 = [v4 devices];
    id v14 = [v13 firstObject];
    id v11 = [(SDRapportBrowser *)self createSFNodeFromCNContacts:v9 identifier:v12 device:v14];

    +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 flags]);
    SFNodeSetRapportFlags();
    [(id)objc_opt_class() updateRangingMeasurementForPerson:v4 inNode:v11];
  }
  else
  {
    unsigned __int16 v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000BC458();
    }

    id v11 = 0;
  }

  return v11;
}

- (__SFNode)createSFNodeFromMyRPDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[SDStatusMonitor sharedMonitor];
  id v6 = [v5 meCard];

  if (v6)
  {
    id v7 = +[NSSet setWithObject:v6];
    id v8 = [v4 identifier];
    int v9 = [(SDRapportBrowser *)self createSFNodeFromCNContacts:v7 identifier:v8 device:v4];

    SFNodeSetRapportFlags();
    [(id)objc_opt_class() updateRangingMeasurementForDevice:v4 inNode:v9];
  }
  else
  {
    unsigned __int16 v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000BC4C0(v10);
    }

    int v9 = 0;
  }

  return v9;
}

+ (id)identifiersForPerson:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if ([v3 flags])
  {
    id v5 = [v3 devices];

    id v6 = [v5 valueForKey:@"identifier"];
    [v4 addObjectsFromArray:v6];
  }
  else
  {
    id v5 = [v3 identifier];

    [v4 addObject:v5];
  }

  return v4;
}

+ (BOOL)personHasAirDropEligibleDevice:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [a3 devices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([a1 deviceIsEligibleForAirDrop:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)deviceIsEligibleForAirDrop:(id)a3
{
  id v3 = a3;
  id v4 = [v3 model];
  id v5 = v4;
  if (v4
    && (([v4 hasPrefix:@"AppleTV"] & 1) != 0
     || ([v5 hasPrefix:@"Watch"] & 1) != 0
     || ([v5 hasPrefix:@"Audio"] & 1) != 0))
  {

    LOBYTE(v5) = 0;
  }
  else
  {

    LODWORD(v5) = ([v3 flags] >> 11) & 1;
  }

  return (char)v5;
}

+ (id)deviceTypeFromModelIdentifier:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = @"iPhone";
  if (([v3 hasPrefix:@"iPhone"] & 1) == 0)
  {
    CFStringRef v4 = @"iPad";
    if (([v3 hasPrefix:@"iPad"] & 1) == 0)
    {
      if ([v3 hasPrefix:@"iPod"])
      {
        CFStringRef v4 = @"iPod touch";
      }
      else if ([v3 hasPrefix:@"MacBookPro"])
      {
        CFStringRef v4 = @"MacBook Pro";
      }
      else if ([v3 hasPrefix:@"MacBookAir"])
      {
        CFStringRef v4 = @"MacBook Air";
      }
      else if ([v3 hasPrefix:@"MacPro"])
      {
        CFStringRef v4 = @"Mac Pro";
      }
      else
      {
        CFStringRef v4 = @"iMac";
        if (![v3 hasPrefix:@"iMac"]) {
          CFStringRef v4 = &stru_1008E7020;
        }
      }
    }
  }

  return (id)v4;
}

- (SDXPCHelperConnection)helperConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helperConnection);

  return (SDXPCHelperConnection *)WeakRetained;
}

- (void)setHelperConnection:(id)a3
{
}

- (unint64_t)ultraWideBandState
{
  return self->_ultraWideBandState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_peopleDiscovery, 0);

  objc_storeStrong((id *)&self->_cachedNodes, 0);
}

@end