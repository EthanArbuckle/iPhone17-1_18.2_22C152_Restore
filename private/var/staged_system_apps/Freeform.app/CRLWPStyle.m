@interface CRLWPStyle
- (BOOL)wantsCustomResolveLogicForProperty:(unint64_t)a3 forStyles:(id)a4;
- (_TtC8Freeform10CRLWPStyle)init;
- (float)floatValueForProperty:(unint64_t)a3;
- (float)resolvedFloatForProperty:(unint64_t)a3 inStyles:(id)a4;
- (id)boxedValueForProperty:(unint64_t)a3;
- (id)resolvedValueForProperty:(unint64_t)a3 inStyles:(id)a4;
- (id)valueForProperty:(unint64_t)a3;
- (int)intValueForProperty:(unint64_t)a3;
- (int)resolvedIntForProperty:(unint64_t)a3 inStyles:(id)a4;
@end

@implementation CRLWPStyle

- (id)boxedValueForProperty:(unint64_t)a3
{
  v3 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"boxedValue(for:)", 16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Style/CRLWPStyleProxy.swift", 87, 2, 47, (uint64_t)"Requesting value for invalid property", 37, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"boxedValue(for:)", 16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Style/CRLWPStyleProxy.swift", 87, 2, 47);
  swift_unknownObjectRetain();

  return 0;
}

- (id)valueForProperty:(unint64_t)a3
{
  v4 = *(uint64_t (**)(unint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  v6 = (void *)v4(a3);

  return v6;
}

- (int)intValueForProperty:(unint64_t)a3
{
  v4 = *(uint64_t (**)(unint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  if (v4(a3))
  {
    self;
    v6 = (void *)swift_dynamicCastObjCClass();
    if (v6)
    {
      int v7 = [v6 intValue];

      swift_unknownObjectRelease();
      return v7;
    }
    swift_unknownObjectRelease();
  }

  return 0x80000000;
}

- (float)floatValueForProperty:(unint64_t)a3
{
  v4 = *(uint64_t (**)(unint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v5 = self;
  if (!v4(a3)) {
    goto LABEL_5;
  }
  self;
  v6 = (void *)swift_dynamicCastObjCClass();
  if (!v6)
  {
    swift_unknownObjectRelease();
LABEL_5:
    float v8 = INFINITY;

    return v8;
  }
  [v6 floatValue];
  float v8 = v7;

  swift_unknownObjectRelease();
  return v8;
}

- (BOOL)wantsCustomResolveLogicForProperty:(unint64_t)a3 forStyles:(id)a4
{
  return 0;
}

- (id)resolvedValueForProperty:(unint64_t)a3 inStyles:(id)a4
{
  return 0;
}

- (int)resolvedIntForProperty:(unint64_t)a3 inStyles:(id)a4
{
  return 0x80000000;
}

- (float)resolvedFloatForProperty:(unint64_t)a3 inStyles:(id)a4
{
  return INFINITY;
}

- (_TtC8Freeform10CRLWPStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLWPStyle();
  return [(CRLWPStyle *)&v3 init];
}

@end