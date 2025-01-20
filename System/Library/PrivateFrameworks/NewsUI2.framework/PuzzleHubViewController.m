@interface PuzzleHubViewController
- (_TtC7NewsUI223PuzzleHubViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI223PuzzleHubViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PuzzleHubViewController

- (_TtC7NewsUI223PuzzleHubViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_promiseViewController) = 0;
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_coverViewManager;
  sub_1DFDF1780();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1DFDF1770();

  result = (_TtC7NewsUI223PuzzleHubViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(PuzzleHubViewController *)&v3 viewDidLoad];
  sub_1DFDF1760();
  sub_1DEE22090();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1DEE22500();
}

- (_TtC7NewsUI223PuzzleHubViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI223PuzzleHubViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_offlineManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_feedViewContext));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_promiseViewController));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_referralContext);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_referralContext);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_referralContext);
  uint64_t v6 = *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate
                  + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_referralContext);
  unsigned __int8 v7 = *((unsigned char *)&self->super._view + OBJC_IVAR____TtC7NewsUI223PuzzleHubViewController_referralContext);
  sub_1DED236B0(v3, v4, v5, v6, v7);
}

@end