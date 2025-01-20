@interface MKGETCertificateRouter
- (MKCertificate)certificate;
- (MKGETCertificateRouter)initWithSRP:(id)a3 certificate:(id)a4;
- (MKGETCertificateRouterDelegate)delegate;
- (MKSRPServer)srp;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setCertificate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSrp:(id)a3;
@end

@implementation MKGETCertificateRouter

- (MKGETCertificateRouter)initWithSRP:(id)a3 certificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MKGETCertificateRouter;
  v8 = [(MKGETCertificateRouter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MKGETCertificateRouter *)v8 setSrp:v6];
    [(MKGETCertificateRouter *)v9 setCertificate:v7];
  }

  return v9;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6 = a5;
  id v7 = [(MKSRPServer *)self->_srp sharedKey];
  if (v7)
  {
    v8 = [(MKCertificate *)self->_certificate encodedCertificate];
    v9 = [[MKCrypto alloc] initWithKey:v7];
    v10 = [(MKCrypto *)v9 encryptData:v8];
    [v6 setBody:v10];
  }
  else
  {
    objc_super v11 = +[MKLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MKGETCertificateRouter server:didReceiveRequest:response:]((uint64_t)self, v11);
    }
  }
}

- (MKGETCertificateRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKGETCertificateRouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKSRPServer)srp
{
  return self->_srp;
}

- (void)setSrp:(id)a3
{
}

- (MKCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_srp, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ could not continue to send the certificate because shared key is missing. The client didn't call POST /srp before.", (uint8_t *)&v2, 0xCu);
}

@end