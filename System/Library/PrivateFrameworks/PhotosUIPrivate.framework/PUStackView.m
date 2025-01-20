@interface PUStackView
+ (int64_t)maximumNumberOfVisibleItemsForStyle:(unint64_t)a3;
- (BOOL)combinesPhotoDecorations;
- (BOOL)continuousCorners;
- (BOOL)cornerOverlaysDisabled;
- (BOOL)hasRoundedCorners;
- (BOOL)isEmpty;
- (BOOL)isHighlighted;
- (BOOL)isImageHiddenForItemAtIndex:(int64_t)a3;
- (BOOL)wouldCoverAllItemsInStackView:(id)a3;
- (CGPoint)stackPerspectiveFactor;
- (CGPoint)topLeftCornerOfFrontStackItem;
- (CGRect)_getStackFrame;
- (CGRect)rectOfStackItemAtIndex:(int64_t)a3 inCoordinateSpace:(id)a4;
- (CGSize)stackSize;
- (NSArray)_photoDecorationVariants;
- (NSArray)_photoViews;
- (NSArray)stackItemViews;
- (NSPointerArray)_imageSizes;
- (PUPhotoDecoration)photoDecoration;
- (PUStackView)initWithFrame:(CGRect)a3;
- (UIColor)cornersBackgroundColor;
- (UIColor)gridBackgroundColor;
- (UIEdgeInsets)stackPerspectiveInsets;
- (UIImage)emptyPlaceholderImage;
- (UIOffset)stackOffset;
- (UIOffset)stackPerspectiveOffset;
- (UIView)_backgroundView;
- (double)cornerRadius;
- (double)gridItemSpacing;
- (double)gridMargin;
- (double)itemAlpha;
- (double)posterSquareCornerRadius;
- (double)posterSubitemCornerRadius;
- (id)_combinedPhotoDecorationsImage;
- (id)newLayoutAttributesForItemAtIndex:(int64_t)a3 relativeToView:(id)a4;
- (id)newLayoutAttributesForVisbleItemsRelativeToView:(id)a3 maxCount:(int64_t)a4;
- (int64_t)_numberOfViews;
- (int64_t)numberOfVisibleItems;
- (unint64_t)style;
- (void)_getCenter:(CGPoint *)a3 bounds:(CGRect *)a4 forPhotoViewAtIndex:(int64_t)a5;
- (void)_rebuildDecorationVariants;
- (void)_setBackgroundView:(id)a3;
- (void)_setNeedsDynamicLayout;
- (void)_setPhotoDecorationVariants:(id)a3;
- (void)_updateBackgroundView;
- (void)_updateDynamicLayout;
- (void)_updateHighlight;
- (void)_updateNumberOfViews;
- (void)_updatePhotoViews;
- (void)_updateSubviewsOrdering;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3 forItemAtIndex:(int64_t)a4;
- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4 forItemAtIndex:(int64_t)a5;
- (void)setCollectionTileLayoutTemplate:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setCombinesPhotoDecorations:(BOOL)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerOverlaysDisabled:(BOOL)a3;
- (void)setCornersBackgroundColor:(id)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setEmptyPlaceholderImage:(id)a3;
- (void)setFeatureSpec:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setGridBackgroundColor:(id)a3;
- (void)setGridItemSpacing:(double)a3;
- (void)setGridMargin:(double)a3;
- (void)setHasRoundedCorners:(BOOL)a3;
- (void)setHasRoundedCorners:(BOOL)a3 withCornersBackgroundColor:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setImageHidden:(BOOL)a3 forItemAtIndex:(int64_t)a4;
- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4;
- (void)setItemAlpha:(double)a3;
- (void)setNumberOfVisibleItems:(int64_t)a3;
- (void)setPhotoDecoration:(id)a3;
- (void)setPosterSquareCornerRadius:(double)a3;
- (void)setPosterSubitemCornerRadius:(double)a3;
- (void)setStackOffset:(UIOffset)a3;
- (void)setStackPerspectiveFactor:(CGPoint)a3;
- (void)setStackPerspectiveInsets:(UIEdgeInsets)a3;
- (void)setStackPerspectiveOffset:(UIOffset)a3;
- (void)setStackSize:(CGSize)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSubtitle:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setTitle:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)setTitleFontName:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PUStackView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornersBackgroundColor, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__photoDecorationVariants, 0);
  objc_storeStrong((id *)&self->__imageSizes, 0);
  objc_storeStrong((id *)&self->__photoViews, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_gridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_photoDecoration, 0);
  objc_storeStrong((id *)&self->_combinedPhotoDecorationImageView, 0);
}

- (void)setCornersBackgroundColor:(id)a3
{
}

- (UIColor)cornersBackgroundColor
{
  return self->_cornersBackgroundColor;
}

- (void)_setBackgroundView:(id)a3
{
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (void)_setPhotoDecorationVariants:(id)a3
{
}

- (NSArray)_photoDecorationVariants
{
  return self->__photoDecorationVariants;
}

- (NSPointerArray)_imageSizes
{
  return self->__imageSizes;
}

- (NSArray)_photoViews
{
  return self->__photoViews;
}

- (int64_t)_numberOfViews
{
  return self->__numberOfViews;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (UIImage)emptyPlaceholderImage
{
  return self->_emptyPlaceholderImage;
}

- (double)itemAlpha
{
  return self->_itemAlpha;
}

- (int64_t)numberOfVisibleItems
{
  return self->_numberOfVisibleItems;
}

- (BOOL)cornerOverlaysDisabled
{
  return self->_cornerOverlaysDisabled;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (double)posterSubitemCornerRadius
{
  return self->_posterSubitemCornerRadius;
}

- (double)posterSquareCornerRadius
{
  return self->_posterSquareCornerRadius;
}

- (double)gridItemSpacing
{
  return self->_gridItemSpacing;
}

- (double)gridMargin
{
  return self->_gridMargin;
}

- (UIColor)gridBackgroundColor
{
  return self->_gridBackgroundColor;
}

- (CGPoint)stackPerspectiveFactor
{
  double x = self->_stackPerspectiveFactor.x;
  double y = self->_stackPerspectiveFactor.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIOffset)stackPerspectiveOffset
{
  double horizontal = self->_stackPerspectiveOffset.horizontal;
  double vertical = self->_stackPerspectiveOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double top = self->_stackPerspectiveInsets.top;
  double left = self->_stackPerspectiveInsets.left;
  double bottom = self->_stackPerspectiveInsets.bottom;
  double right = self->_stackPerspectiveInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIOffset)stackOffset
{
  double horizontal = self->_stackOffset.horizontal;
  double vertical = self->_stackOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (CGSize)stackSize
{
  double width = self->_stackSize.width;
  double height = self->_stackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)combinesPhotoDecorations
{
  return self->_combinesPhotoDecorations;
}

- (PUPhotoDecoration)photoDecoration
{
  return self->_photoDecoration;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setSubtitle:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v9 = a3;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    v6 = [(PUStackView *)self _photoViews];
    v7 = [v6 objectAtIndex:a4];

    v8 = [v7 contentHelper];
    [v8 setSubtitle:v9];
  }
}

- (void)setTitle:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v9 = a3;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    v6 = [(PUStackView *)self _photoViews];
    v7 = [v6 objectAtIndex:a4];

    v8 = [v7 contentHelper];
    [v8 setTitle:v9];
  }
}

- (void)setTitleFontName:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v9 = a3;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    v6 = [(PUStackView *)self _photoViews];
    v7 = [v6 objectAtIndex:a4];

    v8 = [v7 contentHelper];
    [v8 setTitleFontName:v9];
  }
}

- (void)setCollectionTileLayoutTemplate:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v9 = a3;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    v6 = [(PUStackView *)self _photoViews];
    v7 = [v6 objectAtIndex:a4];

    v8 = [v7 contentHelper];
    [v8 setCollectionTileLayoutTemplate:v9];
  }
}

- (void)setFeatureSpec:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v9 = a3;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    v6 = [(PUStackView *)self _photoViews];
    v7 = [v6 objectAtIndex:a4];

    v8 = [v7 contentHelper];
    [v8 setFeatureSpec:v9];
  }
}

- (void)_updateDynamicLayout
{
  uint64_t v3 = [(PUStackView *)self numberOfVisibleItems];
  if ([(PUStackView *)self style] == 4 || [(PUStackView *)self style] == 3)
  {
    if (v3 >= 1)
    {
      transforms = self->_transforms;
      long long v5 = *MEMORY[0x1E4F1DAB8];
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      do
      {
        *(_OWORD *)&transforms->a = v5;
        *(_OWORD *)&transforms->c = v6;
        *(_OWORD *)&transforms->tdouble x = v7;
        ++transforms;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    [(PUStackView *)self stackPerspectiveOffset];
    double v9 = v8;
    double v11 = v10;
    [(PUStackView *)self stackPerspectiveFactor];
    if (v12 >= 0.0)
    {
      double v14 = v13;
      if (v13 >= 0.0)
      {
        double v15 = v12;
        [(PUStackView *)self stackPerspectiveInsets];
        double v17 = -v16;
        double v18 = 0.0;
        if (v14 > 0.25)
        {
          double v18 = 1.0;
          if (v14 < 1.0) {
            double v18 = (v14 + -0.25) / 0.75;
          }
        }
        double v9 = v9 * v15 + (1.0 - v15) * v9;
        double v11 = v11 * v18 + (1.0 - v18) * v17;
      }
    }
    if (v3 >= 1)
    {
      uint64_t v19 = 0;
      v20 = self->_transforms;
      do
      {
        memset(&v22, 0, sizeof(v22));
        CGAffineTransformMakeTranslation(&v22, v9 * (double)v19, v11 * (double)v19);
        long long v21 = *(_OWORD *)&v22.c;
        *(_OWORD *)&v20->a = *(_OWORD *)&v22.a;
        *(_OWORD *)&v20->c = v21;
        *(_OWORD *)&v20->tdouble x = *(_OWORD *)&v22.tx;
        ++v19;
        ++v20;
      }
      while (v3 != v19);
    }
  }
}

- (void)_setNeedsDynamicLayout
{
  self->_needsDynamicLayout = 1;
  [(PUStackView *)self setNeedsLayout];
}

- (id)_combinedPhotoDecorationsImage
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if (_combinedPhotoDecorationsImage_onceToken[0] != -1) {
    dispatch_once(_combinedPhotoDecorationsImage_onceToken, &__block_literal_global_88161);
  }
  uint64_t v3 = [(PUStackView *)self _photoDecorationVariants];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v80;
    uint64_t v7 = 1319;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v80 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(*((void *)&v79 + 1) + 8 * i) hash] ^ (1319 * v7);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = 1319;
  }
  double v9 = (void *)_combinedPhotoDecorationsImage__imageCache;
  double v10 = [NSNumber numberWithUnsignedInteger:v7];
  double v11 = [v9 objectForKey:v10];

  if (!v11 && v3)
  {
    [(PUStackView *)self bounds];
    CGFloat v72 = v13;
    CGFloat v73 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    double v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v18 scale];
    double v20 = v19;

    CGFloat v70 = v17;
    CGFloat v71 = v15;
    v86.double width = v15;
    v86.double height = v17;
    UIGraphicsBeginImageContextWithOptions(v86, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(CurrentContext, 0);
    int64_t v22 = [(PUStackView *)self numberOfVisibleItems];
    uint64_t v23 = [(PUStackView *)self _numberOfViews];
    if (v23 >= 1)
    {
      uint64_t v24 = v23;
      int64_t v25 = 0;
      v26 = &OBJC_IVAR___PUReviewScrubber__scrubberCellClass;
      v27 = self;
      double v67 = 1.0 / v20;
      uint64_t v68 = v23;
      int64_t v69 = v22;
      do
      {
        v78[0] = 0;
        v78[1] = 0;
        long long v76 = 0u;
        long long v77 = 0u;
        [(PUStackView *)self _getCenter:v78 bounds:&v76 forPhotoViewAtIndex:v25];
        v28 = (_OWORD *)((char *)v27 + v26[550]);
        long long v29 = v28[1];
        *(_OWORD *)&v75.a = *v28;
        *(_OWORD *)&v75.c = v29;
        *(_OWORD *)&v75.tCGFloat x = v28[2];
        UIRectCenteredAboutPoint();
        CGAffineTransform v74 = v75;
        CGRect v88 = CGRectApplyAffineTransform(v87, &v74);
        if (v25 < v22)
        {
          CGFloat x = v88.origin.x;
          CGFloat y = v88.origin.y;
          if (![(PUStackView *)self isImageHiddenForItemAtIndex:v25])
          {
            v32 = [(PUStackView *)self _photoViews];
            v33 = [v32 objectAtIndex:v25];

            v34 = [v33 contentHelper];
            objc_msgSend(v34, "imageContentFrameForBounds:", v76, v77);
            CGFloat v36 = v35;
            CGFloat v38 = v37;
            CGFloat v40 = v39;
            CGFloat v42 = v41;

            v89.origin.CGFloat x = v36;
            v89.origin.CGFloat y = v38;
            v89.size.double width = v40;
            v89.size.double height = v42;
            CGRect v90 = CGRectOffset(v89, x, y);
            double v43 = v90.origin.x;
            double v44 = v90.origin.y;
            double width = v90.size.width;
            double height = v90.size.height;
            v47 = [v33 contentHelper];
            objc_msgSend(v47, "photoDecorationBorderViewFrameForImageContentFrame:", v43, v44, width, height);
            CGFloat v49 = v48;
            double v51 = v50;
            double v53 = v52;
            double v55 = v54;

            v56 = [v3 objectAtIndex:v25];
            id v57 = [v56 foregroundColor];
            v58 = (CGColor *)[v57 CGColor];

            if (v58 && CGColorGetAlpha(v58) > 0.0)
            {
              CGContextSetFillColorWithColor(CurrentContext, v58);
              v91.origin.CGFloat x = v43;
              v91.origin.CGFloat y = v44;
              v91.size.double width = width;
              v91.size.double height = height;
              CGContextFillRect(CurrentContext, v91);
            }
            double v59 = v53 - v67;
            id v60 = [v56 borderColor];
            v61 = (CGColor *)[v60 CGColor];

            if (v61 && CGColorGetAlpha(v61) > 0.0)
            {
              [v56 borderWidth];
              CGFloat v63 = v62;
              CGContextSetStrokeColorWithColor(CurrentContext, v61);
              CGContextSetLineWidth(CurrentContext, v63);
              v92.origin.CGFloat x = v49;
              v92.origin.CGFloat y = v67 + v51;
              v92.size.double width = v59;
              v92.size.double height = v55 - v67;
              CGContextStrokeRect(CurrentContext, v92);
            }
            v93.origin.CGFloat y = v72;
            v93.origin.CGFloat x = v73;
            v93.size.double height = v70;
            v93.size.double width = v71;
            CGContextAddRect(CurrentContext, v93);
            v94.origin.CGFloat x = v49;
            v94.origin.CGFloat y = v67 + v51;
            v94.size.double width = v59;
            v94.size.double height = v55 - v67;
            CGContextAddRect(CurrentContext, v94);
            CGContextEOClip(CurrentContext);

            uint64_t v24 = v68;
            int64_t v22 = v69;
            v26 = &OBJC_IVAR___PUReviewScrubber__scrubberCellClass;
          }
        }
        ++v25;
        v27 = (PUStackView *)((char *)v27 + 48);
      }
      while (v24 != v25);
    }
    double v11 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v64 = (void *)_combinedPhotoDecorationsImage__imageCache;
    v65 = [NSNumber numberWithUnsignedInteger:v7];
    [v64 setObject:v11 forKey:v65];
  }
  return v11;
}

void __45__PUStackView__combinedPhotoDecorationsImage__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_combinedPhotoDecorationsImage__imageCache;
  _combinedPhotoDecorationsImage__imageCache = (uint64_t)v0;
}

- (void)_getCenter:(CGPoint *)a3 bounds:(CGRect *)a4 forPhotoViewAtIndex:(int64_t)a5
{
  [(PUStackView *)self _getStackFrame];
  double v11 = v10;
  double y = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  [(PUStackView *)self stackPerspectiveInsets];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  uint64_t v26 = [(PUStackView *)self effectiveUserInterfaceLayoutDirection];
  unint64_t v27 = [(PUStackView *)self style];
  switch(v27)
  {
    case 1uLL:
      CGFloat v38 = [(PUStackView *)self _imageSizes];
      double v39 = [v38 pointerAtIndex:a5];

      [v39 CGSizeValue];
      double v11 = PURectWithSizeThatFitsInRect(v40, v41, v11, y, v15, v17);
      double y = v42;
      double v15 = v43;
      CGFloat v17 = v44;

      goto LABEL_16;
    case 2uLL:
      double v11 = PURectWithSizeThatFitsInRect(1.0, 0.850000024, v11, y, v15, v17);
      double y = v45;
      double v15 = v46;
      CGFloat v17 = v47;
      goto LABEL_16;
    case 3uLL:
    case 4uLL:
      unint64_t v28 = v27;
      long long v29 = (double *)MEMORY[0x1E4FB2848];
      [(PUStackView *)self gridMargin];
      CGFloat v31 = v30;
      [(PUStackView *)self gridItemSpacing];
      double v33 = v32;
      v78.origin.CGFloat x = v11;
      v78.origin.double y = y;
      v78.size.CGFloat width = v15;
      v78.size.CGFloat height = v17;
      CGRect v79 = CGRectInset(v78, v31, v31);
      uint64_t v34 = 2;
      if (v28 != 3) {
        uint64_t v34 = 3;
      }
      double v35 = v33 * (double)(v34 - 1);
      double v15 = (v79.size.width - v35) / (double)v34;
      CGFloat v17 = (v79.size.height - v35) / (double)v34;
      int64_t v36 = a5 / v34;
      int64_t v37 = a5 % v34;
      if (v26) {
        double v11 = CGRectGetMaxX(v79) - v15 * (double)(v37 + 1) - v33 * (double)v37;
      }
      else {
        double v11 = (v33 + v15) * (double)v37 + CGRectGetMinX(v79);
      }
      double v23 = v29[2];
      double v25 = v29[3];
      double v58 = v33 + v17;
      double v21 = v29[1];
      double y = v31 + (double)v36 * v58;
      double v19 = *v29;
      goto LABEL_16;
    case 6uLL:
      uint64_t v48 = [(PUStackView *)self numberOfVisibleItems];
      if (v48 < [(id)objc_opt_class() maximumNumberOfVisibleItemsForStyle:6]) {
        goto LABEL_16;
      }
      double v75 = v19;
      double v76 = v21;
      [(PUStackView *)self gridMargin];
      CGFloat v50 = v49;
      [(PUStackView *)self gridItemSpacing];
      double v52 = v51;
      v80.origin.CGFloat x = v11;
      v80.origin.double y = y;
      v80.size.CGFloat width = v15;
      v80.size.CGFloat height = v17;
      CGRect v81 = CGRectInset(v80, v50, v50);
      double y = v81.origin.y;
      CGFloat width = v81.size.width;
      CGFloat v17 = (v81.size.height - v52) * 0.5;
      double v15 = (v81.size.width - v52) / 3.0;
      CGFloat rect = v81.origin.x;
      CGFloat height = v81.size.height;
      double v11 = CGRectGetMaxX(v81) - v15;
      if (a5 == 2)
      {
        double v21 = v76;
        CGFloat v65 = rect;
        CGFloat v66 = height;
        if (v26)
        {
          CGFloat v67 = rect;
          double v68 = y;
          CGFloat v69 = width;
          CGFloat MinX = CGRectGetMinX(*(CGRect *)(&v66 - 3));
          CGFloat v66 = height;
          double v11 = MinX;
          CGFloat v65 = rect;
        }
        double v71 = y;
        CGFloat v72 = width;
        double y = CGRectGetMaxY(*(CGRect *)&v65) - v17;
      }
      else
      {
        double v21 = v76;
        if (a5 == 1)
        {
          if (!v26) {
            goto LABEL_27;
          }
          v82.origin.CGFloat x = rect;
          v82.origin.double y = y;
          v82.size.CGFloat width = width;
          v82.size.CGFloat height = height;
          CGFloat v54 = CGRectGetMinX(v82);
        }
        else
        {
          if (a5)
          {
            CGFloat v73 = [MEMORY[0x1E4F28B00] currentHandler];
            [v73 handleFailureInMethod:a2 object:self file:@"PUStackView.m" lineNumber:730 description:@"Code which should be unreachable has been reached"];

            abort();
          }
          double v15 = v15 + v15;
          CGFloat v17 = height;
          CGFloat v54 = rect;
          if (v26)
          {
            double v55 = y;
            CGFloat v56 = width;
            CGFloat v57 = height;
            double v11 = CGRectGetMaxX(*(CGRect *)&v54) - v15;
            goto LABEL_27;
          }
        }
        double v11 = v54;
      }
LABEL_27:
      double v19 = v75;
LABEL_16:
      PURoundRectToPixel(v11 + v21 * (double)a5, y + v19 * (double)a5, v15 - (v21 * (double)a5 + v25 * (double)a5), v17 - (v19 * (double)a5 + v23 * (double)a5));
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      if (a3)
      {
        UIRectGetCenter();
        a3->CGFloat x = v63;
        a3->double y = v64;
      }
      if (a4)
      {
        a4->origin.CGFloat x = 0.0;
        a4->origin.double y = 0.0;
        a4->size.CGFloat width = v60;
        a4->size.CGFloat height = v62;
      }
      return;
    default:
      goto LABEL_16;
  }
}

- (CGRect)_getStackFrame
{
  [(PUStackView *)self stackOffset];
  double v4 = v3;
  double v6 = v5;
  [(PUStackView *)self bounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  double v11 = v4 + CGRectGetMidX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  double v12 = v6 + CGRectGetMidY(v20);
  [(PUStackView *)self stackSize];
  if (v13 >= width) {
    double v15 = width;
  }
  else {
    double v15 = v13;
  }
  if (v14 >= height) {
    double v16 = height;
  }
  else {
    double v16 = v14;
  }
  double v17 = v11 - v15 * 0.5;
  double v18 = v12 - v16 * 0.5;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)_rebuildDecorationVariants
{
  id v11 = [(PUStackView *)self photoDecoration];
  uint64_t v3 = [(PUStackView *)self numberOfVisibleItems];
  if ([(PUStackView *)self style] == 4 || [(PUStackView *)self style] == 3)
  {
    double v4 = 0;
  }
  else
  {
    double v5 = [(PUStackView *)self emptyPlaceholderImage];

    if (v5) {
      [v11 photoDecorationVariantsWithIncreasingBorderBrightness:v3];
    }
    else {
    double v4 = [v11 photoDecorationVariantsWithIncreasingAlpha:v3];
    }
  }
  [(PUStackView *)self _setPhotoDecorationVariants:v4];
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (v4)
      {
        uint64_t v7 = [v4 objectAtIndex:i];
      }
      else
      {
        uint64_t v7 = 0;
      }
      double v8 = [(PUStackView *)self _photoViews];
      double v9 = [v8 objectAtIndex:i];

      double v10 = [v9 contentHelper];
      [v10 setPhotoDecoration:v7];
    }
  }
}

- (void)_updatePhotoViews
{
  if ([(PUStackView *)self style] == 5
    || [(PUStackView *)self style] == 3
    || ![(PUStackView *)self style])
  {
    double v4 = [(PUStackView *)self gridBackgroundColor];
  }
  else
  {
    double v4 = 0;
  }
  [(PUStackView *)self cornerRadius];
  uint64_t v6 = v5;
  uint64_t v7 = [(PUStackView *)self cornersBackgroundColor];
  [(PUStackView *)self itemAlpha];
  uint64_t v9 = v8;
  BOOL v10 = [(PUStackView *)self combinesPhotoDecorations];
  BOOL v11 = [(PUStackView *)self effectiveUserInterfaceLayoutDirection] == 0;
  double v12 = [(PUStackView *)self _photoViews];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __32__PUStackView__updatePhotoViews__block_invoke;
  v15[3] = &unk_1E5F2C108;
  BOOL v21 = v11;
  BOOL v22 = v10;
  v15[4] = self;
  id v16 = v7;
  id v17 = v4;
  SEL v18 = a2;
  uint64_t v19 = v6;
  uint64_t v20 = v9;
  id v13 = v4;
  id v14 = v7;
  [v12 enumerateObjectsUsingBlock:v15];
}

void __32__PUStackView__updatePhotoViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  if ([*(id *)(a1 + 32) style] != 6)
  {
    uint64_t v8 = -1;
    goto LABEL_14;
  }
  if (a3 == 2)
  {
    BOOL v5 = *(unsigned char *)(a1 + 80) == 0;
    uint64_t v6 = 8;
    uint64_t v7 = 4;
LABEL_8:
    if (v5) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v6;
    }
    goto LABEL_14;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PUStackView.m" lineNumber:603 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    BOOL v5 = *(unsigned char *)(a1 + 80) == 0;
    uint64_t v6 = 5;
    uint64_t v7 = 10;
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 80)) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
LABEL_14:
  uint64_t v9 = [MEMORY[0x1E4F90330] sharedInstance];
  int v10 = [v9 disableRoundedOverlays];

  uint64_t v11 = ([*(id *)(a1 + 32) cornerOverlaysDisabled] | v10) ^ 1;
  double v12 = [v18 contentHelper];
  [v12 setAvoidsImageViewIfPossible:*(unsigned __int8 *)(a1 + 81)];

  id v13 = [v18 contentHelper];
  [v13 setAvoidsPhotoDecoration:*(unsigned __int8 *)(a1 + 81)];

  id v14 = [v18 contentHelper];
  objc_msgSend(v14, "setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:", v8, v11, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "continuousCorners"), *(double *)(a1 + 64));

  double v15 = [v18 contentHelper];
  [v15 setBackgroundColor:*(void *)(a1 + 48)];

  id v16 = [v18 contentHelper];
  [v16 setContentAlpha:*(double *)(a1 + 72)];
}

- (void)_updateSubviewsOrdering
{
  uint64_t v3 = [(PUStackView *)self _backgroundView];
  if (v3)
  {
    double v4 = v3;
    [(PUStackView *)self sendSubviewToBack:v3];
    uint64_t v3 = v4;
  }
}

- (void)_updateHighlight
{
  BOOL v3 = [(PUStackView *)self isHighlighted];
  unint64_t v4 = [(PUStackView *)self style];
  unsigned int v5 = (0x68u >> v4) & 1;
  if (v4 > 6) {
    LOBYTE(v5) = 0;
  }
  if (v3) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  uint64_t v7 = [(PUStackView *)self _photoViews];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__PUStackView__updateHighlight__block_invoke;
  v8[3] = &__block_descriptor_33_e28_v32__0__PUPhotoView_8Q16_B24l;
  char v9 = v6;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __31__PUStackView__updateHighlight__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentHelper];
  [v3 setHighlighted:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateBackgroundView
{
  unint64_t v3 = [(PUStackView *)self style];
  unint64_t v4 = [(PUStackView *)self _backgroundView];
  if (v3 == 4)
  {
    id v7 = v4;
    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PUStackView *)self bounds];
      id v7 = (id)objc_msgSend(v5, "initWithFrame:");
      [(PUStackView *)self insertSubview:v7 atIndex:0];
      [(PUStackView *)self _setBackgroundView:v7];
      [(PUStackView *)self _updateSubviewsOrdering];
    }
    char v6 = [(PUStackView *)self gridBackgroundColor];
    [v7 setBackgroundColor:v6];
  }
  else
  {
    if (!v4) {
      return;
    }
    id v7 = v4;
    [v4 removeFromSuperview];
    [(PUStackView *)self _setBackgroundView:0];
  }
}

- (void)_updateNumberOfViews
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfVisibleItemsForStyle:", -[PUStackView style](self, "style"));
  if (v3 != self->__numberOfViews)
  {
    int64_t v4 = v3;
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->__photoViews];
    int64_t numberOfViews = self->__numberOfViews;
    if (numberOfViews < v4)
    {
      int64_t v7 = numberOfViews;
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v16 = *MEMORY[0x1E4F1DAB8];
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      do
      {
        uint64_t v8 = [PUPhotoView alloc];
        [(PUStackView *)self bounds];
        char v9 = -[PUPhotoView initWithFrame:](v8, "initWithFrame:");
        int v10 = [(PUPhotoView *)v9 layer];
        [v10 setAllowsGroupOpacity:0];

        uint64_t v11 = [(PUPhotoView *)v9 contentHelper];
        [v11 setFillMode:1];

        [(PUStackView *)self insertSubview:v9 atIndex:0];
        [(NSArray *)v5 addObject:v9];
        double v12 = &self->_transforms[v7];
        *(_OWORD *)&v12->a = v16;
        *(_OWORD *)&v12->c = v15;
        *(_OWORD *)&v12->tCGFloat x = v14;
        self->_imageHidden[numberOfViews] = 0;

        ++numberOfViews;
        ++v7;
      }
      while (v4 != numberOfViews);
    }
    self->__int64_t numberOfViews = v4;
    photoViews = self->__photoViews;
    self->__photoViews = v5;

    [(PUStackView *)self _updatePhotoViews];
    [(PUStackView *)self _updateSubviewsOrdering];
  }
}

- (void)prepareForReuse
{
  uint64_t v3 = [(PUStackView *)self numberOfVisibleItems];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    double v6 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      uint64_t v8 = [(PUStackView *)self emptyPlaceholderImage];
      [(PUStackView *)self setImage:v8 forItemAtIndex:v5];

      -[PUStackView setImageSize:forItemAtIndex:](self, "setImageSize:forItemAtIndex:", v5, v6, v7);
      [(PUStackView *)self setFeatureSpec:0 forItemAtIndex:v5];
      [(PUStackView *)self setCollectionTileLayoutTemplate:0 forItemAtIndex:v5];
      [(PUStackView *)self setTitleFontName:0 forItemAtIndex:v5];
      [(PUStackView *)self setTitle:0 forItemAtIndex:v5];
      [(PUStackView *)self setSubtitle:0 forItemAtIndex:v5++];
    }
    while (v4 != v5);
  }
}

- (id)newLayoutAttributesForVisbleItemsRelativeToView:(id)a3 maxCount:(int64_t)a4
{
  id v6 = a3;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  int64_t v8 = [(PUStackView *)self numberOfVisibleItems];
  if (v8 >= a4) {
    int64_t v9 = a4;
  }
  else {
    int64_t v9 = v8;
  }
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      id v11 = [(PUStackView *)self newLayoutAttributesForItemAtIndex:i relativeToView:v6];
      [v7 addObject:v11];
    }
  }

  return v7;
}

- (id)newLayoutAttributesForItemAtIndex:(int64_t)a3 relativeToView:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4FB15E0];
  double v7 = (void *)MEMORY[0x1E4F28D58];
  id v8 = a4;
  int64_t v9 = [v7 indexPathForItem:a3 inSection:0];
  int v10 = [v6 layoutAttributesForCellWithIndexPath:v9];

  double v21 = 0.0;
  double v22 = 0.0;
  long long v19 = 0u;
  long long v20 = 0u;
  [(PUStackView *)self _getCenter:&v21 bounds:&v19 forPhotoViewAtIndex:a3];
  -[PUStackView convertPoint:toView:](self, "convertPoint:toView:", v8, v21, v22);
  double v12 = v11;
  double v14 = v13;

  double v21 = v12;
  double v22 = v14;
  objc_msgSend(v10, "setCenter:", v12, v14);
  [v10 setSize:v20];
  long long v15 = &self->_transforms[a3];
  long long v16 = *(_OWORD *)&v15->c;
  v18[0] = *(_OWORD *)&v15->a;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&v15->tx;
  [v10 setTransform:v18];
  objc_msgSend(v10, "setZIndex:", -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems") + ~a3);
  return v10;
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_emptCGFloat y = a3;
    if (a3)
    {
      uint64_t v4 = [(PUStackView *)self numberOfVisibleItems];
      if (v4 >= 1)
      {
        uint64_t v5 = v4;
        for (uint64_t i = 0; i != v5; ++i)
          [(PUStackView *)self setImage:0 forItemAtIndex:i];
      }
      [(PUStackView *)self _rebuildDecorationVariants];
    }
  }
}

- (void)setEmptyPlaceholderImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_emptyPlaceholderImage = &self->_emptyPlaceholderImage;
  if (self->_emptyPlaceholderImage != v5)
  {
    id v17 = v5;
    objc_storeStrong((id *)p_emptyPlaceholderImage, a3);
    [(UIImage *)v17 size];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [(PUStackView *)self numberOfVisibleItems];
    if (v11 >= 1)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        [(PUStackView *)self setImage:v17 forItemAtIndex:i];
        -[PUStackView setImageSize:forItemAtIndex:](self, "setImageSize:forItemAtIndex:", i, v8, v10);
        double v14 = [(PUStackView *)self _photoViews];
        long long v15 = [v14 objectAtIndex:i];

        long long v16 = [v15 contentHelper];
        [v16 setFillMode:0];
      }
    }
    p_emptyPlaceholderImage = (UIImage **)[(PUStackView *)self _rebuildDecorationVariants];
  }
  MEMORY[0x1F4181820](p_emptyPlaceholderImage);
}

- (BOOL)wouldCoverAllItemsInStackView:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v34 = v4;
  id v6 = [v4 _photoViews];
  double v7 = (void *)[v5 initWithArray:v6];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [(PUStackView *)self _photoViews];
  uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        double v13 = (void *)[v7 copy];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              [v12 frame];
              CGFloat v21 = v20;
              CGFloat v23 = v22;
              CGFloat v25 = v24;
              CGFloat v27 = v26;
              [v19 frame];
              v48.origin.CGFloat x = v28;
              v48.origin.CGFloat y = v29;
              v48.size.double width = v30;
              v48.size.double height = v31;
              v47.origin.CGFloat x = v21;
              v47.origin.CGFloat y = v23;
              v47.size.double width = v25;
              v47.size.double height = v27;
              if (CGRectContainsRect(v47, v48)) {
                [v7 removeObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v16);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v9);
  }

  BOOL v32 = [v7 count] == 0;
  return v32;
}

- (NSArray)stackItemViews
{
  return self->__photoViews;
}

- (CGPoint)topLeftCornerOfFrontStackItem
{
  if ([(PUStackView *)self style] == 4)
  {
    [(PUStackView *)self _getStackFrame];
  }
  else
  {
    id v5 = [(PUStackView *)self newLayoutAttributesForItemAtIndex:0 relativeToView:self];
    [v5 frame];
    CGRect v11 = CGRectIntegral(v10);
    CGFloat x = v11.origin.x;
    CGFloat y = v11.origin.y;

    double v3 = x;
    double v4 = y;
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGRect)rectOfStackItemAtIndex:(int64_t)a3 inCoordinateSpace:(id)a4
{
  id v6 = a4;
  double v7 = [(PUStackView *)self _photoViews];
  if ([v7 count] <= (unint64_t)a3)
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
    [v8 bounds];
    objc_msgSend(v8, "convertRect:toCoordinateSpace:", v6);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(PUStackView *)self _updateHighlight];
  }
}

- (void)setCornerOverlaysDisabled:(BOOL)a3
{
  if (self->_cornerOverlaysDisabled != a3)
  {
    self->_cornerOverlaysDisabled = a3;
    [(PUStackView *)self _updatePhotoViews];
  }
}

- (void)setHasRoundedCorners:(BOOL)a3 withCornersBackgroundColor:(id)a4
{
  BOOL v5 = a3;
  double v7 = (UIColor *)a4;
  if (self->_hasRoundedCorners != v5 || self->_cornersBackgroundColor != v7)
  {
    self->_hasRoundedCorners = v5;
    uint64_t v8 = v7;
    objc_storeStrong((id *)&self->_cornersBackgroundColor, a4);
    [(PUStackView *)self _updatePhotoViews];
    double v7 = v8;
  }
}

- (void)setHasRoundedCorners:(BOOL)a3
{
}

- (double)cornerRadius
{
  if (![(PUStackView *)self hasRoundedCorners]) {
    return 0.0;
  }
  if ([(PUStackView *)self style] == 3)
  {
    [(PUStackView *)self posterSubitemCornerRadius];
  }
  else
  {
    [(PUStackView *)self posterSquareCornerRadius];
  }
  return result;
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4 forItemAtIndex:(int64_t)a5
{
  uint64_t v8 = [(PUStackView *)self _photoViews];
  double v9 = [v8 objectAtIndex:a5];

  double v10 = [v9 contentHelper];
  long long v11 = *(_OWORD *)&a3->count;
  v12[0] = *(_OWORD *)&a3->badges;
  v12[1] = v11;
  [v10 setBadgeInfo:v12];
  [v10 setBadgeStyle:a4];
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3 forItemAtIndex:(int64_t)a4
{
  long long v4 = *(_OWORD *)&a3->count;
  v5[0] = *(_OWORD *)&a3->badges;
  v5[1] = v4;
  [(PUStackView *)self setBadgeInfo:v5 style:1 forItemAtIndex:a4];
}

- (void)setImageHidden:(BOOL)a3 forItemAtIndex:(int64_t)a4
{
  if (a4 <= 8 && self->_imageHidden[a4] != a3)
  {
    self->_imageHidden[a4] = a3;
    [(PUStackView *)self setNeedsLayout];
  }
}

- (BOOL)isImageHiddenForItemAtIndex:(int64_t)a3
{
  return a3 > 8 || self->_imageHidden[a3];
}

- (void)setItemAlpha:(double)a3
{
  if (self->_itemAlpha != a3)
  {
    self->_itemAlpha = a3;
    [(PUStackView *)self _updatePhotoViews];
  }
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  double v9 = (UIImage *)a3;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    id v6 = [(PUStackView *)self _photoViews];
    double v7 = [v6 objectAtIndexedSubscript:a4];
    uint64_t v8 = [v7 contentHelper];

    [v8 setPhotoImage:v9];
    [v8 setFillMode:self->_emptyPlaceholderImage != v9];
  }
}

- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(PUStackView *)self _numberOfViews] > a4)
  {
    id v8 = [(PUStackView *)self _imageSizes];
    objc_msgSend(v8, "replacePointerAtIndex:withPointer:", a4, objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height));
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setNumberOfVisibleItems:(int64_t)a3
{
  if (self->_numberOfVisibleItems != a3)
  {
    self->_numberOfVisibleItems = a3;
    [(PUStackView *)self _rebuildDecorationVariants];
    [(PUStackView *)self _setNeedsDynamicLayout];
  }
}

- (void)setGridItemSpacing:(double)a3
{
  if (self->_gridItemSpacing != a3)
  {
    self->_gridItemSpacing = a3;
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setGridMargin:(double)a3
{
  if (self->_gridMargin != a3)
  {
    self->_gridMargin = a3;
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setGridBackgroundColor:(id)a3
{
  BOOL v5 = (UIColor *)a3;
  if (self->_gridBackgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_gridBackgroundColor, a3);
    if (self->_style == 3) {
      [(PUStackView *)self _updatePhotoViews];
    }
    else {
      [(PUStackView *)self _updateBackgroundView];
    }
    BOOL v5 = v6;
  }
}

- (void)setPosterSubitemCornerRadius:(double)a3
{
  if (self->_posterSubitemCornerRadius != a3)
  {
    self->_posterSubitemCornerRadius = a3;
    [(PUStackView *)self _updatePhotoViews];
  }
}

- (void)setPosterSquareCornerRadius:(double)a3
{
  if (self->_posterSquareCornerRadius != a3)
  {
    self->_posterSquareCornerRadius = a3;
    [(PUStackView *)self _updatePhotoViews];
  }
}

- (void)setContinuousCorners:(BOOL)a3
{
  if (self->_continuousCorners != a3)
  {
    self->_continuousCorners = a3;
    [(PUStackView *)self _updatePhotoViews];
  }
}

- (void)setStackPerspectiveFactor:(CGPoint)a3
{
  double v3 = fmax(a3.x, 0.0);
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  double v4 = fmax(a3.y, 0.0);
  if (v4 > 1.0) {
    double v4 = 1.0;
  }
  if (v3 != self->_stackPerspectiveFactor.x || v4 != self->_stackPerspectiveFactor.y)
  {
    self->_stackPerspectiveFactor.CGFloat x = v3;
    self->_stackPerspectiveFactor.CGFloat y = v4;
    [(PUStackView *)self _setNeedsDynamicLayout];
  }
}

- (void)setStackPerspectiveOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_stackPerspectiveOffset.horizontal
    || a3.vertical != self->_stackPerspectiveOffset.vertical)
  {
    self->_stackPerspectiveOffset = a3;
    [(PUStackView *)self _setNeedsDynamicLayout];
  }
}

- (void)setStackOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_stackOffset.horizontal || a3.vertical != self->_stackOffset.vertical)
  {
    self->_stackOffset = a3;
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setStackPerspectiveInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_stackPerspectiveInsets.left
    || a3.top != self->_stackPerspectiveInsets.top
    || a3.right != self->_stackPerspectiveInsets.right
    || a3.bottom != self->_stackPerspectiveInsets.bottom)
  {
    self->_stackPerspectiveInsets = a3;
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setStackSize:(CGSize)a3
{
  if (a3.width != self->_stackSize.width || a3.height != self->_stackSize.height)
  {
    self->_stackSize = a3;
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setCombinesPhotoDecorations:(BOOL)a3
{
  if (self->_combinesPhotoDecorations != a3)
  {
    self->_combinesPhotoDecorations = a3;
    combinedPhotoDecorationImageView = self->_combinedPhotoDecorationImageView;
    if (a3)
    {
      if (!combinedPhotoDecorationImageView)
      {
        BOOL v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        id v6 = self->_combinedPhotoDecorationImageView;
        self->_combinedPhotoDecorationImageView = v5;

        [(PUStackView *)self addSubview:self->_combinedPhotoDecorationImageView];
      }
    }
    else if (combinedPhotoDecorationImageView)
    {
      [(UIImageView *)combinedPhotoDecorationImageView removeFromSuperview];
      double v7 = self->_combinedPhotoDecorationImageView;
      self->_combinedPhotoDecorationImageView = 0;
    }
    [(PUStackView *)self _updatePhotoViews];
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)setPhotoDecoration:(id)a3
{
  BOOL v5 = (PUPhotoDecoration *)a3;
  if (self->_photoDecoration != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_photoDecoration, a3);
    [(PUStackView *)self _rebuildDecorationVariants];
    [(PUStackView *)self _setNeedsDynamicLayout];
    BOOL v5 = v6;
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PUStackView *)self _updateBackgroundView];
    [(PUStackView *)self _updateNumberOfViews];
    [(PUStackView *)self _rebuildDecorationVariants];
    [(PUStackView *)self _setNeedsDynamicLayout];
    [(PUStackView *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUStackView;
  id v4 = a3;
  [(PUStackView *)&v7 traitCollectionDidChange:v4];
  BOOL v5 = [(PUStackView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PUStackView *)self _rebuildDecorationVariants];
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PUStackView;
  [(PUStackView *)&v10 layoutSubviews];
  double v3 = [(PUStackView *)self _backgroundView];
  if (v3)
  {
    [(PUStackView *)self _getStackFrame];
    objc_msgSend(v3, "setFrame:");
  }
  int64_t v4 = [(PUStackView *)self numberOfVisibleItems];
  int64_t v5 = v4;
  if (self->_needsDynamicLayout)
  {
    self->_needsDynamicLayout = 0;
    if (v4) {
      [(PUStackView *)self _updateDynamicLayout];
    }
  }
  int v6 = [(PUStackView *)self _photoViews];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__PUStackView_layoutSubviews__block_invoke;
  v9[3] = &unk_1E5F2C0C0;
  v9[4] = self;
  v9[5] = v5;
  [v6 enumerateObjectsUsingBlock:v9];

  if (self->_combinedPhotoDecorationImageView)
  {
    objc_super v7 = [(PUStackView *)self _combinedPhotoDecorationsImage];
    [(UIImageView *)self->_combinedPhotoDecorationImageView setImage:v7];
    combinedPhotoDecorationImageView = self->_combinedPhotoDecorationImageView;
    [(PUStackView *)self bounds];
    -[UIImageView setFrame:](combinedPhotoDecorationImageView, "setFrame:");
  }
}

void __29__PUStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40) <= a3)
  {
    int v9 = 1;
  }
  else
  {
    double v16 = 0.0;
    double v17 = 0.0;
    long long v14 = 0u;
    long long v15 = 0u;
    [*(id *)(a1 + 32) _getCenter:&v16 bounds:&v14 forPhotoViewAtIndex:a3];
    objc_msgSend(v5, "setCenter:", v16, v17);
    objc_msgSend(v5, "setBounds:", v14, v15);
    int v6 = (long long *)(*(void *)(a1 + 32) + 408 + 48 * a3);
    long long v7 = v6[1];
    long long v11 = *v6;
    long long v12 = v7;
    long long v13 = v6[2];
    id v8 = [v5 layer];
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    [v8 setAffineTransform:v10];

    int v9 = 0;
  }
  [v5 setHidden:v9 | *(unsigned __int8 *)(*(void *)(a1 + 32) + 848 + a3)];
}

- (PUStackView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PUStackView;
  double v3 = -[PUStackView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    int64_t v4 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
    [(NSPointerArray *)v4 setCount:9];
    imageSizes = v3->__imageSizes;
    v3->__imageSizes = v4;

    v3->_itemAlpha = 1.0;
    v3->_continuousCorners = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    v3->_stackPerspectiveFactor = _Q0;
    [(PUStackView *)v3 _updateBackgroundView];
    [(PUStackView *)v3 _updateNumberOfViews];
  }
  return v3;
}

+ (int64_t)maximumNumberOfVisibleItemsForStyle:(unint64_t)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return qword_1AEFF8548[a3];
  }
}

@end