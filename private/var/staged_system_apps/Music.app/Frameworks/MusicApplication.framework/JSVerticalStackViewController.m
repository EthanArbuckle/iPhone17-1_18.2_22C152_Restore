@interface JSVerticalStackViewController
- (UIColor)viewBackgroundColor;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC16MusicApplication29JSVerticalStackViewController)initWithCoder:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setViewBackgroundColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation JSVerticalStackViewController

- (_TtC16MusicApplication29JSVerticalStackViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_B552C();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = (void *)(*(uint64_t (**)(void))((char *)&stru_388.offset
                                    + (swift_isaMask & (uint64_t)self->super.super.super.super.isa)))();

  return (UIViewController *)v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JSVerticalStackViewController();
  v4 = v7.receiver;
  [(VerticalStackViewController *)&v7 viewWillAppear:v3];
  [v4 _isInPopoverPresentation];
  v5 = (void *)(*(uint64_t (**)(void))((char *)&stru_388.offset + (swift_isaMask & *v4)))();
  if (v5)
  {
    v6 = v5;
    [v5 beginAppearanceTransition:1 animated:v3];
  }
  sub_B3310();
  sub_B36F0();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JSVerticalStackViewController();
  v4 = v8.receiver;
  id v5 = [(VerticalStackViewController *)&v8 viewWillDisappear:v3];
  v6 = (void *)(*(uint64_t (**)(id))((char *)&stru_388.offset + (swift_isaMask & *v4)))(v5);
  if (v6)
  {
    objc_super v7 = v6;
    [v6 beginAppearanceTransition:0 animated:v3];

    v4 = v7;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_AC2E4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_AC720();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSVerticalStackViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(JSVerticalStackViewController *)&v6 traitCollectionDidChange:v4];
  sub_B3310();
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSVerticalStackViewController();
  id v2 = v3.receiver;
  [(JSVerticalStackViewController *)&v3 viewSafeAreaInsetsDidChange];
  sub_B3310();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_AD600(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v8 = (*(uint64_t (**)(__n128, __n128))((char *)&stru_388.offset
                                                 + (swift_isaMask & (uint64_t)self->super.super.super.super.isa)))((__n128)a4, *(__n128 *)&a4.y);
  if (v8)
  {
    double x = a5->x;
    double y = a5->y;
    id v15 = (id)v8;
    id v11 = a3;
    v12 = self;
    sub_3A01A0(x, y);
    a5->double x = v13;
    a5->double y = v14;
  }
}

- (UIColor)viewBackgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for JSVerticalStackViewController();
  id v2 = [(JSVerticalStackViewController *)&v4 viewBackgroundColor];

  return v2;
}

- (void)setViewBackgroundColor:(id)a3
{
  id v5 = (objc_class *)type metadata accessor for JSVerticalStackViewController();
  v10.receiver = self;
  v10.super_class = v5;
  id v6 = a3;
  objc_super v7 = self;
  uint64_t v8 = [(JSVerticalStackViewController *)&v10 viewBackgroundColor];
  v9.receiver = v7;
  v9.super_class = v5;
  [(JSVerticalStackViewController *)&v9 setViewBackgroundColor:v6];
  sub_AEDF8();
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_customJSPageDetailsProvider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_pageHeaderContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_inlineBubbleTipViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_promotionalParallaxViewController));
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_metricsPageProperties, (uint64_t *)&unk_DC5B70);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_bottomStackItemBackgroundColor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_headerItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_inlineBubbleTipRequest));
  swift_release();

  swift_bridgeObjectRelease();
}

@end