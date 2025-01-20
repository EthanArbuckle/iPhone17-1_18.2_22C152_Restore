@interface VerticalStackViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGRect)scrollViewVisibleBounds;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (_TtC16MusicApplication27VerticalStackViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27VerticalStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VerticalStackViewController

- (_TtC16MusicApplication27VerticalStackViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_533990();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController();
  v4 = v6.receiver;
  [(VerticalStackViewController *)&v6 viewWillAppear:v3];
  unsigned __int8 v5 = v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState];
  v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState] = v3;
  sub_52DF1C(v5);
  sub_52B798();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController();
  v4 = v6.receiver;
  [(VerticalStackViewController *)&v6 viewDidAppear:v3];
  unsigned __int8 v5 = *((unsigned char *)v4 + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState);
  *((unsigned char *)v4 + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState) = -127;
  sub_52DF1C(v5);
  (*(void (**)(uint64_t))&stru_158.segname[(swift_isaMask & *v4) + 8])(1);
  sub_52BAA0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController();
  v4 = v6.receiver;
  [(VerticalStackViewController *)&v6 viewWillDisappear:v3];
  unsigned __int8 v5 = v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState];
  v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState] = v3 | 0x40;
  sub_52DF1C(v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_52DD04(a3);
}

- (id)contentScrollView
{
  v2 = self;
  id v3 = sub_52866C();

  return v3;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  id v3 = self;
  id v4 = sub_52866C();

  return v4;
}

- (CGRect)scrollViewVisibleBounds
{
  v2 = self;
  id v3 = sub_52866C();
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_52EC8C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_52F0A4();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = self;
  sub_52F1BC(a3, a4);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_52F568((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  self;
  if (swift_dynamicCastObjCClass())
  {
    swift_unknownObjectRetain_n();
    double v7 = self;
    id v8 = sub_5284F8();
    double width = sub_5304F0(0.0, 0.0, width, height, (uint64_t)v8, 0x10000);
    double height = v9;

    swift_unknownObjectRelease_n();
  }
  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_533820();
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_5338DC();
}

- (_TtC16MusicApplication27VerticalStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC16MusicApplication27VerticalStackViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController____lazy_storage___scrollView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

@end