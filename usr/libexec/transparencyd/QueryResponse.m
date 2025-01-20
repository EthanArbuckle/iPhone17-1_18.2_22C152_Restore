@interface QueryResponse
+ (id)descriptor;
- (NSDictionary)metadata;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
@end

@implementation QueryResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032EEA0;
  if (!qword_10032EEA0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:QueryResponse messageName:@"QueryResponse" fileDescription:&unk_100325780 fields:&off_100325798 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B3ED];
    qword_10032EEA0 = (uint64_t)v2;
  }
  return v2;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = [(QueryResponse *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(QueryResponse *)self setMetadata:v8];
  }
}

@end