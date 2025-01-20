@interface STKStickerKeyboardRecentCollectionViewController
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (STKStickerKeyboardRecentCollectionViewController)init;
- (STKStickerKeyboardRecentCollectionViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation STKStickerKeyboardRecentCollectionViewController

- (STKStickerKeyboardRecentCollectionViewController)init
{
  uint64_t v2 = sub_25E4A2500();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F798B8], v2);
  v7 = (STKStickerKeyboardRecentCollectionViewController *)(*(uint64_t (**)(char *, double, double, double, double))(ObjectType + 1024))(v5, 0.0, 0.0, 0.0, 0.0);
  swift_deallocPartialClassInstance();
  return v7;
}

- (STKStickerKeyboardRecentCollectionViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_25E4A1E20();
  v5 = (objc_class *)MEMORY[0x263F8EE88];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_blankCellUUIDs) = (Class)MEMORY[0x263F8EE88];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_blankCellIndexPaths) = v5;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_previousContainerSize);
  void *v6 = 0;
  v6[1] = 0;

  result = (STKStickerKeyboardRecentCollectionViewController *)sub_25E4A2EA0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StickerKeyboardRecentCollectionViewController();
  id v2 = v6.receiver;
  [(StickerCollectionViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  sub_25E48F700();
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_25E4A1F00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A1EB0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void).cxx_destruct
{
  id v2 = (char *)self + OBJC_IVAR___STKStickerKeyboardRecentCollectionViewController_moreButtonIdentifier;
  uint64_t v3 = sub_25E4A1E30();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end