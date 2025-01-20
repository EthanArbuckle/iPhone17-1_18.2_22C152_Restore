@interface MKPOSTCertificateRouter
- (MKPOSTCertificateRouter)initWithSRP:(id)a3;
- (MKPOSTCertificateRouterDelegate)delegate;
- (MKSRPServer)srp;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSrp:(id)a3;
@end

@implementation MKPOSTCertificateRouter

- (MKPOSTCertificateRouter)initWithSRP:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPOSTCertificateRouter;
  v5 = [(MKPOSTCertificateRouter *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MKPOSTCertificateRouter *)v5 setSrp:v4];
  }

  return v6;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  v6 = objc_msgSend(a4, "body", a3);
  if ([v6 length])
  {
    v7 = [(MKSRPServer *)self->_srp sharedKey];
    if (v7)
    {
      objc_super v8 = [[MKCrypto alloc] initWithKey:v7];
      v9 = [(MKCrypto *)v8 decryptData:v6];
      if (v9)
      {
        v10 = [[MKCertificate alloc] initWithPEM:v9];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained router:self didReceiveCertifciate:v10];
      }
      else
      {
        v10 = +[MKLog log];
        if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
          -[MKPOSTCertificateRouter server:didReceiveRequest:response:]((uint64_t)self, &v10->super, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    else
    {
      objc_super v8 = +[MKLog log];
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR)) {
        -[MKPOSTCertificateRouter server:didReceiveRequest:response:]((uint64_t)self, &v8->super, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKPOSTCertificateRouter server:didReceiveRequest:response:]((uint64_t)self, v7, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (MKPOSTCertificateRouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKPOSTCertificateRouterDelegate *)WeakRetained;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srp, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end