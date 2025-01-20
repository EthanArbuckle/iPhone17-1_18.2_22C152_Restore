@interface ICFolderComposerViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (ICFolderComposerViewController)initWithAccount:(id)a3 folderTitle:(id)a4 smartFolderQuery:(id)a5 completion:(id)a6;
- (ICFolderComposerViewController)initWithCoder:(id)a3;
- (ICFolderComposerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)doneActionWithSender:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICFolderComposerViewController

- (ICFolderComposerViewController)initWithAccount:(id)a3 folderTitle:(id)a4 smartFolderQuery:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = a3;
  id v14 = a5;
  return (ICFolderComposerViewController *)sub_10030258C(v13, (uint64_t)a4, v11, a5, (uint64_t)sub_100304304, v12);
}

- (ICFolderComposerViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10030303C();
}

- (void)doneActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100303EB4();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_10015C304();
  dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();

  LOBYTE(v12) = v14[15];
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return v12 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100303FB8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_100304104(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (ICFolderComposerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICFolderComposerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerViewController_smartFolderQuery));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICFolderComposerViewController_collectionView));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICFolderComposerViewController_filterViewController);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = (ICFolderComposerViewController *)a3;
  uint64_t v7 = self;
  v5 = (ICFolderComposerViewController *)sub_10015BE94();
  if (v5)
  {
    uint64_t v6 = v5;
    [(ICFolderComposerViewController *)v5 endEditing:0];

    id v4 = v7;
    uint64_t v7 = v6;
  }
}

@end