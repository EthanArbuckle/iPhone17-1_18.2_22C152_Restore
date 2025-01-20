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
    sub_1AFD4B0E0(v4, v2);
    v3 = (void *)sub_1AFFC9778();
    sub_1AFDE6658(v4, v2);
  }

  return (NSData *)v3;
}

- (NSString)filePath
{
  if (*(void *)&self->filePath[8])
  {
    sub_1AFFC8E38();
    unint64_t v2 = (void *)sub_1AFFCAE68();
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