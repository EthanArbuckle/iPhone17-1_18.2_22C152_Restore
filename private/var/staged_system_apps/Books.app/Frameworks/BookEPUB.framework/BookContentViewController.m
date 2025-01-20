@interface BookContentViewController
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8BookEPUB25BookContentViewController)initWithCoder:(id)a3;
- (_TtC8BookEPUB25BookContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)cleanupSnapshotView;
- (void)pageDrag:(id)a3;
- (void)unhandledDirectTapGesture:(id)a3;
- (void)unhandledTapAction:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BookContentViewController

- (_TtC8BookEPUB25BookContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A6C78();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v8 = a3;
  v7 = self;
  sub_1938DC((uint64_t)a3, a4);
}

- (_TtC8BookEPUB25BookContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8BookEPUB25BookContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_bookEntity, &qword_3FF038);
  swift_release();
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentLayoutProviderProviding);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_readingSettingsProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_unhandledTapRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___readingLoupeOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___readingLoupeView));
  swift_release();
  sub_524A4((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_axCurrentLocation, (uint64_t)v5);
  sub_52530(v5);
  sub_524A4((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_failedLocation, (uint64_t)v6);
  sub_52530(v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_log;
  uint64_t v4 = sub_2FB8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_stateHandler));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_readingLoupeLongPressTipController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_paginatingHostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___pagedModeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___scrollContainerView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController__uberScrollContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___pageLabelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_bookmarkCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController____lazy_storage___bookmarkWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_bookmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_slidePanRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_curlPanRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_contentSnapshotView));
  sub_1A70E0((uint64_t)self + OBJC_IVAR____TtC8BookEPUB25BookContentViewController_cancellables);
  swift_bridgeObjectRelease();
}

- (void)pageDrag:(id)a3
{
  id v4 = a3;
  v15 = self;
  id v5 = [(BookContentViewController *)v15 view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(BookContentViewController *)v15 view];
  [v4 velocityInView:v10];
  double v12 = v11;
  double v14 = v13;

  BookContentViewController.performPageDrag(translation:velocity:gestureState:)((uint64_t)[v4 state], v7, v9, v12, v14);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  Swift::Bool v9 = BookContentViewController.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)((UIGestureRecognizer)v6, (UIGestureRecognizer)v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  Swift::Bool v9 = BookContentViewController.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer)v6, (UITouch)v7);

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = BookContentViewController.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  Swift::Bool v9 = BookContentViewController.gestureRecognizer(_:shouldRequireFailureOf:)((UIGestureRecognizer)v6, (UIGestureRecognizer)v7);

  return v9;
}

- (void)viewDidLoad
{
  v2 = self;
  BookContentViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  BookContentViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  BookContentViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  BookContentViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_2FCD00();
  swift_unknownObjectRelease();
  sub_1A6F78();

  sub_39FCC((uint64_t)&v8);
}

- (void)cleanupSnapshotView
{
  v2 = self;
  sub_19E8E4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  BookContentViewController.viewDidLayoutSubviews()();
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  return 0;
}

- (void)unhandledDirectTapGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A1264(v4);
}

- (void)unhandledTapAction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A18D4(v4);
}

@end