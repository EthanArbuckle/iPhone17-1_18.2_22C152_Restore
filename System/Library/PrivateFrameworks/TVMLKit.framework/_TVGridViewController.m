@interface _TVGridViewController
- (BOOL)contentFlowsVertically;
- (BOOL)shouldHeaderFloatByDefault;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)makeCollectionViewWithFrame:(CGRect)a3;
- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4;
- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4;
- (void)viewDidLoad;
@end

@implementation _TVGridViewController

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_TVGridViewController;
  long long v4 = *(_OWORD *)&a4->cellMargin.top;
  v8[6] = *(_OWORD *)&a4->cellInsetAlt.bottom;
  v8[7] = v4;
  v8[8] = *(_OWORD *)&a4->cellMargin.bottom;
  long long v5 = *(_OWORD *)&a4->cellInset.top;
  v8[2] = *(_OWORD *)&a4->cellPadding.bottom;
  v8[3] = v5;
  long long v6 = *(_OWORD *)&a4->cellInsetAlt.top;
  v8[4] = *(_OWORD *)&a4->cellInset.bottom;
  v8[5] = v6;
  long long v7 = *(_OWORD *)&a4->cellPadding.top;
  v8[0] = a4->cellSize;
  v8[1] = v7;
  [(_TVMLCollectionViewController *)&v9 updateWithViewElement:a3 cellMetrics:v8];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_TVGridViewController;
  [(_TVMLCollectionViewController *)&v4 viewDidLoad];
  if (self->_configureForListTemplate)
  {
    v3 = [(_TVMLCollectionViewController *)self collectionWrappingView];
    [v3 setCollectionGradientMask:1];
  }
}

- (id)makeCollectionViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [_TVMLGridView alloc];
  objc_super v9 = objc_alloc_init(_TVGridViewFlowLayout);
  v10 = -[_TVGridView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);

  [(_TVMLGridView *)v10 setConfigureForListTemplate:self->_configureForListTemplate];
  return v10;
}

- (BOOL)contentFlowsVertically
{
  return 1;
}

- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  BOOL v4 = a4;
  long long v6 = [(_TVMLCollectionViewController *)self collectionView];
  long long v7 = [v6 collectionViewLayout];

  [(_TVMLCollectionViewController *)self cellMetrics];
  [v7 setCellMetrics:&v15];
  v8 = [(_TVMLCollectionViewController *)self collectionElement];
  objc_super v9 = [v8 style];

  v10 = [v9 valueForStyle:@"tv-line-spacing"];
  if (v10)
  {
    objc_msgSend(v9, "tv_lineSpacing");
    double v12 = v11;
  }
  else
  {
    double v12 = NAN;
  }

  objc_msgSend(v9, "tv_interitemSpacing");
  double v14 = v13;
  [v7 expectedLineSpacing];
  [v7 setMinimumInteritemSpacing:v14];
  [v7 setMinimumLineSpacing:v12];
  if (v4) {
    [v7 invalidateLayout];
  }
}

- (BOOL)shouldHeaderFloatByDefault
{
  return !self->_configureForListTemplate;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  long long v7 = [(_TVMLCollectionViewController *)self collectionElement];
  v8 = [v7 sections];
  objc_super v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  v10 = objc_msgSend(v9, "prototypeForItemAtIndex:", objc_msgSend(v6, "row"));
  [(_TVMLCollectionViewController *)self expectedCellSizeForElement:v10 atIndexPath:v6];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a4;
  double v9 = *MEMORY[0x263F1D1C0];
  double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v10 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  if (a5 >= 1)
  {
    double v12 = [(_TVMLCollectionViewController *)self collectionElement];
    double v13 = [v12 sections];
    double v14 = [v13 objectAtIndex:a5];
    double v15 = [v14 items];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      [v7 minimumLineSpacing];
      double v9 = v17;
    }
  }

  double v18 = v9;
  double v19 = v8;
  double v20 = v10;
  double v21 = v11;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

@end