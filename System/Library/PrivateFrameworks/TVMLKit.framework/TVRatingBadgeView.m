@interface TVRatingBadgeView
+ (id)ratingBadgeViewWithValue:(double)a3 layout:(id)a4 existingBadgeView:(id)a5;
- (BOOL)canBecomeFocused;
- (CGSize)_starSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVRatingBadgeLayout)ratingBadgeLayout;
- (TVRatingBadgeView)initWithFrame:(CGRect)a3;
- (double)_circleRadius;
- (double)_interitemSpacing;
- (double)_starHeight;
- (double)ratingValue;
- (id)_halfStarImage;
- (id)_ratingStyle;
- (id)_starImage;
- (id)_tintColor;
- (void)drawRect:(CGRect)a3;
- (void)setRatingBadgeLayout:(id)a3;
- (void)setRatingValue:(double)a3;
@end

@implementation TVRatingBadgeView

+ (id)ratingBadgeViewWithValue:(double)a3 layout:(id)a4 existingBadgeView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v10 = v9;
  [v9 setRatingBadgeLayout:v7];
  [v10 setRatingValue:a3];
  [v10 setNeedsDisplay];

  return v10;
}

- (TVRatingBadgeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TVRatingBadgeView;
  v3 = -[TVRatingBadgeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(TVRatingBadgeView *)v3 setBackgroundColor:v4];

    [(TVRatingBadgeView *)v3 setOpaque:0];
  }
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)setRatingValue:(double)a3
{
  if (self->_ratingValue != a3)
  {
    self->_ratingValue = a3;
    [(TVRatingBadgeView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  v4 = [(TVRatingBadgeView *)self _starImage];
  [(TVViewLayout *)self->_ratingBadgeLayout padding];
  uint64_t v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v12 = v11;
  [(TVRatingBadgeView *)self _interitemSpacing];
  uint64_t v14 = v13;
  uint64_t v15 = [(TVRatingBadgeView *)self effectiveUserInterfaceLayoutDirection];
  if (v4)
  {
    v16 = [(TVRatingBadgeView *)self _halfStarImage];
    v17 = [(TVRatingBadgeView *)self _tintColor];
    v18 = [v4 _flatImageWithColor:v17];

    v19 = [(TVRatingBadgeView *)self _tintColor];
    v20 = [v19 colorWithAlphaComponent:0.3];
    v21 = [v4 _flatImageWithColor:v20];

    v22 = [(TVRatingBadgeView *)self _tintColor];
    v23 = [v16 _flatImageWithColor:v22];

    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    *(CGFloat *)&v70[3] = v8;
    double ratingValue = self->_ratingValue;
    [(TVRatingBadgeView *)self _starSize];
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __30__TVRatingBadgeView_drawRect___block_invoke;
    v56[3] = &unk_264BA7F80;
    id v29 = v21;
    id v57 = v29;
    double v62 = round(ratingValue * 10.0) * 0.5;
    id v30 = v18;
    id v58 = v30;
    id v31 = v23;
    v60 = self;
    v61 = v70;
    uint64_t v63 = v6;
    CGFloat v64 = v8;
    CGFloat v65 = v10;
    uint64_t v66 = v12;
    uint64_t v67 = v26;
    uint64_t v68 = v28;
    id v59 = v31;
    uint64_t v69 = v14;
    v32 = (void (**)(void, void))MEMORY[0x230FC9DC0](v56);
    if (v15 == 1)
    {
      uint64_t v33 = 5;
      do
        v32[2](v32, v33--);
      while (v33);
    }
    else
    {
      for (uint64_t i = 1; i != 6; ++i)
        v32[2](v32, i);
    }

    _Block_object_dispose(v70, 8);
  }
  else
  {
    id v34 = [(TVRatingBadgeLayout *)self->_ratingBadgeLayout fillColor];
    uint64_t v35 = [v34 CGColor];

    id v36 = [(TVRatingBadgeView *)self _tintColor];
    uint64_t v37 = [v36 CGColor];

    if (v15 == 1) {
      uint64_t v38 = v37;
    }
    else {
      uint64_t v38 = v35;
    }
    if (v15 == 1) {
      uint64_t v39 = v35;
    }
    else {
      uint64_t v39 = v37;
    }
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, v8, v10);
    double v41 = round(self->_ratingValue * 10.0) * 0.5;
    [(TVRatingBadgeView *)self _circleRadius];
    CGFloat v43 = v42;
    double v44 = v42 + v42;
    UIRectGetCenter();
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    Mutable = CGPathCreateMutable();
    CGPathAddArc(Mutable, 0, v46, v48, v43, 4.71238898, 1.57079633, 1);
    v50 = CGPathCreateMutable();
    CGPathAddArc(v50, 0, v46, v48, v43, 4.71238898, 1.57079633, 0);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __30__TVRatingBadgeView_drawRect___block_invoke_2;
    v55[3] = &unk_264BA7FA8;
    *(double *)&v55[5] = v41;
    v55[6] = CurrentContext;
    v55[7] = Mutable;
    v55[8] = v50;
    v55[9] = v35;
    v55[10] = v38;
    v55[11] = v39;
    v55[13] = 0;
    v55[14] = 0;
    v55[12] = v37;
    *(double *)&v55[15] = v44;
    *(double *)&v55[16] = v44;
    v55[4] = self;
    v51 = (void (**)(void, void))MEMORY[0x230FC9DC0](v55);
    if (v15 == 1)
    {
      uint64_t v52 = 5;
      do
        v51[2](v51, v52--);
      while (v52);
    }
    else
    {
      for (uint64_t j = 1; j != 6; ++j)
        v51[2](v51, j);
    }
    CGPathRelease(Mutable);
    CGPathRelease(v50);
  }
}

void __30__TVRatingBadgeView_drawRect___block_invoke(uint64_t a1, unint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  double v5 = *(double *)(a1 + 72);
  id v10 = v4;
  if (v5 >= (double)a2)
  {
    double v7 = (id *)(a1 + 40);
  }
  else
  {
    if (v5 <= (double)(a2 - 1) || v5 >= (double)a2) {
      goto LABEL_10;
    }
    double v7 = (id *)(a1 + 48);
  }
  id v8 = *v7;

  id v10 = v8;
LABEL_10:
  double v9 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10];
  objc_msgSend(v9, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(double *)(a1 + 80), *(double *)(a1 + 112), *(double *)(a1 + 120));
  [*(id *)(a1 + 56) addSubview:v9];
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 112)
                                                              + *(double *)(a1 + 128)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24);
}

void __30__TVRatingBadgeView_drawRect___block_invoke_2(uint64_t a1, unint64_t a2)
{
  double v3 = *(double *)(a1 + 40);
  double v4 = (double)a2;
  if (v3 >= (double)a2)
  {
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 56));
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 64));
    id v8 = (CGColorRef *)(a1 + 72);
  }
  else
  {
    double v5 = (double)(a2 - 1);
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 56));
    uint64_t v6 = *(CGContext **)(a1 + 48);
    if (v3 > v5 && v3 < v4)
    {
      CGContextSetFillColorWithColor(v6, *(CGColorRef *)(a1 + 80));
      CGContextDrawPath(*(CGContextRef *)(a1 + 48), kCGPathFill);
      CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 64));
      id v8 = (CGColorRef *)(a1 + 88);
    }
    else
    {
      CGContextAddPath(v6, *(CGPathRef *)(a1 + 64));
      id v8 = (CGColorRef *)(a1 + 96);
    }
  }
  CGContextSetFillColorWithColor(*(CGContextRef *)(a1 + 48), *v8);
  CGContextDrawPath(*(CGContextRef *)(a1 + 48), kCGPathFill);
  double v9 = *(CGContext **)(a1 + 48);
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 104));
  [*(id *)(a1 + 32) _interitemSpacing];
  double v12 = Width + v11;
  CGContextTranslateCTM(v9, v12, 0.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = [(TVRatingBadgeView *)self _starImage];
  [(TVViewLayout *)self->_ratingBadgeLayout padding];
  double v6 = v5;
  double v8 = v7;
  double v11 = v9 + v10;
  if (v4)
  {
    [(TVRatingBadgeView *)self _starSize];
    double v13 = v11 + v12;
    [(TVRatingBadgeView *)self _starSize];
  }
  else
  {
    [(TVRatingBadgeView *)self _circleRadius];
    double v13 = v11 + v15 * 2.0;
    [(TVRatingBadgeView *)self _circleRadius];
    double v14 = v16 + v16;
  }
  double v17 = v6 + v8 + v14 * 5.0;
  [(TVRatingBadgeView *)self _interitemSpacing];
  double v19 = v17 + v18 * 4.0;

  double v20 = v19;
  double v21 = v13;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)_tintColor
{
  double v3 = [(TVRatingBadgeView *)self traitCollection];
  double v4 = v3;
  if (v3
    && [v3 userInterfaceStyle] == 2
    && ([(TVViewLayout *)self->_ratingBadgeLayout darkTintColor],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(TVViewLayout *)self->_ratingBadgeLayout darkTintColor];
  }
  else
  {
    uint64_t v6 = [(TVViewLayout *)self->_ratingBadgeLayout tintColor];
  }
  double v7 = (void *)v6;

  return v7;
}

- (double)_interitemSpacing
{
  double v3 = [(TVRatingBadgeView *)self traitCollection];
  [(TVRatingBadgeLayout *)self->_ratingBadgeLayout interitemSpacing];
  double v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v3 preferredContentSizeCategory];
    if (+[TVMLUtilities isAXSmallEnabled:v6])
    {
      [(TVRatingBadgeLayout *)self->_ratingBadgeLayout interitemSpacingAXSmall];
      double v8 = v7;

      if (v8 > 0.0)
      {
        [(TVRatingBadgeLayout *)self->_ratingBadgeLayout interitemSpacingAXSmall];
LABEL_9:
        double v5 = v9;
        goto LABEL_11;
      }
    }
    else
    {
    }
    double v10 = [v3 preferredContentSizeCategory];
    if (!+[TVMLUtilities isAXLargeEnabled:v10])
    {

      goto LABEL_11;
    }
    [(TVRatingBadgeLayout *)self->_ratingBadgeLayout interitemSpacingAXLarge];
    double v12 = v11;

    if (v12 > 0.0)
    {
      [(TVRatingBadgeLayout *)self->_ratingBadgeLayout interitemSpacingAXLarge];
      goto LABEL_9;
    }
  }
LABEL_11:

  return v5;
}

- (id)_ratingStyle
{
  double v3 = [(TVRatingBadgeView *)self traitCollection];
  double v4 = [(TVRatingBadgeLayout *)self->_ratingBadgeLayout ratingStyle];
  if (v3)
  {
    double v5 = [v3 preferredContentSizeCategory];
    if (+[TVMLUtilities isAXSmallEnabled:v5])
    {
      uint64_t v6 = [(TVRatingBadgeLayout *)self->_ratingBadgeLayout ratingStyleAXSmall];

      if (v6)
      {
        uint64_t v7 = [(TVRatingBadgeLayout *)self->_ratingBadgeLayout ratingStyleAXSmall];
        goto LABEL_9;
      }
    }
    else
    {
    }
    double v8 = [v3 preferredContentSizeCategory];
    if (!+[TVMLUtilities isAXLargeEnabled:v8])
    {
LABEL_10:

      goto LABEL_11;
    }
    double v9 = [(TVRatingBadgeLayout *)self->_ratingBadgeLayout ratingStyleAXLarge];

    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v7 = [(TVRatingBadgeLayout *)self->_ratingBadgeLayout ratingStyleAXLarge];
LABEL_9:
    double v8 = v4;
    double v4 = (void *)v7;
    goto LABEL_10;
  }
LABEL_11:

  return v4;
}

- (CGSize)_starSize
{
  double v3 = [(TVRatingBadgeView *)self _starImage];
  [v3 size];
  double v5 = v4;
  [(TVRatingBadgeView *)self _starHeight];
  double v7 = v5 * v6;
  double v8 = [(TVRatingBadgeView *)self _starImage];
  [v8 size];
  double v10 = v7 / v9;

  float v11 = v10;
  double v12 = ceilf(v11);
  [(TVRatingBadgeView *)self _starHeight];
  double v14 = v13;
  double v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (double)_starHeight
{
  if (_starHeight_onceToken != -1) {
    dispatch_once(&_starHeight_onceToken, &__block_literal_global_34);
  }
  double v3 = [(TVRatingBadgeView *)self _ratingStyle];
  if ([v3 isEqualToString:@"star-hollow-l"] && self->_ratingValue > 0.0)
  {
    double v4 = @"star-l";
  }
  else
  {
    double v4 = [(TVRatingBadgeView *)self _ratingStyle];
  }
  double v5 = v4;

  double v6 = [(id)_starHeight_sStarStyleMap objectForKeyedSubscript:v5];
  [v6 floatValue];
  double v8 = v7;

  return v8;
}

void __32__TVRatingBadgeView__starHeight__block_invoke()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = @"star-s";
  v2[1] = @"star-m";
  v3[0] = &unk_26E59E4D0;
  v3[1] = &unk_26E59E4E8;
  v2[2] = @"star-l";
  v2[3] = @"star-hollow-l";
  v3[2] = &unk_26E59E500;
  v3[3] = &unk_26E59E500;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)_starHeight_sStarStyleMap;
  _starHeight_sStarStyleMap = v0;
}

- (id)_starImage
{
  double v3 = [(TVRatingBadgeView *)self _ratingStyle];
  if ([v3 isEqualToString:@"star-hollow-l"] && self->_ratingValue > 0.0)
  {
    double v4 = @"star-l";
  }
  else
  {
    double v4 = [(TVRatingBadgeView *)self _ratingStyle];
  }
  double v5 = v4;

  if ([(__CFString *)v5 isEqualToString:@"star-hollow-l"])
  {
    double v6 = @"star_hollow_mask";
  }
  else if ([(__CFString *)v5 isEqualToString:@"circle"])
  {
    double v6 = 0;
  }
  else
  {
    double v6 = @"star_mask";
  }
  float v7 = (void *)MEMORY[0x263F1C6B0];
  double v8 = +[TVMLUtilities TVMLKitBundle];
  double v9 = [v7 imageNamed:v6 inBundle:v8];

  return v9;
}

- (id)_halfStarImage
{
  double v3 = (void *)MEMORY[0x263F1C6B0];
  double v4 = +[TVMLUtilities TVMLKitBundle];
  double v5 = [v3 imageNamed:@"star_half_mask" inBundle:v4];

  if (v5
    && [(TVRatingBadgeView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    double v6 = (void *)MEMORY[0x263F1C6B0];
    id v7 = v5;
    uint64_t v8 = [v7 CGImage];
    [v7 scale];
    objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, 4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v5;
  }
  double v10 = v9;

  return v10;
}

- (double)_circleRadius
{
  if (_circleRadius_onceToken != -1) {
    dispatch_once(&_circleRadius_onceToken, &__block_literal_global_19_0);
  }
  double v3 = (void *)_circleRadius_sCircleRadiusMap;
  double v4 = [(TVRatingBadgeView *)self _ratingStyle];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  double v6 = (void *)v5;
  id v7 = &unk_26E59E518;
  if (v5) {
    id v7 = (void *)v5;
  }
  id v8 = v7;

  [v8 floatValue];
  float v10 = v9;

  return v10;
}

void __34__TVRatingBadgeView__circleRadius__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"circle";
  v3[0] = &unk_26E59E518;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)_circleRadius_sCircleRadiusMap;
  _circleRadius_sCircleRadiusMap = v0;
}

- (TVRatingBadgeLayout)ratingBadgeLayout
{
  return self->_ratingBadgeLayout;
}

- (void)setRatingBadgeLayout:(id)a3
{
}

- (double)ratingValue
{
  return self->_ratingValue;
}

- (void).cxx_destruct
{
}

@end