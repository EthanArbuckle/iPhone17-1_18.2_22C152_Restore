@interface NGMPrekeySignatureFormatter
- (NGMPrekeySignatureFormatter)initWithPublicPrekey:(id)a3;
- (NSData)prekeyPublic;
- (double)timestamp;
- (id)initToSignKey:(id)a3;
- (id)signedData;
@end

@implementation NGMPrekeySignatureFormatter

- (id)initToSignKey:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMPrekeySignatureFormatter;
  v5 = [(NGMPrekeySignatureFormatter *)&v12 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = +[NGMTimeBasedEvaluations nowDate];
  [v6 timeIntervalSince1970];
  v5->_timestamp = v7;

  if (v5->_timestamp >= 1680101200.0)
  {
    uint64_t v9 = [v4 dataRepresentation];
    prekeyPublic = v5->_prekeyPublic;
    v5->_prekeyPublic = (NSData *)v9;

LABEL_5:
    v8 = v5;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (NGMPrekeySignatureFormatter)initWithPublicPrekey:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NGMPrekeySignatureFormatter;
  v5 = [(NGMPrekeySignatureFormatter *)&v11 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_timestamp = v6;
    double v7 = [v4 dhKey];
    uint64_t v8 = [v7 dataRepresentation];
    prekeyPublic = v5->_prekeyPublic;
    v5->_prekeyPublic = (NSData *)v8;
  }
  return v5;
}

- (id)signedData
{
  [(NGMPrekeySignatureFormatter *)self timestamp];
  uint64_t v10 = v3;
  id v4 = (void *)MEMORY[0x263EFF990];
  v5 = [@"NGMPrekeySignature" dataUsingEncoding:4];
  double v6 = [v4 dataWithData:v5];

  double v7 = [(NGMPrekeySignatureFormatter *)self prekeyPublic];
  [v6 appendData:v7];

  uint64_t v8 = [MEMORY[0x263EFF990] dataWithBytes:&v10 length:8];
  [v6 appendData:v8];

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)prekeyPublic
{
  return self->_prekeyPublic;
}

- (void).cxx_destruct
{
}

@end