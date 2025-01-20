@interface StickerCollectionViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (_TtC10StickersUI31StickerCollectionViewController)initWithCoder:(id)a3;
- (_TtC10StickersUI31StickerCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10StickersUI31StickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP10StickersUI38StickerProvidingViewControllerDelegate_)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)avtStickerRecentRenderedWithIdentifier:(id)a3 localizedDescription:(id)a4 image:(id)a5 url:(id)a6 avatarRecordIdentifier:(id)a7 stickerConfigurationIdentifier:(id)a8;
- (void)avtStickerRecentStoreDidChange;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)dealloc;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)handleLongPress:(id)a3;
- (void)handleStickerCreationProgressUpdateNotification:(id)a3;
- (void)handleTap:(id)a3;
- (void)makeStickerFromPhotoPicker;
- (void)photoPickerDidDismiss;
- (void)setDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation StickerCollectionViewController

- (_TtP10StickersUI38StickerProvidingViewControllerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2611D9870](v2);

  return (_TtP10StickersUI38StickerProvidingViewControllerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_25E474E20();

  swift_unknownObjectRelease();
}

- (_TtC10StickersUI31StickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC10StickersUI31StickerCollectionViewController *)sub_25E45AAA8(a3);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  v2 = v11.receiver;
  id v3 = [(StickerCollectionViewController *)&v11 viewDidLoad];
  v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = (*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v2) + 0x428))(v3);
  (*(void (**)(uint64_t))((*v4 & *v2) + 0x448))(v5);
  sub_25E45C320();
  (*(void (**)(uint64_t, uint64_t))((*v4 & *v2) + 0x430))(v6, v7);
  id v8 = objc_msgSend(v2, sel_view, v11.receiver, v11.super_class);
  if (v8)
  {
    v9 = v8;
    type metadata accessor for KeylineView();
    v10 = sub_25E489D50(v9);
    (*(void (**)(void *))((*v4 & *v2) + 0x3F0))(v10);
  }
  else
  {
    __break(1u);
  }
}

- (void)dealloc
{
  v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x438);
  id v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  [(StickerCollectionViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_25E4417FC((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_lastAddedStickerIdentifier, &qword_26A6EFD80);
  swift_release();
  sub_25E43DCDC((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_delegate);
  id v3 = (char *)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_storeType;
  uint64_t v4 = sub_25E4A2500();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_editMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_placeholderImageView));
  sub_25E4417FC((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addingStickerIdentifier, &qword_26A6EFD80);
  sub_25E4417FC((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addingRecentStickerIdentifier, &qword_26A6EFD80);
  sub_25E4417FC((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_hiddenStickerViewIdentifier, &qword_26A6EFD80);
  sub_25E4426B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_completionHandlerWaitingForStickerBound));
  sub_25E4426B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_completionHandlerWaitingForStickerDisplay));
  sub_25E4417FC((uint64_t)self + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_needsMenuPresentationStickerIdentifier, &qword_26A6EFD80);
  sub_25E474FD4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(void **)((char *)&self->super.super._view+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun), *(void **)((char *)&self->super.super._tabBarItem+ OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_addContextToRun));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_animationContextImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_dataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_insertLocationMarker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_collectionLayout));
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_keyline);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  uint64_t v4 = v10.receiver;
  id v5 = [(StickerCollectionViewController *)&v10 viewWillAppear:v3];
  uint64_t v6 = (void *)MEMORY[0x263F8EED0];
  uint64_t v7 = *(void *)(*(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & *v4) + 0x350))(v5);
  (*(void (**)(void *, _UNKNOWN **))(v7 + 416))(v4, &off_270B282C8);
  swift_release();
  id v8 = objc_msgSend(v4, sel_collectionView, v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_reloadData);

    (*(void (**)(uint64_t))((*v6 & *v4) + 0x1D8))(1);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_25E45CE4C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StickerCollectionViewController(0);
  [(StickerCollectionViewController *)&v4 viewDidDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_25E45D244();
}

- (void)photoPickerDidDismiss
{
  v2 = self;
  sub_25E45DEA8();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25E4A1F00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A1EB0();
  id v10 = a3;
  objc_super v11 = self;
  sub_25E463088(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25E4A1F00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A1EB0();
  id v10 = a3;
  objc_super v11 = self;
  id v12 = sub_25E4637D8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v8 = sub_25E4A1F00();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  v15 = (char *)&v31 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v18 = (char *)&v31 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v19);
  v33 = v20;
  v34 = (char *)&v31 - v21;
  sub_25E4A1EB0();
  sub_25E4A1EB0();
  sub_25E4A1EB0();
  v22 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x388);
  id v32 = a3;
  v23 = self;
  LOBYTE(self) = v22();
  v24 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v24(v12, v15, v8);
  if (self)
  {
    uint64_t v25 = sub_25E4A1ED0();
    v26 = *(void (**)(char *, uint64_t))(v9 + 8);
    v26(v12, v8);
    if (v25) {
      v27 = v15;
    }
    else {
      v27 = v18;
    }
  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v9 + 8);
    v26(v12, v8);
    v27 = v15;
  }
  v28 = v34;
  v24(v34, v27, v8);

  v26(v15, v8);
  v26(v18, v8);
  v26(v33, v8);
  v29 = (void *)sub_25E4A1EA0();
  v26(v28, v8);

  return v29;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
}

- (void)makeStickerFromPhotoPicker
{
  v2 = self;
  sub_25E4655F4();
}

- (void)handleStickerCreationProgressUpdateNotification:(id)a3
{
}

- (_TtC10StickersUI31StickerCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10StickersUI31StickerCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10StickersUI31StickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10StickersUI31StickerCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)avtStickerRecentRenderedWithIdentifier:(id)a3 localizedDescription:(id)a4 image:(id)a5 url:(id)a6 avatarRecordIdentifier:(id)a7 stickerConfigurationIdentifier:(id)a8
{
  uint64_t v10 = sub_25E4A1DA0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25E4A1E30();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A1E10();
  sub_25E4A1D50();
  id v18 = a5;
  uint64_t v19 = self;
  sub_25E476C84((uint64_t)v17);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)avtStickerRecentStoreDidChange
{
  v2 = self;
  StickerCollectionViewController.avtStickerRecentStoreDidChange()();
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_25E4A1F00();
  uint64_t v6 = sub_25E4A28D0();
  uint64_t v7 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x350);
  id v8 = a3;
  uint64_t v9 = self;
  uint64_t v10 = *(void *)v7();
  (*(void (**)(uint64_t))(v10 + 504))(v6);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25E472A68(v4);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = sub_25E477850(v8);

  return v10;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_25E47938C(v7);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC10StickersUI31StickerCollectionViewController_isPresentingEditMenu) = 1;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  double v9 = self;
  _s10StickersUI31StickerCollectionViewControllerC19editMenuInteraction_011willDismissH3For8animatorySo06UIEdithI0C_So0nH13ConfigurationCSo0nhI9Animating_ptF_0();

  swift_unknownObjectRelease();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25E47337C(v4);
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_25E4A1F00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A1EB0();
  double v10 = *(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x460);
  id v11 = a3;
  double v12 = self;
  LOBYTE(self) = v10(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (self & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = _s10StickersUI31StickerCollectionViewControllerC17gestureRecognizer_13shouldReceiveSbSo09UIGestureH0C_So7UITouchCtF_0(v6);

  return v9 & 1;
}

@end