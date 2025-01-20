@interface LemonadeCuratedLibraryView_ContainerViewController
- (CGRect)layout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4;
- (LemonadeCuratedLibraryView_ContainerViewController)initWithCoder:(id)a3;
- (LemonadeCuratedLibraryView_ContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UINavigationItem)navigationItem;
- (void)curatedLibraryViewDidUpdateBars:(id)a3;
- (void)curatedLibraryViewRequestImmediateUpdate:(id)a3;
- (void)scrollViewControllerContentInsetDidChange:(id)a3;
- (void)scrollViewControllerDidEndScrolling:(id)a3;
- (void)scrollViewControllerDidEndScrollingAnimation:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4;
- (void)setNeedsUpdate;
- (void)updateBarItems;
- (void)updateCuratedLibraryViewModel;
- (void)updateResetCuratedLibraryView;
- (void)updateScrollView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation LemonadeCuratedLibraryView_ContainerViewController

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A9B393CC((uint64_t)v4);
}

- (void)updateBarItems
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.super.super.isa
                                         + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_viewModel)
                           + 1576);
  v3 = self;
  id v4 = (void *)v2();
  id v5 = objc_msgSend(v4, sel_toolbarItems);

  [(LemonadeCuratedLibraryView_ContainerViewController *)v3 setToolbarItems:v5];
}

- (void)scrollViewControllerContentInsetDidChange:(id)a3
{
  id v4 = a3;
  v11 = self;
  id v5 = [(LemonadeCuratedLibraryView_ContainerViewController *)v11 view];
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNeedsLayout);

    uint64_t v7 = *(uint64_t *)((char *)&v11->super.super.super.isa
                    + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_viewModel);
    id v8 = objc_msgSend(v4, sel_contentInset);
    v10.n128_u64[0] = v9;
    (*(void (**)(id, __n128))(*(void *)v7 + 2280))(v8, v10);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1A9B81790();
}

- (UINavigationItem)navigationItem
{
  v2 = *(uint64_t (**)(void))(**(void **)((char *)&self->super.super.super.isa
                                         + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_viewModel)
                           + 1576);
  v3 = self;
  id v4 = (void *)v2();
  id v5 = objc_msgSend(v4, sel_navigationItem);

  return (UINavigationItem *)v5;
}

- (void)setNeedsUpdate
{
  v2 = self;
  id v3 = [(LemonadeCuratedLibraryView_ContainerViewController *)v2 viewIfLoaded];
  objc_msgSend(v3, sel_setNeedsLayout);
}

- (CGRect)layout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  __n128 v10 = self;
  CGFloat v11 = sub_1A9C168F8(v9, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)curatedLibraryViewDidUpdateBars:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A9EA97AC();
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  sub_1A9B8116C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LemonadeCuratedLibraryView.ContainerViewController();
  id v4 = v6.receiver;
  [(LemonadeCuratedLibraryView_ContainerViewController *)&v6 viewDidAppear:v3];
  char v5 = v4[OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_hasAppearedOnce];
  v4[OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_hasAppearedOnce] = 1;
  if ((v5 & 1) == 0) {
    sub_1A9B39F50();
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LemonadeCuratedLibraryView.ContainerViewController();
  v2 = (char *)v6.receiver;
  [(LemonadeCuratedLibraryView_ContainerViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    id v4 = v3;
    char v5 = *(void **)&v2[OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_clippingView];
    objc_msgSend(v3, sel_addSubview_, v5);

    objc_msgSend(v5, sel_setClipsToBounds_, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)updateCuratedLibraryViewModel
{
  v2 = self;
  sub_1A9D01764();
}

- (void)updateScrollView
{
  v2 = self;
  sub_1A9B39738();
}

- (LemonadeCuratedLibraryView_ContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A9EA94E4();
}

- (void)updateResetCuratedLibraryView
{
  v2 = self;
  sub_1A9EA8810();
}

- (void)curatedLibraryViewRequestImmediateUpdate:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1A9B5A7DC();
}

- (void)scrollViewControllerWillBeginScrollingAnimation:(id)a3 towardsContentEdges:(unint64_t)a4
{
  char v4 = *((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isAnimatingScrollTowardsEdge);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isAnimatingScrollTowardsEdge) = 1;
  if ((v4 & 1) == 0)
  {
    id v6 = a3;
    uint64_t v7 = self;
    sub_1A9B39F50();
  }
}

- (void)scrollViewControllerDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1A9EA9B5C();
}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  uint64_t v3 = OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isPerformingScrollAnimation;
  int v4 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isPerformingScrollAnimation);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_isPerformingScrollAnimation) = 0;
  if (v4 == 1)
  {
    id v6 = a3;
    uint64_t v7 = self;
    uint64_t v8 = sub_1A9EA80C4();
    (*(void (**)(void))(*(void *)v8 + 184))(*((unsigned __int8 *)&self->super.super.super.isa + v3));

    swift_release();
  }
}

- (LemonadeCuratedLibraryView_ContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGRect result = (LemonadeCuratedLibraryView_ContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_updater));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_curatedLibraryViewModel));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_zoomableViewModel));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_miniModeAnimator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_librarySummaryPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController_clippingView));
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___LemonadeCuratedLibraryView_ContainerViewController____lazy_storage___cplStatusProvider);
}

@end