@interface MKPOSTProgressRouter
- (MKPOSTProgressRouterDelegate)delegate;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MKPOSTProgressRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  v6 = objc_msgSend(a4, "body", a3);
  if ([v6 length])
  {
    uint64_t v18 = 0;
    v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v18];
    v8 = v7;
    if (!v18)
    {
      v9 = [v7 objectForKey:@"progress"];
      [v9 floatValue];
      int v11 = v10;

      v12 = [v8 objectForKey:@"remaining_time"];
      uint64_t v13 = [v12 unsignedLongLongValue];

      v14 = [v8 objectForKey:@"state"];
      uint64_t v15 = [v14 intValue];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      LODWORD(v17) = v11;
      [WeakRetained router:self didUpdateProgress:v13 remainingTime:v15 state:v17];
    }
  }
}

- (MKPOSTProgressRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKPOSTProgressRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end