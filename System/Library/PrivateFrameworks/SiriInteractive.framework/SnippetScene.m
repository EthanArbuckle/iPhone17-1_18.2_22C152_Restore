@interface SnippetScene
- (_TtC15SiriInteractive12SnippetScene)initWithSession:(id)a3 connectionOptions:(id)a4;
@end

@implementation SnippetScene

- (_TtC15SiriInteractive12SnippetScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  return (_TtC15SiriInteractive12SnippetScene *)sub_25C9903CC(a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  sub_25C992358((uint64_t)v3);
}

@end