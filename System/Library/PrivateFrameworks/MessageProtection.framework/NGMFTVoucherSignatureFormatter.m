@interface NGMFTVoucherSignatureFormatter
- (NGMFTVoucherSignatureFormatter)initWithApplicationData:(id)a3;
- (NSData)signedData;
- (void)setSignedData:(id)a3;
@end

@implementation NGMFTVoucherSignatureFormatter

- (NGMFTVoucherSignatureFormatter)initWithApplicationData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMFTVoucherSignatureFormatter;
  v5 = [(NGMFTVoucherSignatureFormatter *)&v12 init];
  if (v5)
  {
    v6 = [@"com.apple.FaceTime.Voucher" dataUsingEncoding:4];
    objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v4, "length") + objc_msgSend(v6, "length"));
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v8 = v7;
    [(NSData *)v7 appendData:v6];
    [(NSData *)v8 appendData:v4];
    signedData = v5->_signedData;
    v5->_signedData = v8;
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end