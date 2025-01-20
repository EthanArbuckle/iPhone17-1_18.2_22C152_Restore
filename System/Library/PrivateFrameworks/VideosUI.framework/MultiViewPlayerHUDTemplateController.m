@interface MultiViewPlayerHUDTemplateController
- (VUIMultiPlayerDetailsViewControllerDelegate)detailDelegate;
- (_TtC8VideosUI36MultiViewPlayerHUDTemplateController)initWithCoder:(id)a3;
- (double)contentsHeight;
- (id)contentsDidLoad;
- (id)didInteract;
- (int64_t)itemCount;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)setContentsDidLoad:(id)a3;
- (void)setDetailDelegate:(id)a3;
- (void)setDidInteract:(id)a3;
- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3;
- (void)updateWithSelectedPlaybackIdentifiers:(id)a3 reloadingData:(BOOL)a4;
- (void)vuiScrollViewDidScroll:(id)a3;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
@end

@implementation MultiViewPlayerHUDTemplateController

- (int64_t)itemCount
{
  v2 = self;
  int64_t v3 = sub_1E36591E0();

  return v3;
}

- (double)contentsHeight
{
  v2 = self;
  double v3 = sub_1E365948C();

  return v3;
}

- (id)contentsDidLoad
{
  uint64_t v2 = sub_1E34A2FF4(&OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_contentsDidLoad, (void (*)(void, void))sub_1E2C5FBA0);
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1E2C4A3CC;
    v6[3] = &block_descriptor_25_1;
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
  if (v4)
  {
    uint64_t v5 = OUTLINED_FUNCTION_21_0();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1E3070BA0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1E3434910((uint64_t)v4, v5, (uint64_t)&OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_contentsDidLoad, (uint64_t (*)(uint64_t, uint64_t))sub_1E2C5FB90);
}

- (id)didInteract
{
  uint64_t v2 = sub_1E34A2FF4(&OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_didInteract, (void (*)(void, void))sub_1E2C5FBA0);
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1E34A3054;
    v6[3] = &block_descriptor_19_7;
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
  if (v4)
  {
    uint64_t v5 = OUTLINED_FUNCTION_21_0();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1E303D7D8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1E3434910((uint64_t)v4, v5, (uint64_t)&OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_didInteract, (uint64_t (*)(uint64_t, uint64_t))sub_1E2C5FB90);
}

- (VUIMultiPlayerDetailsViewControllerDelegate)detailDelegate
{
  uint64_t v2 = (void *)sub_1E3659B98();
  return (VUIMultiPlayerDetailsViewControllerDelegate *)v2;
}

- (void)setDetailDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1E3659C3C();
}

- (void)vui_viewDidLoad
{
  uint64_t v2 = self;
  sub_1E3659C84();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  uint64_t v3 = self;
  sub_1E365A2F0();
}

- (_TtC8VideosUI36MultiViewPlayerHUDTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E365AC34();
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E365AD90();
}

- (void)updateWithSelectedPlaybackIdentifiers:(id)a3 reloadingData:(BOOL)a4
{
  sub_1E387CC98();
  v6 = self;
  sub_1E365C88C((uint64_t)v6, a4);

  swift_bridgeObjectRelease();
}

- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3
{
  sub_1E387CC98();
  id v4 = self;
  sub_1E365D004();

  swift_bridgeObjectRelease();
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_contentsDidLoad));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_didInteract));
  id v3 = (char *)self + OBJC_IVAR____TtC8VideosUI36MultiViewPlayerHUDTemplateController_detailDelegate;
  sub_1E2F6ABF0((uint64_t)v3);
}

@end