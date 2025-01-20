@interface PosterRackStackedLayout
- (BOOL)_disablesDoubleSidedAnimations;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGSize)collectionViewContentSize;
- (_TtC11PosterBoard23PosterRackStackedLayout)init;
- (_TtC11PosterBoard23PosterRackStackedLayout)initWithCoder:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)finalizeCollectionViewUpdates;
- (void)finalizeLayoutTransition;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareForTransitionFromLayout:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
@end

@implementation PosterRackStackedLayout

- (_TtC11PosterBoard23PosterRackStackedLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D32EA638();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  sub_1D32CE184(0, &qword_1EA6A8D58);
  sub_1D3372348();
  v4 = self;
  v5 = (void *)sub_1D3372338();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PosterRackStackedLayout();
  [(PosterRackStackedLayout *)&v6 prepareForCollectionViewUpdates:v5];

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PosterRackStackedLayout();
  v2 = (char *)v4.receiver;
  [(PosterRackStackedLayout *)&v4 finalizeCollectionViewUpdates];
  id v3 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_sectionIndexPathsToDelete];
  swift_beginAccess();
  *(void *)id v3 = MEMORY[0x1E4FBC860];

  swift_bridgeObjectRelease();
}

- (void)prepareForTransitionToLayout:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterRackStackedLayout();
  id v4 = a3;
  v5 = (char *)v8.receiver;
  [(PosterRackStackedLayout *)&v8 prepareForTransitionToLayout:v4];
  uint64_t v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = &v5[OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_layoutModeTransitioningTo];
    *(void *)v7 = *(void *)(v6 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_layoutMode);
    v7[8] = 0;
  }
}

- (void)prepareForTransitionFromLayout:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32E48B8(v4);
}

- (void)finalizeLayoutTransition
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD6F930);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for PosterRackStackedLayout();
  v12.receiver = self;
  v12.super_class = v6;
  v7 = self;
  [(PosterRackStackedLayout *)&v12 finalizeLayoutTransition];
  uint64_t v8 = sub_1D3372088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_indexPathToMaintainForTransition;
  swift_beginAccess();
  sub_1D32EA5D0((uint64_t)v5, v9);
  swift_endAccess();
  v10 = (char *)v7 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_layoutModeTransitioningTo;
  *(void *)v10 = 0;
  v10[8] = 1;
}

- (void)prepareLayout
{
  v2 = self;
  sub_1D32E4E58();
}

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)((char *)&self->super._collectionViewBoundsSize.width
                 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_contentBounds);
  double v3 = *(double *)((char *)&self->super._collectionViewBoundsSize.height
                 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_contentBounds);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_1D32E8670(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1D32E77A4);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1D32E8D50(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1D32E7B4C);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1D32E8D50(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1D32E7DB4);
}

- (BOOL)_disablesDoubleSidedAnimations
{
  return 1;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_1D32E8670(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1D32E7F3C);
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1D32E8D50(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1D32E8778);
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:
{
  swift_beginAccess();
  sub_1D3372088();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1D3372338();
  swift_bridgeObjectRelease();
  return v0;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_1D32E8F10(x, y, width, height);

  if (v8)
  {
    sub_1D32CE184(0, (unint64_t *)&qword_1EBD6FD98);
    uint64_t v9 = (void *)sub_1D3372338();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v4 = self;
  sub_1D32E9B58(x);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat y = v10;
  result.double x = v9;
  return result;
}

- (_TtC11PosterBoard23PosterRackStackedLayout)init
{
  CGPoint result = (_TtC11PosterBoard23PosterRackStackedLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D32EA5C0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_sectionRevealProgressProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D32E1170((uint64_t)self + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_indexPathToMaintainForTransition, &qword_1EBD6F930);
}

@end