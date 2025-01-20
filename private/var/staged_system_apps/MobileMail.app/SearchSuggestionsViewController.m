@interface SearchSuggestionsViewController
- (BOOL)hasSuggestions;
- (UICollectionView)collectionView;
- (UIScrollView)observableScrollView;
- (_TtC10MobileMail31SearchSuggestionsViewController)initWithCoder:(id)a3;
- (_TtC10MobileMail31SearchSuggestionsViewController)initWithMailScene:(id)a3 contactStore:(id)a4 delegate:(id)a5;
- (_TtC10MobileMail31SearchSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)searchSuggestionsForCategory:(id)a3;
- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3;
- (id)viewForKeyboardAvoidance:(id)a3;
- (void)beginUpdatingSuggestions;
- (void)clearSuggestions;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didRemoveSearchSuggestion:(id)a3;
- (void)endUpdatingSuggestions;
- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4;
- (void)reportVisibleSuggestionResults;
- (void)setCollectionView:(id)a3;
- (void)shouldReloadSearchSuggestion:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutMargins:(UIEdgeInsets)a3;
- (void)updateSuggestionsWithResult:(id)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SearchSuggestionsViewController

- (BOOL)hasSuggestions
{
  v2 = self;
  sub_1003E7E50();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (UICollectionView)collectionView
{
  v2 = self;
  id v5 = sub_1003E8188();

  return (UICollectionView *)v5;
}

- (void)setCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003E82D4(a3);
}

- (_TtC10MobileMail31SearchSuggestionsViewController)initWithMailScene:(id)a3 contactStore:(id)a4 delegate:(id)a5
{
  id v5 = a3;
  id v6 = a4;
  swift_unknownObjectRetain();
  return (_TtC10MobileMail31SearchSuggestionsViewController *)sub_1003ECDFC(a3, a4, (uint64_t)a5);
}

- (_TtC10MobileMail31SearchSuggestionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003EE044();
}

- (void)dealloc
{
  v2 = self;
  sub_1003EE2CC();
}

- (void).cxx_destruct
{
  uint64_t v9 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_contactCellRegistration;
  uint64_t v2 = sub_10001C210(&qword_100698400);
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v9);
  uint64_t v10 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_documentCellRegistration;
  uint64_t v3 = sub_10001C210(&qword_1006983F8);
  (*(void (**)(char *))(*(void *)(v3 - 8) + 8))((char *)self + v10);
  uint64_t v11 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_legacySuggestedSearchRegistration;
  uint64_t v12 = sub_10001C210(&qword_1006983F0);
  v13 = *(void (**)(char *))(*(void *)(v12 - 8) + 8);
  v13((char *)self + v11);
  ((void (*)(char *, uint64_t))v13)((char *)self + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_listCellRegistration, v12);
  uint64_t v14 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_linkCellRegistration;
  uint64_t v4 = sub_10001C210(&qword_1006983E8);
  (*(void (**)(char *))(*(void *)(v4 - 8) + 8))((char *)self + v14);
  uint64_t v15 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_locationCellRegistration;
  uint64_t v5 = sub_10001C210(&qword_1006983E0);
  (*(void (**)(char *))(*(void *)(v5 - 8) + 8))((char *)self + v15);
  uint64_t v16 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_photoCellRegistration;
  uint64_t v6 = sub_10001C210(&qword_1006983D8);
  (*(void (**)(char *))(*(void *)(v6 - 8) + 8))((char *)self + v16);
  uint64_t v17 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_instantAnswerFlightCellRegistration;
  uint64_t v7 = sub_10001C210(&qword_1006983D0);
  (*(void (**)(char *))(*(void *)(v7 - 8) + 8))((char *)self + v17);
  uint64_t v18 = OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_instantAnswerHotelCellRegistration;
  uint64_t v8 = sub_10001C210(&qword_1006983C8);
  (*(void (**)(char *))(*(void *)(v8 - 8) + 8))((char *)self + v18);
  sub_1003FEDD0((uint64_t)self + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_topHitCellRegistration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_cellRegistrationFactory));
  sub_10001B0B0();
  sub_10024C328((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController_scene));
  sub_100287934();
  sub_10024C328((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___collectionView));
  sub_1003FEE84((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___cellProvider));
  sub_10022FCDC();
  sub_1003FEE84((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail31SearchSuggestionsViewController____lazy_storage___supplementaryViewProvider));
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_1003EE728();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  sub_1003F1FEC(v4 & 1);
}

- (void)viewLayoutMarginsDidChange
{
  uint64_t v2 = self;
  sub_1003F2230();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003F23A4(a3);
}

- (_TtC10MobileMail31SearchSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (_TtC10MobileMail31SearchSuggestionsViewController *)sub_1003F4AE8();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v14 = self;
  id v15 = a3;
  id v13 = a4;
  uint64_t v12 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (uint64_t)&v8 - v8;
  id v5 = (id)__chkstk_darwin(v15);
  id v6 = v13;
  uint64_t v7 = self;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1003F4CCC(v15, v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v17 = self;
  id v19 = a3;
  id v18 = a4;
  id v16 = a5;
  uint64_t v15 = type metadata accessor for IndexPath();
  uint64_t v12 = *(void *)(v15 - 8);
  uint64_t v13 = v15 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (char *)&v10 - v11;
  id v6 = (id)__chkstk_darwin(v19);
  id v7 = v18;
  id v8 = v16;
  uint64_t v9 = self;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1003F6490((uint64_t)v19);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v15);
}

- (UIScrollView)observableScrollView
{
  uint64_t v2 = self;
  id v5 = sub_1003F6668();

  return (UIScrollView *)v5;
}

- (void)clearSuggestions
{
  uint64_t v2 = self;
  sub_1003F6694();
}

- (void)beginUpdatingSuggestions
{
  uint64_t v2 = self;
  sub_1003F684C();
}

- (void)endUpdatingSuggestions
{
  uint64_t v2 = self;
  sub_1003F69FC();
}

- (void)updateSuggestionsWithResult:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F6B7C(a3);
}

- (id)searchSuggestionsForCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F8190((uint64_t)a3);

  sub_1003FF520();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return isa;
}

- (void)reportVisibleSuggestionResults
{
  uint64_t v2 = self;
  sub_1003F828C();
}

- (void)updateLayoutMargins:(UIEdgeInsets)a3
{
  uint64_t v3 = self;
  sub_1003F8328(a3.top, a3.left, a3.bottom, a3.right);
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v9 = sub_1003F8448();

  return v9;
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v9 = (id)sub_1003F84F0();

  return v9;
}

- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1003F8584(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)shouldReloadSearchSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F8788(a3);
}

- (void)didRemoveSearchSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F8844((uint64_t)a3);
}

@end