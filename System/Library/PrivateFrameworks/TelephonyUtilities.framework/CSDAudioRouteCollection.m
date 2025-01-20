@interface CSDAudioRouteCollection
- (BOOL)_anyRoutePassesTest:(id)a3;
- (BOOL)_setRoutesFromRouteDictionaries:(id)a3;
- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch;
- (BOOL)hasInEarRouteInTipiWithCompanionWatch;
- (BOOL)isAirTunesRouteAvailable;
- (BOOL)isAnyPreferredRouteAvailableAndActive;
- (BOOL)isAnyRouteAvailableWithBluetoothEndpointType:(int64_t)a3;
- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3;
- (BOOL)isBluetoothRouteAvailable;
- (BOOL)isCarAudioRouteAvailable;
- (BOOL)isInEarAudioRouteAvailable;
- (BOOL)isReceiverRouteAvailable;
- (BOOL)isSpeakerRouteAvailable;
- (BOOL)isWirelessHeadsetRouteAvailable;
- (BOOL)updatePickableRoutes;
- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4;
- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4 routeManager:(id)a5;
- (CSDRouteManager)routeManager;
- (NSArray)routes;
- (NSString)category;
- (NSString)mode;
- (TURoute)preferredAndActiveRoute;
- (TURoute)preferredRoute;
- (id)_routePassingTest:(id)a3;
- (id)description;
- (id)systemController;
- (void)enumerateRoutesInvokingBlock:(id)a3 forRoutesPassingTest:(id)a4;
- (void)setCategory:(id)a3;
- (void)setMode:(id)a3;
- (void)setRoutes:(id)a3;
@end

@implementation CSDAudioRouteCollection

- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4 routeManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSDAudioRouteCollection;
  v11 = [(CSDAudioRouteCollection *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CSDAudioRouteCollection *)v11 setCategory:v8];
    [(CSDAudioRouteCollection *)v12 setMode:v9];
    objc_storeWeak((id *)&v12->_routeManager, v10);
  }

  return v12;
}

- (CSDAudioRouteCollection)initWithCategory:(id)a3 mode:(id)a4
{
  return [(CSDAudioRouteCollection *)self initWithCategory:a3 mode:a4 routeManager:0];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CSDAudioRouteCollection *)self category];
  v5 = [(CSDAudioRouteCollection *)self mode];
  v6 = +[NSString stringWithFormat:@"<%@ %p category=%@ mode=%@>", v3, self, v4, v5];

  return v6;
}

- (TURoute)preferredRoute
{
  uint64_t v3 = +[TURoute predicateForPreferredRoute];
  v4 = [(CSDAudioRouteCollection *)self _routePassingTest:v3];

  return (TURoute *)v4;
}

- (TURoute)preferredAndActiveRoute
{
  return (TURoute *)[(CSDAudioRouteCollection *)self _routePassingTest:&stru_1005082A0];
}

- (BOOL)isReceiverRouteAvailable
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_1005082C0];
}

- (BOOL)isSpeakerRouteAvailable
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_1005082E0];
}

- (BOOL)isWirelessHeadsetRouteAvailable
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_100508300];
}

- (BOOL)isAirTunesRouteAvailable
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_100508320];
}

- (BOOL)isCarAudioRouteAvailable
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_100508340];
}

- (BOOL)isBluetoothRouteAvailable
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_100508360];
}

- (BOOL)isAnyRouteAvailableWithBluetoothEndpointType:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013B6D0;
  v4[3] = &unk_100508380;
  v4[4] = a3;
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:v4];
}

- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013B7A0;
  v6[3] = &unk_1005083A8;
  id v7 = a3;
  id v4 = v7;
  LOBYTE(self) = [(CSDAudioRouteCollection *)self _anyRoutePassesTest:v6];

  return (char)self;
}

- (BOOL)isAnyPreferredRouteAvailableAndActive
{
  return [(CSDAudioRouteCollection *)self _anyRoutePassesTest:&stru_1005082A0];
}

- (BOOL)isInEarAudioRouteAvailable
{
  uint64_t v3 = +[TURoute predicateForInEarAudioRoute];
  id v4 = [(CSDAudioRouteCollection *)self _routePassingTest:v3];
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

- (BOOL)hasInEarRouteInTipiWithCompanionWatch
{
  uint64_t v3 = +[TURoute predicateForInEarRouteInTipiWithCompanionWatch];
  id v4 = [(CSDAudioRouteCollection *)self _routePassingTest:v3];
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch
{
  uint64_t v3 = +[TURoute predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch];
  id v4 = [(CSDAudioRouteCollection *)self _routePassingTest:v3];
  LOBYTE(self) = v4 != 0;

  return (char)self;
}

- (void)enumerateRoutesInvokingBlock:(id)a3 forRoutesPassingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(CSDAudioRouteCollection *)self routes];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10013B9D0;
    v10[3] = &unk_1005083D0;
    id v11 = v8;
    id v12 = v6;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

- (id)_routePassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10013BB60;
  id v12 = sub_10013BB70;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013BB78;
  v7[3] = &unk_1005083F8;
  v7[4] = &v8;
  [(CSDAudioRouteCollection *)self enumerateRoutesInvokingBlock:v7 forRoutesPassingTest:v4];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)_anyRoutePassesTest:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10013BC84;
  v6[3] = &unk_1005083F8;
  void v6[4] = &v7;
  [(CSDAudioRouteCollection *)self enumerateRoutesInvokingBlock:v6 forRoutesPassingTest:v4];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (BOOL)updatePickableRoutes
{
  uint64_t v3 = [(CSDAudioRouteCollection *)self mode];

  id v4 = [(CSDAudioRouteCollection *)self systemController];
  id v5 = [(CSDAudioRouteCollection *)self category];
  if (v3)
  {
    id v6 = [(CSDAudioRouteCollection *)self mode];
    uint64_t v7 = [v4 pickableRoutesForCategory:v5 andMode:v6];
  }
  else
  {
    uint64_t v7 = [v4 pickableRoutesForCategory:v5];
  }

  BOOL v8 = [(CSDAudioRouteCollection *)self _setRoutesFromRouteDictionaries:v7];
  return v8;
}

- (BOOL)_setRoutesFromRouteDictionaries:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  v23 = self;
  id v6 = [(CSDAudioRouteCollection *)self routeManager];
  uint64_t v7 = [v6 aaDeviceManager];
  BOOL v8 = [v7 discoveredDevices];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(const char **)(*((void *)&v27 + 1) + 8 * i);
        id v14 = [objc_alloc((Class)TUAudioRoute) initWithDictionary:v13];
        v15 = v14;
        if (v14)
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_10013C098;
          v25[3] = &unk_100508420;
          id v16 = v14;
          id v26 = v16;
          v17 = objc_msgSend(v8, "tu_firstObjectPassingTest:", v25);
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v16, "setInTipiWithCompanion:", (-[NSObject smartRoutingStateFlags](v17, "smartRoutingStateFlags") >> 1) & 1);
            objc_msgSend(v16, "setSmartRoutedTo:", (-[NSObject smartRoutingStateFlags](v18, "smartRoutingStateFlags") >> 2) & 1);
          }

          [v5 addObject:v16];
        }
        else
        {
          v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to create audio route from route dictionary: %@", buf, 0xCu);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }

  v19 = [(CSDAudioRouteCollection *)v23 routes];
  unsigned __int8 v20 = [v5 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSDAudioRouteCollection _setRoutesFromRouteDictionaries:]";
      __int16 v33 = 2112;
      v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    [(CSDAudioRouteCollection *)v23 setRoutes:v5];
  }

  return v20 ^ 1;
}

- (id)systemController
{
  return +[AVSystemController sharedAVSystemController];
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (CSDRouteManager)routeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeManager);

  return (CSDRouteManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routeManager);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end