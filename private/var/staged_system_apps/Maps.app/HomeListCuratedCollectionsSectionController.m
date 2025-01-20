@interface HomeListCuratedCollectionsSectionController
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5;
- (void)collectionsCarouselDidScrollBackward;
- (void)collectionsCarouselDidScrollForward;
- (void)exploreGuidesButtonTapped;
- (void)routeToCuratedCollection:(id)a3;
- (void)routeToGuidesHomeFromExploreGuides:(id)a3;
@end

@implementation HomeListCuratedCollectionsSectionController

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  self;
  uint64_t v12 = swift_dynamicCastObjCClass();
  if (v12)
  {
    uint64_t v13 = OBJC_IVAR____TtC4Maps43HomeListCuratedCollectionsSectionController_needsResetScrollOffset;
    if (*((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC4Maps43HomeListCuratedCollectionsSectionController_needsResetScrollOffset) == 1)
    {
      v14 = (void *)v12;
      id v15 = a3;
      id v16 = a4;
      v17 = self;
      [v14 resetScrollOffset];
      *((unsigned char *)&self->super.super.isa + v13) = 0;
    }
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps43HomeListCuratedCollectionsSectionController____lazy_storage___curatedCollectionsIdentifierPath));
}

- (void)routeToCuratedCollection:(id)a3
{
  sub_1000F1C90((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, (uint64_t)v8);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v6 = a3;
  v7 = self;
  sub_1000F1BD8((uint64_t)v8);
  if (Strong)
  {
    [Strong homeItemTapped:v6];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)routeToGuidesHomeFromExploreGuides:(id)a3
{
  sub_1000F1C90((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration, (uint64_t)v9);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v6 = a3;
  v7 = self;
  sub_1000F1BD8((uint64_t)v9);
  if (Strong)
  {
    id v8 = [v6 guideLocation];
    [Strong homeItemTapped:v8];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = self;

  [v8 captureCuratedCollectionCarouselTapCollectionWithIdentifier:a3 atIndex:a4 isSaved:v5];
}

- (void)collectionsCarouselDidScrollForward
{
  v2 = self;

  [v2 captureCuratedCollectionCarouselScrollForward];
}

- (void)collectionsCarouselDidScrollBackward
{
  v2 = self;

  [v2 captureCuratedCollectionCarouselScrollBackward];
}

- (void)exploreGuidesButtonTapped
{
  v2 = self;

  [v2 captureExploreGuidesTapAction];
}

@end