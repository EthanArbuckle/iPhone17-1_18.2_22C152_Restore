@interface UARPTLVPersonalizationPayloadTagBackDeploy
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPAssetTagBackDeploy)tag;
- (UARPTLVPersonalizationPayloadTagBackDeploy)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setTag:(id)a3;
@end

@implementation UARPTLVPersonalizationPayloadTagBackDeploy

- (UARPTLVPersonalizationPayloadTagBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationPayloadTagBackDeploy;
  return [(UARPMetaDataTLVBackDeploy *)&v3 init];
}

- (void)setTag:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 copy];
  v7 = *(void **)(&v5->super._tlvLength + 1);
  *(void *)(&v5->super._tlvLength + 1) = v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 = +[UARPTLVPersonalizationPayloadTagBackDeploy metaDataTableEntry];
  id v4 = [v3 objectForKeyedSubscript:@"Name"];
  v5 = +[NSString stringWithFormat:@"<%@: %@>", v4, *(void *)(&self->super._tlvLength + 1)];

  return v5;
}

+ (unsigned)tlvType
{
  return -2001563391;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init((Class)NSMutableData);
  int v8 = uarpHtonl(+[UARPTLVPersonalizationPayloadTagBackDeploy tlvType]);
  [v3 appendBytes:&v8 length:4];
  int v7 = uarpHtonl(4u);
  [v3 appendBytes:&v7 length:4];
  id v4 = [(UARPTLVPersonalizationPayloadTagBackDeploy *)self tlvValue];
  [v3 appendData:v4];

  v5 = +[NSData dataWithData:v3];
  return v5;
}

- (id)tlvValue
{
  unsigned int v4 = [*(id *)(&self->super._tlvLength + 1) tag];
  id v2 = [objc_alloc((Class)NSData) initWithBytes:&v4 length:4];
  return v2;
}

+ (id)metaDataTableEntry
{
  v6[0] = @"Personalization Payload Tag";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", +[UARPTLVPersonalizationPayloadTagBackDeploy tlvType]);
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
    if ([v4 length] == (id)4)
    {
      v5 = (char *)[v4 UTF8String];
      id v6 = objc_opt_new();
      int v7 = [[UARPAssetTagBackDeploy alloc] initWithChar1:*v5 char2:v5[1] char3:v5[2] char4:v5[3]];
      [v6 setTag:v7];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    v5 = objc_opt_new();
    id v6 = [[UARPAssetTagBackDeploy alloc] initWithChar1:*(char *)a4 char2:*((char *)a4 + 1) char3:*((char *)a4 + 2) char4:*((char *)a4 + 3)];
    [v5 setTag:v6];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UARPAssetTagBackDeploy)tag
{
  return (UARPAssetTagBackDeploy *)objc_getProperty(self, a2, 28, 1);
}

- (void).cxx_destruct
{
}

@end