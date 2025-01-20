@interface PXPhotosGridMessagesLayoutSpec
- (CGSize)interItemSpacing;
- (CGSize)itemInternalMargin;
- (CGSize)itemInternalSquareMargin;
- (PXPhotosGridMessagesLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (UIEdgeInsets)padding;
- (double)itemCornerRadius;
- (int64_t)numberOfColumnsForNumberOfItems:(int64_t)a3;
- (unint64_t)numberOfColumns;
@end

@implementation PXPhotosGridMessagesLayoutSpec

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (CGSize)itemInternalSquareMargin
{
  double width = self->_itemInternalSquareMargin.width;
  double height = self->_itemInternalSquareMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)itemInternalMargin
{
  double width = self->_itemInternalMargin.width;
  double height = self->_itemInternalMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)numberOfColumnsForNumberOfItems:(int64_t)a3
{
  if (self->_numberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = +[PXMessagesUISettings sharedInstance];
    [v5 minItemSize];
    double v7 = v6;
    uint64_t v8 = [v5 minColumns];
    [v5 maxColumns];
    [v5 comfortableFitPercentage];
    double width = self->_referenceSize.width;
    int64_t v11 = llround(width / v7);
    if (width > 0.0 && a3 >= 1)
    {
      double height = self->_referenceSize.height;
      if (height > 0.0)
      {
        double v14 = height - self->_padding.top - self->_padding.bottom;
        if (v14 > 0.0 && v8 < v11)
        {
          double v16 = v9 * v14;
          uint64_t v17 = v8;
          do
          {
            if (width / (double)v17 * (double)(uint64_t)ceil((double)a3 / (double)v17) < v16) {
              break;
            }
            ++v17;
          }
          while (v11 != v17);
        }
      }
    }
    PXClamp();
  }
  return self->_numberOfColumns;
}

- (PXPhotosGridMessagesLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PXPhotosGridMessagesLayoutSpec;
  double v7 = [(PXFeatureSpec *)&v29 initWithExtendedTraitCollection:v6 options:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    p_referenceSize = &v7->_referenceSize;
    [(PXFeatureSpec *)v7 layoutReferenceSize];
    *(void *)&p_referenceSize->double width = v10;
    v8->_referenceSize.double height = v11;
    uint64_t v12 = [(PXFeatureSpec *)v8 layoutOrientation];
    if ([(PXFeatureSpec *)v8 sizeClass] == 2)
    {
      if ([(PXFeatureSpec *)v8 userInterfaceIdiom] == 4)
      {
        v8->_numberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
        long long v28 = xmmword_1AB359EB0;
        goto LABEL_16;
      }
      v8->_numberOfColumns = 4;
      if (v12 != 2) {
        goto LABEL_15;
      }
      long long v15 = xmmword_1AB359EC0;
    }
    else
    {
      uint64_t v13 = [(PXFeatureSpec *)v8 sizeSubclass];
      switch(v13)
      {
        case 1:
          uint64_t v18 = 2;
          v8->_interItemSpacing.double width = 2.0;
          if (v12 == 2) {
            uint64_t v18 = 4;
          }
          v8->_numberOfColumns = v18;
          if (v12 == 2)
          {
            v8->_interItemSpacing.double height = 6.0;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            v8->_itemInternalSquareMargin.double width = 26.0;
            double v20 = 15.0;
            double v21 = 26.0;
          }
          else
          {
            v8->_interItemSpacing.double height = 4.0;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            v8->_itemInternalSquareMargin.double width = 33.0;
            double v20 = 15.0;
            double v21 = 33.0;
          }
          goto LABEL_29;
        case 2:
          uint64_t v19 = 2;
          if (v12 == 2) {
            uint64_t v19 = 4;
          }
          v8->_numberOfColumns = v19;
          if (v12 == 2)
          {
            v8->_interItemSpacing = (CGSize)xmmword_1AB2F2C50;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            *(double *)&uint64_t v17 = 32.0;
            goto LABEL_28;
          }
          long long v15 = xmmword_1AB359EA0;
          break;
        case 3:
          uint64_t v14 = 2;
          if (v12 == 2) {
            uint64_t v14 = 3;
          }
          v8->_numberOfColumns = v14;
          if (v12 != 2)
          {
            long long v28 = xmmword_1AB359EA0;
LABEL_16:
            v8->_interItemSpacing = (CGSize)v28;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            *(double *)&uint64_t v17 = 38.0;
LABEL_28:
            uint64_t *p_itemInternalSquareMargin = v17;
            double v20 = 20.0;
            double v21 = *(double *)&v17;
LABEL_29:
            *((double *)p_itemInternalSquareMargin + 1) = v21;
            __asm { FMOV            V1.2D, #8.0 }
            v8->_itemInternalMargin = _Q1;
            v8->_itemCornerRadius = v20;
LABEL_30:
            PXEdgeInsetsMake();
          }
          long long v15 = xmmword_1AB2F2C50;
          break;
        default:
          goto LABEL_30;
      }
    }
    v8->_interItemSpacing = (CGSize)v15;
    p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
    *(double *)&uint64_t v17 = 34.0;
    goto LABEL_28;
  }

  return 0;
}

@end