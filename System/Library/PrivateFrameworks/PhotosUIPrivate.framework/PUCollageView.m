@interface PUCollageView
+ (int64_t)maximumNumberOfItems;
- (BOOL)hasRoundedCorners;
- (CGSize)collageSize;
- (CGSize)imageSizeForItemAtIndex:(int64_t)a3;
- (NSArray)_imageViews;
- (NSPointerArray)_imageSizes;
- (PUCollageView)initWithFrame:(CGRect)a3;
- (PXRoundedCornerOverlayView)_roundedCornerOverlayView;
- (UIColor)cornersBackgroundColor;
- (double)cornerRadius;
- (double)spacing;
- (double)subitemCornerRadius;
- (int64_t)_numberOfImageViews;
- (int64_t)numberOfItems;
- (void)_setRoundedCornerOverlayView:(id)a3;
- (void)_updateImageViews;
- (void)_updateRoundedCornerOverlayView;
- (void)layoutSubviews;
- (void)setCollageSize:(CGSize)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornersBackgroundColor:(id)a3;
- (void)setHasRoundedCorners:(BOOL)a3;
- (void)setHasRoundedCorners:(BOOL)a3 withCornersBackgroundColor:(id)a4;
- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4;
- (void)setNumberOfItems:(int64_t)a3;
- (void)setSpacing:(double)a3;
- (void)setSubitemCornerRadius:(double)a3;
@end

@implementation PUCollageView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_cornersBackgroundColor, 0);
  objc_storeStrong((id *)&self->__imageSizes, 0);
  objc_storeStrong((id *)&self->__imageViews, 0);
}

- (void)_setRoundedCornerOverlayView:(id)a3
{
}

- (PXRoundedCornerOverlayView)_roundedCornerOverlayView
{
  return self->__roundedCornerOverlayView;
}

- (void)setCornersBackgroundColor:(id)a3
{
}

- (UIColor)cornersBackgroundColor
{
  return self->_cornersBackgroundColor;
}

- (NSPointerArray)_imageSizes
{
  return self->__imageSizes;
}

- (NSArray)_imageViews
{
  return self->__imageViews;
}

- (int64_t)_numberOfImageViews
{
  return self->__numberOfImageViews;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (double)subitemCornerRadius
{
  return self->_subitemCornerRadius;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (CGSize)collageSize
{
  double width = self->_collageSize.width;
  double height = self->_collageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateRoundedCornerOverlayView
{
  if ([(PUCollageView *)self hasRoundedCorners])
  {
    int64_t v3 = [(PUCollageView *)self numberOfItems];
    uint64_t v4 = [(PUCollageView *)self _roundedCornerOverlayView];
    v5 = (void *)v4;
    if (v3 == 1)
    {
      if (!v4)
      {
        id v6 = objc_alloc(MEMORY[0x1E4F90620]);
        [(PUCollageView *)self bounds];
        v5 = objc_msgSend(v6, "initWithFrame:");
        [(PUCollageView *)self addSubview:v5];
        [(PUCollageView *)self _setRoundedCornerOverlayView:v5];
        [(PUCollageView *)self bringSubviewToFront:v5];
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __48__PUCollageView__updateRoundedCornerOverlayView__block_invoke;
      v7[3] = &unk_1E5F2A0A0;
      v7[4] = self;
      [v5 performChanges:v7];
      goto LABEL_9;
    }
  }
  else
  {
    v5 = [(PUCollageView *)self _roundedCornerOverlayView];
  }
  if (!v5) {
    return;
  }
  [v5 removeFromSuperview];
  [(PUCollageView *)self _setRoundedCornerOverlayView:0];
LABEL_9:
}

void __48__PUCollageView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 cornerRadius];
  objc_msgSend(v5, "setCornerRadius:");
  uint64_t v4 = [*(id *)(a1 + 32) cornersBackgroundColor];
  [v5 setOverlayColor:v4];

  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  [v5 setDisplayScale:*(double *)&PUMainScreenScale_screenScale];
}

- (void)_updateImageViews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double subitemCornerRadius = 0.0;
  if (self->_hasRoundedCorners
    && [(PUCollageView *)self numberOfItems] >= 2
    && (double subitemCornerRadius = self->_subitemCornerRadius, subitemCornerRadius > 0.0))
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = [(PUCollageView *)self _imageViews];
  uint64_t v6 = [v5 firstObject];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(PUCollageView *)self _imageViews];
    v9 = [v8 firstObject];
    v10 = [v9 layer];
    [v10 cornerRadius];
    double v12 = v11;

    if (v12 != subitemCornerRadius)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v13 = [(PUCollageView *)self _imageViews];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v19 = [v18 layer];
            [v19 setCornerRadius:subitemCornerRadius];

            v20 = [v18 layer];
            objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v15);
      }
    }
  }
  else
  {
  }
}

- (void)setHasRoundedCorners:(BOOL)a3 withCornersBackgroundColor:(id)a4
{
  BOOL v5 = a3;
  v7 = (UIColor *)a4;
  if (self->_hasRoundedCorners != v5 || self->_cornersBackgroundColor != v7)
  {
    self->_hasRoundedCorners = v5;
    v8 = v7;
    objc_storeStrong((id *)&self->_cornersBackgroundColor, a4);
    [(PUCollageView *)self _updateImageViews];
    [(PUCollageView *)self _updateRoundedCornerOverlayView];
    v7 = v8;
  }
}

- (void)setHasRoundedCorners:(BOOL)a3
{
}

- (void)setSubitemCornerRadius:(double)a3
{
  if (self->_subitemCornerRadius != a3)
  {
    self->_double subitemCornerRadius = a3;
    [(PUCollageView *)self _updateImageViews];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PUCollageView *)self _updateRoundedCornerOverlayView];
  }
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v8 = a3;
  if ([(PUCollageView *)self _numberOfImageViews] > a4)
  {
    uint64_t v6 = [(PUCollageView *)self _imageViews];
    v7 = [v6 objectAtIndex:a4];

    [v7 setImage:v8];
  }
}

- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(PUCollageView *)self _numberOfImageViews] > a4)
  {
    id v8 = [(PUCollageView *)self _imageSizes];
    objc_msgSend(v8, "replacePointerAtIndex:withPointer:", a4, objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height));
    [(PUCollageView *)self setNeedsLayout];
  }
}

- (CGSize)imageSizeForItemAtIndex:(int64_t)a3
{
  if ([(PUCollageView *)self _numberOfImageViews] <= a3)
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    BOOL v5 = [(PUCollageView *)self _imageSizes];
    uint64_t v6 = [v5 pointerAtIndex:a3];

    [v6 CGSizeValue];
    double v8 = v7;
    double v10 = v9;
  }
  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setNumberOfItems:(int64_t)a3
{
  if (self->_numberOfItems != a3)
  {
    self->_numberOfItems = a3;
    [(PUCollageView *)self _updateImageViews];
    [(PUCollageView *)self _updateRoundedCornerOverlayView];
    [(PUCollageView *)self setNeedsLayout];
  }
}

- (void)setCollageSize:(CGSize)a3
{
  if (a3.width != self->_collageSize.width || a3.height != self->_collageSize.height)
  {
    self->_collageSize = a3;
    [(PUCollageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [(PUCollageView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PUCollageView *)self collageSize];
  double v12 = v11;
  double v14 = v13;
  v56.origin.x = v4;
  v56.origin.y = v6;
  v56.size.double width = v8;
  v56.size.double height = v10;
  double v15 = CGRectGetMidX(v56) + v12 * -0.5;
  v57.origin.x = v4;
  v57.origin.y = v6;
  v57.size.double width = v8;
  v57.size.double height = v10;
  double v16 = CGRectGetMidY(v57) + v14 * -0.5;
  id v47 = [(PUCollageView *)self _imageViews];
  int64_t v17 = [(PUCollageView *)self numberOfItems];
  uint64_t v18 = [(id)objc_opt_class() maximumNumberOfItems];
  if (v17 >= v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v17;
  }
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v48 = *MEMORY[0x1E4F1DB28];
  long long v49 = v20;
  long long v50 = v48;
  long long v51 = v20;
  long long v52 = v48;
  *(_OWORD *)v53 = v20;
  double v21 = v15;
  *(double *)&long long v20 = v16;
  double v22 = v12;
  double v23 = v14;
  double MinX = CGRectGetMinX(*(CGRect *)((char *)&v20 - 8));
  v58.origin.x = v15;
  v58.origin.y = v16;
  v58.size.double width = v12;
  v58.size.double height = v14;
  double MinY = CGRectGetMinY(v58);
  v59.origin.x = v15;
  v59.origin.y = v16;
  v59.size.double width = v12;
  v59.size.double height = v14;
  CGRectGetMidX(v59);
  UIRoundToViewScale();
  double v45 = v26;
  v60.origin.x = v15;
  v60.origin.y = v16;
  v60.size.double width = v12;
  v60.size.double height = v14;
  CGRectGetMidY(v60);
  UIRoundToViewScale();
  double v44 = v27;
  v61.origin.x = v15;
  v61.origin.y = v16;
  v61.size.double width = v12;
  v61.size.double height = v14;
  double MaxX = CGRectGetMaxX(v61);
  v62.origin.x = v15;
  v62.origin.y = v16;
  v62.size.double width = v12;
  v62.size.double height = v14;
  double MaxY = CGRectGetMaxY(v62);
  [(PUCollageView *)self spacing];
  UIRoundToViewScale();
  double v30 = v29;
  if (v19 < 3)
  {
    if (v19 == 2)
    {
      [(PUCollageView *)self imageSizeForItemAtIndex:0];
      *(double *)&long long v48 = MinX;
      *((double *)&v48 + 1) = MinY;
      if (v34 <= v33)
      {
        *(double *)&long long v49 = MaxY - MinX;
        *((double *)&v49 + 1) = v44 - v30 - MinY;
        *(double *)&long long v50 = MinX;
        *((double *)&v50 + 1) = v44 + v30;
        *(double *)&long long v51 = MaxX - MinX;
        *((double *)&v51 + 1) = MaxY - (v44 + v30);
      }
      else
      {
        *(double *)&long long v49 = v45 - v30 - MinX;
        *((double *)&v49 + 1) = MaxY - MinY;
        *(double *)&long long v50 = v45 + v30;
        *((double *)&v50 + 1) = MinY;
        *(double *)&long long v51 = MaxX - (v45 + v30);
        *((double *)&v51 + 1) = MaxY - MinY;
      }
    }
    else
    {
      *(double *)&long long v48 = MinX;
      *((double *)&v48 + 1) = MinY;
      *(double *)&long long v49 = MaxX - MinX;
      *((double *)&v49 + 1) = MaxY - MinY;
    }
  }
  else
  {
    [(PUCollageView *)self imageSizeForItemAtIndex:0];
    *(double *)&long long v48 = MinX;
    *((double *)&v48 + 1) = MinY;
    if (v32 <= v31)
    {
      *(double *)&long long v49 = MaxX - MinX;
      *((double *)&v49 + 1) = v44 - v30 - MinY;
      *(double *)&long long v50 = MinX;
      *((double *)&v50 + 1) = v44 + v30;
      *(double *)&long long v51 = v45 - v30 - MinX;
      *((double *)&v51 + 1) = MaxY - (v44 + v30);
    }
    else
    {
      *(double *)&long long v49 = v45 - v30 - MinX;
      *((double *)&v49 + 1) = MaxY - MinY;
      *(double *)&long long v50 = v45 + v30;
      *((double *)&v50 + 1) = MinY;
      *(double *)&long long v51 = MaxX - (v45 + v30);
      *((double *)&v51 + 1) = v44 - v30 - MinY;
    }
    *(double *)&long long v52 = v45 + v30;
    *((double *)&v52 + 1) = v44 + v30;
    v53[0] = MaxX - (v45 + v30);
    v53[1] = MaxY - (v44 + v30);
  }
  if ([(PUCollageView *)self _numberOfImageViews] >= 1)
  {
    int64_t v35 = 0;
    v36 = (double *)&v49;
    do
    {
      v37 = [v47 objectAtIndex:v35];
      double v38 = *(v36 - 2);
      double v39 = *(v36 - 1);
      double v40 = *v36;
      double v41 = v36[1];
      v36 += 4;
      objc_msgSend(v37, "setFrame:", v38, v39, v40, v41);
      [v37 setHidden:v35 >= v19];

      ++v35;
    }
    while (v35 < [(PUCollageView *)self _numberOfImageViews]);
  }
  v42 = [(PUCollageView *)self _roundedCornerOverlayView];
  v43 = v42;
  if (v42) {
    objc_msgSend(v42, "setFrame:", v15, v16, v12, v14);
  }
}

- (PUCollageView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PUCollageView;
  double v3 = -[PUCollageView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = 3;
    double v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      CGFloat v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v6, v7, v8, v9);
      [v10 setContentMode:2];
      [v10 setClipsToBounds:1];
      [(PUCollageView *)v3 addSubview:v10];
      [v5 addObject:v10];

      --v4;
    }
    while (v4);
    double v11 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
    [(NSPointerArray *)v11 setCount:3];
    v3->__numberOfImageViews = 3;
    uint64_t v12 = [v5 copy];
    imageViews = v3->__imageViews;
    v3->__imageViews = (NSArray *)v12;

    imageSizes = v3->__imageSizes;
    v3->__imageSizes = v11;

    [(PUCollageView *)v3 setCornerRadius:10.0];
    [(PUCollageView *)v3 setClipsToBounds:1];
    [(PUCollageView *)v3 _updateRoundedCornerOverlayView];
  }
  return v3;
}

+ (int64_t)maximumNumberOfItems
{
  return 3;
}

@end