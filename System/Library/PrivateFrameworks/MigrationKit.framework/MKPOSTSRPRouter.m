@interface MKPOSTSRPRouter
- (MKPOSTSRPRouter)initWithSRP:(id)a3;
- (MKPOSTSRPRouterDelegate)delegate;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MKPOSTSRPRouter

- (MKPOSTSRPRouter)initWithSRP:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPOSTSRPRouter;
  v6 = [(MKPOSTSRPRouter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_srp, a3);
  }

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  v6 = objc_msgSend(a4, "body", a3);
  if (![v6 length])
  {
    objc_super v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKPOSTSRPRouter server:didReceiveRequest:response:]((uint64_t)self, v9);
    }
    goto LABEL_8;
  }
  id v15 = 0;
  v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v15];
  v8 = v15;
  if (v8)
  {
    objc_super v9 = v8;
    v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MKPOSTSRPRouter server:didReceiveRequest:response:]((uint64_t)self, v9, v10);
    }

LABEL_8:
    goto LABEL_9;
  }
  v12 = [v7 objectForKey:@"pubkey"];
  v13 = [v7 objectForKey:@"proof"];
  v14 = [(MKSRPServer *)self->_srp generateSharedKey:v12 proofOfMatch:v13];

  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained routerDidAuthenticateClient:self];
    goto LABEL_10;
  }
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routerDidRejectClient:self];
LABEL_10:
}

- (MKPOSTSRPRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKPOSTSRPRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_srp, 0);
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ could not continue to authenticate the client because the client sent invalid parameters.", (uint8_t *)&v2, 0xCu);
}

- (void)server:(uint64_t)a1 didReceiveRequest:(void *)a2 response:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  objc_super v9 = v5;
  _os_log_error_impl(&dword_22BFAC000, a3, OS_LOG_TYPE_ERROR, "%@ could not continue to authenticate the client because there was an underlying issue occurred unexpectedly. error=%@", (uint8_t *)&v6, 0x16u);
}

@end