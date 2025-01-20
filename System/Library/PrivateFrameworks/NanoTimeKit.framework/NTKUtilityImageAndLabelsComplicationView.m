@interface NTKUtilityImageAndLabelsComplicationView
- (BOOL)_isViewVisible:(id)a3;
- (BOOL)_shouldLayoutWithImageView;
- (CDComplicationImageView)imageView;
- (CLKUIColoringLabel)firstLabel;
- (CLKUIColoringLabel)secondLabel;
- (NTKUtilityImageAndLabelsComplicationView)initWithFrame:(CGRect)a3;
- (double)_gapBetweenView:(id)a3 nextView:(id)a4;
- (double)_widthThatFits;
- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3;
- (void)_enumerateColoringViewsWithBlock:(id)a3;
- (void)_layoutSubviewsHorizontally:(id)a3;
- (void)_setLabelAttributedText:(id)a3;
- (void)_setLabelText:(id)a3;
- (void)_setLabelTextProvider:(id)a3;
- (void)_setSecondLabelText:(id)a3;
- (void)_updateFirstLabelMaxSize;
- (void)_updateWithImageProvider:(id)a3;
- (void)layoutSubviews;
- (void)setFirstLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSecondLabel:(id)a3;
@end

@implementation NTKUtilityImageAndLabelsComplicationView

- (NTKUtilityImageAndLabelsComplicationView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKUtilityImageAndLabelsComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id v5 = [(NTKUtilityComplicationView *)v3 _newStandardLabelSubview];
    [(NTKUtilityImageAndLabelsComplicationView *)v4 setFirstLabel:v5];

    id v6 = [(NTKUtilityComplicationView *)v4 _newStandardLabelSubview];
    [(NTKUtilityImageAndLabelsComplicationView *)v4 setSecondLabel:v6];
  }
  return v4;
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)NTKUtilityImageAndLabelsComplicationView;
  [(NTKUtilityComplicationView *)&v50 layoutSubviews];
  [(NTKUtilityImageAndLabelsComplicationView *)self bounds];
  double v4 = v3;
  id v5 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v5 sizeToFit];

  id v6 = [(NTKUtilityImageAndLabelsComplicationView *)self secondLabel];
  [v6 sizeToFit];

  v7 = [(NTKUtilityImageAndLabelsComplicationView *)self imageView];
  [v7 sizeToFit];

  [(NTKUtilityComplicationView *)self layoutLabelVertically:self->_firstLabel];
  [(NTKUtilityComplicationView *)self layoutLabelVertically:self->_secondLabel];
  objc_super v8 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = [(NTKUtilityImageAndLabelsComplicationView *)self secondLabel];
  [v17 frame];

  v18 = [(NTKUtilityImageAndLabelsComplicationView *)self imageView];
  [v18 frame];
  double v20 = v19;
  double v22 = v21;

  -[NTKUtilityComplicationView _imageViewOriginYWithBaseImageSize:labelFrame:](self, "_imageViewOriginYWithBaseImageSize:labelFrame:", v20, v22, v10, v12, v14, v16);
  if ([(NTKUtilityComplicationView *)self shouldUsePlatterInset])
  {
    v23 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v23, v48);
    double v4 = v4 + v49 * -2.0;
  }
  if (v20 > 0.0)
  {
    v24 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v24, v46);
    double v4 = v4 - (v20 - v47);
  }
  v25 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v25, v44);
  double v26 = v4 - v14 - v45;

  if (v26 >= 0.0) {
    double v27 = v26;
  }
  else {
    double v27 = 0.0;
  }
  if (v14 >= v4) {
    double v28 = 0.0;
  }
  else {
    double v28 = v27;
  }
  v29 = [(NTKUtilityImageAndLabelsComplicationView *)self imageView];
  v30 = [(NTKUtilityComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  objc_msgSend(v29, "setFrame:");

  v31 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  v32 = [(NTKUtilityComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  objc_msgSend(v31, "setFrame:");

  v33 = [(NTKUtilityImageAndLabelsComplicationView *)self secondLabel];
  v34 = [(NTKUtilityComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  objc_msgSend(v33, "setFrame:");

  v35 = [(NTKUtilityImageAndLabelsComplicationView *)self secondLabel];
  [v35 setMaxWidth:v28];

  int IsRTL = CLKLayoutIsRTL();
  if (IsRTL) {
    p_secondLabel = &self->_secondLabel;
  }
  else {
    p_secondLabel = &self->_firstLabel;
  }
  if (IsRTL) {
    p_firstLabel = &self->_firstLabel;
  }
  else {
    p_firstLabel = &self->_secondLabel;
  }
  v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", *p_secondLabel, *p_firstLabel, 0);
  if (self->_imageView)
  {
    char v40 = [(NTKUtilityComplicationView *)self placement];
    if ((v40 & 8) != 0 || (uint64_t v41 = v40 & 0xA, v42 = CLKLayoutIsRTL(), v43 = 0, !v41) && v42) {
      uint64_t v43 = [v39 count];
    }
    [v39 insertObject:self->_imageView atIndex:v43];
  }
  [(NTKUtilityImageAndLabelsComplicationView *)self _layoutSubviewsHorizontally:v39];
}

- (BOOL)_shouldLayoutWithImageView
{
  int v3 = [(CDComplicationImageView *)self->_imageView isHidden] ^ 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return [(CDComplicationImageView *)self->_imageView hasMonochromeImage] & v3;
  }
  return v3;
}

- (void)_updateFirstLabelMaxSize
{
  [(NTKUtilityComplicationView *)self maxSize];
  double v4 = v3;
  if ([(NTKUtilityImageAndLabelsComplicationView *)self _shouldLayoutWithImageView])
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v6 = v5;
    v7 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v7, v9);
    double v4 = v4 - (v6 + v10);
  }
  firstLabel = self->_firstLabel;

  [(CLKUIColoringLabel *)firstLabel setMaxWidth:v4];
}

- (double)_widthThatFits
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[CLKUIColoringLabel sizeThatFits:](self->_firstLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v4);
  double v6 = v5;
  if ([(NTKUtilityImageAndLabelsComplicationView *)self _shouldLayoutWithImageView])
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v4);
    double v8 = v7;
    double v9 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v9, v18);
    double v6 = v6 + v8 + v19;
  }
  uint64_t v10 = [(CLKUIColoringLabel *)self->_secondLabel text];
  if (v10)
  {
    double v11 = (void *)v10;
    char v12 = [(CLKUIColoringLabel *)self->_secondLabel isHidden];

    if ((v12 & 1) == 0)
    {
      -[CLKUIColoringLabel sizeThatFits:](self->_secondLabel, "sizeThatFits:", v3, v4);
      double v14 = v13;
      double v15 = [(NTKUtilityComplicationView *)self device];
      _LayoutConstants_49(v15, v17);
      double v6 = v6 + v14 + v17[13];
    }
  }
  return v6;
}

- (void)_layoutSubviewsHorizontally:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NTKUtilityImageAndLabelsComplicationView *)self bounds];
  double v6 = v5;
  uint64_t v8 = v7;
  double v10 = v9;
  uint64_t v12 = v11;
  if ([(NTKUtilityComplicationView *)self shouldUsePlatterInset])
  {
    double v13 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v13, v49);
    double v14 = v50;

    double v6 = v6 + v14;
    double v10 = v10 + v14 * -2.0;
  }
  if (([(NTKUtilityComplicationView *)self placement] & 2) == 0)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v18 = 0;
      uint64_t v19 = *(void *)v46;
      double v20 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v15);
          }
          double v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (-[NTKUtilityImageAndLabelsComplicationView _isViewVisible:](self, "_isViewVisible:", v22, (void)v45))
          {
            [v22 frame];
            double v20 = v20 + v23;
            if (v18)
            {
              [(NTKUtilityImageAndLabelsComplicationView *)self _gapBetweenView:v18 nextView:v22];
              double v20 = v20 + v24;
            }
            id v25 = v22;

            v18 = v25;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v17);
    }
    else
    {
      v18 = 0;
      double v20 = 0.0;
    }

    char v26 = [(NTKUtilityComplicationView *)self placement];
    double v27 = v6;
    uint64_t v28 = v8;
    double v29 = v10;
    uint64_t v30 = v12;
    if ((v26 & 8) != 0)
    {
      double v6 = CGRectGetMaxX(*(CGRect *)&v27) - v20;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v27);
      v32 = [(NTKUtilityComplicationView *)self device];
      CLKFloorForDevice();
      double v6 = MinX + v33;
    }
  }
  if (objc_msgSend(v4, "count", (void)v45))
  {
    unint64_t v34 = 0;
    v35 = 0;
    double v36 = 0.0;
    double v37 = 0.0;
    do
    {
      v38 = [v4 objectAtIndexedSubscript:v34];
      if ([(NTKUtilityImageAndLabelsComplicationView *)self _isViewVisible:v38])
      {
        [v38 frame];
        double v40 = v39;
        double v41 = v6;
        if (v35)
        {
          [(NTKUtilityImageAndLabelsComplicationView *)self _gapBetweenView:v35 nextView:v38];
          double v41 = v37 + v36 + v42;
        }
        uint64_t v43 = [(NTKUtilityComplicationView *)self device];
        CLKPixelAlignRectForDevice();
        objc_msgSend(v38, "setFrame:");

        id v44 = v38;
        v35 = v44;
        double v37 = v41;
        double v36 = v40;
      }

      ++v34;
    }
    while ([v4 count] > v34);
  }
}

- (double)_gapBetweenView:(id)a3 nextView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v9 = objc_opt_isKindOfClass();
  double v10 = &unk_1FCDEE418;
  if (isKindOfClass & 1) != 0 && (v9)
  {
    uint64_t v11 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v11, v17);
    uint64_t v12 = (double *)&v18;
LABEL_8:
    double v13 = *v12;

    goto LABEL_9;
  }
  double v13 = 0.0;
  if (((isKindOfClass | v9) & 1) != 0
    && (([v6 conformsToProtocol:v10] & 1) != 0
     || [v7 conformsToProtocol:v10]))
  {
    uint64_t v11 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v11, &v15);
    uint64_t v12 = (double *)&v16;
    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

- (BOOL)_isViewVisible:(id)a3
{
  id v3 = a3;
  if ([v3 isHidden])
  {
    BOOL v4 = 0;
  }
  else
  {
    [v3 bounds];
    BOOL v4 = v5 > 0.0;
  }

  return v4;
}

- (void)_setLabelTextProvider:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v5 setTextProvider:v4];

  [(NTKUtilityImageAndLabelsComplicationView *)self setNeedsLayout];
  id v6 = [(NTKUtilityComplicationView *)self displayObserver];
  [v6 complicationDisplayNeedsResize:self];
}

- (void)_setLabelText:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v5 setTextProvider:0];

  id v6 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v6 setText:v4];

  [(NTKUtilityImageAndLabelsComplicationView *)self setNeedsLayout];
  id v7 = [(NTKUtilityComplicationView *)self displayObserver];
  [v7 complicationDisplayNeedsResize:self];
}

- (void)_setLabelAttributedText:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v5 setTextProvider:0];

  id v6 = [(NTKUtilityImageAndLabelsComplicationView *)self firstLabel];
  [v6 setAttributedText:v4];

  [(NTKUtilityImageAndLabelsComplicationView *)self setNeedsLayout];
  id v7 = [(NTKUtilityComplicationView *)self displayObserver];
  [v7 complicationDisplayNeedsResize:self];
}

- (void)_setSecondLabelText:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKUtilityImageAndLabelsComplicationView *)self secondLabel];
  [v5 setTextProvider:0];

  id v6 = [(NTKUtilityImageAndLabelsComplicationView *)self secondLabel];
  [v6 setText:v4];

  [(NTKUtilityImageAndLabelsComplicationView *)self setNeedsLayout];
  id v7 = [(NTKUtilityComplicationView *)self displayObserver];
  [v7 complicationDisplayNeedsResize:self];
}

- (void)_updateWithImageProvider:(id)a3
{
  id v8 = a3;
  char v4 = objc_msgSend(off_1E62BD5F0, "existingImageView:supportsImageProvider:", self->_imageView);
  imageView = self->_imageView;
  if ((v4 & 1) == 0)
  {
    [(CDComplicationImageView *)self->_imageView removeFromSuperview];
    id v6 = [off_1E62BD5F0 viewForImageProvider:v8];
    id v7 = self->_imageView;
    self->_imageView = v6;

    imageView = self->_imageView;
    if (imageView)
    {
      -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:");
      [(NTKUtilityImageAndLabelsComplicationView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
  }
  [(NTKUtilityComplicationView *)self _updateImageViewColor:imageView];
  [(CDComplicationImageView *)self->_imageView setImageProvider:v8];
  [(NTKUtilityImageAndLabelsComplicationView *)self _updateFirstLabelMaxSize];
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  char v4 = (void (**)(id, CLKUIColoringLabel *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_secondLabel);
  (*v4)(v6, (CLKUIColoringLabel *)self->_imageView);
}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  char v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4[2](v4, self->_imageView);
  }
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (CLKUIColoringLabel)firstLabel
{
  return self->_firstLabel;
}

- (void)setFirstLabel:(id)a3
{
}

- (CLKUIColoringLabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end