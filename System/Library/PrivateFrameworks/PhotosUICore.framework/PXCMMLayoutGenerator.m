@interface PXCMMLayoutGenerator
+ (id)_defaultEditorialLayoutGeneratorWithReferenceSize:(CGSize)a3 headerHeight:(double)a4 interItemSpacing:(CGSize)a5;
+ (id)_defaultGridLayoutGeneratorWithReferenceSize:(CGSize)a3 additionalTileCount:(unint64_t)a4 headerHeight:(double)a5 itemSize:(CGSize)a6 interItemSpacing:(CGSize)a7 contentInsets:(UIEdgeInsets)a8;
+ (id)_gridLayoutGeneratorWithReferenceSize:(CGSize)a3 columnCount:(unint64_t)a4 additionalTileCount:(unint64_t)a5 headerHeight:(double)a6 interItemSpacing:(CGSize)a7;
+ (id)layoutGeneratorForLayoutType:(int64_t)a3 withReferenceSize:(CGSize)a4 additionalTileCount:(unint64_t)a5 headerHeight:(double)a6 itemSize:(CGSize)a7 interItemSpacing:(CGSize)a8 contentInsets:(UIEdgeInsets)a9;
@end

@implementation PXCMMLayoutGenerator

+ (id)_defaultEditorialLayoutGeneratorWithReferenceSize:(CGSize)a3 headerHeight:(double)a4 interItemSpacing:(CGSize)a5
{
  double width = a5.width;
  double height = a3.height;
  double v8 = a3.width;
  v9 = objc_alloc_init(PXEditorialLayoutMetrics);
  -[PXLayoutMetrics setReferenceSize:](v9, "setReferenceSize:", v8, height);
  [(PXEditorialLayoutMetrics *)v9 setInterTileSpacing:width];
  [(PXEditorialLayoutMetrics *)v9 setNumberOfColumns:3];
  [(PXEditorialLayoutMetrics *)v9 setLowerItemCountThreshold:6];
  -[PXEditorialLayoutMetrics setPadding:](v9, "setPadding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  [(PXEditorialLayoutMetrics *)v9 setHeaderHeight:a4];
  v10 = [[PXEditorialLayoutGenerator alloc] initWithMetrics:v9];

  return v10;
}

+ (id)_gridLayoutGeneratorWithReferenceSize:(CGSize)a3 columnCount:(unint64_t)a4 additionalTileCount:(unint64_t)a5 headerHeight:(double)a6 interItemSpacing:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v11 = a3.height;
  double v12 = a3.width;
  if (!a4)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PXCMMLayoutGenerator.m", 58, @"Invalid parameter not satisfying: %@", @"columnCount > 0" object file lineNumber description];
  }
  v13 = objc_alloc_init(PXGridLayoutMetrics);
  [(PXGridLayoutMetrics *)v13 setAxis:1];
  -[PXLayoutMetrics setReferenceSize:](v13, "setReferenceSize:", v12, v11);
  [(PXGridLayoutMetrics *)v13 setDisplaysHeaderTile:a6 > 0.0];
  -[PXGridLayoutMetrics setHeaderSize:](v13, "setHeaderSize:", a6, a6);
  -[PXGridLayoutMetrics setInterItemSpacing:](v13, "setInterItemSpacing:", width, height);
  -[PXGridLayoutMetrics setContentInsets:](v13, "setContentInsets:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  [(PXGridLayoutMetrics *)v13 setAdditionalTileCount:a5];
  [(PXLayoutMetrics *)v13 referenceSize];
  [(PXGridLayoutMetrics *)v13 contentInsets];
  PXEdgeInsetsInsetSize();
}

+ (id)_defaultGridLayoutGeneratorWithReferenceSize:(CGSize)a3 additionalTileCount:(unint64_t)a4 headerHeight:(double)a5 itemSize:(CGSize)a6 interItemSpacing:(CGSize)a7 contentInsets:(UIEdgeInsets)a8
{
  double height = a6.height;
  double width = a6.width;
  double v12 = a3.height;
  double v13 = a3.width;
  v14 = objc_alloc_init(PXGridLayoutMetrics);
  [(PXGridLayoutMetrics *)v14 setAxis:1];
  -[PXLayoutMetrics setReferenceSize:](v14, "setReferenceSize:", v13, v12);
  [(PXGridLayoutMetrics *)v14 setDisplaysHeaderTile:a5 > 0.0];
  -[PXGridLayoutMetrics setHeaderSize:](v14, "setHeaderSize:", a5, a5);
  -[PXGridLayoutMetrics setItemSize:](v14, "setItemSize:", width, height);
  -[PXGridLayoutMetrics setInterItemSpacing:](v14, "setInterItemSpacing:", a7.width, a7.height);
  -[PXGridLayoutMetrics setContentInsets:](v14, "setContentInsets:", a8.top, a8.left, a8.bottom, a8.right);
  [(PXGridLayoutMetrics *)v14 setAdditionalTileCount:a4];
  v15 = [[PXGridLayoutGenerator alloc] initWithMetrics:v14];

  return v15;
}

+ (id)layoutGeneratorForLayoutType:(int64_t)a3 withReferenceSize:(CGSize)a4 additionalTileCount:(unint64_t)a5 headerHeight:(double)a6 itemSize:(CGSize)a7 interItemSpacing:(CGSize)a8 contentInsets:(UIEdgeInsets)a9
{
  switch(a3)
  {
    case 0:
      double v11 = objc_msgSend(a1, "_defaultGridLayoutGeneratorWithReferenceSize:additionalTileCount:headerHeight:itemSize:interItemSpacing:contentInsets:", a5, a4.width, a4.height, a6, a7.width, a7.height, a8.width, a8.height, *(void *)&a9.top, *(void *)&a9.left, *(void *)&a9.bottom, *(void *)&a9.right, v9);
      goto LABEL_11;
    case 1:
      double v11 = objc_msgSend(a1, "_defaultEditorialLayoutGeneratorWithReferenceSize:headerHeight:interItemSpacing:", a4.width, a4.height, a6, a8.width, a8.height);
      goto LABEL_11;
    case 2:
      uint64_t v13 = 2;
      goto LABEL_10;
    case 3:
      uint64_t v13 = 3;
      goto LABEL_10;
    case 4:
      uint64_t v13 = 4;
LABEL_10:
      double v11 = objc_msgSend(a1, "_gridLayoutGeneratorWithReferenceSize:columnCount:additionalTileCount:headerHeight:interItemSpacing:", v13, a5, a4.width, a4.height, a6, a8.width, a8.height);
LABEL_11:
      break;
    default:
      double v11 = 0;
      break;
  }
  return v11;
}

@end