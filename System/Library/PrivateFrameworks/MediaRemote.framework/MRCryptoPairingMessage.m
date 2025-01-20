@interface MRCryptoPairingMessage
- (BOOL)isRetrying;
- (BOOL)isUsingSystemPairing;
- (MRCryptoPairingMessage)initWithPairingData:(id)a3 status:(int)a4;
- (MRCryptoPairingMessage)initWithPairingData:(id)a3 status:(int)a4 isRetrying:(BOOL)a5 isUsingSystemPairing:(BOOL)a6 state:(unint64_t)a7;
- (NSData)pairingData;
- (int)status;
- (unint64_t)encryptionType;
- (unint64_t)state;
- (unint64_t)type;
@end

@implementation MRCryptoPairingMessage

- (MRCryptoPairingMessage)initWithPairingData:(id)a3 status:(int)a4
{
  return [(MRCryptoPairingMessage *)self initWithPairingData:a3 status:*(void *)&a4 isRetrying:0 isUsingSystemPairing:0 state:0];
}

- (MRCryptoPairingMessage)initWithPairingData:(id)a3 status:(int)a4 isRetrying:(BOOL)a5 isUsingSystemPairing:(BOOL)a6 state:(unint64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRCryptoPairingMessage;
  v13 = [(MRProtocolMessage *)&v16 init];
  if (v13)
  {
    v14 = objc_alloc_init(_MRCryptoPairingMessageProtobuf);
    [(_MRCryptoPairingMessageProtobuf *)v14 setPairingData:v12];
    [(_MRCryptoPairingMessageProtobuf *)v14 setStatus:v10];
    [(_MRCryptoPairingMessageProtobuf *)v14 setIsRetrying:v9];
    [(_MRCryptoPairingMessageProtobuf *)v14 setIsUsingSystemPairing:v8];
    [(_MRCryptoPairingMessageProtobuf *)v14 setState:a7];
    [(MRProtocolMessage *)v13 setUnderlyingCodableMessage:v14];
  }
  return v13;
}

- (NSData)pairingData
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 pairingData];

  return (NSData *)v3;
}

- (int)status
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int v3 = [v2 status];

  return v3;
}

- (BOOL)isRetrying
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 isRetrying];

  return v3;
}

- (BOOL)isUsingSystemPairing
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 isUsingSystemPairing];

  return v3;
}

- (unint64_t)state
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = (int)[v2 state];

  return v3;
}

- (unint64_t)encryptionType
{
  return 0;
}

- (unint64_t)type
{
  return 34;
}

@end