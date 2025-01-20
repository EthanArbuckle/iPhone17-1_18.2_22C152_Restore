@interface ContextKey
- (BOOL)isEqual:(id)a3;
- (_TtC15PromotedContent10ContextKey)init;
- (int64_t)hash;
@end

@implementation ContextKey

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent10ContextKey_key);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B5CB3770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1B5C5248C((uint64_t)v8);

  sub_1B5C196E8((uint64_t)v8);
  return v6;
}

- (_TtC15PromotedContent10ContextKey)init
{
  result = (_TtC15PromotedContent10ContextKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end