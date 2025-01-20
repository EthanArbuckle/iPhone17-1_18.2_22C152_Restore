@interface _SESDCKSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isPreArmed;
- (BOOL)isWaitingForSecureElement;
- (NSData)auth;
- (NSData)seToken;
- (SEEndPoint)activeEndpoint;
- (_SESDCKSession)initWithRemoteObject:(id)a3 queue:(id)a4;
- (void)cancelRKEFunction:(unint64_t)a3 reply:(id)a4;
- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4;
- (void)endSession:(id)a3;
- (void)endSessionInternal:(id)a3;
- (void)preArmActiveKey:(BOOL)a3 reply:(id)a4;
- (void)pushSecureElementToken:(id)a3;
- (void)releaseRemoteObject;
- (void)sendEvent:(id)a3 keyIdentifier:(id)a4;
- (void)sendPassthroughMessage:(id)a3 reply:(id)a4;
- (void)sendRKEFunction:(unint64_t)a3 action:(unint64_t)a4 authorization:(id)a5 completion:(id)a6;
- (void)setActiveKey:(id)a3 reply:(id)a4;
- (void)setAuth:(id)a3;
- (void)setAuthorization:(id)a3 reply:(id)a4;
- (void)setDidEndCallback:(id)a3;
- (void)setIsWaitingForSecureElement:(BOOL)a3;
- (void)setSeToken:(id)a3;
- (void)setSecureElementToken:(id)a3 reply:(id)a4;
- (void)start;
- (void)useSecureElementToken;
@end

@implementation _SESDCKSession

- (_SESDCKSession)initWithRemoteObject:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_SESDCKSession;
  return [(_SESSession *)&v5 initWithRemoteObject:a3 queue:a4];
}

+ (id)validateEntitlements:(id)a3
{
  v3 = +[_SESSessionClientInfo withConnection:a3];
  if ([v3 dckSessionEntitlement])
  {
    v4 = 0;
  }
  else
  {
    objc_super v5 = SESDefaultLogObject();
    v7 = [v3 clientName];
    v4 = SESCreateAndLogError();
  }

  return v4;
}

- (void)setDidEndCallback:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_SESDCKSession;
  [(_SESSession *)&v3 setDidEndCallback:a3];
}

- (void)releaseRemoteObject
{
  objc_super v3 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_SESDCKSession;
  [(_SESSession *)&v4 releaseRemoteObject];
}

- (void)start
{
  objc_super v3 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SESDCKSession start %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)_SESDCKSession;
  [(_SESSession *)&v5 start];
}

- (void)endSessionInternal:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESDCKSession endSessionInternal %@ error %@", buf, 0x16u);
  }

  [(_SESDCKSession *)self setSeToken:0];
  [(_SESDCKSession *)self setAuth:0];
  [(_SESDCKSession *)self setIsWaitingForSecureElement:0];
  activeEndpoint = self->_activeEndpoint;
  self->_activeEndpoint = 0;

  self->_isPreArmed = 0;
  v8.receiver = self;
  v8.super_class = (Class)_SESDCKSession;
  [(_SESSession *)&v8 endSessionInternal:v4];
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_SESSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100066D88;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setActiveKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066F24;
  block[3] = &unk_10040BEE8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setSecureElementToken:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067550;
  block[3] = &unk_10040C560;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setAuthorization:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = [(_SESSession *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006775C;
  v8[3] = &unk_10040BE80;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)preArmActiveKey:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067940;
  block[3] = &unk_10040DF20;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sendRKEFunction:(unint64_t)a3 action:(unint64_t)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067C2C;
  block[3] = &unk_10040E098;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)cancelRKEFunction:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067ED0;
  block[3] = &unk_10040E0C0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sendPassthroughMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068178;
  block[3] = &unk_10040C560;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)useSecureElementToken
{
  objc_super v3 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006841C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)pushSecureElementToken:(id)a3
{
  id v4 = a3;
  id v5 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000685BC;
  block[3] = &unk_10040B880;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v8);

  if (![(_SESSession *)self isActive])
  {
    unint64_t v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Dropping event due to session not active %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_11;
  }
  id v9 = [(SEEndPoint *)self->_activeEndpoint publicKeyIdentifier];
  unsigned int v10 = [v9 isEqualToData:v7];

  if (v10)
  {
    if (qword_10045CDD8[0] != -1) {
      dispatch_once(qword_10045CDD8, &stru_10040E0E0);
    }
    unint64_t v11 = [v6 objectForKeyedSubscript:@"xpcEventName"];
    if ([(id)qword_10045CDD0 containsObject:v11])
    {
      id v12 = SESDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sending event via session delegate %@", (uint8_t *)&v14, 0xCu);
      }

      id v13 = [(_SESSession *)self remoteObject];
      [v13 sendEvent:v6];
    }
LABEL_11:
  }
}

- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v8);

  if (![(_SESSession *)self isActive])
  {
    unint64_t v11 = SESDefaultLogObject();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    __int16 v15 = 0;
    id v12 = "Ignoring passthrough message received with no active session";
    id v13 = (uint8_t *)&v15;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
    goto LABEL_9;
  }
  id v9 = [(SEEndPoint *)self->_activeEndpoint publicKeyIdentifier];
  unsigned __int8 v10 = [v9 isEqualToData:v7];

  if ((v10 & 1) == 0)
  {
    unint64_t v11 = SESDefaultLogObject();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    __int16 v14 = 0;
    id v12 = "Ignoring passthrough message for non-active key";
    id v13 = (uint8_t *)&v14;
    goto LABEL_8;
  }
  unint64_t v11 = [(_SESSession *)self remoteObject];
  [v11 didReceivePassthroughMessage:v6];
LABEL_9:
}

- (SEEndPoint)activeEndpoint
{
  return self->_activeEndpoint;
}

- (BOOL)isPreArmed
{
  return self->_isPreArmed;
}

- (NSData)seToken
{
  return self->_seToken;
}

- (void)setSeToken:(id)a3
{
}

- (NSData)auth
{
  return self->_auth;
}

- (void)setAuth:(id)a3
{
}

- (BOOL)isWaitingForSecureElement
{
  return self->_isWaitingForSecureElement;
}

- (void)setIsWaitingForSecureElement:(BOOL)a3
{
  self->_isWaitingForSecureElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_seToken, 0);

  objc_storeStrong((id *)&self->_activeEndpoint, 0);
}

@end