@interface CSDIDSSession
- (BOOL)isCellularDataAllowed;
- (BOOL)isCellularDataPreferred;
- (BOOL)isWiFiAllowed;
- (CSDIDSSession)init;
- (CSDIDSSession)initWithSessionProvider:(id)a3;
- (CSDIDSSessionProvider)sessionProvider;
- (NSMutableDictionary)preferences;
- (NSString)UUID;
- (NSString)propertiesDescription;
- (NSUUID)clientUUID;
- (id)description;
- (void)_updateSessionPreferences;
- (void)setCellularDataAllowed:(BOOL)a3;
- (void)setCellularDataPreferred:(BOOL)a3;
- (void)setClientUUID:(id)a3;
- (void)setWiFiAllowed:(BOOL)a3;
@end

@implementation CSDIDSSession

- (CSDIDSSession)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDIDSSession.m", 26, @"%s is not available. Use a designated initializer instead.", "-[CSDIDSSession init]");

  return 0;
}

- (CSDIDSSession)initWithSessionProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDIDSSession;
  v6 = [(CSDIDSSession *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionProvider, a3);
    uint64_t v8 = +[NSMutableDictionary dictionary];
    preferences = v7->_preferences;
    v7->_preferences = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CSDIDSSession *)self propertiesDescription];
  id v5 = +[NSString stringWithFormat:@"<%@ %p %@>", v3, self, v4];

  return v5;
}

- (NSString)propertiesDescription
{
  v2 = [(CSDIDSSession *)self UUID];
  uint64_t v3 = +[NSString stringWithFormat:@"UUID=%@", v2];

  return (NSString *)v3;
}

- (NSString)UUID
{
  v2 = [(CSDIDSSession *)self sessionProvider];
  uint64_t v3 = [v2 UUID];

  return (NSString *)v3;
}

- (void)_updateSessionPreferences
{
  id v4 = [(CSDIDSSession *)self sessionProvider];
  uint64_t v3 = [(CSDIDSSession *)self preferences];
  [v4 setPreferences:v3];
}

- (BOOL)isWiFiAllowed
{
  v2 = [(CSDIDSSession *)self preferences];
  uint64_t v3 = [v2 objectForKeyedSubscript:IDSSessionDisallowWifiInterfaceKey];
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (void)setWiFiAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ wiFiAllowed: %d", (uint8_t *)&v8, 0x12u);
  }

  v6 = +[NSNumber numberWithInt:!v3];
  v7 = [(CSDIDSSession *)self preferences];
  [v7 setObject:v6 forKeyedSubscript:IDSSessionDisallowWifiInterfaceKey];

  [(CSDIDSSession *)self _updateSessionPreferences];
}

- (BOOL)isCellularDataAllowed
{
  v2 = [(CSDIDSSession *)self preferences];
  BOOL v3 = [v2 objectForKeyedSubscript:IDSSessionDisallowCellularInterfaceKey];
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (void)setCellularDataAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ cellularDataAllowed: %d", (uint8_t *)&v8, 0x12u);
  }

  v6 = +[NSNumber numberWithInt:!v3];
  v7 = [(CSDIDSSession *)self preferences];
  [v7 setObject:v6 forKeyedSubscript:IDSSessionDisallowCellularInterfaceKey];

  [(CSDIDSSession *)self _updateSessionPreferences];
}

- (BOOL)isCellularDataPreferred
{
  v2 = [(CSDIDSSession *)self preferences];
  BOOL v3 = [v2 objectForKeyedSubscript:IDSSessionPreferCellularForCallSetupKey];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setCellularDataPreferred:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ cellularDataPreferred: %d", (uint8_t *)&v8, 0x12u);
  }

  v6 = +[NSNumber numberWithBool:v3];
  v7 = [(CSDIDSSession *)self preferences];
  [v7 setObject:v6 forKeyedSubscript:IDSSessionPreferCellularForCallSetupKey];

  [(CSDIDSSession *)self _updateSessionPreferences];
}

- (NSUUID)clientUUID
{
  BOOL v3 = [(CSDIDSSession *)self preferences];
  uint64_t v4 = IDSSessionClientUUIDKey;
  id v5 = [v3 objectForKeyedSubscript:IDSSessionClientUUIDKey];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSUUID);
    v7 = [(CSDIDSSession *)self preferences];
    int v8 = [v7 objectForKeyedSubscript:v4];
    id v9 = [v6 initWithUUIDString:v8];
  }
  else
  {
    id v9 = 0;
  }

  return (NSUUID *)v9;
}

- (void)setClientUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 UUIDString];
    int v9 = 138412546;
    __int16 v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ clientUUID: %@", (uint8_t *)&v9, 0x16u);
  }
  v7 = [v4 UUIDString];
  int v8 = [(CSDIDSSession *)self preferences];
  [v8 setObject:v7 forKeyedSubscript:IDSSessionClientUUIDKey];

  [(CSDIDSSession *)self _updateSessionPreferences];
}

- (CSDIDSSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (NSMutableDictionary)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_storeStrong((id *)&self->_sessionProvider, 0);
}

@end