@interface UARPTLVPersonalizationFTABPayloadBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSArray)tlvs;
- (UARPTLVPersonalizationFTABPayloadBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTLVs:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABPayloadBackDeploy

- (UARPTLVPersonalizationFTABPayloadBackDeploy)init
{
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABPayloadBackDeploy;
  v2 = [(UARPMetaDataTLVBackDeploy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = *(void **)(v2 + 28);
    *(void *)(v2 + 28) = v3;
  }
  return (UARPTLVPersonalizationFTABPayloadBackDeploy *)v2;
}

- (void)setTLVs:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 bytes];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      if (v6 + 4 > (unint64_t)[v4 length]) {
        break;
      }
      uint64_t v7 = uarpNtohl(*(_DWORD *)&v5[v6]);
      unint64_t v8 = v6 + 8;
      if (v6 + 8 > (unint64_t)[v4 length]) {
        break;
      }
      uint64_t v9 = uarpNtohl(*(_DWORD *)&v5[v6 + 4]);
      unint64_t v6 = v8 + v9;
      if (v6 > (unint64_t)[v4 length]) {
        break;
      }
      id v10 = +[UARPMetaDataTLVBackDeploy tlvFromType:v7 length:v9 value:&v5[v8]];
      if (!v10) {
        break;
      }
      v11 = v10;
      [*(id *)(&self->super._tlvLength + 1) addObject:v10];
    }
    while (v6 < (unint64_t)[v4 length]);
  }
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationFTABPayloadBackDeploy metaDataTableEntry];
  id v4 = objc_opt_new();
  id v5 = [v3 objectForKeyedSubscript:@"Name"];
  [v4 appendFormat:@"<%@: \r", v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(&self->super._tlvLength + 1);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 appendFormat:@"        <%@>\r", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v4 appendFormat:@"    >"];
  v11 = +[NSString stringWithString:v4];

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
  v6[0] = @"Personalization FTAB Payload";
  v5[0] = @"Name";
  v5[1] = @"Value";
  v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABPayloadBackDeploy tlvType]);
  v6[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  id v4 = +[NSData dataWithBytes:a4 length:a3];
  id v5 = objc_opt_new();
  [v5 setTLVs:v4];

  return v5;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
}

@end