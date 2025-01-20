@interface CRLTextPosition
- (BOOL)eolAffinity;
- (BOOL)isAtStartOfParagraphIn:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (_TtC8Freeform15CRLTextPosition)init;
- (id)clampedTo:(id)a3;
- (id)init:(int64_t)a3;
- (id)init:(int64_t)a3 caretAffinity:(unint64_t)a4;
- (id)offset:(int64_t)a3 in:(id)a4;
- (int64_t)compare:(id)a3;
- (int64_t)location;
- (unint64_t)caretAffinity;
- (unint64_t)insertionEdge;
- (void)setInsertionEdge:(unint64_t)a3;
@end

@implementation CRLTextPosition

- (BOOL)eolAffinity
{
  return *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity) == (Class)1;
}

- (unint64_t)insertionEdge
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge);
}

- (void)setInsertionEdge:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge) = (Class)a3;
}

- (int64_t)location
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
}

- (unint64_t)caretAffinity
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity);
}

- (id)init:(int64_t)a3 caretAffinity:(unint64_t)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_insertionEdge) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location) = (Class)a3;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_caretAffinity) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(CRLTextPosition *)&v9 init];
}

- (id)init:(int64_t)a3
{
  return [(CRLTextPosition *)self init:a3 caretAffinity:0];
}

- (BOOL)isAtStartOfParagraphIn:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  return [a3 textRangeForParagraphAtCharIndex:v3] == v3;
}

- (id)offset:(int64_t)a3 in:(id)a4
{
  id v6 = a4;
  v7 = self;
  id v8 = sub_100A0713C(a3, (uint64_t)v6);

  return v8;
}

- (id)clampedTo:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  v7 = self;
  id v8 = [v6 range];
  id v10 = v8;
  uint64_t v11 = *(uint64_t *)((char *)&v7->super.super.isa + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  if (v11 >= (uint64_t)v8)
  {
    uint64_t v12 = sub_100A07DFC((uint64_t)v8, v9);
    if (v12 >= v11) {
      id v10 = (id)v11;
    }
    else {
      id v10 = (id)v12;
    }
  }
  id v13 = [objc_allocWithZone(ObjectType) init:v10 caretAffinity:0];

  return v13;
}

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
  char v6 = sub_100A07878((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  sub_100A07A28();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_100A07A28();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC8Freeform15CRLTextPosition)init
{
  result = (_TtC8Freeform15CRLTextPosition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)compare:(id)a3
{
  swift_getObjectType();

  return sub_100A07D98((uint64_t)a3, (uint64_t)self);
}

@end