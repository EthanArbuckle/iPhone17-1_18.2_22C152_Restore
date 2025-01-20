@interface UARPTLVPersonalizationFTABPayloadOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSArray)tlvs;
- (UARPTLVPersonalizationFTABPayloadOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTLVs:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABPayloadOS

- (UARPTLVPersonalizationFTABPayloadOS)init
{
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABPayloadOS;
  v2 = [(UARPMetaDataTLVOS *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tlvs = v2->_tlvs;
    v2->_tlvs = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)setTLVs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      if (v6 + 4 > [v4 length]) {
        break;
      }
      uint64_t v7 = uarpHtonl(*(_DWORD *)(v5 + v6));
      unint64_t v8 = v6 + 8;
      if (v6 + 8 > [v4 length]) {
        break;
      }
      uint64_t v9 = uarpHtonl(*(_DWORD *)(v5 + v6 + 4));
      unint64_t v6 = v8 + v9;
      if (v6 > [v4 length]) {
        break;
      }
      id v10 = +[UARPMetaDataTLVOS tlvFromType:v7 length:v9 value:v5 + v8];
      if (!v10) {
        break;
      }
      v11 = v10;
      [(NSMutableArray *)self->_tlvs addObject:v10];
    }
    while (v6 < [v4 length]);
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = +[UARPTLVPersonalizationFTABPayloadOS metaDataTableEntry];
  id v4 = objc_opt_new();
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  [v4 appendFormat:@"<%@: \r", v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v6 = self->_tlvs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 appendFormat:@"        <%@>\r", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v4 appendFormat:@"    >"];
  id v11 = (id)[NSString stringWithString:v4];

  return v11;
}

+ (unsigned)tlvType
{
  return -2001563376;
}

- (id)generateTLV
{
  return 0;
}

- (id)tlvValue
{
  return 0;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Personalization FTAB Payload";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = [NSNumber numberWithUnsignedInt:+[UARPTLVPersonalizationFTABPayloadOS tlvType](UARPTLVPersonalizationFTABPayloadOS, "tlvType")];
  v6[1] = v2;
  id v3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  id v4 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a3];
  id v5 = objc_opt_new();
  [v5 setTLVs:v4];

  return v5;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end