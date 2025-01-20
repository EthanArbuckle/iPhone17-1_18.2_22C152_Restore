@interface SKUISearchCollectionViewFlowLayout
- (BOOL)backfills;
- (SKUISearchCollectionViewFlowLayout)init;
- (double)horizontalPadding;
- (double)verticalPadding;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)init;
- (void)prepareLayout;
- (void)setBackfills:(BOOL)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setVerticalPadding:(double)a3;
@end

@implementation SKUISearchCollectionViewFlowLayout

- (SKUISearchCollectionViewFlowLayout)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchCollectionViewFlowLayout init]();
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUISearchCollectionViewFlowLayout;
  v3 = [(SKUIItemGridCollectionViewLayout *)&v5 init];
  if (v3)
  {
    [(SKUISearchCollectionViewFlowLayout *)v3 registerClass:objc_opt_class() forDecorationViewOfKind:@"a"];
    [(SKUISearchCollectionViewFlowLayout *)v3 registerClass:objc_opt_class() forDecorationViewOfKind:@"b"];
  }
  return v3;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)SKUISearchCollectionViewFlowLayout;
  v8 = [(SKUIItemGridCollectionViewLayout *)&v30 layoutAttributesForElementsInRect:sel_layoutAttributesForElementsInRect_];
  v9 = (void *)[v8 mutableCopy];

  [(UICollectionViewFlowLayout *)self itemSize];
  double v11 = v10;
  double v13 = v12;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v14 = floor((CGRectGetMinY(v32) - self->_headerSize.height) / v13);
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  uint64_t v15 = (uint64_t)v14;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  int64_t v16 = vcvtpd_s64_f64((CGRectGetMaxY(v33) - self->_headerSize.height) / v13);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v17 = CGRectGetMinX(v34) / v11;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v18 = CGRectGetMaxX(v35) / v11;
  if (self->_backfills)
  {
    if (self->_numberOfRows <= v16) {
      int64_t v19 = v16 + 6;
    }
    else {
      int64_t v19 = v16;
    }
  }
  else
  {
    --v15;
    int64_t numberOfRows = self->_numberOfRows;
    if (numberOfRows + 1 < v16 - 1) {
      int64_t v19 = numberOfRows + 1;
    }
    else {
      int64_t v19 = v16 - 1;
    }
  }
  int64_t v21 = vcvtpd_s64_f64(v17);
  unint64_t v22 = vcvtmd_s64_f64(v18);
  int64_t v23 = v19 - 1;
  if (v15 < v19 - 1)
  {
    do
    {
      v24 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v15];
      v25 = [(SKUISearchCollectionViewFlowLayout *)self layoutAttributesForDecorationViewOfKind:@"b" atIndexPath:v24];
      [v9 addObject:v25];

      ++v15;
    }
    while (v23 != v15);
  }
  if ((uint64_t)(v22 - 1) > v21)
  {
    int64_t v26 = v21 + 1;
    do
    {
      v27 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v26];
      v28 = [(SKUISearchCollectionViewFlowLayout *)self layoutAttributesForDecorationViewOfKind:@"a" atIndexPath:v27];
      [v9 addObject:v28];

      ++v26;
    }
    while (v22 != v26);
  }

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v6 indexAtPosition:0];
  double v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForDecorationViewOfKind:withIndexPath:", v7, v6);

  [v13 setZIndex:1];
  LODWORD(v6) = [v7 isEqualToString:@"b"];

  if (v6)
  {
    double horizontalPadding = self->_horizontalPadding;
    double v15 = self->_headerSize.height + (double)(v12 + 1) * v11;
    [(UICollectionView *)self->_collectionView frame];
    double v17 = v16 + self->_horizontalPadding * -2.0;
    double v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v18 scale];
    double v20 = 1.0 / v19;
  }
  else
  {
    double horizontalPadding = v9 * (double)v12;
    double v15 = self->_verticalPadding + self->_headerSize.height;
    double v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v18 scale];
    double v17 = 1.0 / v21;
    uint64_t v22 = 6;
    if (!self->_backfills) {
      uint64_t v22 = 0;
    }
    double v20 = -(self->_verticalPadding - v11 * (double)(v22 + self->_numberOfRows));
  }
  objc_msgSend(v13, "setFrame:", horizontalPadding, v15, v17, v20);

  return v13;
}

- (void)prepareLayout
{
  v13.receiver = self;
  v13.super_class = (Class)SKUISearchCollectionViewFlowLayout;
  [(UICollectionViewFlowLayout *)&v13 prepareLayout];
  v3 = [(SKUISearchCollectionViewFlowLayout *)self collectionView];
  collectionView = self->_collectionView;
  self->_collectionView = v3;

  [(UICollectionView *)self->_collectionView frame];
  double v6 = v5;
  [(UICollectionViewFlowLayout *)self itemSize];
  self->_numberOfColumns = vcvtmd_s64_f64(v6 / v7);
  if ([(UICollectionView *)self->_collectionView numberOfSections] < 1)
  {
    float v10 = 0.0;
  }
  else
  {
    NSInteger v8 = 0;
    uint64_t v9 = 0;
    do
      v9 += [(UICollectionView *)self->_collectionView numberOfItemsInSection:v8++];
    while (v8 < [(UICollectionView *)self->_collectionView numberOfSections]);
    float v10 = (float)v9;
  }
  self->_int64_t numberOfRows = vcvtps_s32_f32(v10 / (float)self->_numberOfColumns);
  [(UICollectionViewFlowLayout *)self headerReferenceSize];
  self->_headerSize.CGFloat width = v11;
  self->_headerSize.CGFloat height = v12;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_double horizontalPadding = a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (BOOL)backfills
{
  return self->_backfills;
}

- (void)setBackfills:(BOOL)a3
{
  self->_backfills = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISearchCollectionViewFlowLayout init]";
}

@end