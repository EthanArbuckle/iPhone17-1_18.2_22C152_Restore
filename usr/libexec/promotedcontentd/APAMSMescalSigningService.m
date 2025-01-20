@interface APAMSMescalSigningService
- (APMescalSigningStateChangedDelegate)delegate;
- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5;
- (id)rawSignatureForData:(id)a3 error:(id *)a4;
- (void)retrySetup;
- (void)setDelegate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setup;
@end

@implementation APAMSMescalSigningService

- (void)setState:(int64_t)a3
{
  v5 = [(APAMSMescalSigningService *)self delegate];

  if (v5)
  {
    id v6 = [(APAMSMescalSigningService *)self delegate];
    [v6 mescalStateChanged:a3];
  }
}

- (void)setup
{
}

- (void)retrySetup
{
  v3 = [@"APMescalSigningService AMS provider status check." dataUsingEncoding:4];
  uint64_t v6 = 0;
  v4 = [(APAMSMescalSigningService *)self rawSignatureForData:v3 error:&v6];
  if (v4) {
    BOOL v5 = v6 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    [(APAMSMescalSigningService *)self setState:2];
  }
}

- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)rawSignatureForData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v7 = objc_alloc((Class)NSUserDefaults);
    id v8 = [v7 initWithSuiteName:APDefaultsBundleID];
    if ([v8 BOOLForKey:@"ForceAMSMescalError"])
    {
      uint64_t v9 = AMSErrorDomain;
      v24[0] = NSLocalizedDescriptionKey;
      v24[1] = NSLocalizedFailureReasonErrorKey;
      v25[0] = @"Bag Value Missing";
      v25[1] = @"The bag does not contain sign-sap-setup-cert nor did anyone register a default value.";
      v10 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      v11 = +[NSError errorWithDomain:v9 code:204 userInfo:v10];

      if (v11)
      {
        v12 = 0;
        BOOL v13 = 1;
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  v14 = +[APAMSBagManager adprivacydBag];
  id v21 = 0;
  v12 = +[AMSMescal signatureFromData:v6 type:1 bag:v14 error:&v21];
  id v15 = v21;

  BOOL v13 = v15 != 0;
  if (v12) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    v11 = 0;
    goto LABEL_20;
  }
  v11 = v15;
LABEL_13:
  v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "rawSignatureForData failed with error %{public}@", buf, 0xCu);
  }

  [(APAMSMescalSigningService *)self setState:3];
  char v18 = !v13;
  if (!a4) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    v19 = [v11 domain];
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, [v11 code], 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

  return v12;
}

- (APMescalSigningStateChangedDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (APMescalSigningStateChangedDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end