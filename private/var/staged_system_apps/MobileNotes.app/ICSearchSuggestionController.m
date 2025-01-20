@interface ICSearchSuggestionController
- (ICSearchSuggestionController)init;
- (ICSearchSuggestionController)initWithParentView:(id)a3 delegate:(id)a4;
- (UICollectionView)collectionView;
- (uint64_t)collectionView:(void *)a3 canFocusItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)hide;
- (void)showWithAnimated:(BOOL)a3 transitionCoordinator:(id)a4 searchBarFrame:(CGRect)a5;
- (void)updateForSuggestions:(id)a3;
@end

@implementation ICSearchSuggestionController

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___ICSearchSuggestionController_collectionView));
}

- (ICSearchSuggestionController)initWithParentView:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (ICSearchSuggestionController *)sub_10028A580(v5, (uint64_t)a4);
}

- (void)showWithAnimated:(BOOL)a3 transitionCoordinator:(id)a4 searchBarFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  swift_unknownObjectRetain();
  v12 = self;
  sub_10028B214(a3, a4, x, y, width, height);
  swift_unknownObjectRelease();
}

- (void)updateForSuggestions:(id)a3
{
  uint64_t v4 = sub_10002F214((uint64_t *)&unk_1006A1360);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031418(0, (unint64_t *)&unk_1006A3630);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_10028AFEC(v8, 0);
  dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  swift_bridgeObjectRelease();
}

- (void)hide
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSearchSuggestionController_collectionView);
  uint64_t v6 = self;
  id v3 = [v2 superview];
  if (v3)
  {
    id v4 = v3;
    id v5 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___ICSearchSuggestionController_parentView);

    if (v4 == v5)
    {
      [v2 setHidden:1];
      [v2 removeFromSuperview];
    }
  }
}

- (ICSearchSuggestionController)init
{
  result = (ICSearchSuggestionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSearchSuggestionController_collectionView);
}

- (uint64_t)collectionView:(void *)a3 canFocusItemAtIndexPath:
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a1;
  LOBYTE(a1) = sub_10028BD80();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a1 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10028BB98(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end