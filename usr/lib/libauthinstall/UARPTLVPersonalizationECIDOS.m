@interface UARPTLVPersonalizationECIDOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationECIDOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unint64_t)ecID;
- (void)setEcID:(unint64_t)a3;
@end

@implementation UARPTLVPersonalizationECIDOS

- (UARPTLVPersonalizationECIDOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationECIDOS;
  return [(UARPMetaDataTLV64OS *)&v3 init];
}

- (void)setEcID:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v4->_ecID = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationECIDOS metaDataTableEntry];
  v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: 0x%016llx>", v5, self->_ecID];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563386;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECIDOS tlvType];
  unint64_t ecID = self->_ecID;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationECIDOS;
  id v5 = [(UARPMetaDataTLV64OS *)&v7 generateTLV:v3 tlvValue:ecID];

  return v5;
}

- (id)tlvValue
{
  unint64_t ecID = self->_ecID;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationECIDOS;
  id v3 = [(UARPMetaDataTLV64OS *)&v5 tlvValue:ecID];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization ECID";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)[NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationECIDOS tlvType](UARPTLVPersonalizationECIDOS, "tlvType")];
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
    id v4 = v3;
    objc_super v5 = objc_opt_new();
    uint64_t v6 = [v4 unsignedLongLongValue];

    [v5 setEcID:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 8)
  {
    objc_super v5 = objc_opt_new();
    [v5 setEcID:uarpHtonll(*(void *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

@end