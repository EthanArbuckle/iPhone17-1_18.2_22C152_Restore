@interface CKTranscriptCompositorSwift
- (CKTranscriptCompositorDatasourceDelegate)delegate;
- (CKTranscriptCompositorSwift)init;
- (CKTranscriptCompositorSwift)initWithLayoutContext:(int64_t)a3 datasource:(id)a4;
- (NSArray)boundarySupplementaryItems;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)collectionViewLayout;
- (double)interSectionSpacing;
- (id)datasource;
- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)contentsInsetReference;
- (int64_t)layoutContext;
- (int64_t)scrollDirection;
- (void)setBoundarySupplementaryItems:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setContentsInsetReference:(int64_t)a3;
- (void)setDatasource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterSectionSpacing:(double)a3;
- (void)setLayoutContext:(int64_t)a3;
- (void)setScrollDirection:(int64_t)a3;
@end

@implementation CKTranscriptCompositorSwift

- (UICollectionView)collectionView
{
  return (UICollectionView *)sub_1E4ACB76C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
}

- (void)setCollectionView:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1E4ACD558(a3);
}

- (CKTranscriptCompositorDatasourceDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1E4E87900](v2);
  return (CKTranscriptCompositorDatasourceDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)layoutContext
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext);
  swift_beginAccess();
  return *v2;
}

- (void)setLayoutContext:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (id)datasource
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return v2;
}

- (void)setDatasource:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptCompositorSwift_datasource);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return (UICollectionViewCompositionalLayout *)sub_1E4ACB76C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
}

- (void)setCollectionViewLayout:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v5 = *v4;
  id *v4 = a3;
  id v6 = a3;
}

- (int64_t)scrollDirection
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
  swift_beginAccess();
  return *v2;
}

- (void)setScrollDirection:(int64_t)a3
{
  v4 = self;
  TranscriptCompositor.scrollDirection.setter(a3);
}

- (double)interSectionSpacing
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
  swift_beginAccess();
  return *v2;
}

- (void)setInterSectionSpacing:(double)a3
{
  v4 = self;
  TranscriptCompositor.interSectionSpacing.setter(a3);
}

- (NSArray)boundarySupplementaryItems
{
  swift_beginAccess();
  sub_1E4ACAED8(0, &qword_1EAE88E80);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E4ACFCB8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setBoundarySupplementaryItems:(id)a3
{
  sub_1E4ACAED8(0, &qword_1EAE88E80);
  uint64_t v4 = sub_1E4ACFCC8();
  v5 = self;
  TranscriptCompositor.boundarySupplementaryItems.setter(v4);
}

- (int64_t)contentsInsetReference
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
  swift_beginAccess();
  return *v2;
}

- (void)setContentsInsetReference:(int64_t)a3
{
  uint64_t v4 = self;
  TranscriptCompositor.contentsInsetReference.setter(a3);
}

- (CKTranscriptCompositorSwift)initWithLayoutContext:(int64_t)a3 datasource:(id)a4
{
  return (CKTranscriptCompositorSwift *)TranscriptCompositor.init(layoutContext:datasource:)(a3, (uint64_t)a4);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = TranscriptCompositor.layoutSection(forSection:layoutEnvironment:)(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (CKTranscriptCompositorSwift)init
{
  result = (CKTranscriptCompositorSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E4ACDA24((uint64_t)self + OBJC_IVAR___CKTranscriptCompositorSwift_delegate);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end