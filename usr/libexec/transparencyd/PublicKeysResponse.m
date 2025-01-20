@interface PublicKeysResponse
+ (id)descriptor;
- (NSDictionary)metadata;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
@end

@implementation PublicKeysResponse

+ (id)descriptor
{
  id v2 = (id)qword_10032ED28;
  if (!qword_10032ED28)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:PublicKeysResponse messageName:@"PublicKeysResponse" fileDescription:&unk_100324980 fields:&off_100324BF8 fieldCount:11 storageSize:88 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028AFEF];
    qword_10032ED28 = (uint64_t)v2;
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
    v7 = [(PublicKeysResponse *)self metadata];
    id v8 = [v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v8 setObject:v9 forKeyedSubscript:v6];
    [(PublicKeysResponse *)self setMetadata:v8];
  }
}

@end