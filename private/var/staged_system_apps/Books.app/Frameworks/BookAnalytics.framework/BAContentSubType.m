@interface BAContentSubType
+ (BAContentSubType)fixedLayout;
+ (BAContentSubType)rmt;
+ (BAContentSubType)traditional;
+ (BAContentSubType)unknown;
- (BAContentSubType)init;
@end

@implementation BAContentSubType

+ (BAContentSubType)unknown
{
  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = [super init];

  return (BAContentSubType *)v4;
}

+ (BAContentSubType)rmt
{
  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 1;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = [super init];

  return (BAContentSubType *)v4;
}

+ (BAContentSubType)fixedLayout
{
  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 2;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = [super init];

  return (BAContentSubType *)v4;
}

+ (BAContentSubType)traditional
{
  v2 = (objc_class *)type metadata accessor for BridgedContentSubType();
  v3 = objc_allocWithZone(v2);
  v3[OBJC_IVAR___BAContentSubType_subTypeEnum] = 3;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = [super init];

  return (BAContentSubType *)v4;
}

- (BAContentSubType)init
{
  result = (BAContentSubType *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end