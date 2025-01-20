@interface LibraryRecommendationBannerViewController
- (BOOL)accessibilityIsExplicit;
- (MPButton)accessibilityCloseButton;
- (NSString)accessibilityHeadlineText;
- (NSString)accessibilitySubtitleText;
- (NSString)accessibilityTitleText;
- (UIView)accessibilityBannerView;
- (_TtC16MusicApplication41LibraryRecommendationBannerViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication41LibraryRecommendationBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation LibraryRecommendationBannerViewController

- (_TtC16MusicApplication41LibraryRecommendationBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_45A614();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(LibraryRecommendationBannerViewController *)&v5 viewWillDisappear:v3];
  sub_452C44();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_452FDC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_453194(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_4534FC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_453ED0();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[LibraryRecommendationBannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_45B07C;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_DCCD8;
  v11[3] = &block_descriptor_42;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_454480(a3);
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(LibraryRecommendationBannerViewController *)&v3 music_viewInheritedLayoutInsetsDidChange];
  sub_4541F0();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_4546E4(a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_4548B8(a3);
}

- (UIView)accessibilityBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_bannerView));
}

- (NSString)accessibilityHeadlineText
{
  return (NSString *)sub_455ED8();
}

- (NSString)accessibilityTitleText
{
  return (NSString *)sub_455ED8();
}

- (NSString)accessibilitySubtitleText
{
  return (NSString *)sub_455ED8();
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.super.super.isa
                            + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_bannerView)
                 + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_badgeView);
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (MPButton)accessibilityCloseButton
{
  uint64_t v2 = self;
  id v3 = sub_456C58();

  return (MPButton *)v3;
}

- (_TtC16MusicApplication41LibraryRecommendationBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication41LibraryRecommendationBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_recommendationContext);
  id v4 = *(void **)&self->recommendationContext[OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_recommendationContext
                                            + 16];
  swift_bridgeObjectRelease();

  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController____lazy_storage___accountButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_pageHeaderContentView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_contentOffsetObserver);
}

@end