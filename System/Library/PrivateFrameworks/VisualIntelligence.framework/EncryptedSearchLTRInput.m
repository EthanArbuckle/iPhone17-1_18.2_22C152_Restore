@interface EncryptedSearchLTRInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation EncryptedSearchLTRInput

- (NSSet)featureNames
{
  sub_1DCFEC2D4((uint64_t)&unk_1F3836020);
  swift_arrayDestroy();
  v2 = (void *)sub_1DD0487C8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_1DD048408();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_1DCFE9CD8(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end