@interface NFSecureElementReaderProxyListener
- (NFHardwareSecureElementInfo)seInfo;
- (NFSecureElementManagerSession)seSession;
- (NFSecureElementReaderProxyListener)initWithSTSReaderSession:(id)a3;
- (id)transceiveWithData:(id)a3 outError:(id *)a4;
- (void)setSeInfo:(id)a3;
- (void)setSeSession:(id)a3;
@end

@implementation NFSecureElementReaderProxyListener

- (NFSecureElementReaderProxyListener)initWithSTSReaderSession:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NFSecureElementReaderProxyListener;
  v5 = [(NFSecureElementReaderProxyListener *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v14 = 0;
  v6 = [MEMORY[0x263F58138] embeddedSecureElementWithError:&v14];
  id v7 = v14;
  uint64_t v8 = [v6 info];
  seInfo = v5->_seInfo;
  v5->_seInfo = (NFHardwareSecureElementInfo *)v8;

  if (!v7)
  {
    uint64_t v11 = [v4 proxyReaderSESession];
    seSession = v5->_seSession;
    v5->_seSession = (NFSecureElementManagerSession *)v11;

LABEL_5:
    v10 = v5;
    goto LABEL_6;
  }

  v10 = 0;
LABEL_6:

  return v10;
}

- (id)transceiveWithData:(id)a3 outError:(id *)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[NFSecureElementReaderProxyListener transceiveWithData:outError:]", 64, self, @"data = %@", v8, v9, (uint64_t)v7);
  v10 = [(NFSecureElementReaderProxyListener *)self seSession];

  if (v10)
  {
    uint64_t v11 = [(NFSecureElementReaderProxyListener *)self seSession];
    v12 = [(NFSecureElementReaderProxyListener *)self seInfo];
    v13 = [v12 serialNumber];
    a4 = [v11 transceive:v7 forSEID:v13 error:a4];
  }
  else if (a4)
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    objc_super v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v21[0] = *MEMORY[0x263F08320];
    v16 = [NSString stringWithUTF8String:"Hardware Not Available"];
    v22[0] = v16;
    v22[1] = &unk_26D307738;
    v21[1] = @"Line";
    v21[2] = @"Method";
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v22[2] = v17;
    v21[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 69);
    v22[3] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    *a4 = [v14 errorWithDomain:v15 code:12 userInfo:v19];

    a4 = 0;
  }

  return a4;
}

- (NFSecureElementManagerSession)seSession
{
  return self->_seSession;
}

- (void)setSeSession:(id)a3
{
}

- (NFHardwareSecureElementInfo)seInfo
{
  return self->_seInfo;
}

- (void)setSeInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seInfo, 0);
  objc_storeStrong((id *)&self->_seSession, 0);
}

@end