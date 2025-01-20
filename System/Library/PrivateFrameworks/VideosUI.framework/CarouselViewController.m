@interface CarouselViewController
- (_TtC8VideosUI22CarouselViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI22CarouselViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (unint64_t)numberOfItemsInCarouselView:(id)a3;
- (void)carouselView:(id)a3 didCenterItemAtIndex:(unint64_t)a4;
- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(unint64_t)a5;
- (void)carouselView:(id)a3 didSelectItemAtIndex:(unint64_t)a4;
- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(unint64_t)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)handleFullscreenPlaybackUIDidChange:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vui_willMoveToParentViewController:(id)a3;
@end

@implementation CarouselViewController

- (void)loadView
{
  v2 = self;
  sub_1E2FE16CC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E2FE1980(v4);
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E2FE1A48((uint64_t)a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E2FE1B78(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E2FE230C(v4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1E2FE2574();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1E2FE26DC(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1E2FE2A44();
}

- (void).cxx_destruct
{
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI22CarouselViewController_viewImpressioner, &qword_1EBF87B70);
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI22CarouselViewController_headerViewModel, &qword_1EBF8E898);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CarouselViewController_contextMenuInteractor));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CarouselViewController____lazy_storage___carouselViewContainer));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC8VideosUI22CarouselViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI22CarouselViewController *)sub_1E2FE33A0(v5, v7, a4);
}

- (_TtC8VideosUI22CarouselViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI22CarouselViewController *)sub_1E2FE3548(a3);
}

- (unint64_t)numberOfItemsInCarouselView:(id)a3
{
  return sub_1E2FE4828();
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  id v6 = OUTLINED_FUNCTION_28_9((uint64_t)self, (uint64_t)a2, a3);
  id v7 = v5;
  id v8 = (void *)sub_1E2FE4890((uint64_t)v7, v4);

  return v8;
}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  id v7 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v8 = v5;
  id v9 = v6;
  OUTLINED_FUNCTION_11_16();
  sub_1E2FE4E18(v10, v11, v12);
}

- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  id v7 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v8 = v5;
  id v9 = v6;
  OUTLINED_FUNCTION_11_16();
  sub_1E2FE50D4(v10, v11, v12);
}

- (void)carouselView:(id)a3 didCenterItemAtIndex:(unint64_t)a4
{
  id v6 = OUTLINED_FUNCTION_28_9((uint64_t)self, (uint64_t)a2, a3);
  id v7 = v5;
  sub_1E2FE5370((uint64_t)v7, v4);
}

- (void)carouselView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  id v6 = OUTLINED_FUNCTION_28_9((uint64_t)self, (uint64_t)a2, a3);
  id v7 = v5;
  sub_1E2FE5470((uint64_t)v7, v4);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = sub_1E2FE5994((uint64_t)v5);

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6 = OUTLINED_FUNCTION_28_9((uint64_t)self, (uint64_t)a2, a3);
  id v7 = v4;
  id v8 = v5;
  id v9 = sub_1E2FE5D40((uint64_t)v8, v7);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v8 = v5;
  swift_unknownObjectRetain();
  id v9 = v6;
  sub_1E2FE5E00();

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = OUTLINED_FUNCTION_10_4((uint64_t)self, (uint64_t)a2, a3);
  id v8 = v5;
  swift_unknownObjectRetain();
  id v9 = v6;
  OUTLINED_FUNCTION_11_16();
  sub_1E2FE5EAC(v10, v11, v12);

  swift_unknownObjectRelease();
}

- (void)handleFullscreenPlaybackUIDidChange:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  uint64_t v10 = self;
  sub_1E2FE6654();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

@end