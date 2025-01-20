@interface FMDOwnerAuthenticationManager
+ (id)ownerAuthenticationManagerEraseAllContentsAndSettings;
- (BOOL)fallbackToNoAuthentication;
- (FMDOwnerAuthenticationManager)init;
- (FMFuture)currentTask;
- (LAContext)context;
- (NSString)localizedReason;
- (id)deniedOperationBlock;
- (id)evaluationOptions;
- (id)permittedOperationBlock;
- (void)evaluateOperation;
- (void)evaluatePolicy;
- (void)setContext:(id)a3;
- (void)setCurrentTask:(id)a3;
- (void)setDeniedOperationBlock:(id)a3;
- (void)setFallbackToNoAuthentication:(BOOL)a3;
- (void)setLocalizedReason:(id)a3;
- (void)setPermittedOperationBlock:(id)a3;
@end

@implementation FMDOwnerAuthenticationManager

+ (id)ownerAuthenticationManagerEraseAllContentsAndSettings
{
  v2 = objc_alloc_init(FMDOwnerAuthenticationManager);
  v3 = [@"FM_OWNER_AUTH_REASON_EACS" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDOwnerAuthenticationManager *)v2 setLocalizedReason:v3];

  [(FMDOwnerAuthenticationManager *)v2 setFallbackToNoAuthentication:1];

  return v2;
}

- (FMDOwnerAuthenticationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)FMDOwnerAuthenticationManager;
  return [(FMDOwnerAuthenticationManager *)&v3 init];
}

- (void)evaluateOperation
{
  objc_super v3 = [(FMDOwnerAuthenticationManager *)self currentTask];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)FMFuture);
    [(FMDOwnerAuthenticationManager *)self permittedOperationBlock];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100012CB4;
    v13[3] = &unk_1002D9648;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v14;
    id v6 = [v4 addSuccessBlock:v13];
    [(FMDOwnerAuthenticationManager *)self deniedOperationBlock];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100012CCC;
    v11[3] = &unk_1002D9670;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v12;
    id v8 = [v4 addFailureBlock:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012CE4;
    v10[3] = &unk_1002D9698;
    v10[4] = self;
    id v9 = [v4 addCompletionBlock:v10];
    [(FMDOwnerAuthenticationManager *)self setCurrentTask:v4];
    [(FMDOwnerAuthenticationManager *)self evaluatePolicy];
  }
}

- (id)evaluationOptions
{
  v7[0] = &off_1002F1DF8;
  objc_super v3 = [(FMDOwnerAuthenticationManager *)self localizedReason];
  v7[1] = &off_1002F1E10;
  v8[0] = v3;
  id v4 = +[NSNumber numberWithBool:[(FMDOwnerAuthenticationManager *)self fallbackToNoAuthentication]];
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)evaluatePolicy
{
  objc_super v3 = [(FMDOwnerAuthenticationManager *)self context];

  if (v3)
  {
    id v4 = sub_100059D38();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10023B6A4(v4);
    }
  }
  else
  {
    id v4 = objc_alloc_init((Class)LAContext);
    [(FMDOwnerAuthenticationManager *)self setContext:v4];
    id v5 = [(FMDOwnerAuthenticationManager *)self evaluationOptions];
    id v6 = sub_100059D38();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Evaluating location-based owner authentication policy with options %@.", buf, 0xCu);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    void v7[2] = sub_100012F48;
    v7[3] = &unk_1002D96C0;
    v7[4] = self;
    [v4 evaluatePolicy:1025 options:v5 reply:v7];
  }
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(id)a3
{
}

- (BOOL)fallbackToNoAuthentication
{
  return self->_fallbackToNoAuthentication;
}

- (void)setFallbackToNoAuthentication:(BOOL)a3
{
  self->_fallbackToNoAuthentication = a3;
}

- (id)permittedOperationBlock
{
  return self->_permittedOperationBlock;
}

- (void)setPermittedOperationBlock:(id)a3
{
}

- (id)deniedOperationBlock
{
  return self->_deniedOperationBlock;
}

- (void)setDeniedOperationBlock:(id)a3
{
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FMFuture)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_deniedOperationBlock, 0);
  objc_storeStrong(&self->_permittedOperationBlock, 0);

  objc_storeStrong((id *)&self->_localizedReason, 0);
}

@end