@interface ContextActionsPresentationTransition
- (_TtC12NowPlayingUI36ContextActionsPresentationTransition)init;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)performWithCustomAnimator:(id)a3 completion:(id)a4;
- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
@end

@implementation ContextActionsPresentationTransition

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_E1630(v8, v9, v10);
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_E1B1C(v8, v9, v10);
}

- (void)performWithCustomAnimator:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  id v8 = (void *)swift_allocObject();
  v8[2] = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  sub_E1DD4(sub_2744C, v8, (uint64_t)sub_C2C8C, v9);

  swift_release();

  swift_release();
}

- (_TtC12NowPlayingUI36ContextActionsPresentationTransition)init
{
  result = (_TtC12NowPlayingUI36ContextActionsPresentationTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_E2DB0(*(id *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition____lazy_storage___mirroredDismissalTransition));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_sourceView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_highlighterView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_presentedView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_snapshotView);
}

@end