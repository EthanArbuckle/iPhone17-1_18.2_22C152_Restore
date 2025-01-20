@interface MKGETSRPPrecheckRouter
- (MKGETSRPPrecheckRouter)initWithPrecheck:(id)a3;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
@end

@implementation MKGETSRPPrecheckRouter

- (MKGETSRPPrecheckRouter)initWithPrecheck:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKGETSRPPrecheckRouter;
  v6 = [(MKGETSRPPrecheckRouter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_precheck, a3);
  }

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = [v7 hostname];
  if ([v9 length])
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v11 = [(MKSRPPrecheck *)self->_precheck serverForKey:v9];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[MKLog log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v7 hostname];
        *(_DWORD *)buf = 138477827;
        v23 = v14;
        _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "srp for hostname is currently being used. hostname=%{private}@", buf, 0xCu);
      }
      uint64_t v15 = 0;
    }
    else
    {
      [(MKSRPPrecheck *)self->_precheck setServerForKey:v9];
      v12 = [(MKSRPPrecheck *)self->_precheck serverForKey:v9];
      id v20 = 0;
      id v21 = 0;
      [v12 generateSalt:&v21 pubkey:&v20];
      v13 = v21;
      id v16 = v20;
      if (-[NSObject length](v13, "length") && [v16 length])
      {
        [v10 setObject:v13 forKeyedSubscript:@"salt"];
        [v10 setObject:v16 forKeyedSubscript:@"pubkey"];
        uint64_t v15 = 1;
      }
      else
      {
        v17 = +[MKLog log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[MKPOSTSRPRouter server:didReceiveRequest:response:]((uint64_t)self, v17);
        }

        [(MKSRPPrecheck *)self->_precheck removeServerForKey:v9];
        uint64_t v15 = 0;
      }
    }
    v18 = [NSNumber numberWithBool:v15];
    [v10 setObject:v18 forKeyedSubscript:@"success"];

    v19 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:0 error:0];
    [v8 setBody:v19];
  }
}

- (void).cxx_destruct
{
}

@end