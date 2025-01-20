@interface MKGETSRPRouter
- (MKGETSRPRouter)initWithSRP:(id)a3;
- (MKGETSRPRouterDelegate)delegate;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MKGETSRPRouter

- (MKGETSRPRouter)initWithSRP:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKGETSRPRouter;
  v6 = [(MKGETSRPRouter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_srp, a3);
  }

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a5;
  srp = self->_srp;
  id v13 = 0;
  id v14 = 0;
  [(MKSRPServer *)srp generateSalt:&v14 pubkey:&v13];
  id v8 = v14;
  id v9 = v13;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    v15[0] = @"salt";
    v15[1] = @"pubkey";
    v16[0] = v8;
    v16[1] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    v11 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:0 error:0];
    [v6 setBody:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained routerDidRevokeEncryptionKey:self];
  }
  else
  {
    v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MKPOSTSRPRouter server:didReceiveRequest:response:]((uint64_t)self, v10);
    }
  }
}

- (MKGETSRPRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKGETSRPRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_srp, 0);
}

@end