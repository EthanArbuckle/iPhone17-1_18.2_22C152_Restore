@interface UARPTLVPersonalizedManifestOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSData)nonce;
- (UARPTLVPersonalizedManifestOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setManifest:(id)a3;
@end

@implementation UARPTLVPersonalizedManifestOS

- (UARPTLVPersonalizedManifestOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizedManifestOS;
  return [(UARPMetaDataTLVDataOS *)&v3 init];
}

- (void)setManifest:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  manifest = v5->_manifest;
  v5->_manifest = (NSData *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizedManifestOS metaDataTableEntry];
  id v4 = NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, self->_manifest];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563344;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizedManifestOS tlvType];
  manifest = self->_manifest;
  v7.receiver = self;
  v7.super_class = (Class)UARPTLVPersonalizedManifestOS;
  id v5 = [(UARPMetaDataTLVDataOS *)&v7 generateTLV:v3 tlvValue:manifest];

  return v5;
}

- (id)tlvValue
{
  return self->_manifest;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalized Manifest";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizedManifestOS tlvType](UARPTLVPersonalizedManifestOS, "tlvType")];
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
    [v4 setManifest:v3];
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
  id v7 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a3];
  [v6 setManifest:v7];

  return v6;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);

  objc_storeStrong((id *)&self->_manifest, 0);
}

@end