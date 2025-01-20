@interface FMTableViewCellImageContainer.MaskingContext
- (BOOL)isEqual:(id)a3;
- (_TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext)init;
- (int64_t)hash;
@end

@implementation FMTableViewCellImageContainer.MaskingContext

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1002F5BFC((uint64_t)v8);

  sub_100067244((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  return sub_1002F5D98();
}

- (_TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext)init
{
  result = (_TtCC6FindMy29FMTableViewCellImageContainerP33_39D425E43D70273F0BCEA8DCE959394914MaskingContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end