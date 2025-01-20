@interface _SESACWGSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isPreArmed;
- (BOOL)isWaitingForSecureElement;
- (NSData)auth;
- (NSData)seToken;
- (SEEndPoint)activeEndpoint;
- (_SESACWGSession)initWithRemoteObject:(id)a3 queue:(id)a4;
- (void)endSession:(id)a3;
- (void)endSessionInternal:(id)a3;
- (void)preArmActiveKey:(BOOL)a3 reply:(id)a4;
- (void)pushSecureElementToken:(id)a3;
- (void)releaseRemoteObject;
- (void)sendEvent:(id)a3 keyIdentifier:(id)a4;
- (void)setActiveKey:(id)a3 reply:(id)a4;
- (void)setAuth:(id)a3;
- (void)setDidEndCallback:(id)a3;
- (void)setIsWaitingForSecureElement:(BOOL)a3;
- (void)setSeToken:(id)a3;
- (void)setSecureElementToken:(id)a3 reply:(id)a4;
- (void)start;
- (void)useSecureElementToken;
@end

@implementation _SESACWGSession

- (_SESACWGSession)initWithRemoteObject:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_SESACWGSession;
  return [(_SESSession *)&v5 initWithRemoteObject:a3 queue:a4];
}

+ (id)validateEntitlements:(id)a3
{
  v3 = +[_SESSessionClientInfo withConnection:a3];
  if ([v3 acwgSessionEntitlement])
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
  v3.super_class = (Class)_SESACWGSession;
  [(_SESSession *)&v3 setDidEndCallback:a3];
}

- (void)releaseRemoteObject
{
  objc_super v3 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_SESACWGSession;
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SESACWGSession start %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)_SESACWGSession;
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESACWGSession endSessionInternal %@ error %@", buf, 0x16u);
  }

  [(_SESACWGSession *)self setSeToken:0];
  [(_SESACWGSession *)self setAuth:0];
  [(_SESACWGSession *)self setIsWaitingForSecureElement:0];
  activeEndpoint = self->_activeEndpoint;
  self->_activeEndpoint = 0;

  self->_isPreArmed = 0;
  v8.receiver = self;
  v8.super_class = (Class)_SESACWGSession;
  [(_SESSession *)&v8 endSessionInternal:v4];
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_SESSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000620A4;
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
  block[2] = sub_100062240;
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
  block[2] = sub_10006271C;
  block[3] = &unk_10040C560;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)preArmActiveKey:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062930;
  block[3] = &unk_10040DF20;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)useSecureElementToken
{
  objc_super v3 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062B88;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)pushSecureElementToken:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062D28;
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
    BOOL v11 = SESDefaultLogObject();
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
    if (qword_10045CDB8 != -1) {
      dispatch_once(&qword_10045CDB8, &stru_10040DF40);
    }
    BOOL v11 = [v6 objectForKeyedSubscript:@"xpcEventName"];
    if ([(id)qword_10045CDB0 containsObject:v11])
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