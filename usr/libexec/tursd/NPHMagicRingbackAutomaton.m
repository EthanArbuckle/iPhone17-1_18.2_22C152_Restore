@interface NPHMagicRingbackAutomaton
+ (BOOL)shouldNotFlipMute;
- (NPHCall)currentIncomingCallRequest;
- (NPHCall)currentOutgoingCallResponse;
- (NPHMagicRingbackAutomaton)init;
- (NPHStateManager)stateManager;
- (void)_flipMuteForCall:(id)a3;
- (void)_flipMuteForCall:(id)a3 and:(id)a4;
- (void)setCurrentIncomingCallRequest:(id)a3;
- (void)setCurrentOutgoingCallResponse:(id)a3;
- (void)setStateManager:(id)a3;
- (void)stateManager:(id)a3 callConfigurationUpdated:(id)a4;
@end

@implementation NPHMagicRingbackAutomaton

- (NPHMagicRingbackAutomaton)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPHMagicRingbackAutomaton;
  v2 = [(NPHMagicRingbackAutomaton *)&v6 init];
  if (v2)
  {
    v3 = [[NPHStateManager alloc] initWithDelegate:v2];
    stateManager = v2->_stateManager;
    v2->_stateManager = v3;
  }
  return v2;
}

- (void)stateManager:(id)a3 callConfigurationUpdated:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(NPHMagicRingbackAutomaton *)self currentOutgoingCallResponse];

  if (v6)
  {
    v7 = [(NPHMagicRingbackAutomaton *)self currentOutgoingCallResponse];
    unsigned int v8 = [v7 status];

    if (v8 == 6) {
      [(NPHMagicRingbackAutomaton *)self setCurrentOutgoingCallResponse:0];
    }
  }
  else
  {
    v9 = [(NPHMagicRingbackAutomaton *)self currentIncomingCallRequest];

    if (v9)
    {
      v10 = [(NPHMagicRingbackAutomaton *)self currentIncomingCallRequest];
      unsigned int v11 = [v10 status];

      if (v11 == 6)
      {
        v12 = [(NPHMagicRingbackAutomaton *)self currentIncomingCallRequest];
        unsigned int v13 = [v12 disconnectedReason];

        if (v13 == 6)
        {
          v14 = [NPHCall alloc];
          v15 = objc_opt_new();
          v16 = [(NPHCall *)v14 initWithTUCall:v15];
          [(NPHMagicRingbackAutomaton *)self setCurrentOutgoingCallResponse:v16];

          v17 = [(NPHMagicRingbackAutomaton *)self currentIncomingCallRequest];
          v18 = [v17 redialPrompt];

          v19 = +[NSUserDefaults standardUserDefaults];
          [v19 doubleForKey:@"NPHMagicRingbackAutomatonCallBackDelay"];
          double v21 = v20;

          dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10000729C;
          v31[3] = &unk_100010748;
          v31[4] = v18;
          v31[5] = self;
          dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, v31);
        }
        [(NPHMagicRingbackAutomaton *)self setCurrentIncomingCallRequest:0];
      }
    }
    else
    {
      uint64_t v23 = [v5 incomingCall];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [v5 calls];
        id v26 = [v25 count];

        if (v26 == (id)1)
        {
          v27 = [v5 incomingCall];
          [(NPHMagicRingbackAutomaton *)self setCurrentIncomingCallRequest:v27];

          v28 = +[TUCallCenter sharedInstance];
          v29 = [(NPHMagicRingbackAutomaton *)self currentIncomingCallRequest];
          v30 = [v29 onlyTUCall];
          [v28 answerCall:v30];
        }
      }
    }
  }
}

- (void)setCurrentIncomingCallRequest:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentIncomingCallRequest, a3);
  objc_super v6 = sub_100001854();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentIncomingCallRequest = self->_currentIncomingCallRequest;
    *(_DWORD *)buf = 138412290;
    unsigned int v13 = currentIncomingCallRequest;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_currentIncomingCallRequest: %@", buf, 0xCu);
  }

  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007490;
  v10[3] = &unk_100010748;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)setCurrentOutgoingCallResponse:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentOutgoingCallResponse, a3);
  objc_super v6 = sub_100001854();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentOutgoingCallResponse = self->_currentOutgoingCallResponse;
    *(_DWORD *)buf = 138412290;
    unsigned int v13 = currentOutgoingCallResponse;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_currentOutgoingCallResponse: %@", buf, 0xCu);
  }

  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000075EC;
  v10[3] = &unk_100010748;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)_flipMuteForCall:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() shouldNotFlipMute] & 1) == 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000076A4;
    v5[3] = &unk_100010748;
    v5[4] = self;
    id v6 = v4;
    [(NPHMagicRingbackAutomaton *)self _flipMuteForCall:v6 and:v5];
  }
}

- (void)_flipMuteForCall:(id)a3 and:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 onlyTUCall];
  uint64_t v8 = [v7 isUplinkMuted] ^ 1;
  id v9 = [v6 onlyTUCall];

  [v9 setUplinkMuted:v8];
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000078DC;
  block[3] = &unk_1000109B0;
  id v13 = v5;
  id v11 = v5;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

+ (BOOL)shouldNotFlipMute
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"NPHDoNotFlipMuteDuringPPTs"];

  return v3;
}

- (NPHStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (NPHCall)currentIncomingCallRequest
{
  return self->_currentIncomingCallRequest;
}

- (NPHCall)currentOutgoingCallResponse
{
  return self->_currentOutgoingCallResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOutgoingCallResponse, 0);
  objc_storeStrong((id *)&self->_currentIncomingCallRequest, 0);

  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end