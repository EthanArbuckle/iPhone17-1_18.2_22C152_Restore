@interface ICSmartFolderComposerViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (ICSmartFolderComposerViewController)initWithAccount:(id)a3 smartFolder:(id)a4 completion:(id)a5;
- (ICSmartFolderComposerViewController)initWithCoder:(id)a3;
- (ICSmartFolderComposerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)consumedBottomAreaForResizer:(id)a3;
- (id)keyboardResizerScrollView;
- (void)cancelActionWithSender:(id)a3;
- (void)doneActionWithSender:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICSmartFolderComposerViewController

- (ICSmartFolderComposerViewController)initWithCoder:(id)a3
{
}

- (ICSmartFolderComposerViewController)initWithAccount:(id)a3 smartFolder:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = a4;
  return (ICSmartFolderComposerViewController *)sub_100488CC8(v9, a4, (uint64_t)sub_10048BF28, v8);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(ICSmartFolderComposerViewController *)&v6 viewDidLoad];
  sub_100488FF4();
  id v3 = objc_allocWithZone((Class)ICScrollViewKeyboardResizer);
  id v4 = [v3 initWithDelegate:v2];
  v5 = *(void **)&v2[OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer];
  *(void *)&v2[OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer] = v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_100489390(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100489D70(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer);
  v7 = self;
  if (v6) {
    [v6 stopAutoResizing];
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(ICSmartFolderComposerViewController *)&v8 viewWillDisappear:v3];
}

- (void)cancelActionWithSender:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v6 = a3;
  v7 = self;
  sub_10048B3F4((uint64_t)v6, v7, v5);

  swift_release();
}

- (void)doneActionWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10048BC48();
}

- (ICSmartFolderComposerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICSmartFolderComposerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___doneBarButtonItem));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSmartFolderComposerViewController_tagSelection));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSmartFolderComposerViewController_smartFolder);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSmartFolderComposerViewController_scrollViewKeyboardResizer);
  if (v3)
  {
    uint64_t v5 = (ICSmartFolderComposerViewController *)a3;
    v7 = self;
    if ([v3 fullyShowingKeyboard])
    {
      uint64_t v6 = sub_100487D6C();
      [v6 endEditing:1];

      uint64_t v5 = v7;
      v7 = (ICSmartFolderComposerViewController *)v6;
    }
  }
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(ICSmartFolderComposerViewController *)v5 view];
  if (v6)
  {
    objc_super v8 = v6;
    [v6 safeAreaInsets];
    double v10 = v9;

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)keyboardResizerScrollView
{
  v2 = self;
  BOOL v3 = sub_100487D6C();

  return v3;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100243634(&OBJC_IVAR___ICSmartFolderComposerViewController____lazy_storage___cancelBarButtonItem, &selRef_cancelActionWithSender_, 1);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10048B3F4((uint64_t)v6, v5, v7);

  swift_release();
}

@end