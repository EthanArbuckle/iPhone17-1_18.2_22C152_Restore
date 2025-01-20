@interface UARPTLVPersonalizationNonceOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSData)nonce;
- (UARPTLVPersonalizationNonceOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setNonce:(id)a3;
@end

@implementation UARPTLVPersonalizationNonceOS

- (UARPTLVPersonalizationNonceOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationNonceOS;
  return [(UARPMetaDataTLVDataOS *)&v3 init];
}

- (void)setNonce:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  nonce = v5->_nonce;
  v5->_nonce = (NSData *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationNonceOS metaDataTableEntry];
  id v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, self->_nonce];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563385;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationNonceOS tlvType];
  nonce = self->_nonce;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationNonceOS;
  id v5 = [(UARPMetaDataTLVDataOS *)&v7 generateTLV:v3 tlvValue:nonce];

  return v5;
}

- (id)tlvValue
{
  return self->_nonce;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Nonce";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationNonceOS tlvType](UARPTLVPersonalizationNonceOS, "tlvType")];
  v6[1] = v2;
  id v3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_new();
    [v4 setNonce:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  id v6 = objc_opt_new();
  id v7 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a3];
  [v6 setNonce:v7];

  return v6;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end