@interface UARPTLVPersonalizationLifeBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationLifeBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)life;
- (void)setLife:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationLifeBackDeploy

- (UARPTLVPersonalizationLifeBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationLifeBackDeploy;
  return [(UARPMetaDataTLV8BackDeploy *)&v3 init];
}

- (void)setLife:(unsigned __int8)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((unsigned char *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationLifeBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = +[NSString stringWithFormat:@"<%@: 0x%02x>", v4, *((unsigned __int8 *)&self->super.super._tlvLength + 4)];

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563343;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationLifeBackDeploy tlvType];
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationLifeBackDeploy;
  id v5 = [(UARPMetaDataTLV8BackDeploy *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationLifeBackDeploy;
  id v3 = [(UARPMetaDataTLV8BackDeploy *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization Life";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationLifeBackDeploy tlvType]);
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
    id v6 = [v4 unsignedCharValue];

    [v5 setLife:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 1)
  {
    objc_super v5 = objc_opt_new();
    [v5 setLife:*(unsigned __int8 *)a4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unsigned)life
{
  return *((unsigned char *)&self->super.super._tlvLength + 4);
}

@end