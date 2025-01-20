@interface NGMMessageSignatureFormatter
- (NGMMessageSignatureFormatter)initWithDHOutput:(id)a3 prekeyPub:(id)a4 ephemeralPub:(id)a5 recipientPub:(id)a6 ciphertext:(id)a7;
- (NSData)formattedSignedData;
- (id)signedData;
@end

@implementation NGMMessageSignatureFormatter

- (NGMMessageSignatureFormatter)initWithDHOutput:(id)a3 prekeyPub:(id)a4 ephemeralPub:(id)a5 recipientPub:(id)a6 ciphertext:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = (void *)[a3 mutableCopy];
  [v16 appendData:v15];

  [v16 appendData:v14];
  [v16 appendData:v13];

  [v16 appendData:v12];
  v20.receiver = self;
  v20.super_class = (Class)NGMMessageSignatureFormatter;
  v17 = [(NGMMessageSignatureFormatter *)&v20 init];
  v18 = v17;
  if (v17) {
    objc_storeStrong((id *)&v17->_formattedSignedData, v16);
  }

  return v18;
}

- (id)signedData
{
  return self->_formattedSignedData;
}

- (NSData)formattedSignedData
{
  return self->_formattedSignedData;
}

- (void).cxx_destruct
{
}

@end