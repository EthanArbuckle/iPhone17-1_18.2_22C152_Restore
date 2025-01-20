@interface UARPTLVPersonalizationProductionModeBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationProductionModeBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)productionMode;
- (void)setProductionMode:(unsigned int)a3;
@end

@implementation UARPTLVPersonalizationProductionModeBackDeploy

- (UARPTLVPersonalizationProductionModeBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationProductionModeBackDeploy;
  return [(UARPMetaDataTLV32BackDeploy *)&v3 init];
}

- (void)setProductionMode:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationProductionModeBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = +[NSString stringWithFormat:@"<%@: 0x%08x>", v4, *(&self->super.super._tlvLength + 1)];

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563381;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationProductionModeBackDeploy tlvType];
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationProductionModeBackDeploy;
  id v5 = [(UARPMetaDataTLV32BackDeploy *)&v7 generateTLV:v3 tlvValue:v4];
  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationProductionModeBackDeploy;
  id v3 = [(UARPMetaDataTLV32BackDeploy *)&v5 tlvValue:v2];
  return v3;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization Production Mode";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationProductionModeBackDeploy tlvType]);
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
    id v6 = [v4 unsignedLongValue];

    [v5 setProductionMode:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    objc_super v5 = objc_opt_new();
    [v5 setProductionMode:uarpNtohl(*(_DWORD *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (unsigned)productionMode
{
  return *(&self->super.super._tlvLength + 1);
}

@end