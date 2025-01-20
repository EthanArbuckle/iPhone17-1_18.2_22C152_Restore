@interface WiFiUserSettingsStore
- (BOOL)syncingEnabled;
- (CWFKeyValueStore)userSettingsKVS;
- (WiFiUserSettingsStore)init;
- (id)keyDidChangeHandler;
- (void)_kvsDidChangeWithKeys:(id)a3 isExternal:(BOOL)a4;
- (void)_setupKVSHandler;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAutoInstantHotspotMode:(int64_t)a3;
- (void)setKeyDidChangeHandler:(id)a3;
- (void)setSyncingEnabled:(BOOL)a3;
- (void)setUserSettingsKVS:(id)a3;
@end

@implementation WiFiUserSettingsStore

- (WiFiUserSettingsStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiUserSettingsStore;
  v2 = [(WiFiUserSettingsStore *)&v7 init];
  if (!v2)
  {
LABEL_8:

    return 0;
  }
  v3 = (CWFKeyValueStore *)[objc_alloc((Class)CWFKeyValueStore) initWithType:5 identifier:@"com.apple.wifi.user-settings"];
  userSettingsKVS = v2->_userSettingsKVS;
  v2->_userSettingsKVS = v3;

  if (!v2->_userSettingsKVS)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s: Error: User Settings CWFKeyValueStore alloc failed"];
    }
    goto LABEL_8;
  }
  [(WiFiUserSettingsStore *)v2 _setupKVSHandler];
  return v2;
}

- (void)_setupKVSHandler
{
  id from = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001610A4;
  v3[3] = &unk_100242810;
  objc_copyWeak(&v4, &from);
  [(CWFKeyValueStore *)self->_userSettingsKVS setEventHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
}

- (void)_kvsDidChangeWithKeys:(id)a3 isExternal:(BOOL)a4
{
  id v6 = a3;
  if (![(WiFiUserSettingsStore *)self syncingEnabled])
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: KVS change disregarded, syncing not enabled", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v21);
    }
    goto LABEL_25;
  }
  if (!a4)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: local changed to KVS keys='%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v6 message];
    }
LABEL_25:
    id v7 = 0;
    goto LABEL_20;
  }
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v22 = v6;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9) {
    goto LABEL_17;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v24;
  uint64_t v12 = CWFUserSettingsStoreAskToJoinModeKey;
  uint64_t v13 = CWFUserSettingsStoreAutoHotspotModeKey;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v8);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if ([v15 isEqualToString:v12])
      {
        v16 = [(CWFKeyValueStore *)self->_userSettingsKVS objectForKey:v12];
        [v7 setObject:v16 forKey:v12];
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: ask to join value changed to '%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v16 message];
        }
      }
      else
      {
        if (![v15 isEqualToString:v13]) {
          continue;
        }
        v16 = [(CWFKeyValueStore *)self->_userSettingsKVS objectForKey:v13];
        [v7 setObject:v16 forKey:v13];
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: hotspot mode value changed to '%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v16 message];
        }
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v10);
LABEL_17:

  v18 = [(WiFiUserSettingsStore *)self keyDidChangeHandler];

  if (v18)
  {
    v19 = [(WiFiUserSettingsStore *)self keyDidChangeHandler];
    ((void (**)(void, id))v19)[2](v19, v7);
  }
  id v6 = v22;
LABEL_20:
}

- (void)setAutoInstantHotspotMode:(int64_t)a3
{
  if ([(WiFiUserSettingsStore *)self syncingEnabled])
  {
    v5 = [(WiFiUserSettingsStore *)self userSettingsKVS];
    id v6 = +[NSNumber numberWithInteger:a3];
    [v5 setObject:v6 forKey:CWFUserSettingsStoreAutoHotspotModeKey];

    id v8 = [(WiFiUserSettingsStore *)self userSettingsKVS];
    [v8 synchronize];
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:message:3, "%s: auto hotspot mode change disregarded, syncing not enabled (new value: %ld)", "-[WiFiUserSettingsStore setAutoInstantHotspotMode:]", a3];
    }
  }
}

- (void)setAskToJoinMode:(int64_t)a3
{
  if ([(WiFiUserSettingsStore *)self syncingEnabled])
  {
    v5 = [(WiFiUserSettingsStore *)self userSettingsKVS];
    id v6 = +[NSNumber numberWithInteger:a3];
    [v5 setObject:v6 forKey:CWFUserSettingsStoreAskToJoinModeKey];

    id v8 = [(WiFiUserSettingsStore *)self userSettingsKVS];
    [v8 synchronize];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: ask to join mode change disregarded, syncing not enabled (new value: %ld)", "-[WiFiUserSettingsStore setAskToJoinMode:]", a3);
    }
  }
}

- (void)setSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_syncingEnabled = a3;
  if (qword_10027DD68)
  {
    CFStringRef v5 = @"not enabled";
    if (v3) {
      CFStringRef v5 = @"enabled";
    }
    [(id)qword_10027DD68 WFLog:3, "%s: syncing is %@", "-[WiFiUserSettingsStore setSyncingEnabled:]", v5 message];
  }
}

- (BOOL)syncingEnabled
{
  return self->_syncingEnabled;
}

- (id)keyDidChangeHandler
{
  return self->_keyDidChangeHandler;
}

- (void)setKeyDidChangeHandler:(id)a3
{
}

- (CWFKeyValueStore)userSettingsKVS
{
  return self->_userSettingsKVS;
}

- (void)setUserSettingsKVS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettingsKVS, 0);

  objc_storeStrong(&self->_keyDidChangeHandler, 0);
}

@end