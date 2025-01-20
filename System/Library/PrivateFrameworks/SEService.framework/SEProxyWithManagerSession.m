@interface SEProxyWithManagerSession
- (void)setSession:(void *)a3 seid:;
- (void)transceive:(id)a3 callback:(id)a4;
@end

@implementation SEProxyWithManagerSession

- (void)setSession:(void *)a3 seid:
{
  id v7 = a2;
  id v6 = a3;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 8), a2);
    objc_storeStrong((id *)(a1 + 16), a3);
  }
}

- (void)transceive:(id)a3 callback:(id)a4
{
  session = self->_session;
  seid = self->_seid;
  id v11 = 0;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = a3;
  v9 = [(NFSecureElementManagerSession *)session transceive:v8 forSEID:seid error:&v11];
  id v10 = v11;
  NSLog(&cfstr_SeservClientRe.isa, v8, v9, v10);

  v7[2](v7, v9, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end