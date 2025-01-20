@interface UARPMetaDataTLV32BackDeploy
- (UARPMetaDataTLV32BackDeploy)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned int)a4;
- (id)tlvValue:(unsigned int)a3;
@end

@implementation UARPMetaDataTLV32BackDeploy

- (UARPMetaDataTLV32BackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV32BackDeploy;
  return [(UARPMetaDataTLVBackDeploy *)&v3 init];
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = objc_alloc_init((Class)NSMutableData);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl(4u);
  [v7 appendBytes:&v11 length:4];
  id v8 = [(UARPMetaDataTLV32BackDeploy *)self tlvValue:v4];
  [v7 appendData:v8];
  v9 = +[NSData dataWithData:v7];

  return v9;
}

- (id)tlvValue:(unsigned int)a3
{
  int v5 = uarpHtonl(a3);
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&v5 length:4];

  return v3;
}

@end