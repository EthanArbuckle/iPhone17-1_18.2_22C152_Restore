@interface UARPTLVPersonalizationFTABSubfileTrustedBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationFTABSubfileTrustedBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)trusted;
- (void)setTrusted:(unsigned __int16)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileTrustedBackDeploy

- (UARPTLVPersonalizationFTABSubfileTrustedBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
  return [(UARPMetaDataTLV16BackDeploy *)&v3 init];
}

- (void)setTrusted:(unsigned __int16)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((_WORD *)&v4->super.super._tlvLength + 2) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = +[NSString stringWithFormat:@"<%@: %u>", v4, *((unsigned __int16 *)&self->super.super._tlvLength + 2)];

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563369;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy tlvType];
  uint64_t v4 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
  id v5 = [(UARPMetaDataTLV16BackDeploy *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
  id v3 = [(UARPMetaDataTLV16BackDeploy *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization FTAB Payload Trusted";
  v5[0] = @"Name";
  v5[1] = @"Value";
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileTrustedBackDeploy tlvType]);
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
    id v6 = [v4 unsignedShortValue];

    [v5 setTrusted:v6];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 2)
  {
    objc_super v5 = objc_opt_new();
    [v5 setTrusted:uarpNtohs(*(unsigned __int16 *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unsigned)trusted
{
  return *((_WORD *)&self->super.super._tlvLength + 2);
}

@end