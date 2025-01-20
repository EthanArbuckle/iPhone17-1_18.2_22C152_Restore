@interface PPKPDFThumbnailsCollectionView
- (PPKPDFThumbnailsCollectionView)initWithCoder:(id)a3;
- (PPKPDFThumbnailsCollectionView)initWithFrame:(CGRect)a3;
- (id)initFromThumbnailView:(id)a3;
- (void)reloadPage:(id)a3;
- (void)updateImageForCell:(id)a3 indexPath:(id)a4 page:(id)a5;
@end

@implementation PPKPDFThumbnailsCollectionView

- (void)updateImageForCell:(id)a3 indexPath:(id)a4 page:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  specialized PPKPDFThumbnailsCollectionView.getImage(forCell:indexPath:page:completion:)((uint64_t)a3, (uint64_t)v11, v13, v14);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)reloadPage:(id)a3
{
  v4 = (PDFPage *)a3;
  v5 = self;
  PPKPDFThumbnailsCollectionView.reload(_:)(v4);
}

- (id)initFromThumbnailView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PPKPDFThumbnailsCollectionView();
  return [(PPKPDFThumbnailsCollectionViewBase *)&v5 initFromThumbnailView:a3];
}

- (PPKPDFThumbnailsCollectionView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PPKPDFThumbnailsCollectionView();
  return -[PPKPDFThumbnailsCollectionView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (PPKPDFThumbnailsCollectionView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PPKPDFThumbnailsCollectionView();
  return [(PPKPDFThumbnailsCollectionView *)&v5 initWithCoder:a3];
}

@end