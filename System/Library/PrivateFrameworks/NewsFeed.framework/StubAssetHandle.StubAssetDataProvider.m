@interface StubAssetHandle.StubAssetDataProvider
- (BOOL)isRawFileConsumable;
- (NSData)data;
- (NSString)filePath;
@end

@implementation StubAssetHandle.StubAssetDataProvider

- (NSData)data
{
  unint64_t v2 = *(void *)&self->data[8];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)self->data;
    sub_1BFE95820(v4, v2);
    v3 = (void *)sub_1C151605C();
    sub_1BFE95878(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)filePath
{
  if (*(void *)&self->filePath[8])
  {
    swift_bridgeObjectRetain();
    unint64_t v2 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isRawFileConsumable
{
  return 1;
}

@end