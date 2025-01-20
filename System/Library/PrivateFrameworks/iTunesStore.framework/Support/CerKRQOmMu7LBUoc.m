@interface CerKRQOmMu7LBUoc
+ (id)scorerWithContext:(id)a3;
- (BOOL)isPaidBuyV2;
- (CerKRQOmMu7LBUoc)initWithContext:(id)a3;
- (NSData)preparedBlob;
- (NSError)prepareError;
- (NSString)lastScoreIdentifier;
- (ODISession)odiSession;
- (OS_dispatch_queue)callback_queue;
- (OS_dispatch_queue)score_id_queue;
- (id)VkBISyFszEu5z9lr:(id)a3 error:(id *)a4;
- (id)handler;
- (id)prepareBindingsFromContext:(id)a3;
- (id)settingsFromContext:(id)a3;
- (void)_safeCallbackWithMessage:(id)a3 uuid:(id)a4 error:(id)a5;
- (void)eVZ8hjC0Tuzwvnqc:(id)a3;
- (void)prepareScoreMessage;
- (void)provideFeedback:(BOOL)a3;
- (void)scoreWithScoreRequest:(id)a3 completionHandler:(id)a4;
- (void)setCallback_queue:(id)a3;
- (void)setContext:(id)a3;
- (void)setHandler:(id)a3;
- (void)setLastScoreIdentifier:(id)a3;
- (void)setOdiSession:(id)a3;
- (void)setPrepareError:(id)a3;
- (void)setPreparedBlob:(id)a3;
- (void)setScore_id_queue:(id)a3;
- (void)stop;
- (void)triggerCoreODI;
- (wumZ2SSA5KbWdu7E)context;
@end

@implementation CerKRQOmMu7LBUoc

+ (id)scorerWithContext:(id)a3
{
  id v3 = a3;
  v4 = [[CerKRQOmMu7LBUoc alloc] initWithContext:v3];

  return v4;
}

- (CerKRQOmMu7LBUoc)initWithContext:(id)a3
{
  v4 = (wumZ2SSA5KbWdu7E *)a3;
  v17.receiver = self;
  v17.super_class = (Class)CerKRQOmMu7LBUoc;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E3EEC;
  block[3] = &unk_1003AE190;
  v5 = [(CerKRQOmMu7LBUoc *)&v17 init];
  v16 = v5;
  if (qword_100402050 != -1) {
    dispatch_once(&qword_100402050, block);
  }
  context = v5->_context;
  v5->_context = v4;
  v7 = v4;

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.libCoreAS.callback", 0);
  callback_queue = v5->_callback_queue;
  v5->_callback_queue = (OS_dispatch_queue *)v8;

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.libCoreAS.sid", 0);
  score_id_queue = v5->_score_id_queue;
  v5->_score_id_queue = (OS_dispatch_queue *)v10;

  uint64_t v12 = +[NSMutableDictionary dictionary];
  identifier2UUID = v5->_identifier2UUID;
  v5->_identifier2UUID = (NSMutableDictionary *)v12;

  return v5;
}

- (id)settingsFromContext:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 serverEndpointIdentifier];
  [v4 setEndpointIdentifier:v5];

  objc_msgSend(v4, "setSettingsType:", objc_msgSend(v3, "eventFrequency") == (id)2);
  v6 = [v3 phoneNumber];
  [v4 setPhone:v6];

  v7 = [v3 emailAddress];
  [v4 setEmail:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  dispatch_queue_t v8 = objc_msgSend(v3, "identities", 0);
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        v14 = [v13 fullName];
        if (v14 || ([v13 firstName], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          v26 = [v13 lastName];

          if (!v26) {
            goto LABEL_13;
          }
        }
        if (![v13 type])
        {
          uint64_t v15 = [v4 name];
          if (!v15 || (v16 = (void *)v15, id v17 = [v13 source], v16, v17 == (id)2))
          {
            v18 = objc_opt_new();
            v19 = [v13 firstName];
            [v18 setFirstName:v19];

            v20 = [v13 lastName];
            [v18 setLastName:v20];

            v21 = [v13 fullName];
            [v18 setFullName:v21];

            [v4 setName:v18];
          }
        }
LABEL_13:
        v22 = [v13 phoneNumber];
        if (v22)
        {
        }
        else
        {
          v23 = [v13 emailAddress];

          if (!v23) {
            goto LABEL_21;
          }
        }
        if ([v13 type] == (id)1)
        {
          v24 = [v13 phoneNumber];
          [v4 setPPhone:v24];

          v25 = [v13 emailAddress];
          [v4 setPEmail:v25];
        }
        else
        {
          if ([v13 type]) {
            goto LABEL_21;
          }
          v25 = [v13 phoneNumber];
          [v4 setPhone:v25];
        }

LABEL_21:
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v27 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      id v10 = v27;
    }
    while (v27);
  }

  return v4;
}

- (id)VkBISyFszEu5z9lr:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  id v5 = a3;
  sub_1001E5D60((uint64_t)[v5 bytes], (uint64_t)objc_msgSend(v5, "length"), (uint64_t)&v12);
  if (v6)
  {
    int v7 = v6;
    dispatch_queue_t v8 = +[NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
    *a4 = +[NSError errorWithDomain:v8 code:v7 userInfo:0];

    id v9 = 0;
  }
  else
  {
    id v10 = objc_alloc((Class)NSData);
    id v9 = objc_msgSend(v10, "initWithBytes:length:", v12, objc_msgSend(v5, "length"));
  }
  free(v12);

  return v9;
}

- (void)prepareScoreMessage
{
  self->_prepared = 1;
  if ([(CerKRQOmMu7LBUoc *)self isPaidBuyV2])
  {
    score_id_queue = self->_score_id_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E44F4;
    block[3] = &unk_1003AE190;
    void block[4] = self;
    dispatch_async(score_id_queue, block);
  }
  else
  {
    v4 = +[ktSeAkOyXkmyQNgH sharedInstance];
    id v5 = [(CerKRQOmMu7LBUoc *)self context];
    int v6 = [(CerKRQOmMu7LBUoc *)self settingsFromContext:v5];

    int v7 = self->_score_id_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001E4568;
    v10[3] = &unk_1003AE1E0;
    id v11 = v4;
    id v12 = v6;
    v13 = self;
    id v8 = v6;
    id v9 = v4;
    dispatch_async(v7, v10);
  }
}

- (void)_safeCallbackWithMessage:(id)a3 uuid:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  callback_queue = self->_callback_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001E47C0;
  v15[3] = &unk_1003AE208;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(callback_queue, v15);
}

- (void)scoreWithScoreRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1001F0D94();
  }
  id v8 = objc_retainBlock(v7);
  id handler = self->_handler;
  self->_id handler = v8;

  if (self->_prepared)
  {
    id v10 = +[ktSeAkOyXkmyQNgH sharedInstance];
    score_id_queue = self->_score_id_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001E49E0;
    v15[3] = &unk_1003AE1E0;
    v15[4] = self;
    id v16 = v6;
    id v17 = v10;
    id v12 = v10;
    dispatch_async(score_id_queue, v15);
  }
  else
  {
    id v13 = +[NSString stringWithUTF8String:kCoreASErrorDomainCA];
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"prepareScoreMessage wasn't called prior to scoreMessageWithNonce:completionHandler:";
    id v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v12 = +[NSError errorWithDomain:v13 code:-21 userInfo:v14];

    [(CerKRQOmMu7LBUoc *)self _safeCallbackWithMessage:0 uuid:0 error:v12];
  }
}

- (void)stop
{
  id v3 = +[NSString stringWithUTF8String:kCoreASErrorDomainCA];
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = @"Timeout Error";
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v5 = +[NSError errorWithDomain:v3 code:40000 userInfo:v4];
  [(CerKRQOmMu7LBUoc *)self _safeCallbackWithMessage:0 uuid:0 error:v5];
}

- (void)eVZ8hjC0Tuzwvnqc:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "confirmFinished", buf, 2u);
  }
  score_id_queue = self->_score_id_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E4F98;
  v8[3] = &unk_1003AE258;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(score_id_queue, v8);
}

- (BOOL)isPaidBuyV2
{
  id v3 = [(CerKRQOmMu7LBUoc *)self context];
  id v4 = [v3 serverEndpointIdentifier];
  if ([@"paidBuy" isEqualToString:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    NSErrorUserInfoKey v6 = [(CerKRQOmMu7LBUoc *)self context];
    id v7 = [v6 serverEndpointIdentifier];
    if ([@"freeBuy" isEqualToString:v7])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v8 = [(CerKRQOmMu7LBUoc *)self context];
      id v9 = [v8 serverEndpointIdentifier];
      unsigned int v5 = [@"review" isEqualToString:v9] ^ 1;
    }
  }

  return v5;
}

- (void)triggerCoreODI
{
  id v3 = objc_alloc_init(off_100401880());
  id v4 = [(CerKRQOmMu7LBUoc *)self context];
  unsigned int v5 = [(CerKRQOmMu7LBUoc *)self prepareBindingsFromContext:v4];
  [v3 setAttributes:v5];

  NSErrorUserInfoKey v6 = [(CerKRQOmMu7LBUoc *)self odiSession];
  [v6 updateWithAdditionalAttributes:v3];

  id v7 = [(CerKRQOmMu7LBUoc *)self odiSession];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E51C4;
  v8[3] = &unk_1003AE280;
  v8[4] = self;
  [v7 getAssessment:v8];
}

- (id)prepareBindingsFromContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v5 = [v3 identities];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001E54F8;
  v10[3] = &unk_1003AE2A8;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  id v7 = [v3 phoneNumber];
  [v6 setObject:v7 forKeyedSubscript:@"phoneNumber"];

  id v8 = [v3 callerID];

  [v6 setObject:v8 forKeyedSubscript:@"callerID"];

  return v6;
}

- (void)provideFeedback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CerKRQOmMu7LBUoc *)self odiSession];
  [v4 provideFeedbackOnPayloadOutcome:!v3];
}

- (wumZ2SSA5KbWdu7E)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
}

- (OS_dispatch_queue)score_id_queue
{
  return self->_score_id_queue;
}

- (void)setScore_id_queue:(id)a3
{
}

- (NSString)lastScoreIdentifier
{
  return self->_lastScoreIdentifier;
}

- (void)setLastScoreIdentifier:(id)a3
{
}

- (NSError)prepareError
{
  return self->_prepareError;
}

- (void)setPrepareError:(id)a3
{
}

- (NSData)preparedBlob
{
  return self->_preparedBlob;
}

- (void)setPreparedBlob:(id)a3
{
}

- (ODISession)odiSession
{
  return self->_odiSession;
}

- (void)setOdiSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiSession, 0);
  objc_storeStrong((id *)&self->_preparedBlob, 0);
  objc_storeStrong((id *)&self->_prepareError, 0);
  objc_storeStrong((id *)&self->_lastScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_score_id_queue, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_identifier2UUID, 0);
}

@end