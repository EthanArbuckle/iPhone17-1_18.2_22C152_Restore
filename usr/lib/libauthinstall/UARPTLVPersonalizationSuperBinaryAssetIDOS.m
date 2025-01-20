@interface UARPTLVPersonalizationSuperBinaryAssetIDOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationSuperBinaryAssetIDOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)assetID;
- (void)setAssetID:(unsigned __int16)a3;
@end

@implementation UARPTLVPersonalizationSuperBinaryAssetIDOS

- (UARPTLVPersonalizationSuperBinaryAssetIDOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationSuperBinaryAssetIDOS;
  return [(UARPMetaDataTLV16OS *)&v3 init];
}

- (void)setAssetID:(unsigned __int16)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((_WORD *)&v4->super.super._tlvLength + 2) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationSuperBinaryAssetIDOS metaDataTableEntry];
  v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %u>", v5, *((unsigned __int16 *)&self->super.super._tlvLength + 2)];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563390;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationSuperBinaryAssetIDOS tlvType];
  uint64_t v4 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationSuperBinaryAssetIDOS;
  id v5 = [(UARPMetaDataTLV16OS *)&v7 generateTLV:v3 tlvValue:v4];

  return v5;
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int16 *)&self->super.super._tlvLength + 2);
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationSuperBinaryAssetIDOS;
  id v3 = [(UARPMetaDataTLV16OS *)&v5 tlvValue:v2];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization SuperBinary AssetID";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationSuperBinaryAssetIDOS tlvType](UARPTLVPersonalizationSuperBinaryAssetIDOS, "tlvType")];
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
    uint64_t v6 = [v4 unsignedShortValue];

    [v5 setAssetID:v6];
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
    [v5 setAssetID:uarpHtons(*(unsigned __int16 *)a4)];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (unsigned)assetID
{
  return *((_WORD *)&self->super.super._tlvLength + 2);
}

@end