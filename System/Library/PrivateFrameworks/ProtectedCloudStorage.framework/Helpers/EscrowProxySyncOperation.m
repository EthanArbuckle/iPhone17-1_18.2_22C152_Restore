@interface EscrowProxySyncOperation
- (EscrowProxySyncOperation)initWithDSID:(id)a3;
- (NSString)dsid;
- (id)completionBlockWithError;
- (void)main;
- (void)setCompletionBlockWithError:(id)a3;
- (void)setDsid:(id)a3;
@end

@implementation EscrowProxySyncOperation

- (EscrowProxySyncOperation)initWithDSID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EscrowProxySyncOperation;
  v5 = [(EscrowProxySyncOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    [(EscrowProxySyncOperation *)v5 setDsid:v4];
  }

  return v6;
}

- (void)main
{
  v3 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Synchronize keys with escrow proxy", buf, 2u);
  }
  id v4 = [(EscrowProxySyncOperation *)self dsid];
  char v5 = PCSCurrentPersonaMatchesDSID();

  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v7 = [(EscrowProxySyncOperation *)self dsid];
    objc_super v8 = +[PCSAccountsModel guitarfishStateForDSID:v7];

    if (v8)
    {
      v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 BOOLValue]);
      [v6 setObject:v9 forKeyedSubscript:kPCSSetupGuitarfish];

      [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:kPCSSetupForceLogging];
      v10 = [(EscrowProxySyncOperation *)self dsid];
      [v6 setObject:v10 forKeyedSubscript:kPCSSetupDSID];

      v11 = +[PCSMetrics metrics];
      v12 = [v11 keyRegistryCallback];
      id v13 = objc_retainBlock(v12);
      [v6 setObject:v13 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

      if ((PCSIdentitySynchronizeKeys() & 1) == 0)
      {
        v17 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fail to synchronize keys: %@", buf, 0xCu);
        }
      }
      v18 = [(EscrowProxySyncOperation *)self completionBlockWithError];
      v18[2]();

      v19 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Synchronize keys complete", buf, 2u);
      }
    }
    else
    {
      v15 = [(EscrowProxySyncOperation *)self completionBlockWithError];
      v16 = +[NSError errorWithDomain:kPCSErrorDomain code:230 userInfo:0];
      ((void (**)(void, void, void *))v15)[2](v15, 0, v16);
    }
  }
  else
  {
    v14 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current persona doesn't match dsid", buf, 2u);
    }
  }
}

- (id)completionBlockWithError
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlockWithError:(id)a3
{
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong(&self->_completionBlockWithError, 0);
}

@end