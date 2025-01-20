@interface COSActivationResponseManager
- (BOOL)awaitingActivation;
- (BOOL)didPresentFlow;
- (BOOL)hasStashedALFlow;
- (BOOL)isFlowOnHold;
- (COSSetupController)setupController;
- (RUIObjectModel)currentObjectModel;
- (RUIObjectModel)rootObjectModel;
- (id)parentViewControllerForObjectModel:(id)a3;
- (id)viewControllerForAlertPresentation;
- (void)awaitActivationWhileHoldingFlow:(BOOL)a3;
- (void)clearActivationState;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 elementDidChange:(id)a4;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6;
- (void)objectModelPressedBack:(id)a3;
- (void)presentFlow;
- (void)setAwaitingActivation:(BOOL)a3;
- (void)setCurrentObjectModel:(id)a3;
- (void)setIsFlowOnHold:(BOOL)a3;
- (void)setRootObjectModel:(id)a3;
- (void)setSetupController:(id)a3;
@end

@implementation COSActivationResponseManager

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = pbb_activation_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100175124((uint64_t)v5, (uint64_t)v6, v7);
  }
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = pbb_activation_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    int v29 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "receivedObj %@ %@ %d", (uint8_t *)&v24, 0x1Cu);
  }

  rootObjectModel = self->_rootObjectModel;
  if (rootObjectModel)
  {
    v12 = [(RUIObjectModel *)rootObjectModel visiblePage];
    v13 = [v12 view];
    [v13 setAlpha:1.0];

    v14 = [(RUIObjectModel *)self->_rootObjectModel visiblePage];
    v15 = [v14 view];
    [v15 setUserInteractionEnabled:1];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
    [WeakRetained showBusyIndicator:1];
  }
  v17 = [v9 defaultPages];
  id v18 = [v17 count];

  if (v18)
  {
    objc_storeStrong((id *)&self->_currentObjectModel, a4);
    if (self->_rootObjectModel)
    {
      if (a5 == 3)
      {
        id v19 = objc_loadWeakRetained((id *)&self->_setupController);
        [v19 popRUIObject:self->_rootObjectModel animated:0];

        objc_storeStrong((id *)&self->_rootObjectModel, a4);
        [(RUIObjectModel *)self->_rootObjectModel setDelegate:self];
        id v20 = objc_loadWeakRetained((id *)&self->_setupController);
        [v20 pushRUIObject:self->_rootObjectModel animated:0 completion:0];

        goto LABEL_16;
      }
      [v9 setDelegate:self];
      v23 = objc_loadWeakRetained((id *)&self->_setupController);
      [v23 pushRUIObject:v9 animated:1 completion:&stru_1002474F8];
    }
    else
    {
      objc_storeStrong((id *)&self->_rootObjectModel, a4);
      [(RUIObjectModel *)self->_rootObjectModel setDelegate:self];
      v21 = pbb_activation_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Stashing the AL Controller, we'll show it when Setup is ready.", (uint8_t *)&v24, 2u);
      }

      self->_hasStashedALFlow = 1;
      v22 = +[NSNotificationCenter defaultCenter];
      [v22 postNotificationName:@"COSActivationResponseManagerStashedALFlowNotification" object:0];

      if (self->_awaitingActivation)
      {
        [(COSActivationResponseManager *)self presentFlow];
        goto LABEL_16;
      }
      v23 = [UIApp bridgeController];
      [v23 beganWaitingForPresentationOfActivationEvent];
    }
  }
LABEL_16:
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = pbb_activation_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didReceiveHTTPResponse %@ %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)objectModel:(id)a3 elementDidChange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = pbb_activation_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "elementDidChange %@ %@", (uint8_t *)&v15, 0x16u);
  }

  int v8 = [v6 name];
  unsigned int v9 = [v8 isEqualToString:@"tryAgain"];

  if (v9)
  {
    __int16 v10 = pbb_activation_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Retry Activation button pressed", (uint8_t *)&v15, 2u);
    }

    id v11 = [UIApp bridgeController];
    [v11 tellGizmoToRetryActivation];

    v12 = [UIApp bridgeController];
    [v12 tellGizmoToKeepAliveForActivationEvent];
  }
  else
  {
    v13 = [v6 name];
    unsigned int v14 = [v13 isEqualToString:@"reset"];

    if (v14) {
      [UIApp resetSetupFlowAnimated:1 forEvent:48];
    }
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void))a6;
  unsigned int v14 = pbb_activation_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "pressedLink (%@) (%@) (%@)", buf, 0x20u);
  }

  int v15 = [v10 clientInfo];
  id v16 = [v15 objectForKeyedSubscript:@"elementIdForiCloudAppleId"];

  if (![(__CFString *)v16 length])
  {

    id v16 = @"login";
  }
  __int16 v17 = [v10 rowForFormField:v16];
  if (v17)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    [v17 populatePostbackDictionary:v18];
  }
  id v19 = [v12 lowercaseString];
  unsigned int v20 = [v19 isEqualToString:@"post"];

  if (v20)
  {
    v21 = [v10 postbackData];
  }
  else
  {
    v21 = 0;
  }
  v22 = pbb_activation_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "loading URL: %@", buf, 0xCu);
  }
  v34 = v12;

  id v23 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v11 cachePolicy:1 timeoutInterval:240.0];
  int v24 = v23;
  if (v21)
  {
    [v23 setHTTPBody:v21];
    [v24 setHTTPMethod:@"POST"];
    [v24 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    id v25 = pbb_activation_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sending Request", buf, 2u);
    }
  }
  __int16 v26 = [UIApp bridgeController];
  [v26 sendProxyActivationWithCustomRequest:v24];

  id v27 = [UIApp bridgeController];
  [v27 tellGizmoToKeepAliveForActivationEvent];

  rootObjectModel = self->_rootObjectModel;
  if (rootObjectModel)
  {
    int v29 = [(RUIObjectModel *)rootObjectModel visiblePage];
    v30 = [v29 view];
    [v30 setAlpha:0.65];

    v31 = [(RUIObjectModel *)self->_rootObjectModel visiblePage];
    v32 = [v31 view];
    [v32 setUserInteractionEnabled:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
    [WeakRetained showBusyIndicator:1];

    self->_hasStashedALFlow = 0;
  }
  v13[2](v13, 1, 0);
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return 0;
}

- (void)objectModelPressedBack:(id)a3
{
  id v4 = a3;
  id v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "objectModelPressedBack %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  [WeakRetained popRUIObject:v4 animated:1];
}

- (void)setAwaitingActivation:(BOOL)a3
{
  if (a3)
  {
    [(COSActivationResponseManager *)self awaitActivationWhileHoldingFlow:0];
  }
  else
  {
    id v4 = pbb_activation_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No longer awaiting activation", v5, 2u);
    }

    self->_isFlowOnHold = 0;
    self->_awaitingActivation = 0;
  }
}

- (void)awaitActivationWhileHoldingFlow:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = pbb_activation_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Awaiting Activation while holding: %d", (uint8_t *)v6, 8u);
  }

  self->_isFlowOnHold = v3;
  self->_awaitingActivation = 1;
  if (self->_rootObjectModel) {
    [(COSActivationResponseManager *)self presentFlow];
  }
}

- (void)presentFlow
{
  BOOL v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Present Flow for Activation Lock", buf, 2u);
  }

  self->_didPresentFlow = 1;
  if (self->_isFlowOnHold)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
    [WeakRetained blockGoingBackFromCurrentController];
  }
  id v5 = objc_loadWeakRetained((id *)&self->_setupController);
  rootObjectModel = self->_rootObjectModel;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010D66C;
  v7[3] = &unk_1002438A0;
  v7[4] = self;
  [v5 pushRUIObject:rootObjectModel animated:1 completion:v7];
}

- (id)viewControllerForAlertPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  BOOL v3 = [WeakRetained navigationController];
  id v4 = [v3 topViewController];

  return v4;
}

- (void)clearActivationState
{
  BOOL v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[COSActivationResponseManager clearActivationState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(RUIObjectModel *)self->_rootObjectModel setDelegate:0];
  rootObjectModel = self->_rootObjectModel;
  self->_rootObjectModel = 0;

  [(RUIObjectModel *)self->_currentObjectModel setDelegate:0];
  currentObjectModel = self->_currentObjectModel;
  self->_currentObjectModel = 0;

  *(_DWORD *)&self->_awaitingActivation = 0;
}

- (COSSetupController)setupController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);

  return (COSSetupController *)WeakRetained;
}

- (void)setSetupController:(id)a3
{
}

- (BOOL)awaitingActivation
{
  return self->_awaitingActivation;
}

- (BOOL)didPresentFlow
{
  return self->_didPresentFlow;
}

- (BOOL)hasStashedALFlow
{
  return self->_hasStashedALFlow;
}

- (RUIObjectModel)rootObjectModel
{
  return self->_rootObjectModel;
}

- (void)setRootObjectModel:(id)a3
{
}

- (RUIObjectModel)currentObjectModel
{
  return self->_currentObjectModel;
}

- (void)setCurrentObjectModel:(id)a3
{
}

- (BOOL)isFlowOnHold
{
  return self->_isFlowOnHold;
}

- (void)setIsFlowOnHold:(BOOL)a3
{
  self->_isFlowOnHold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentObjectModel, 0);
  objc_storeStrong((id *)&self->_rootObjectModel, 0);

  objc_destroyWeak((id *)&self->_setupController);
}

@end