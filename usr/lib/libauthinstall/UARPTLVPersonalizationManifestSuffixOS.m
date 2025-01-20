@interface UARPTLVPersonalizationManifestSuffixOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)manifestSuffix;
- (UARPTLVPersonalizationManifestSuffixOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setManifestSuffix:(id)a3;
@end

@implementation UARPTLVPersonalizationManifestSuffixOS

- (UARPTLVPersonalizationManifestSuffixOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationManifestSuffixOS;
  return [(UARPMetaDataTLVStringOS *)&v3 init];
}

- (void)setManifestSuffix:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  manifestSuffix = v5->_manifestSuffix;
  v5->_manifestSuffix = (NSString *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationManifestSuffixOS metaDataTableEntry];
  id v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, self->_manifestSuffix];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563340;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationManifestSuffixOS tlvType];
  manifestSuffix = self->_manifestSuffix;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizationManifestSuffixOS;
  id v5 = [(UARPMetaDataTLVStringOS *)&v7 generateTLV:v3 tlvValue:manifestSuffix];

  return v5;
}

- (id)tlvValue
{
  manifestSuffix = self->_manifestSuffix;
  v5.receiver = self;
  v5.super_class = (Class)UARPTLVPersonalizationManifestSuffixOS;
  id v3 = [(UARPMetaDataTLVStringOS *)&v5 tlvValue:manifestSuffix];

  return v3;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization Manifest Suffix";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [(id)[NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationManifestSuffixOS tlvType](UARPTLVPersonalizationManifestSuffixOS, "tlvType")];
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
    [v4 setManifestSuffix:v3];
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
  objc_super v7 = (void *)[[NSString alloc] initWithBytes:a4 length:a3 encoding:4];
  [v6 setManifestSuffix:v7];

  return v6;
}

- (NSString)manifestSuffix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end