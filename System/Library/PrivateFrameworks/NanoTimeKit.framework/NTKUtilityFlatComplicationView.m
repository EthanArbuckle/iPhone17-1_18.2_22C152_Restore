@interface NTKUtilityFlatComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (void)circleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 interior:(BOOL *)a6 forPlacement:(unint64_t)a7 forDevice:(id)a8;
- (BOOL)_shouldLayoutWithImageView;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CDComplicationImageView)imageView;
- (CGSize)boundingSizeOfCurrentComplicationTemplate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKMonochromeFilterProvider)filterProvider;
- (CLKUIColoringLabel)label;
- (NTKUtilityFlatComplicationView)initWithFrame:(CGRect)a3;
- (NTKUtilityFlatComplicationViewDelegate)delegate;
- (UIBezierPath)path;
- (double)_widthThatFits;
- (double)baselineOffset;
- (double)circleRadius;
- (double)maxAngularWidth;
- (double)textWidthInRadians;
- (double)tracking;
- (id)_backgroundPlatterImage;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (int64_t)textAlignment;
- (unint64_t)imagePlacement;
- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3;
- (void)_enumerateColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)_updateHighlightViewCornerRadius;
- (void)_updateLabelMaxWidth;
- (void)layoutSubviews;
- (void)setBaselineOffset:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxAngularWidth:(double)a3;
- (void)setPath:(id)a3;
- (void)setPlacement:(unint64_t)a3;
- (void)setShouldUseBackgroundPlatter:(BOOL)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTextWidthInRadians:(double)a3;
- (void)setTracking:(double)a3;
- (void)setUseBlockyHighlightCorners:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)updateTextWidthIfNeeded;
@end

@implementation NTKUtilityFlatComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (NTKUtilityFlatComplicationView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKUtilityFlatComplicationView;
  id v3 = -[NTKUtilityComplicationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NTKUtilityComplicationView *)v3 _newStandardLabelSubview];
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v5;

    objc_storeStrong((id *)&v4->_activeLabel, v4->_label);
    [(NTKUtilityFlatComplicationView *)v4 _updateHighlightViewCornerRadius];
  }
  return v4;
}

+ (void)circleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 interior:(BOOL *)a6 forPlacement:(unint64_t)a7 forDevice:(id)a8
{
  char v8 = a7;
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  memset(v26, 0, sizeof(v26));
  id v21 = a8;
  _LayoutConstants_49(v21, v26);
  if (a6) {
    *a6 = 0;
  }
  double v13 = *(double *)&v28;
  double v14 = *((double *)&v27 + 1);
  double v15 = *(double *)&v29;
  double v16 = *((double *)&v28 + 1);
  if (v8)
  {
    _LayoutConstants_49(v21, v24);
    uint64_t v18 = v25;
    BOOL v17 = 0;
    if ((v8 & 2) == 0)
    {
      double v14 = (v8 & 8) != 0 ? -v14 : v13;
      if ((v8 & 8) == 0) {
        double v16 = v15;
      }
    }
    if (a3) {
      goto LABEL_14;
    }
  }
  else
  {
    if ((v8 & 4) == 0)
    {
      BOOL v17 = 0;
      uint64_t v18 = 0;
      double v14 = 0.0;
      double v16 = 0.0;
      if (!a3) {
        goto LABEL_15;
      }
LABEL_14:
      *(void *)a3 = v18;
      goto LABEL_15;
    }
    _LayoutConstants_49(v21, v22);
    uint64_t v18 = v23;
    if ((v8 & 8) != 0) {
      double v19 = v14;
    }
    else {
      double v19 = v13;
    }
    if ((v8 & 8) != 0) {
      double v20 = v16;
    }
    else {
      double v20 = v15;
    }
    if ((v8 & 2) != 0) {
      double v14 = -v14;
    }
    else {
      double v14 = v19;
    }
    if ((v8 & 2) == 0) {
      double v16 = v20;
    }
    BOOL v17 = 1;
    if (a3) {
      goto LABEL_14;
    }
  }
LABEL_15:
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v16;
  }
  if (a6) {
    *a6 = v17;
  }
}

- (void)updateTextWidthIfNeeded
{
  id v3 = [(CLKUICurvedColoringLabel *)self->_curvedLabel path];

  if (!v3)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    [(CLKUICurvedColoringLabel *)self->_curvedLabel sizeToFit];
    [(CLKUICurvedColoringLabel *)self->_curvedLabel getTextCenter:0 startAngle:&v12 endAngle:&v11];
    double v4 = fabs(v12);
    double v5 = fabs(v11);
    double v11 = v5;
    double v12 = v4;
    if (v4 >= v5) {
      double v6 = v4;
    }
    else {
      double v6 = v5;
    }
    if (v4 >= v5) {
      double v4 = v5;
    }
    double v7 = v6 - v4;
    char v8 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v8, v9);
    [(NTKUtilityFlatComplicationView *)self setTextWidthInRadians:v7 + v10];
  }
}

- (void)setTextWidthInRadians:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_textWidthInRadians = a3;
    uint64_t v5 = [(NTKUtilityFlatComplicationView *)self delegate];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = [(NTKUtilityFlatComplicationView *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [(NTKUtilityFlatComplicationView *)self delegate];
        [v9 utilityComplicationView:self didChangeTextWidth:self->_textWidthInRadians];
      }
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  curvedLabel = self->_curvedLabel;
  if (curvedLabel)
  {
    id v9 = [(CLKUICurvedColoringLabel *)curvedLabel path];

    if (v9)
    {
      BOOL v10 = 0;
    }
    else
    {
      double v28 = 0.0;
      double v29 = 0.0;
      double v26 = 0.0;
      double v27 = 0.0;
      [(CLKUICurvedColoringLabel *)self->_curvedLabel getTextCenter:&v28 startAngle:&v27 endAngle:&v26];
      -[CLKUICurvedColoringLabel convertPoint:fromView:](self->_curvedLabel, "convertPoint:fromView:", self, x, y);
      double v15 = v14;
      double v17 = v16;
      [(CLKUICurvedColoringLabel *)self->_curvedLabel circleRadius];
      double v19 = v18;
      int v20 = [(CLKUICurvedColoringLabel *)self->_curvedLabel interior];
      double v22 = v26;
      double v21 = v27;
      uint64_t v23 = [(NTKUtilityComplicationView *)self device];
      _LayoutConstants_49(v23, v31);
      BOOL v10 = NTKUtilityComplicationCurvedPointInside(v20, v15, v17, v19, v28, v29, v21, v22, v24, v32, v33, v34, v35);
    }
  }
  else
  {
    double v11 = [(NTKUtilityComplicationView *)self complicationTemplate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(NTKUtilityFlatComplicationView *)self bounds];
      CGRect v38 = CGRectInset(v37, 0.0, -20.0);
      v36.double x = x;
      v36.double y = y;
      BOOL v13 = CGRectContainsPoint(v38, v36);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)NTKUtilityFlatComplicationView;
      BOOL v13 = -[NTKUtilityComplicationView pointInside:withEvent:](&v30, sel_pointInside_withEvent_, v7, x, y);
    }
    BOOL v10 = v13;
  }

  return v10;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  uint64_t v5 = [(NTKUtilityComplicationView *)self device];
  uint64_t v6 = [v5 deviceCategory];

  if (v6 == 1) {
    a3 = 0;
  }
  unint64_t v7 = [(NTKUtilityComplicationView *)self textLayoutStyle];
  v27.receiver = self;
  v27.super_class = (Class)NTKUtilityFlatComplicationView;
  [(NTKUtilityComplicationView *)&v27 setTextLayoutStyle:a3];
  if ([(NTKUtilityComplicationView *)self textLayoutStyle] != v7)
  {
    if (a3 == 2)
    {
      label = self->_label;
      if (label)
      {
        [(CLKUIColoringLabel *)label removeFromSuperview];
        double v15 = self->_label;
        self->_label = 0;

        double v16 = [(NTKUtilityComplicationView *)self highlightView];
        [v16 removeFromSuperview];
      }
      double v17 = [(NTKUtilityComplicationView *)self _newStandardCurvedLabelSubview];
      curvedLabel = self->_curvedLabel;
      self->_curvedLabel = v17;

      [(CLKUICurvedColoringLabel *)self->_curvedLabel setFilterProvider:self];
      objc_storeStrong((id *)&self->_activeLabel, self->_curvedLabel);
      BOOL v13 = [(NTKUtilityComplicationView *)self _newCurvedPathHighlightView];
      goto LABEL_12;
    }
    if (a3 == 1)
    {
      char v8 = self->_label;
      if (v8)
      {
        [(CLKUIColoringLabel *)v8 removeFromSuperview];
        id v9 = self->_label;
        self->_label = 0;

        BOOL v10 = [(NTKUtilityComplicationView *)self highlightView];
        [v10 removeFromSuperview];
      }
      double v11 = [(NTKUtilityComplicationView *)self _newStandardCurvedLabelSubview];
      double v12 = self->_curvedLabel;
      self->_curvedLabel = v11;

      [(CLKUICurvedColoringLabel *)self->_curvedLabel setFilterProvider:self];
      objc_storeStrong((id *)&self->_activeLabel, self->_curvedLabel);
      BOOL v13 = [(NTKUtilityComplicationView *)self _newCurvedCircularHighlightView];
LABEL_12:
      curvedHighlightView = self->_curvedHighlightView;
      self->_curvedHighlightView = v13;

      [(NTKUtilityComplicationView *)self setHighlightView:self->_curvedHighlightView];
      return;
    }
    int v20 = self->_curvedLabel;
    if (v20)
    {
      [(CLKUICurvedColoringLabel *)v20 removeFromSuperview];
      double v21 = self->_curvedLabel;
      self->_curvedLabel = 0;

      double v22 = [(NTKUtilityComplicationView *)self highlightView];
      [v22 removeFromSuperview];

      uint64_t v23 = self->_curvedHighlightView;
      self->_curvedHighlightView = 0;
    }
    double v24 = [(NTKUtilityComplicationView *)self _newStandardLabelSubview];
    uint64_t v25 = self->_label;
    self->_label = v24;

    objc_storeStrong((id *)&self->_activeLabel, self->_label);
    id v26 = [(NTKUtilityComplicationView *)self _newHighlightView];
    [(NTKUtilityComplicationView *)self setHighlightView:v26];
  }
}

- (void)setForegroundColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKUtilityComplicationView *)self foregroundColor];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKUtilityFlatComplicationView;
    [(NTKUtilityComplicationView *)&v7 setForegroundColor:v4];
  }
}

- (void)setPlacement:(unint64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)NTKUtilityFlatComplicationView;
  -[NTKUtilityComplicationView setPlacement:](&v21, sel_setPlacement_);
  if ([(NTKUtilityComplicationView *)self textLayoutStyle] == 1)
  {
    double v19 = 0.0;
    double v20 = 0.0;
    double v18 = 0.0;
    unsigned __int8 v17 = 0;
    uint64_t v5 = objc_opt_class();
    char v6 = [(NTKUtilityComplicationView *)self device];
    [v5 circleRadius:&v20 centerAngle:&v19 maxAngularWidth:&v18 interior:&v17 forPlacement:a3 forDevice:v6];

    [(CLKUICurvedColoringLabel *)self->_curvedLabel setCircleRadius:v20];
    [(CLKUICurvedColoringLabel *)self->_curvedLabel setInterior:v17];
    [(CLKUICurvedColoringLabel *)self->_curvedLabel setCenterAngle:v19];
    [(CLKUICurvedColoringLabel *)self->_curvedLabel setMaxAngularWidth:v18];
    if (![(NTKUtilityComplicationView *)self isPlacementForTopBezelComplication])
    {
      int v7 = v17;
      char v8 = [(NTKUtilityComplicationView *)self device];
      id v9 = v8;
      if (v7)
      {
        _LayoutConstants_49(v8, v15);
        BOOL v10 = (double *)&v16;
      }
      else
      {
        _LayoutConstants_49(v8, &v13);
        BOOL v10 = (double *)&v14;
      }
      [(CLKUICurvedColoringLabel *)self->_curvedLabel setTracking:*v10];
    }
    unint64_t v11 = [(NTKUtilityFlatComplicationView *)self imagePlacement];
    curvedLabel = self->_curvedLabel;
  }
  else
  {
    if ([(NTKUtilityComplicationView *)self textLayoutStyle] != 2) {
      return;
    }
    [(CLKUICurvedColoringLabel *)self->_curvedLabel setPath:self->_path];
    unint64_t v11 = [(NTKUtilityFlatComplicationView *)self imagePlacement];
    curvedLabel = self->_curvedLabel;
  }
  [(CLKUICurvedColoringLabel *)curvedLabel setImagePlacement:v11];
}

- (void)setMaxAngularWidth:(double)a3
{
  uint64_t v5 = [(CLKUICurvedColoringLabel *)self->_curvedLabel path];

  if (!v5)
  {
    curvedLabel = self->_curvedLabel;
    [(CLKUICurvedColoringLabel *)curvedLabel setMaxAngularWidth:a3];
  }
}

- (double)maxAngularWidth
{
  id v3 = [(CLKUICurvedColoringLabel *)self->_curvedLabel path];

  if (v3) {
    return 0.0;
  }
  curvedLabel = self->_curvedLabel;

  [(CLKUICurvedColoringLabel *)curvedLabel maxAngularWidth];
  return result;
}

- (void)setCircleRadius:(double)a3
{
  uint64_t v5 = [(CLKUICurvedColoringLabel *)self->_curvedLabel path];

  if (!v5)
  {
    curvedLabel = self->_curvedLabel;
    [(CLKUICurvedColoringLabel *)curvedLabel setCircleRadius:a3];
  }
}

- (double)circleRadius
{
  id v3 = [(CLKUICurvedColoringLabel *)self->_curvedLabel path];

  if (v3) {
    return 0.0;
  }
  curvedLabel = self->_curvedLabel;

  [(CLKUICurvedColoringLabel *)curvedLabel circleRadius];
  return result;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
  -[CLKUICurvedColoringLabel setBaselineOffset:](self->_curvedLabel, "setBaselineOffset:");
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
  id v5 = a3;
  [(CLKUICurvedColoringLabel *)self->_curvedLabel setPath:v5];
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[CLKUICurvedColoringLabel setTextAlignment:](self->_curvedLabel, "setTextAlignment:");
}

- (void)setTracking:(double)a3
{
  self->_tracking = a3;
  -[CLKUICurvedColoringLabel setTracking:](self->_curvedLabel, "setTracking:");
}

- (void)setUseBlockyHighlightCorners:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityFlatComplicationView;
  [(NTKUtilityComplicationView *)&v4 setUseBlockyHighlightCorners:a3];
  [(NTKUtilityFlatComplicationView *)self _updateHighlightViewCornerRadius];
}

- (unint64_t)imagePlacement
{
  if (([(NTKUtilityComplicationView *)self placement] & 8) != 0) {
    return 2;
  }
  if (([(NTKUtilityComplicationView *)self placement] & 4) == 0) {
    return 1;
  }
  if (CLKLayoutIsRTL()) {
    return 2;
  }
  return 1;
}

- (void)setShouldUseBackgroundPlatter:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilityFlatComplicationView;
  [(NTKUtilityComplicationView *)&v4 setShouldUseBackgroundPlatter:a3];
  [(NTKUtilityFlatComplicationView *)self _updateHighlightViewCornerRadius];
}

- (void)_updateHighlightViewCornerRadius
{
  BOOL v3 = [(NTKUtilityComplicationView *)self useBlockyHighlightCorners];
  objc_super v4 = [(NTKUtilityComplicationView *)self device];
  id v9 = v4;
  if (v3)
  {
    _LayoutConstants_49(v4, v12);
    double v5 = v13;
  }
  else
  {
    uint64_t v6 = [v4 deviceCategory];

    if (v6 == 1)
    {
      id v9 = [(NTKUtilityComplicationView *)self highlightView];
      int v7 = [v9 layer];
      [v7 setCornerRadius:0.0];
      goto LABEL_7;
    }
    id v9 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v9, v10);
    double v5 = v11;
  }
  int v7 = [(NTKUtilityComplicationView *)self highlightView];
  char v8 = [v7 layer];
  [v8 setCornerRadius:v5];

LABEL_7:
}

- (BOOL)_shouldLayoutWithImageView
{
  if ([(NTKUtilityComplicationView *)self textLayoutStyle] == 1
    || [(NTKUtilityComplicationView *)self textLayoutStyle] == 2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    imageView = self->_imageView;
    if (imageView) {
      int v3 = [(CDComplicationImageView *)imageView isHidden] ^ 1;
    }
    else {
      int v3 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return [(CDComplicationImageView *)self->_imageView hasMonochromeImage] & v3;
    }
  }
  return v3;
}

- (void)_updateLabelMaxWidth
{
  [(NTKUtilityComplicationView *)self maxSize];
  double v4 = v3;
  if ([(NTKUtilityFlatComplicationView *)self _shouldLayoutWithImageView])
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v6 = v5;
    int v7 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v7, v11);
    double v4 = v4 - (v6 + v12);
  }
  if ([(NTKUtilityComplicationView *)self shouldUsePlatterInset])
  {
    char v8 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v8, v10);
    double v4 = v4 + v10[22] * -2.0;
  }
  activeLabel = self->_activeLabel;

  [(CLKUIColoringLabel *)activeLabel setMaxWidth:v4];
}

- (double)_widthThatFits
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[CLKUIColoringLabel sizeThatFits:](self->_activeLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v4);
  if ([(NTKUtilityFlatComplicationView *)self _shouldLayoutWithImageView])
  {
    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v3, v4);
    double v5 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v5, v12);
  }
  if ([(NTKUtilityComplicationView *)self shouldUsePlatterInset])
  {
    double v6 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v6, &v11);
  }
  int v7 = [(NTKUtilityComplicationView *)self device];
  CLKCeilForDevice();
  double v9 = v8;

  return v9;
}

- (void)_updateForTemplateChange
{
  v21.receiver = self;
  v21.super_class = (Class)NTKUtilityFlatComplicationView;
  [(NTKUtilityComplicationView *)&v21 _updateForTemplateChange];
  double v3 = [(NTKUtilityComplicationView *)self complicationTemplate];
  double v4 = [v3 imageProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NTKUtilityFlatComplicationView *)self setUseBlockyHighlightCorners:1];
  }
  BOOL v5 = [(NTKUtilityComplicationView *)self textLayoutStyle] == 1
    || [(NTKUtilityComplicationView *)self textLayoutStyle] == 2;
  if (([off_1E62BD5F0 existingImageView:self->_imageView supportsImageProvider:v4] & 1) == 0)
  {
    if (v5) {
      [(CLKUICurvedColoringLabel *)self->_curvedLabel setImageView:0];
    }
    else {
      [(CDComplicationImageView *)self->_imageView removeFromSuperview];
    }
    double v6 = [off_1E62BD5F0 viewForImageProvider:v4];
    imageView = self->_imageView;
    self->_imageView = v6;

    [(NTKUtilityComplicationView *)self _updateImageViewAlpha:self->_imageView];
    [(NTKUtilityComplicationView *)self _updateImageViewColor:self->_imageView];
  }
  [(CDComplicationImageView *)self->_imageView setImageProvider:v4];
  double v8 = self->_imageView;
  if (v5)
  {
    if (!v8 || ([(CDComplicationImageView *)self->_imageView bounds], CGRectIsEmpty(v22)))
    {
      [(CLKUICurvedColoringLabel *)self->_curvedLabel setImageView:0];
    }
    else
    {
      curvedLabel = self->_curvedLabel;
      BOOL v10 = self->_imageView;
      unint64_t v11 = [(NTKUtilityFlatComplicationView *)self imagePlacement];
      double v12 = [(NTKUtilityComplicationView *)self device];
      _LayoutConstants_49(v12, v19);
      [(CLKUICurvedColoringLabel *)curvedLabel setImageView:v10 placement:v11 padding:v20];
    }
  }
  else if (v8)
  {
    -[NTKUtilityFlatComplicationView addSubview:](self, "addSubview:");
  }
  activeLabel = self->_activeLabel;
  uint64_t v14 = [v3 textProvider];
  [(CLKUIColoringLabel *)activeLabel setTextProvider:v14];

  if (self->_curvedLabel)
  {
    [(NTKUtilityComplicationView *)self setBackgroundPlatter:0];
    [(UIImageView *)self->_curvedHighlightView setImage:0];
  }
  [(NTKUtilityFlatComplicationView *)self _updateLabelMaxWidth];
  double v15 = [(NTKUtilityComplicationView *)self colorScheme];
  int v16 = [v15 containsOverrideFaceColor];

  if (v16)
  {
    unsigned __int8 v17 = [(NTKUtilityComplicationView *)self colorScheme];
    [(NTKUtilityComplicationView *)self _applyColorScheme:v17];
  }
  [(NTKUtilityFlatComplicationView *)self setNeedsLayout];
  double v18 = [(NTKUtilityComplicationView *)self displayObserver];
  [v18 complicationDisplayNeedsResize:self];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  curvedLabel = self->_curvedLabel;
  if (curvedLabel)
  {
    if (self->_label)
    {
      -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double width = v7;
      CGFloat height = v8;
      if ([(NTKUtilityComplicationView *)self shouldUsePlatterInset])
      {
        double v9 = [(NTKUtilityComplicationView *)self device];
        _LayoutConstants_49(v9, v15);
        double width = width + v16 * 2.0;
      }
    }
    else
    {
      double v12 = [(CLKUICurvedColoringLabel *)curvedLabel path];

      if (!v12)
      {
        [(CLKUICurvedColoringLabel *)self->_curvedLabel centerAngle];
        int v13 = CLKFloatEqualsFloat();
        [(NTKUtilityComplicationView *)self device];
        objc_claimAutoreleasedReturnValue();
        if (v13) {
          CLKUICurvedColoringLabelCenterSize();
        }
        CLKUICurvedColoringLabelCornerSize();
      }
    }
    [(NTKUtilityComplicationView *)self minimumWidth];
    if (width >= v10) {
      double v10 = width;
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKUtilityFlatComplicationView;
    -[NTKUtilityComplicationView sizeThatFits:](&v17, sel_sizeThatFits_, a3.width, a3.height);
    CGFloat height = v11;
  }
  double v14 = height;
  result.CGFloat height = v14;
  result.double width = v10;
  return result;
}

- (CGSize)boundingSizeOfCurrentComplicationTemplate
{
  [(NTKUtilityFlatComplicationView *)self layoutIfNeeded];
  [(CLKUIColoringLabel *)self->_activeLabel frame];
  double v4 = v3;
  double v6 = v5;
  result.CGFloat height = v6;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  v95.receiver = self;
  v95.super_class = (Class)NTKUtilityFlatComplicationView;
  [(NTKUtilityComplicationView *)&v95 layoutSubviews];
  double v3 = [(NTKUtilityComplicationView *)self device];
  uint64_t v94 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v79 = 0u;
  memset(v78, 0, sizeof(v78));
  _LayoutConstants_49(v3, v78);
  [(NTKUtilityFlatComplicationView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CLKUIColoringLabel *)self->_activeLabel sizeToFit];
  if (self->_label)
  {
    BOOL v12 = [(NTKUtilityComplicationView *)self shouldUsePlatterInset];
    double v13 = *(double *)&v84;
    if (v12) {
      double v9 = v9 + *(double *)&v84 * -2.0;
    }
    else {
      double v13 = -0.0;
    }
    double v5 = v5 + v13;
    [(NTKUtilityComplicationView *)self layoutLabelVertically:self->_activeLabel];
  }
  [(CLKUIColoringLabel *)self->_activeLabel frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if ([(NTKUtilityFlatComplicationView *)self _shouldLayoutWithImageView])
  {
    CGFloat v74 = v7;
    CGFloat v75 = v11;
    [(CDComplicationImageView *)self->_imageView sizeToFit];
    [(CDComplicationImageView *)self->_imageView frame];
    double v23 = v22;
    CGFloat v25 = v24;
    -[NTKUtilityComplicationView _imageViewOriginYWithBaseImageSize:labelFrame:](self, "_imageViewOriginYWithBaseImageSize:labelFrame:", v22, v24, v15, v17, v19, v21);
    CGFloat v27 = v26;
    if (v19 > v9 - v23 - *(double *)&v79) {
      double v19 = v9 - v23 - *(double *)&v79;
    }
    char v28 = [(NTKUtilityComplicationView *)self placement];
    if ((v28 & 2) != 0)
    {
      v98.origin.double x = v5;
      v98.origin.double y = v74;
      v98.size.CGFloat height = v75;
      v98.size.double width = v9;
      v99.origin.double x = CGRectGetMinX(v98);
      v99.origin.double y = v27;
      v99.size.double width = v23;
      v99.size.CGFloat height = v25;
      CGRectGetMaxX(v99);
    }
    else if ((v28 & 8) != 0)
    {
      v100.origin.double x = v5;
      v100.origin.double y = v74;
      v100.size.CGFloat height = v75;
      v100.size.double width = v9;
      v101.origin.double x = CGRectGetMaxX(v100) - v23;
      v101.origin.double y = v27;
      v101.size.double width = v23;
      v101.size.CGFloat height = v25;
      CGRectGetMinX(v101);
    }
    else
    {
      int IsRTL = CLKLayoutIsRTL();
      if (IsRTL) {
        double v30 = v21;
      }
      else {
        double v30 = v25;
      }
      if (IsRTL) {
        double v31 = v19;
      }
      else {
        double v31 = v23;
      }
      CGFloat v71 = v30;
      CGFloat v72 = v31;
      if (IsRTL) {
        double v32 = v17;
      }
      else {
        double v32 = v27;
      }
      CGFloat v73 = v32;
      CLKLayoutIsRTL();
      v96.origin.double x = v5;
      v96.origin.double y = v74;
      v96.size.CGFloat height = v75;
      v96.size.double width = v9;
      double MinX = CGRectGetMinX(v96);
      CLKFloorForDevice();
      v97.origin.double x = MinX + v34;
      v97.origin.double y = v73;
      v97.size.double width = v72;
      v97.size.CGFloat height = v71;
      CGRectGetMaxX(v97);
      CLKLayoutIsRTL();
      CLKLayoutIsRTL();
    }
    v42 = [(NTKUtilityComplicationView *)self device];
    CLKPixelAlignRectForDevice();
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;

    imageView = self->_imageView;
    v52 = [(NTKUtilityComplicationView *)self device];
    CLKPixelAlignRectForDevice();
    -[CDComplicationImageView setFrame:](imageView, "setFrame:");
  }
  else
  {
    char v35 = [(NTKUtilityComplicationView *)self placement];
    curvedLabel = self->_curvedLabel;
    if (curvedLabel)
    {
      CGRect v37 = [(CLKUICurvedColoringLabel *)curvedLabel path];

      if (v37)
      {
        [(NTKUtilityFlatComplicationView *)self bounds];
      }
      else if ([(NTKUtilityComplicationView *)self isPlacementForTopBezelComplication])
      {
        uint64_t v76 = 0;
        uint64_t v77 = 0;
        [(CLKUICurvedColoringLabel *)self->_curvedLabel getTextCenter:&v76 startAngle:0 endAngle:0];
        [(NTKUtilityFlatComplicationView *)self bounds];
        CGRectGetMidX(v102);
        v103.origin.double x = v15;
        v103.origin.double y = v17;
        v103.size.double width = v19;
        v103.size.CGFloat height = v21;
        CGRectGetWidth(v103);
        [(CLKUICurvedColoringLabel *)self->_curvedLabel bounds];
        CGRectGetMidX(v104);
        v53 = [(NTKUtilityComplicationView *)self device];
        CLKPointRoundForDevice();
      }
      else
      {
        [v3 screenBounds];
        if (v35)
        {
          if ((v35 & 8) != 0)
          {
            CGRectGetWidth(*(CGRect *)&v56);
            CLKUICurvedColoringLabelCornerSize();
          }
        }
        else if ((v35 & 4) != 0)
        {
          if ((v35 & 0xA) != 0) {
            CLKUICurvedColoringLabelCornerSize();
          }
          CLKUICurvedColoringLabelCenterSize();
        }
        CGFloat v60 = v59;
        CGFloat v61 = v58;
        CGFloat v62 = v57;
        CGFloat v63 = v56;
        uint64_t v76 = 0;
        uint64_t v77 = 0;
        [(CLKUICurvedColoringLabel *)self->_curvedLabel getTextCenter:&v76 startAngle:0 endAngle:0];
        [(NTKUtilityComplicationView *)self placement];
        v105.origin.double x = v63;
        v105.origin.double y = v62;
        v105.size.double width = v61;
        v105.size.CGFloat height = v60;
        CGRectGetMaxY(v105);
        [(CLKUICurvedColoringLabel *)self->_curvedLabel circleRadius];
        v106.origin.double x = v63;
        v106.origin.double y = v62;
        v106.size.double width = v61;
        v106.size.CGFloat height = v60;
        CGRectGetMidX(v106);
      }
    }
    else
    {
      double v38 = v5;
      double v39 = v7;
      if ((v35 & 2) != 0)
      {
        double v54 = v9;
        double v55 = v11;
        CGRectGetMinX(*(CGRect *)&v38);
      }
      else
      {
        double v40 = v9;
        double v41 = v11;
        if ((v35 & 8) != 0)
        {
          CGRectGetMaxX(*(CGRect *)&v38);
        }
        else
        {
          CGRectGetMinX(*(CGRect *)&v38);
          CLKFloorForDevice();
        }
      }
    }
    v52 = [(NTKUtilityComplicationView *)self device];
    CLKPixelAlignRectForDevice();
    double v44 = v64;
    double v46 = v65;
    double v48 = v66;
    double v50 = v67;
  }

  -[CLKUIColoringLabel setFrame:](self->_activeLabel, "setFrame:", v44, v46, v48, v50);
  if (self->_curvedLabel)
  {
    v68 = [(UIImageView *)self->_curvedHighlightView image];

    if (!v68)
    {
      v69 = [(NTKUtilityFlatComplicationView *)self _backgroundPlatterImage];
      [(UIImageView *)self->_curvedHighlightView setImage:v69];
    }
    [(UIImageView *)self->_curvedHighlightView sizeToFit];
    [(UIImageView *)self->_curvedHighlightView frame];
    v70 = [(NTKUtilityComplicationView *)self device];
    CLKRectCenteredIntegralRectForDevice();
    -[UIImageView setFrame:](self->_curvedHighlightView, "setFrame:");
  }
  [(NTKUtilityFlatComplicationView *)self updateTextWidthIfNeeded];
}

- (id)_backgroundPlatterImage
{
  if (self->_curvedLabel)
  {
    [(NTKUtilityFlatComplicationView *)self bounds];
    if (CGRectIsEmpty(v32) || ([(CLKUICurvedColoringLabel *)self->_curvedLabel bounds], CGRectIsEmpty(v33)))
    {
      double v3 = 0;
    }
    else
    {
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      memset(v25, 0, sizeof(v25));
      double v4 = [(NTKUtilityComplicationView *)self device];
      _LayoutConstants_49(v4, v25);

      double v5 = [(CLKUICurvedColoringLabel *)self->_curvedLabel path];

      double v3 = 0;
      if (!v5)
      {
        int v6 = [(CLKUICurvedColoringLabel *)self->_curvedLabel interior];
        [(CLKUICurvedColoringLabel *)self->_curvedLabel circleRadius];
        double v23 = 0.0;
        double v24 = 0.0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        [(CLKUICurvedColoringLabel *)self->_curvedLabel getTextCenter:&v23 startAngle:&v22 endAngle:&v21];
        [(CLKUICurvedColoringLabel *)self->_curvedLabel bounds];
        double v7 = *(double *)&v26;
        CGRect v35 = CGRectInset(v34, -*(double *)&v26, -*(double *)&v26);
        CGFloat x = v35.origin.x;
        CGFloat y = v35.origin.y;
        double width = v35.size.width;
        double height = v35.size.height;
        double v12 = CGRectGetWidth(v35);
        [(CLKUICurvedColoringLabel *)self->_curvedLabel bounds];
        double v23 = v23 + (v12 - CGRectGetWidth(v36)) * 0.5;
        v37.origin.CGFloat x = x;
        v37.origin.CGFloat y = y;
        v37.size.double width = width;
        v37.size.double height = height;
        double v13 = CGRectGetHeight(v37);
        [(CLKUICurvedColoringLabel *)self->_curvedLabel bounds];
        double v24 = v24 + (v13 - CGRectGetHeight(v38)) * 0.5;
        double v14 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v6 ^ 1u, v23);
        [v14 setLineWidth:v7];
        [v14 setLineCapStyle:1];
        double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __57__NTKUtilityFlatComplicationView__backgroundPlatterImage__block_invoke;
        v19[3] = &unk_1E62C42D8;
        id v20 = v14;
        id v16 = v14;
        double v17 = [v15 imageWithActions:v19];
        double v3 = [v17 imageWithRenderingMode:2];
      }
    }
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NTKUtilityFlatComplicationView;
    double v3 = [(NTKUtilityComplicationView *)&v30 _backgroundPlatterImage];
  }

  return v3;
}

uint64_t __57__NTKUtilityFlatComplicationView__backgroundPlatterImage__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 set];

  double v3 = *(void **)(a1 + 32);

  return [v3 stroke];
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  double v4 = (void (**)(id, CDComplicationImageView *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_imageView);
}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  double v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4[2](v4, self->_imageView);
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v8 = [(NTKUtilityFlatComplicationView *)self filterProvider];
  double v9 = [v8 filtersForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v6 = [(NTKUtilityFlatComplicationView *)self filterProvider];
  double v7 = [v6 filtersForView:self style:a4];

  return v7;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  double v8 = [(NTKUtilityFlatComplicationView *)self filterProvider];
  double v9 = [v8 filterForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  id v6 = [(NTKUtilityFlatComplicationView *)self filterProvider];
  double v7 = [v6 filterForView:self style:a4];

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NTKUtilityFlatComplicationView *)self filterProvider];
  double v8 = [v7 colorForView:v6 accented:v4];

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKUtilityFlatComplicationView *)self filterProvider];
  id v6 = [v5 backgroundColorForView:v4];

  return v6;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (double)textWidthInRadians
{
  return self->_textWidthInRadians;
}

- (NTKUtilityFlatComplicationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKUtilityFlatComplicationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (double)tracking
{
  return self->_tracking;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_activeLabel, 0);
  objc_storeStrong((id *)&self->_curvedHighlightView, 0);

  objc_storeStrong((id *)&self->_curvedLabel, 0);
}

@end