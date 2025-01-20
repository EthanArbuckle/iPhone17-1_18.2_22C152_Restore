@interface PlayerHUDDocumentViewController
- (VUIMultiPlayerDetailsViewControllerDelegate)detailDelegate;
- (_TtC8VideosUI31PlayerHUDDocumentViewController)initWithCoder:(id)a3;
- (double)contentsHeight;
- (double)nowPlayingTabHeight;
- (id)contentsDidLoad;
- (id)didInteract;
- (id)getNowPlayingTabContextData;
- (int64_t)itemCount;
- (void)recordImpressionsHandler;
- (void)recordPageHandler;
- (void)setContentsDidLoad:(id)a3;
- (void)setDetailDelegate:(id)a3;
- (void)setDidInteract:(id)a3;
- (void)setNowPlayingTabContextData:(id)a3;
- (void)setNowPlayingTabDelegate:(id)a3;
- (void)setPlayerViewSize:(CGSize)a3;
- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3;
- (void)updateWithSelectedPlaybackIdentifiers:(id)a3 reloadingData:(BOOL)a4;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation PlayerHUDDocumentViewController

- (double)contentsHeight
{
  v2 = self;
  double v3 = sub_1E34A2B48();

  return v3;
}

- (id)contentsDidLoad
{
  uint64_t v2 = sub_1E34A2C90();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    OUTLINED_FUNCTION_307();
    v6[2] = sub_1E2C4A3CC;
    v6[3] = &block_descriptor_47_2;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setContentsDidLoad:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v4;
  }
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_8_132();
  sub_1E34A2D40(v6, v7);
}

- (id)didInteract
{
  uint64_t v2 = sub_1E34A2FD4();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    OUTLINED_FUNCTION_307();
    v6[2] = sub_1E34A3054;
    v6[3] = &block_descriptor_41_3;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setDidInteract:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v4;
  }
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_8_132();
  sub_1E34A30E8(v6, v7);
}

- (int64_t)itemCount
{
  uint64_t v2 = self;
  id v3 = sub_1E34A3404();

  return (int64_t)v3;
}

- (VUIMultiPlayerDetailsViewControllerDelegate)detailDelegate
{
  uint64_t v2 = (void *)sub_1E34A34D4();
  return (VUIMultiPlayerDetailsViewControllerDelegate *)v2;
}

- (void)setDetailDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E34A356C();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E34A37D0();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E34A389C();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E34A3AE0();
}

- (void)vui_viewDidLoad
{
  uint64_t v2 = self;
  sub_1E34A3B68();
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E34A4708();
}

- (void)updateWithSelectedPlaybackIdentifiers:(id)a3 reloadingData:(BOOL)a4
{
  sub_1E387CC98();
  uint64_t v6 = self;
  uint64_t v7 = OUTLINED_FUNCTION_12_15();
  sub_1E34A4CA8(v7, a4);

  swift_bridgeObjectRelease();
}

- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3
{
  sub_1E387CC98();
  id v5 = self;
  OUTLINED_FUNCTION_12_15();
  sub_1E34A4E4C();

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI31PlayerHUDDocumentViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI31PlayerHUDDocumentViewController *)sub_1E34A5100(a3);
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_nowPlayingTabDelegate);
  swift_bridgeObjectRelease();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_contentsDidLoad));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_didInteract));
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_detailDelegate);
  swift_release();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI31PlayerHUDDocumentViewController_focusButton);
}

- (void)recordPageHandler
{
  uint64_t v2 = self;
  sub_1E34A53C4();
}

- (void)recordImpressionsHandler
{
  uint64_t v2 = self;
  sub_1E34A5474();
}

- (void)setNowPlayingTabDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E34A54FC();
  swift_unknownObjectRelease();
}

- (id)getNowPlayingTabContextData
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1E34A567C();

  if (v3)
  {
    id v4 = (void *)sub_1E387C668();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setNowPlayingTabContextData:(id)a3
{
  sub_1E387C678();
  id v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_12_15();
  sub_1E34A5804(v6);

  swift_bridgeObjectRelease();
}

- (double)nowPlayingTabHeight
{
  uint64_t v2 = self;
  double v3 = sub_1E34A5A08();

  return v3;
}

- (void)setPlayerViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_1E34A5B58(width, height);
}

@end