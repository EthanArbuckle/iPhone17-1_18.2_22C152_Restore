@interface REMBertTextClassifierInput
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation REMBertTextClassifierInput

- (NSSet)featureNames
{
  sub_1A74FA014((uint64_t)&unk_1EFC931C0);
  swift_arrayDestroy();
  v2 = (void *)sub_1A7572C60();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v5 = v4;
  swift_retain();
  id v6 = sub_1A74F88C8(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end