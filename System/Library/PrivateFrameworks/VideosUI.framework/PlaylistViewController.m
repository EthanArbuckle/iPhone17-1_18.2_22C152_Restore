@interface PlaylistViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (_TtC8VideosUI22PlaylistViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI22PlaylistViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
@end

@implementation PlaylistViewController

- (BOOL)prefersStatusBarHidden
{
  return sub_1E30057E0() & 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return sub_1E3005820();
}

- (_TtC8VideosUI22PlaylistViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3007B20();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3008D40();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3008E38(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3008EDC(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3009038(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E30090FC();
}

- (_TtC8VideosUI22PlaylistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E300C140();
}

- (void).cxx_destruct
{
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_collectionImpressioner, &qword_1EBF8B120);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_headerView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_backgroundMediaInfo));
  OUTLINED_FUNCTION_68_6(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_hostMetadataView);
  OUTLINED_FUNCTION_68_6(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_playbackDidBegin);
  OUTLINED_FUNCTION_68_6(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_initialMediaLoaded);
  OUTLINED_FUNCTION_68_6(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_indexDidChange);
  OUTLINED_FUNCTION_68_6(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_onClosePressed);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22PlaylistViewController____lazy_storage___backgroundMediaController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_interactionManager));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_boundaryObserver, &qword_1EBF91570);
  id v3 = (char *)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController__contentAspectRatio;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFAC1C8);
  OUTLINED_FUNCTION_2();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end