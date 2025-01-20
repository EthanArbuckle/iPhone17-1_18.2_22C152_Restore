@interface ModernBarButtonItem
- (_TtC9SeymourUI19ModernBarButtonItem)init;
- (_TtC9SeymourUI19ModernBarButtonItem)initWithCoder:(id)a3;
- (void)handleTappedButton;
@end

@implementation ModernBarButtonItem

- (_TtC9SeymourUI19ModernBarButtonItem)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI19ModernBarButtonItem *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)handleTappedButton
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19ModernBarButtonItem_callback);
  v3 = self;
  v2();
}

- (_TtC9SeymourUI19ModernBarButtonItem)init
{
  result = (_TtC9SeymourUI19ModernBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end