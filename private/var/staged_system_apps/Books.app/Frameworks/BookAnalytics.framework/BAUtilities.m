@interface BAUtilities
+ (id)stringFromUpSellLocation:(int64_t)a3;
+ (id)stringFromUpSellVariant:(int64_t)a3;
+ (int64_t)backgroundColorFromThemeIdentifier:(id)a3;
+ (int64_t)contentTypeFromAssetType:(int64_t)a3;
- (BAUtilities)init;
@end

@implementation BAUtilities

+ (int64_t)backgroundColorFromThemeIdentifier:(id)a3
{
  uint64_t v3 = sub_27DDB0();
  int64_t v5 = sub_12DA40(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (int64_t)contentTypeFromAssetType:(int64_t)a3
{
  return sub_12DC20(a3);
}

+ (id)stringFromUpSellLocation:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      NSString v3 = sub_27DDA0();
      swift_bridgeObjectRelease();
      return v3;
    default:
      sub_27E390();
      __break(1u);
      JUMPOUT(0x12D228);
  }
}

+ (id)stringFromUpSellVariant:(int64_t)a3
{
  if (!a3 || a3 == 2 || a3 == 1)
  {
    NSString v3 = sub_27DDA0();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    id result = (id)sub_27E390();
    __break(1u);
  }
  return result;
}

- (BAUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Utilities();
  return [(BAUtilities *)&v3 init];
}

@end