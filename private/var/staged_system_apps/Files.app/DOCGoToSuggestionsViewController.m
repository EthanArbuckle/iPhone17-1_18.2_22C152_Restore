@interface DOCGoToSuggestionsViewController
- (BOOL)canBecomeFirstResponder;
- (NSArray)keyCommands;
- (_TtC5Files32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)performKeyCommand:(id)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation DOCGoToSuggestionsViewController

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  id v11 = sub_10050FA60();
  v12 = [(id)objc_allocWithZone((Class)type metadata accessor for DOCGoToSuggestionsCollectionView()) initWithFrame:x, y, width, height];

  v13 = (_TtC5Files32DOCGoToSuggestionsViewController **)&v12[OBJC_IVAR____TtC5FilesP33_D3104C987618D68A12FF2C3DB05A577232DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate];
  *v13 = self;
  v13[1] = (_TtC5Files32DOCGoToSuggestionsViewController *)&off_1006B4798;

  swift_unknownObjectRelease();
  return v12;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10051060C();
}

- (void)viewLayoutMarginsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToSuggestionsViewController();
  id v2 = v6.receiver;
  [(DOCGoToSuggestionsViewController *)&v6 viewLayoutMarginsDidChange];
  id v3 = [v2 collectionView];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 collectionViewLayout];

    [v5 invalidateLayout];
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_isFiltering) & 1) != 0)
    return 1;
  else {
    return (*(void **)((char *)&self->super.super.super.super.super.isa
  }
                       + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_100513784(a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_1005110DC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_100511A00(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_1005137E0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC5Files32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC5Files32DOCGoToSuggestionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->metrics[OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_metrics + 88];

  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files32DOCGoToSuggestionsViewController_suggestionsTableViewDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  id v2 = self;
  id v3 = sub_100512E10();

  if (v3)
  {
    sub_10009E6C4(0, &qword_100708860);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)performKeyCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(DOCGoToSuggestionsViewController *)v5 collectionView];
  if (!v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v9 = v6;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = swift_conformsToProtocol2();
  if (!v8)
  {
LABEL_7:
    __break(1u);
    return;
  }
  (*(void (**)(id, uint64_t, uint64_t))(v8 + 104))(v4, ObjectType, v8);
}

@end