@interface UARPTLVPersonalizationECIDBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationECIDBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unint64_t)ecID;
- (void)setEcID:(unint64_t)a3;
@end

@implementation UARPTLVPersonalizationECIDBackDeploy

- (UARPTLVPersonalizationECIDBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationECIDBackDeploy;
  return [(UARPMetaDataTLV64BackDeploy *)&v3 init];
}

- (void)setEcID:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *(void *)(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationECIDBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = +[NSString stringWithFormat:@"<%@: 0x%016llx>", v4, *(void *)(&self->super.super._tlvLength + 1)];

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563386;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECIDBackDeploy tlvType];
  uint64_t v4 = *(void *)(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationECIDBackDeploy;
  id v5 = [(UARPMetaDataTLV64BackDeploy *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *(void *)(&self->super.super._tlvLength + 1);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationECIDBackDeploy;
  id v3 = [(UARPMetaDataTLV64BackDeploy *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization ECID";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationECIDBackDeploy tlvType]);
  v6[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

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
    id v6 = [v4 unsignedLongLongValue];

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
    [v5 setEcID:uarpNtohll(*(void *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unint64_t)ecID
{
  return *(void *)(&self->super.super._tlvLength + 1);
}

@end