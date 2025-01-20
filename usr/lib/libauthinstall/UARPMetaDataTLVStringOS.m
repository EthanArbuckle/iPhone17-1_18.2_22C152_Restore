@interface UARPMetaDataTLVStringOS
- (UARPMetaDataTLVStringOS)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4;
- (id)tlvValue:(id)a3;
@end

@implementation UARPMetaDataTLVStringOS

- (UARPMetaDataTLVStringOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVStringOS;
  return [(UARPMetaDataTLVOS *)&v3 init];
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF990];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  int v13 = uarpHtonl(a3);
  [v8 appendBytes:&v13 length:4];
  int v12 = uarpHtonl([v7 length]);
  [v8 appendBytes:&v12 length:4];
  id v9 = [(UARPMetaDataTLVStringOS *)self tlvValue:v7];

  [v8 appendData:v9];
  id v10 = (id)[MEMORY[0x263EFF8F8] dataWithData:v8];

  return v10;
}

- (id)tlvValue:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x263EFF8F8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];
  uint64_t v8 = [v6 length];

  id v9 = (void *)[v5 initWithBytes:v7 length:v8];

  return v9;
}

@end