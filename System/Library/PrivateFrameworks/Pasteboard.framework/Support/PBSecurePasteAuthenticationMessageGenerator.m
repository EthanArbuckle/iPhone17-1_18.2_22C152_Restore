@interface PBSecurePasteAuthenticationMessageGenerator
+ (id)sharedInstance;
- (BOOL)_isRequester:(id)a3 allowedToRequestAuthenticationMessageWithContext:(unint64_t)a4;
- (BOOL)validateAuthenticationMessage:(id)a3;
- (PBSecurePasteAuthenticationMessageGenerator)init;
- (id)generateAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 requesterAuditTokenInfo:(id)a5 error:(id *)a6;
@end

@implementation PBSecurePasteAuthenticationMessageGenerator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010698;
  block[3] = &unk_100030CE0;
  block[4] = a1;
  if (qword_100039590 != -1) {
    dispatch_once(&qword_100039590, block);
  }
  v2 = (void *)qword_100039588;
  return v2;
}

- (PBSecurePasteAuthenticationMessageGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)PBSecurePasteAuthenticationMessageGenerator;
  v2 = [(PBSecurePasteAuthenticationMessageGenerator *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Pasteboard.PBServerConnection-authentication-message-queue", 0);
    authenticationMessageQueue = v2->_authenticationMessageQueue;
    v2->_authenticationMessageQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    originator = v2->_originator;
    v2->_originator = (BKSHIDEventAuthenticationOriginator *)v5;
  }
  return v2;
}

- (id)generateAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 requesterAuditTokenInfo:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1000108EC;
  v32 = sub_1000108FC;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000108EC;
  v26 = sub_1000108FC;
  id v27 = 0;
  authenticationMessageQueue = self->_authenticationMessageQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010904;
  v15[3] = &unk_100031638;
  id v12 = v10;
  id v16 = v12;
  v17 = self;
  v18 = &v22;
  v19 = &v28;
  unint64_t v20 = a3;
  int64_t v21 = a4;
  dispatch_sync(authenticationMessageQueue, v15);
  if (a6) {
    *a6 = (id) v23[5];
  }
  id v13 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (BOOL)validateAuthenticationMessage:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  authenticationMessageQueue = self->_authenticationMessageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011024;
  block[3] = &unk_100031660;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(authenticationMessageQueue, block);
  LOBYTE(authenticationMessageQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)authenticationMessageQueue;
}

- (BOOL)_isRequester:(id)a3 allowedToRequestAuthenticationMessageWithContext:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 bundleID];
  v7 = [&off_100033A58 objectForKeyedSubscript:v6];

  objc_super v8 = +[NSNumber numberWithUnsignedLongLong:a4];
  unsigned __int8 v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = _PBLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 bundleID];
      int v13 = 138543362;
      char v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ requested an authentication message with context ID that it's not allowed to request", (uint8_t *)&v13, 0xCu);
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_authenticationMessageQueue, 0);
}

@end