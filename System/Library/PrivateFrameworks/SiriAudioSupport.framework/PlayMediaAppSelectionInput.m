@interface PlayMediaAppSelectionInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation PlayMediaAppSelectionInput

- (NSSet)featureNames
{
  swift_retain();
  sub_237F3C11C((uint64_t)&unk_26EAF5890);
  swift_arrayDestroy();
  swift_release();
  v2 = (void *)sub_2380E4C68();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_2380E4938();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_237FA2D24(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

@end