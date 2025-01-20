@interface NFSecureElementProxyListener
- (NFSecureElementManagerSession)seSession;
- (NFSecureElementProxyListener)initWithSTSSession:(id)a3;
- (id)transceiveWithData:(id)a3 outError:(id *)a4;
- (void)setSeSession:(id)a3;
@end

@implementation NFSecureElementProxyListener

- (NFSecureElementProxyListener)initWithSTSSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElementProxyListener;
  v5 = [(NFSecureElementProxyListener *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 masterSESession];
    seSession = v5->_seSession;
    v5->_seSession = (NFSecureElementManagerSession *)v6;
  }
  return v5;
}

- (id)transceiveWithData:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[NFSecureElementProxyListener transceiveWithData:outError:]", 45, self, @"data = %@", v7, v8, (uint64_t)v6);
  id v16 = 0;
  objc_super v9 = [MEMORY[0x263F58138] embeddedSecureElementWithError:&v16];
  id v10 = v16;
  v11 = [v9 info];

  if (v10)
  {
    v12 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    v13 = [(NFSecureElementProxyListener *)self seSession];
    v14 = [v11 serialNumber];
    v12 = [v13 transceive:v6 forSEID:v14 error:a4];
  }
  return v12;
}

- (NFSecureElementManagerSession)seSession
{
  return self->_seSession;
}

- (void)setSeSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end