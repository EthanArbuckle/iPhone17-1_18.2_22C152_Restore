@interface MKPOSTSRPPrecheckRouter
- (MKPOSTSRPPrecheckRouter)initWithPrecheck:(id)a3;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
@end

@implementation MKPOSTSRPPrecheckRouter

- (MKPOSTSRPPrecheckRouter)initWithPrecheck:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPOSTSRPPrecheckRouter;
  v6 = [(MKPOSTSRPPrecheckRouter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_precheck, a3);
  }

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = [v7 hostname];
  if ([v9 length])
  {
    v10 = [(MKSRPPrecheck *)self->_precheck serverForKey:v9];
    if (v10)
    {
      v11 = [v7 body];
      if ([v11 length])
      {
        id v24 = 0;
        v12 = [MEMORY[0x263F08900] JSONObjectWithData:v11 options:0 error:&v24];
        v13 = v24;
        v23 = v10;
        if (v13)
        {
          v22 = v12;
          v14 = +[MKLog log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[MKPOSTSRPRouter server:didReceiveRequest:response:]((uint64_t)self, v13, v14);
          }
          BOOL v15 = 0;
          v16 = v22;
        }
        else
        {
          v14 = [v12 objectForKey:@"pubkey"];
          v17 = [v12 objectForKey:@"proof"];
          v18 = [v10 generateSharedKey:v14 proofOfMatch:v17];
          v16 = v12;
          BOOL v15 = v18 != 0;
        }
        v10 = v23;
      }
      else
      {
        v13 = +[MKLog log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[MKPOSTSRPRouter server:didReceiveRequest:response:]((uint64_t)self, v13);
        }
        BOOL v15 = 0;
      }
    }
    else
    {
      v11 = +[MKLog log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MKPOSTSRPPrecheckRouter server:didReceiveRequest:response:]((uint64_t)self, v11);
      }
      BOOL v15 = 0;
    }

    v25 = @"success";
    v19 = [NSNumber numberWithBool:v15];
    v26[0] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

    v21 = [MEMORY[0x263F08900] dataWithJSONObject:v20 options:0 error:0];
    [v8 setBody:v21];
    [(MKSRPPrecheck *)self->_precheck removeServerForKey:v9];
  }
}

- (void).cxx_destruct
{
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ srp server was not initialized in GET /srp/precheck.", (uint8_t *)&v2, 0xCu);
}

@end