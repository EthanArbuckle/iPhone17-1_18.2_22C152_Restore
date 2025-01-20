@interface ContextMenuItemIdentifier
- (BOOL)isEqual:(id)a3;
- (_TtC9SeymourUI25ContextMenuItemIdentifier)init;
- (int64_t)hash;
@end

@implementation ContextMenuItemIdentifier

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A8009F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_239E8B298((uint64_t)v8);

  sub_239E8B460((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_23A800B78();

  return v3;
}

- (_TtC9SeymourUI25ContextMenuItemIdentifier)init
{
  result = (_TtC9SeymourUI25ContextMenuItemIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end