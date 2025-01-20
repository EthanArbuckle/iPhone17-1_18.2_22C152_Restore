@interface EpisodeCollectionViewController
- (_TtC8VideosUI31EpisodeCollectionViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI31EpisodeCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5;
- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4;
- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5;
- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6;
- (void)vuiScrollViewDidEndDecelerating:(id)a3;
- (void)vuiScrollViewDidScroll:(id)a3;
- (void)vuiScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)vui_loadView;
- (void)vui_viewDidLayoutSubviews;
@end

@implementation EpisodeCollectionViewController

- (void)vui_loadView
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3082420();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E308272C();
}

- (_TtC8VideosUI31EpisodeCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8VideosUI31EpisodeCollectionViewController *)sub_1E3083AA4(v5, v7, a4);
}

- (_TtC8VideosUI31EpisodeCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI31EpisodeCollectionViewController *)sub_1E3083C44(a3);
}

- (void).cxx_destruct
{
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_viewImpressioner, &qword_1EBF87B70);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_dataSource));
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_currentSnapshot, &qword_1EADE93B8);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_cachedPrototypeCell));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_contextMenuInteractor);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_13();
  sub_1E3876448();
  id v7 = a3;
  id v8 = self;
  sub_1E3084FF4();

  uint64_t v9 = OUTLINED_FUNCTION_83_7();
  v10(v9);
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_14();
  sub_1E387C928();
  sub_1E3876448();
  swift_bridgeObjectRelease();
  uint64_t v7 = OUTLINED_FUNCTION_55_0();
  v8(v7);
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  uint64_t v9 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_20_9();
  sub_1E3876448();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_1E308549C();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
}

- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5
{
  uint64_t v9 = sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_20_9();
  sub_1E3876448();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_1E3085830();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v9);
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E3085A88(v4);
}

- (void)vuiScrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3085C4C();
}

- (void)vuiScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  id v8 = self;
  sub_1E3085CB0(v7, &a5->x);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  uint64_t v9 = (void *)sub_1E3087B50((uint64_t)v7, x, y);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1E3087E58();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3087F1C();

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_1E3087FD0((uint64_t)v10, v9, a5);

  swift_unknownObjectRelease();
}

@end