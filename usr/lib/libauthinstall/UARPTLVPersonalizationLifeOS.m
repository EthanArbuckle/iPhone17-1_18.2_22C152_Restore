@interface UARPTLVPersonalizationLifeOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationLifeOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)life;
- (void)setLife:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationLifeOS

- (UARPTLVPersonalizationLifeOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationLifeOS;
  return [(UARPMetaDataTLV8OS *)&v3 init];
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
  id v3 = +[UARPTLVPersonalizationLifeOS metaDataTableEntry];
  v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: 0x%02x>", v5, *((unsigned __int8 *)&self->super.super._tlvLength + 4)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563343;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationLifeOS tlvType];
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationLifeOS;
  id v5 = [(UARPMetaDataTLV8OS *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationLifeOS;
  id v3 = [(UARPMetaDataTLV8OS *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Life";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationLifeOS tlvType](UARPTLVPersonalizationLifeOS, "tlvType")];
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
    uint64_t v6 = [v4 unsignedCharValue];

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