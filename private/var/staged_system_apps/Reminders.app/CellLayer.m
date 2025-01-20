@interface CellLayer
- (BOOL)masksToBounds;
- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)init;
- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)initWithCoder:(id)a3;
- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)initWithLayer:(id)a3;
@end

@implementation CellLayer

- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CellLayer *)&v3 init];
}

- (BOOL)masksToBounds
{
  return 0;
}

- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100038D28(v9, v9[3]);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(CellLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  sub_100038CD8((uint64_t)v9);
  return v6;
}

- (_TtC9RemindersP33_E28D896C953424B0133C5B43DB432AE59CellLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(CellLayer *)&v5 initWithCoder:a3];
}

@end