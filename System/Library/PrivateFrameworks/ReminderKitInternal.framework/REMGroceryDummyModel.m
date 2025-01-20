@interface REMGroceryDummyModel
+ (BOOL)isGrocerySupportedForLocaleWithIdentifier:(id)a3;
- (_TtC19ReminderKitInternal20REMGroceryDummyModel)init;
@end

@implementation REMGroceryDummyModel

+ (BOOL)isGrocerySupportedForLocaleWithIdentifier:(id)a3
{
  uint64_t v3 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v5 = v4;
  swift_getObjCClassMetadata();
  BOOL v6 = static REMGroceryDummyModel.isGrocerySupported(localeIdentifier:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19ReminderKitInternal20REMGroceryDummyModel)init
{
  result = (_TtC19ReminderKitInternal20REMGroceryDummyModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end