@interface JurassicShareViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC21JournalShareExtension27JurassicShareViewController)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension27JurassicShareViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (uint64_t)textViewDidBeginEditing:(void *)a3;
- (void)cancelTapped:(id)a3;
- (void)dealloc;
- (void)doneTapped:(id)a3;
- (void)extensionWillEnterForeground;
- (void)presentKeyboard;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation JurassicShareViewController

- (void)dealloc
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_coordinator);
  v4 = self;
  v5 = self;
  swift_retain();
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v3];
  swift_release();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for JurassicShareViewController();
  [(JurassicShareViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_linkAsset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_gridCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_textView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_gridViewTopConstraint));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10002F518();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JurassicShareViewController();
  id v4 = v5.receiver;
  [(JurassicShareViewController *)&v5 viewWillAppear:v3];
  sub_1000D17BC();
  sub_100030B64();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JurassicShareViewController();
  id v4 = v5.receiver;
  [(JurassicShareViewController *)&v5 viewDidAppear:v3];
  sub_1000D1310();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JurassicShareViewController();
  id v4 = (char *)v7.receiver;
  [(JurassicShareViewController *)&v7 viewWillDisappear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_coordinator];
  id v6 = [self defaultCenter];
  [v6 removeObserver:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100031484(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)extensionWillEnterForeground
{
  v2 = self;
  sub_1000317D0();
}

- (_TtC21JournalShareExtension27JurassicShareViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100109D30();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC21JournalShareExtension27JurassicShareViewController *)sub_100031C14(v5, v7, a4);
}

- (_TtC21JournalShareExtension27JurassicShareViewController)initWithCoder:(id)a3
{
  return (_TtC21JournalShareExtension27JurassicShareViewController *)sub_100031FF8(a3);
}

- (void)doneTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000374D8();
}

- (void)cancelTapped:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  uint64_t v6 = self;
  id v7 = a3;
  sub_1000DB7DC(v6, (uint64_t)sub_100037410, v5);

  swift_release();
}

- (void)presentKeyboard
{
  v2 = self;
  sub_100032BA0();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_photoAssets);
  if (v4 >> 62)
  {
    id v8 = a3;
    v9 = self;
    swift_bridgeObjectRetain();
    int64_t v5 = sub_10010AA80();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 >= 13) {
    return 13;
  }
  else {
    return v5;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100109630();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100109610();
  id v10 = a3;
  v11 = self;
  sub_100036FE0(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (uint64_t)textViewDidBeginEditing:(void *)a3
{
  if (*(void *)(result + OBJC_IVAR____TtC21JournalShareExtension27JurassicShareViewController_canvasIdleTracker))
  {
    BOOL v3 = (void *)result;
    id v4 = a3;
    id v5 = v3;
    swift_retain();
    sub_10009BF1C();

    return swift_release();
  }
  return result;
}

@end