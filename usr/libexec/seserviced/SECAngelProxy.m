@interface SECAngelProxy
+ (id)sharedInstance;
- (SECAngelProxy)init;
- (void)presentGDPRWithCompletion:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation SECAngelProxy

+ (id)sharedInstance
{
  if (qword_10045CDA8 != -1) {
    dispatch_once(&qword_10045CDA8, &stru_10040DD08);
  }
  v2 = (void *)qword_10045CDA0;

  return v2;
}

- (SECAngelProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)SECAngelProxy;
  result = [(SECAngelProxy *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)presentGDPRWithCompletion:(id)a3
{
  id v15 = a3;
  id v4 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v5 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.SESUIServiceApp"];
  id v6 = [v4 initWithSceneProvidingProcess:v5 configurationIdentifier:@"GDPRPresentmentConfiguration"];

  v7 = objc_opt_new();
  [v7 setUserInfo:&off_10042DCA8];
  v8 = objc_opt_new();
  id v9 = +[SBSRemoteAlertHandle newHandleWithDefinition:v6 configurationContext:v7];
  os_unfair_lock_lock(&self->_lock);
  [v9 registerObserver:self];
  gdprCompletion = (void (**)(id, void *))self->_gdprCompletion;
  if (gdprCompletion)
  {
    v11 = SESDefaultLogObject();
    v12 = SESCreateAndLogError();
    gdprCompletion[2](gdprCompletion, v12);
  }
  id v13 = objc_retainBlock(v15);
  id v14 = self->_gdprCompletion;
  self->_gdprCompletion = v13;

  [v9 activateWithContext:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  objc_super v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "We are showing our glorious GDPR sheet", v4, 2u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "GDPR Dismissed!", v8, 2u);
  }

  gdprCompletion = (void (**)(id, void))self->_gdprCompletion;
  if (gdprCompletion)
  {
    gdprCompletion[2](gdprCompletion, 0);
    id v7 = self->_gdprCompletion;
    self->_gdprCompletion = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "GDPR Presentment crashed?", v11, 2u);
  }

  gdprCompletion = (void (**)(id, void *))self->_gdprCompletion;
  if (gdprCompletion)
  {
    v8 = SESDefaultLogObject();
    id v9 = SESCreateAndLogError();
    gdprCompletion[2](gdprCompletion, v9);

    id v10 = self->_gdprCompletion;
    self->_gdprCompletion = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end