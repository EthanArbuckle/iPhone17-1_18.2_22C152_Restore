@interface UARPTLVPersonalizationChipEpochOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationChipEpochOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)chipEpoch;
- (void)setChipEpoch:(unsigned int)a3;
@end

@implementation UARPTLVPersonalizationChipEpochOS

- (UARPTLVPersonalizationChipEpochOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationChipEpochOS;
  return [(UARPMetaDataTLV32OS *)&v3 init];
}

- (void)setChipEpoch:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationChipEpochOS metaDataTableEntry];
  v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: 0x%08x>", v5, *(&self->super.super._tlvLength + 1)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563380;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationChipEpochOS tlvType];
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationChipEpochOS;
  id v5 = [(UARPMetaDataTLV32OS *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationChipEpochOS;
  id v3 = [(UARPMetaDataTLV32OS *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Chip Epoch";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationChipEpochOS tlvType](UARPTLVPersonalizationChipEpochOS, "tlvType")];
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
    uint64_t v6 = [v4 unsignedLongValue];

    [v5 setChipEpoch:v6];
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
    [v5 setChipEpoch:uarpHtonl(*(_DWORD *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unsigned)chipEpoch
{
  return *(&self->super.super._tlvLength + 1);
}

@end