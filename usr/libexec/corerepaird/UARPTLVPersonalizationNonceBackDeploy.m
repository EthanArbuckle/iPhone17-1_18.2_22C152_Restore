@interface UARPTLVPersonalizationNonceBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSData)nonce;
- (UARPTLVPersonalizationNonceBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setNonce:(id)a3;
@end

@implementation UARPTLVPersonalizationNonceBackDeploy

- (UARPTLVPersonalizationNonceBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationNonceBackDeploy;
  return [(UARPMetaDataTLVDataBackDeploy *)&v3 init];
}

- (void)setNonce:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 copy];
  v7 = *(void **)(&v5->super.super._tlvLength + 1);
  *(void *)(&v5->super.super._tlvLength + 1) = v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationNonceBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = +[NSString stringWithFormat:@"<%@: %@>", v4, *(void *)(&self->super.super._tlvLength + 1)];

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563385;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationNonceBackDeploy tlvType];
  uint64_t v4 = *(void *)(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationNonceBackDeploy;
  id v5 = [(UARPMetaDataTLVDataBackDeploy *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  return *(id *)(&self->super.super._tlvLength + 1);
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization Nonce";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationNonceBackDeploy tlvType]);
  v6[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_new();
    [v4 setNonce:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  id v6 = objc_opt_new();
  objc_super v7 = +[NSData dataWithBytes:a4 length:a3];
  [v6 setNonce:v7];

  return v6;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
}

@end