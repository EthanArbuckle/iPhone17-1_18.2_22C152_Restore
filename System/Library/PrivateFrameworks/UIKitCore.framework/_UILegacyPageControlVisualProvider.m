@interface _UILegacyPageControlVisualProvider
- (BOOL)_hasCustomImageForPage:(int64_t)a3 enabled:(BOOL)a4;
- (CGRect)_indicatorFrameAtIndex:(int64_t)a3;
- (CGRect)_modernBounds;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeForNumberOfPages:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_indicatorSpacing;
- (double)_modernCornerRadius;
- (id)_cachedPageIndicatorCurrentImageForPage:(int64_t)a3;
- (id)_cachedPageIndicatorImageForPage:(int64_t)a3;
- (id)_indicatorViewEnabled:(BOOL)a3 index:(int64_t)a4;
- (id)_modernColorEnabled:(BOOL)a3;
- (id)_pageIndicatorCurrentImageForPage:(int64_t)a3;
- (id)_pageIndicatorImageForPage:(int64_t)a3;
- (id)defaultActivePageIndicatorImage;
- (id)effectiveContentView;
- (id)preferredIndicatorImage;
- (void)_cachePageIndicatorImages;
- (void)_drawModernIndicatorInView:(id)a3 enabled:(BOOL)a4;
- (void)_setDisplayedPage:(int64_t)a3;
- (void)_transitionIndicator:(id)a3 toEnabled:(BOOL)a4 index:(int64_t)a5;
- (void)didEndTrackingWithTouch:(id)a3;
- (void)didUpdateNumberOfPages;
- (void)didUpdatePageIndicatorTintColor;
- (void)invalidateIndicators;
- (void)layoutSubviews;
- (void)prepare;
- (void)pruneArchivedSubviews:(id)a3;
- (void)updateDisplayedPageToCurrentPage;
@end

@implementation _UILegacyPageControlVisualProvider

- (void)prepare
{
  v7.receiver = self;
  v7.super_class = (Class)_UILegacyPageControlVisualProvider;
  [(_UIPageControlVisualProvider *)&v7 prepare];
  if ([(UIPageControl *)self->super._pageControl _implementsCustomPageImagesOverride])
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    pageImages = self->_pageImages;
    self->_pageImages = v3;
  }
  if ([(UIPageControl *)self->super._pageControl _implementsCustomCurrentPageImagesOverride])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    currentPageImages = self->_currentPageImages;
    self->_currentPageImages = v5;
  }
}

- (void)pruneArchivedSubviews:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_indicators;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)didUpdateNumberOfPages
{
  [(_UILegacyPageControlVisualProvider *)self _cachePageIndicatorImages];
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  uint64_t v3 = [(UIPageControl *)self->super._pageControl numberOfPages];
  uint64_t v4 = [(NSMutableArray *)self->_indicators count];
  if (v3 <= v4)
  {
    if (v3 < 1)
    {
      [(NSMutableArray *)self->_indicators makeObjectsPerformSelector:sel_removeFromSuperview];
      indicators = self->_indicators;
      [(NSMutableArray *)indicators removeAllObjects];
    }
    else
    {
      while (v4 > v3)
      {
        uint64_t v9 = [(NSMutableArray *)self->_indicators objectAtIndex:--v4];
        [v9 removeFromSuperview];
        [(NSMutableArray *)self->_indicators removeObjectAtIndex:v4];
      }
    }
  }
  else
  {
    if (!self->_indicators)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = self->_indicators;
      self->_indicators = v5;
    }
    do
    {
      uint64_t v7 = [(_UILegacyPageControlVisualProvider *)self _indicatorViewEnabled:v4 == [(UIPageControl *)self->super._pageControl currentPage] index:v4];
      uint64_t v8 = [(_UILegacyPageControlVisualProvider *)self effectiveContentView];
      [v8 addSubview:v7];

      [(NSMutableArray *)self->_indicators addObject:v7];
      ++v4;
    }
    while (v3 != v4);
  }
}

- (void)didUpdatePageIndicatorTintColor
{
  uint64_t v3 = [(UIPageControl *)self->super._pageControl numberOfPages];
  if (v3 > 1 || v3 == 1 && self->super._displayedPage)
  {
    [(_UILegacyPageControlVisualProvider *)self invalidateIndicators];
  }
}

- (void)didEndTrackingWithTouch:(id)a3
{
  id v20 = a3;
  BOOL v4 = [(UIControl *)self->super._pageControl isTouchInside];
  v5 = v20;
  if (v4)
  {
    [v20 locationInView:self->super._pageControl];
    double v7 = v6;
    uint64_t v8 = [(UIPageControl *)self->super._pageControl currentPage];
    BOOL v9 = [(UIPageControl *)self->super._pageControl defersCurrentPageDisplay];
    BOOL v10 = [(UIView *)self->super._pageControl _shouldReverseLayoutDirection];
    [(UIView *)self->super._pageControl bounds];
    double v12 = v11;
    double v14 = v13;
    if ([(UIPageControl *)self->super._pageControl numberOfPages] == 2
      && (v8 & 0x8000000000000000) == 0)
    {
      pageControl = self->super._pageControl;
      uint64_t v16 = v8 == 0;
LABEL_14:
      [(UIPageControl *)pageControl _updateCurrentPage:v16 updateDisplayImmediately:!v9];
      [(UIPageControl *)self->super._pageControl _emitValueChanged];
      v5 = v20;
      goto LABEL_15;
    }
    double v17 = v12 + v14 * 0.5;
    if (v10) {
      BOOL v18 = v7 >= v17;
    }
    else {
      BOOL v18 = v7 <= v17;
    }
    if (v18)
    {
      uint64_t v16 = v8 - 1;
      v5 = v20;
      if (v8 < 1) {
        goto LABEL_15;
      }
      pageControl = self->super._pageControl;
      goto LABEL_14;
    }
    v5 = v20;
    if ((v8 & 0x8000000000000000) == 0)
    {
      NSInteger v19 = [(UIPageControl *)self->super._pageControl numberOfPages];
      v5 = v20;
      if (v8 < v19 - 1)
      {
        pageControl = self->super._pageControl;
        uint64_t v16 = v8 + 1;
        goto LABEL_14;
      }
    }
  }
LABEL_15:
}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3)
  {
    unint64_t v7 = 0;
    unint64_t v8 = a3 - 1;
    do
    {
      if (v7 < v8)
      {
        [(_UILegacyPageControlVisualProvider *)self _indicatorSpacing];
        double v4 = v4 + v9;
      }
      ++v7;
    }
    while (a3 != v7);
  }
  [(_UILegacyPageControlVisualProvider *)self _modernBounds];
  double v11 = v4 + v10;
  [(_UILegacyPageControlVisualProvider *)self _modernBounds];
  double v13 = v5 + v12 + 30.0;
  double v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v5 = [(NSMutableArray *)self->_indicators count];
  if (v5)
  {
    uint64_t v6 = v5;
    if (v5 != 1 || ![(UIPageControl *)self->super._pageControl hidesForSinglePage])
    {
      [(_UILegacyPageControlVisualProvider *)self _indicatorSpacing];
      double v8 = v4 + v7 * (double)(v6 - 1);
      if (v6 >= 1)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if ([(_UILegacyPageControlVisualProvider *)self _hasCustomImageForPage:i enabled:i == [(UIPageControl *)self->super._pageControl currentPage]])
          {
            [(_UILegacyPageControlVisualProvider *)self _indicatorFrameAtIndex:i];
            double v8 = v8 + v10;
          }
        }
      }
      [(_UILegacyPageControlVisualProvider *)self _modernBounds];
      double v12 = v8 + v11;
      [(_UILegacyPageControlVisualProvider *)self _modernBounds];
      double v3 = v3 + v13 + 30.0;
      double v4 = v12 + 0.0;
    }
  }
  double v14 = v4;
  double v15 = v3;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_UILegacyPageControlVisualProvider *)self intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(UIView *)self->super._pageControl superview];

  if (v8)
  {
    double v9 = [(UIView *)self->super._pageControl superview];
    [v9 bounds];
    double v5 = v10;
  }
  double v11 = v5;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  [(UIView *)self->super._pageControl bounds];
  -[UIView setFrame:](self->_backgroundVisualEffectView, "setFrame:");
  uint64_t v3 = [(NSMutableArray *)self->_indicators count];
  if (v3)
  {
    uint64_t v4 = v3;
    if (v3 != 1 || ![(UIPageControl *)self->super._pageControl hidesForSinglePage])
    {
      [(UIView *)self->super._pageControl bounds];
      double v6 = v5;
      [(_UILegacyPageControlVisualProvider *)self _indicatorSpacing];
      double v8 = v7 * (double)(v4 - 1) + 0.0;
      if (v4 >= 1)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if ([(_UILegacyPageControlVisualProvider *)self _hasCustomImageForPage:i enabled:i == [(UIPageControl *)self->super._pageControl currentPage]])
          {
            [(_UILegacyPageControlVisualProvider *)self _indicatorFrameAtIndex:i];
            double v8 = v8 + v10;
          }
        }
      }
      [(_UILegacyPageControlVisualProvider *)self _modernBounds];
      UIRoundToViewScale(self->super._pageControl);
      double v12 = v11;
      [(_UILegacyPageControlVisualProvider *)self _modernBounds];
      if (v4 >= 1)
      {
        uint64_t v14 = 0;
        if ((*((_DWORD *)&self->super._pageControl->super.super._viewFlags + 4) & 0x80000) != 0) {
          double v15 = v6 - (v12 + v13 * 0.5);
        }
        else {
          double v15 = v12 + v13 * 0.5;
        }
        do
        {
          uint64_t v16 = [(NSMutableArray *)self->_indicators objectAtIndex:v14];
          [(_UILegacyPageControlVisualProvider *)self _indicatorFrameAtIndex:v14];
          if ([(_UILegacyPageControlVisualProvider *)self _hasCustomImageForPage:v14 enabled:v14 == [(UIPageControl *)self->super._pageControl currentPage]])
          {
            [(_UILegacyPageControlVisualProvider *)self _indicatorFrameAtIndex:v14];
            double v18 = v17;
            [(_UILegacyPageControlVisualProvider *)self _indicatorSpacing];
            double v20 = v19 + v18;
            pageControl = self->super._pageControl;
            if ((*((_DWORD *)&pageControl->super.super._viewFlags + 4) & 0x80000) != 0)
            {
              if (!v14)
              {
                [(_UILegacyPageControlVisualProvider *)self _indicatorSpacing];
                double v15 = v15 + v22;
                pageControl = self->super._pageControl;
              }
              double v15 = v15 - v20;
            }
            UIRoundToViewScale(pageControl);
            double v24 = v23;
            UIRoundToViewScale(self->super._pageControl);
            double v26 = v25;
            [v16 bounds];
            objc_msgSend(v16, "setFrame:", v24, v26);
            double v27 = -0.0;
            if ((*((_DWORD *)&self->super._pageControl->super.super._viewFlags + 4) & 0x80000) == 0) {
              double v27 = v20;
            }
            double v15 = v15 + v27;
          }
          else
          {
            UIRoundToViewScale(self->super._pageControl);
            double v29 = v28;
            UIRoundToViewScale(self->super._pageControl);
            double v31 = v30;
            int v32 = *((_DWORD *)&self->super._pageControl->super.super._viewFlags + 4);
            [(_UILegacyPageControlVisualProvider *)self _indicatorSpacing];
            if ((*(void *)&v32 & 0x80000) != 0) {
              double v33 = -v33;
            }
            double v15 = v15 + v33;
            [v16 bounds];
            objc_msgSend(v16, "setFrame:", v29, v31);
          }

          ++v14;
        }
        while (v4 != v14);
      }
    }
  }
}

- (void)invalidateIndicators
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(UIView *)self->super._pageControl invalidateIntrinsicContentSize];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_indicators;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "removeFromSuperview", (void)v10);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_indicators removeAllObjects];
  if ([(UIPageControl *)self->super._pageControl numberOfPages] >= 1)
  {
    NSInteger v8 = 0;
    do
    {
      double v9 = [(_UILegacyPageControlVisualProvider *)self _indicatorViewEnabled:v8 == [(UIPageControl *)self->super._pageControl currentPage] index:v8];
      [(UIView *)self->super._pageControl addSubview:v9];
      [(NSMutableArray *)self->_indicators addObject:v9];

      ++v8;
    }
    while (v8 < [(UIPageControl *)self->super._pageControl numberOfPages]);
  }
  [(UIPageControl *)self->super._pageControl setCurrentPage:[(UIPageControl *)self->super._pageControl currentPage]];
  [(UIView *)self->super._pageControl setNeedsLayout];
}

- (id)effectiveContentView
{
  pageControl = [(UIVisualEffectView *)self->_backgroundVisualEffectView contentView];
  uint64_t v4 = pageControl;
  if (!pageControl) {
    pageControl = self->super._pageControl;
  }
  id v5 = pageControl;

  return v5;
}

- (void)updateDisplayedPageToCurrentPage
{
  NSInteger v3 = [(UIPageControl *)self->super._pageControl currentPage];
  [(_UILegacyPageControlVisualProvider *)self _setDisplayedPage:v3];
}

- (void)_setDisplayedPage:(int64_t)a3
{
  int64_t displayedPage = self->super._displayedPage;
  if (displayedPage != a3)
  {
    if ((displayedPage & 0x8000000000000000) == 0
      && displayedPage < [(UIPageControl *)self->super._pageControl numberOfPages])
    {
      uint64_t v6 = [(NSMutableArray *)self->_indicators objectAtIndex:self->super._displayedPage];
      [(_UILegacyPageControlVisualProvider *)self _transitionIndicator:v6 toEnabled:0 index:self->super._displayedPage];
    }
    self->super._int64_t displayedPage = -1;
    if ((a3 & 0x8000000000000000) == 0
      && [(UIPageControl *)self->super._pageControl numberOfPages] > a3)
    {
      self->super._int64_t displayedPage = a3;
      id v7 = [(NSMutableArray *)self->_indicators objectAtIndex:a3];
      [(_UILegacyPageControlVisualProvider *)self _transitionIndicator:v7 toEnabled:1 index:a3];
    }
  }
}

- (CGRect)_indicatorFrameAtIndex:(int64_t)a3
{
  if ([(_UILegacyPageControlVisualProvider *)self _hasCustomImageForPage:a3 enabled:self->super._displayedPage == a3])
  {
    id v5 = [(NSMutableArray *)self->_indicators objectAtIndex:a3];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    [(_UILegacyPageControlVisualProvider *)self _modernBounds];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_indicatorSpacing
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 16.0;
  }
  pageControl = self->super._pageControl;
  [(UIPageControl *)pageControl _indicatorSpacing];
  return result;
}

- (CGRect)_modernBounds
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v4 = 7.0;
  double v5 = 7.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_modernCornerRadius
{
  [(_UILegacyPageControlVisualProvider *)self _modernBounds];
  return v2 * 0.5;
}

- (id)_modernColorEnabled:(BOOL)a3
{
  pageControl = self->super._pageControl;
  if (!a3)
  {
    double v5 = [(UIPageControl *)pageControl pageIndicatorTintColor];
    if (!v5)
    {
      double v8 = [(UIView *)self->super._pageControl traitCollection];
      double v6 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, dbl_186B9D3B0[[v8 userInterfaceIdiom] == 3]);

      goto LABEL_7;
    }
LABEL_5:
    id v7 = v5;
    double v6 = v7;
    goto LABEL_8;
  }
  double v5 = [(UIPageControl *)pageControl currentPageIndicatorTintColor];
  if (v5) {
    goto LABEL_5;
  }
  double v6 = +[UIColor whiteColor];
LABEL_7:
  id v7 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_hasCustomImageForPage:(int64_t)a3 enabled:(BOOL)a4
{
  NSInteger v6 = [(UIPageControl *)self->super._pageControl currentPage];
  id v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UILegacyPageControlVisualProvider__pageImages[v6 == a3]);
  if (v7)
  {
    double v8 = [v7 objectAtIndexedSubscript:a3];
    double v9 = [MEMORY[0x1E4F1CA98] null];
    BOOL v10 = v8 != v9;
  }
  else
  {
    uint64_t v11 = 5;
    if (v6 == a3) {
      uint64_t v11 = 4;
    }
    return *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UILegacyPageControlVisualProvider__pageImages[v11]) != 0;
  }
  return v10;
}

- (void)_transitionIndicator:(id)a3 toEnabled:(BOOL)a4 index:(int64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  if ([(_UILegacyPageControlVisualProvider *)self _hasCustomImageForPage:a5 enabled:v6])
  {
    if (v6) {
      [(_UILegacyPageControlVisualProvider *)self _cachedPageIndicatorCurrentImageForPage:a5];
    }
    else {
    double v8 = [(_UILegacyPageControlVisualProvider *)self _cachedPageIndicatorImageForPage:a5];
    }
    [v9 setImage:v8];
  }
  else
  {
    [(_UILegacyPageControlVisualProvider *)self _drawModernIndicatorInView:v9 enabled:v6];
  }
}

- (id)_indicatorViewEnabled:(BOOL)a3 index:(int64_t)a4
{
  BOOL v5 = a3;
  if ([(_UILegacyPageControlVisualProvider *)self _hasCustomImageForPage:a4 enabled:a3])
  {
    if ([(UIPageControl *)self->super._pageControl currentPage] == a4) {
      [(_UILegacyPageControlVisualProvider *)self _cachedPageIndicatorCurrentImageForPage:a4];
    }
    else {
    double v8 = [(_UILegacyPageControlVisualProvider *)self _cachedPageIndicatorImageForPage:a4];
    }
    id v7 = [[UIImageView alloc] initWithImage:v8];
  }
  else
  {
    id v7 = objc_alloc_init(UIView);
    [(_UILegacyPageControlVisualProvider *)self _drawModernIndicatorInView:v7 enabled:v5];
  }
  [(UIView *)v7 setUserInteractionEnabled:0];
  return v7;
}

- (void)_drawModernIndicatorInView:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_UILegacyPageControlVisualProvider *)self _modernColorEnabled:v4];
  [v6 setBackgroundColor:v7];

  [(_UILegacyPageControlVisualProvider *)self _modernBounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v6 layer];
  objc_msgSend(v16, "setBounds:", v9, v11, v13, v15);

  [(_UILegacyPageControlVisualProvider *)self _modernCornerRadius];
  double v18 = v17;
  id v19 = [v6 layer];

  [v19 setCornerRadius:v18];
}

- (id)preferredIndicatorImage
{
  return _UIImageWithName(@"UIPageIndicator.png");
}

- (id)defaultActivePageIndicatorImage
{
  return _UIImageWithName(@"UIPageIndicatorCurrent.png");
}

- (id)_cachedPageIndicatorImageForPage:(int64_t)a3
{
  pageImages = self->_pageImages;
  if (pageImages)
  {
    id v6 = [(NSMutableArray *)pageImages objectAtIndexedSubscript:a3];
    id v7 = [MEMORY[0x1E4F1CA98] null];

    if (v6 != v7) {
      goto LABEL_5;
    }
  }
  id v6 = [(_UILegacyPageControlVisualProvider *)self _pageIndicatorImageForPage:a3];
LABEL_5:
  return v6;
}

- (id)_cachedPageIndicatorCurrentImageForPage:(int64_t)a3
{
  currentPageImages = self->_currentPageImages;
  if (currentPageImages)
  {
    id v6 = [(NSMutableArray *)currentPageImages objectAtIndexedSubscript:a3];
    id v7 = [MEMORY[0x1E4F1CA98] null];

    if (v6 != v7) {
      goto LABEL_5;
    }
  }
  id v6 = [(_UILegacyPageControlVisualProvider *)self _pageIndicatorCurrentImageForPage:a3];
LABEL_5:
  return v6;
}

- (id)_pageIndicatorImageForPage:(int64_t)a3
{
  pageImage = self->_pageImage;
  if (pageImage)
  {
    BOOL v4 = pageImage;
  }
  else
  {
    BOOL v4 = [(_UILegacyPageControlVisualProvider *)self preferredIndicatorImage];
  }
  return v4;
}

- (id)_pageIndicatorCurrentImageForPage:(int64_t)a3
{
  currentPageImage = self->_currentPageImage;
  if (currentPageImage)
  {
    BOOL v4 = currentPageImage;
  }
  else
  {
    BOOL v4 = [(_UILegacyPageControlVisualProvider *)self defaultActivePageIndicatorImage];
  }
  return v4;
}

- (void)_cachePageIndicatorImages
{
  pageImages = self->_pageImages;
  if (pageImages)
  {
    [(NSMutableArray *)pageImages removeAllObjects];
    BOOL v4 = [(_UILegacyPageControlVisualProvider *)self preferredIndicatorImage];
    if ([(UIPageControl *)self->super._pageControl numberOfPages] >= 1)
    {
      NSInteger v5 = 0;
      do
      {
        id v6 = [(_UILegacyPageControlVisualProvider *)self _pageIndicatorImageForPage:v5];
        char v7 = [v4 isEqual:v6];
        double v8 = self->_pageImages;
        if (v7)
        {
          double v9 = [MEMORY[0x1E4F1CA98] null];
          [(NSMutableArray *)v8 addObject:v9];
        }
        else
        {
          [(NSMutableArray *)self->_pageImages addObject:v6];
        }

        ++v5;
      }
      while (v5 < [(UIPageControl *)self->super._pageControl numberOfPages]);
    }
  }
  currentPageImages = self->_currentPageImages;
  if (currentPageImages)
  {
    [(NSMutableArray *)currentPageImages removeAllObjects];
    id v16 = [(_UILegacyPageControlVisualProvider *)self defaultActivePageIndicatorImage];
    if ([(UIPageControl *)self->super._pageControl numberOfPages] >= 1)
    {
      NSInteger v11 = 0;
      do
      {
        double v12 = [(_UILegacyPageControlVisualProvider *)self _pageIndicatorCurrentImageForPage:v11];
        char v13 = [v16 isEqual:v12];
        double v14 = self->_currentPageImages;
        if (v13)
        {
          double v15 = [MEMORY[0x1E4F1CA98] null];
          [(NSMutableArray *)v14 addObject:v15];
        }
        else
        {
          [(NSMutableArray *)self->_currentPageImages addObject:v12];
        }

        ++v11;
      }
      while (v11 < [(UIPageControl *)self->super._pageControl numberOfPages]);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicators, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_pageImages, 0);
  objc_storeStrong((id *)&self->_currentPageImages, 0);
  objc_storeStrong((id *)&self->_pageImage, 0);
  objc_storeStrong((id *)&self->_currentPageImage, 0);
}

@end