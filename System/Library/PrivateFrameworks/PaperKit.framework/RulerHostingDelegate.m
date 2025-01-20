@interface RulerHostingDelegate
- (BOOL)rulerHostWantsSharedRuler;
- (_TtC8PaperKit20RulerHostingDelegate)init;
- (id)rulerHostingView;
@end

@implementation RulerHostingDelegate

- (id)rulerHostingView
{
  v2 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit20RulerHostingDelegate_rulerHostView, a2);
  return v2;
}

- (BOOL)rulerHostWantsSharedRuler
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit20RulerHostingDelegate_sharedRuler);
}

- (_TtC8PaperKit20RulerHostingDelegate)init
{
  result = (_TtC8PaperKit20RulerHostingDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end