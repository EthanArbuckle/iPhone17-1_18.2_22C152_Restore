@interface CRLCommandSetMovieCornerRadius
- (NSUUID)id;
- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)init;
- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)initWithId:(id)a3 cornerRadius:(float)a4;
- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)initWithMovieItem:(id)a3 cornerRadius:(float)a4;
- (float)cornerRadius;
@end

@implementation CRLCommandSetMovieCornerRadius

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (float)cornerRadius
{
  return *(float *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_cornerRadius);
}

- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)initWithId:(id)a3 cornerRadius:(float)a4
{
  return (_TtC8Freeform30CRLCommandSetMovieCornerRadius *)sub_1009F777C((char *)self, a4, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_id, &OBJC_IVAR____TtC8Freeform30CRLCommandSetMovieCornerRadius_cornerRadius, type metadata accessor for CRLCommandSetMovieCornerRadius);
}

- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)initWithMovieItem:(id)a3 cornerRadius:(float)a4
{
  return (_TtC8Freeform30CRLCommandSetMovieCornerRadius *)sub_1009F78D4(self, a4, (uint64_t)a2, (char *)a3, (SEL *)&selRef_initWithId_cornerRadius_);
}

- (_TtC8Freeform30CRLCommandSetMovieCornerRadius)init
{
  result = (_TtC8Freeform30CRLCommandSetMovieCornerRadius *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end