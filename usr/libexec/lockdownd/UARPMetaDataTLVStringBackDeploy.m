@interface UARPMetaDataTLVStringBackDeploy
- (UARPMetaDataTLVStringBackDeploy)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4;
- (id)tlvValue:(id)a3;
@end

@implementation UARPMetaDataTLVStringBackDeploy

- (UARPMetaDataTLVStringBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVStringBackDeploy;
  return [(UARPMetaDataTLVBackDeploy *)&v3 init];
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableData);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl([v6 length]);
  [v7 appendBytes:&v11 length:4];
  id v8 = [(UARPMetaDataTLVStringBackDeploy *)self tlvValue:v6];

  [v7 appendData:v8];
  v9 = +[NSData dataWithData:v7];

  return v9;
}

- (id)tlvValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSData);
  id v5 = v3;
  id v6 = [v5 UTF8String];
  id v7 = [v5 length];

  id v8 = [v4 initWithBytes:v6 length:v7];

  return v8;
}

@end