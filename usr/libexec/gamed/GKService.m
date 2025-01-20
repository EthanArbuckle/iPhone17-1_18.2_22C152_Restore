@interface GKService
+ (Class)interfaceClass;
+ (id)serviceForBundleID:(id)a3 localPlayer:(id)a4;
+ (id)serviceFromService:(id)a3;
+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 credential:(id)a5;
+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthentication;
- (GKClientProxy)clientProxy;
- (GKDataTransport)transport;
- (GKPlayerCredential)credential;
- (GKPlayerInternal)localPlayer;
- (GKService)initWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6;
- (GKService)initWithoutCredentialWithTransport:(id)a3 forClient:(id)a4;
- (id)transactionGroupBypassingMultiUser;
- (id)transactionGroupWithName:(id)a3;
- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4;
- (id)transportBypassingMultiUser;
- (void)_coreInitWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6;
- (void)setClientProxy:(id)a3;
- (void)setCredential:(id)a3;
- (void)setLocalPlayer:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation GKService

- (id)transactionGroupBypassingMultiUser
{
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKService.m", 138, "-[GKService transactionGroupBypassingMultiUser]");
  v4 = [(GKService *)self transactionGroupWithName:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_localPlayer, 0);
  objc_storeStrong((id *)&self->_transport, 0);

  objc_storeStrong((id *)&self->_clientProxy, 0);
}

+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithTransport:v9 forClient:v8 localPlayer:v7 credential:0];

  return v10;
}

+ (id)serviceFromService:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [v3 transport];
  v6 = [v3 clientProxy];
  id v7 = [v3 localPlayer];
  id v8 = [v3 credential];

  id v9 = [v4 initWithTransport:v5 forClient:v6 localPlayer:v7 credential:v8];

  return v9;
}

- (id)transactionGroupWithName:(id)a3
{
  id v4 = a3;
  v5 = [(GKService *)self localPlayer];
  v6 = [v5 playerID];
  id v7 = [(GKService *)self transactionGroupWithName:v4 forPlayerID:v6];

  return v7;
}

- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKService *)self clientProxy];
  id v9 = [v8 transactionGroupWithName:v7 forPlayerID:v6];

  return v9;
}

- (GKPlayerInternal)localPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 24, 1);
}

- (GKClientProxy)clientProxy
{
  return (GKClientProxy *)objc_getProperty(self, a2, 8, 1);
}

+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 credential:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [v7 playerInternal];
  id v12 = [v10 initWithTransport:v9 forClient:v8 localPlayer:v11 credential:v7];

  return v12;
}

- (BOOL)requiresAuthentication
{
  return 1;
}

- (GKService)initWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)GKService;
  v14 = [(GKService *)&v22 init];
  if (v14)
  {
    if (!v13)
    {
      v15 = [v12 accountName];

      if (v15)
      {
        v16 = +[GKPlayerCredentialController sharedController];
        v17 = [v12 accountName];
        [v16 credentialForUsername:v17 environment:[v11 environment]];
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12) {
          goto LABEL_9;
        }
        goto LABEL_10;
      }
      v18 = [v10 credential];

      if (!v18)
      {
        v20 = +[GKPlayerCredentialController sharedController];
        [v20 primaryCredentialForEnvironment:[v11 environment]];
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v21 = [v13 playerInternal];

        id v12 = (id)v21;
        if (v21) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      id v13 = [v10 credential];
    }
    if (!v12)
    {
LABEL_9:
      id v12 = [v13 playerInternal];
    }
LABEL_10:
    [(GKService *)v14 _coreInitWithTransport:v10 forClient:v11 localPlayer:v12 credential:v13];
  }

  return v14;
}

- (void)_coreInitWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6
{
  id v10 = (GKDataTransport *)a3;
  id v20 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_storeStrong((id *)&self->_clientProxy, a4);
  objc_storeStrong((id *)&self->_localPlayer, a5);
  p_credential = &self->_credential;
  objc_storeStrong((id *)&self->_credential, a6);
  if (!v10)
  {
    id v10 = [v20 transportWithCredential:v12];
  }
  v14 = *p_credential;
  if (*p_credential)
  {
    v15 = [(GKDataTransport *)v10 credential];

    if (v14 != v15)
    {
      v16 = [(GKDataTransport *)v10 storeBag];
      v17 = [(GKDataTransport *)v10 clientProxy];
      uint64_t v18 = +[GKDataTransport transportWithBag:v16 clientProxy:v17 credential:*p_credential];

      id v10 = (GKDataTransport *)v18;
    }
  }
  transport = self->_transport;
  self->_transport = v10;
}

- (GKDataTransport)transport
{
  return (GKDataTransport *)objc_getProperty(self, a2, 16, 1);
}

- (GKPlayerCredential)credential
{
  return (GKPlayerCredential *)objc_getProperty(self, a2, 32, 1);
}

- (GKService)initWithoutCredentialWithTransport:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKService;
  id v8 = [(GKService *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(GKService *)v8 _coreInitWithTransport:v6 forClient:v7 localPlayer:0 credential:0];
  }

  return v9;
}

+ (id)serviceForBundleID:(id)a3 localPlayer:(id)a4
{
  id v6 = a4;
  id v7 = +[GKClientProxy clientForBundleID:a3];
  id v8 = [a1 serviceWithTransport:0 forClient:v7 localPlayer:v6];

  return v8;
}

+ (unint64_t)requiredEntitlements
{
  v2 = +[NSString stringWithFormat:@"Subclasses must override +requiredEntitlements."];
  id v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m"];
  id v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v2, "+[GKService requiredEntitlements]", [v4 UTF8String], 111);

  +[NSException raise:@"GameKit Exception", @"%@", v5 format];
  return 0;
}

+ (Class)interfaceClass
{
  v2 = +[NSString stringWithFormat:@"Subclasses must override +interfaceClass."];
  id v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m"];
  id v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v2, "+[GKService interfaceClass]", [v4 UTF8String], 117);

  +[NSException raise:@"GameKit Exception", @"%@", v5 format];
  return 0;
}

- (id)transportBypassingMultiUser
{
  v2 = self->_transport;

  return v2;
}

- (void)setClientProxy:(id)a3
{
}

- (void)setTransport:(id)a3
{
}

- (void)setLocalPlayer:(id)a3
{
}

- (void)setCredential:(id)a3
{
}

@end