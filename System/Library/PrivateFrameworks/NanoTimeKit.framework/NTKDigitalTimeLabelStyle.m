@interface NTKDigitalTimeLabelStyle
+ (id)_fontForDesign:(id)a3 withWeight:(double)a4 onDevice:(id)a5;
+ (id)defaultRoundedStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 forDevice:(id)a6;
+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 font:(id)a6 forDevice:(id)a7;
+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 forDevice:(id)a6;
+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 withBaselineY:(double)a6 forDevice:(id)a7;
+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 withBaselineY:(double)a6 withFont:(id)a7 forDevice:(id)a8;
+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 forDevice:(id)a4;
+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 weight:(double)a4 forDevice:(id)a5;
+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 withBaselineY:(double)a4 withFont:(id)a5 forDevice:(id)a6;
+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 withFont:(id)a4 forDevice:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSNumber)tracking;
- (NTKLayoutRule)layoutRule;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setLayoutRule:(id)a3;
- (void)setTracking:(id)a3;
@end

@implementation NTKDigitalTimeLabelStyle

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKDigitalTimeLabelStyle;
  id v5 = -[CLKUITimeLabelStyle copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(NTKDigitalTimeLabelStyle *)self layoutRule];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setLayoutRule:v7];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NTKDigitalTimeLabelStyle *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKDigitalTimeLabelStyle;
    if ([(CLKUITimeLabelStyle *)&v8 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = [(NTKDigitalTimeLabelStyle *)v4 layoutRule];
      char v6 = [v5 isEqual:self->_layoutRule];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)NTKDigitalTimeLabelStyle;
  double v3 = (double)[(CLKUITimeLabelStyle *)&v5 hash];
  return (unint64_t)((double)[(NTKLayoutRule *)self->_layoutRule hash] * 1000.0 + v3 * 100.0);
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 forDevice:(id)a6
{
  BOOL v6 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  id v13 = a6;
  _LayoutConstants_11(v13, (uint64_t)v16);
  v14 = objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:forDevice:", v6, v13, x, y, width, height, a4, *(double *)v16);

  return v14;
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 font:(id)a6 forDevice:(id)a7
{
  BOOL v8 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  id v15 = a7;
  id v16 = a6;
  _LayoutConstants_11(v15, (uint64_t)v19);
  uint64_t v17 = objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", v8, v16, v15, x, y, width, height, a4, *(double *)v19);

  return v17;
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 withBaselineY:(double)a6 forDevice:(id)a7
{
  BOOL v8 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v15 = *MEMORY[0x1E4FB09C8];
  id v16 = a7;
  uint64_t v17 = [a1 _fontForDesign:0 withWeight:v16 onDevice:v15];
  v18 = objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", v8, v17, v16, x, y, width, height, a4, a6);

  return v18;
}

+ (id)defaultRoundedStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 forDevice:(id)a6
{
  BOOL v6 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v13 = *MEMORY[0x1E4F19680];
  double v14 = *MEMORY[0x1E4FB09D8];
  id v15 = a6;
  id v16 = [a1 _fontForDesign:v13 withWeight:v15 onDevice:v14];
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  _LayoutConstants_11(v15, (uint64_t)v19);
  uint64_t v17 = objc_msgSend(a1, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", v6, v16, v15, x, y, width, height, a4, *(double *)v19);

  return v17;
}

+ (id)_fontForDesign:(id)a3 withWeight:(double)a4 onDevice:(id)a5
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _LayoutConstants_11(a5, (uint64_t)&v9);
  if (a3) {
    [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:*((double *)&v10 + 1) design:a4];
  }
  else {
  v7 = [MEMORY[0x1E4F19A50] systemFontOfSize:*((double *)&v10 + 1) weight:a4];
  }
  return v7;
}

+ (id)defaultStyleForBounds:(CGRect)a3 withRightSideMargin:(double)a4 applyAdvanceFudge:(BOOL)a5 withBaselineY:(double)a6 withFont:(id)a7 forDevice:(id)a8
{
  BOOL v10 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a7;
  id v17 = a8;
  v18 = objc_alloc_init(NTKDigitalTimeLabelStyle);
  [(CLKUITimeLabelStyle *)v18 setThreeDigitFont:v16];
  [(CLKUITimeLabelStyle *)v18 setFourDigitFont:v16];
  [(CLKUITimeLabelStyle *)v18 setDesignatorFont:v16];
  [v16 lineHeight];
  double v20 = v19;
  [v16 descender];
  double v22 = v21;
  if (v10)
  {
    uint64_t v28 = 0;
    memset(v27, 0, sizeof(v27));
    _LayoutConstants_11(v17, (uint64_t)v27);
    a4 = a4 - *((double *)v27 + 1);
  }
  id v23 = [[NTKLayoutRule alloc] initForDevice:v17];
  v30.origin.CGFloat x = x;
  v30.origin.double y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat v24 = CGRectGetWidth(v30) - a4;
  [v16 lineHeight];
  objc_msgSend(v23, "setReferenceFrame:", 0.0, y + a6 - (v20 + v22), v24, v25);
  [v23 setHorizontalLayout:2];
  [v23 setVerticalLayout:0];
  [(NTKDigitalTimeLabelStyle *)v18 setLayoutRule:v23];

  return v18;
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 weight:(double)a4 forDevice:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  id v11 = a5;
  _LayoutConstants_11(v11, (uint64_t)&v15);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F19A50], "systemFontOfSize:weight:", *(double *)&v17, a4, v15, v16);
  uint64_t v13 = objc_msgSend(a1, "smallInUpperRightCornerStyleForBounds:withFont:forDevice:", v12, v11, x, y, width, height);

  return v13;
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(a1, "smallInUpperRightCornerStyleForBounds:weight:forDevice:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4FB09C8]);
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 withFont:(id)a4 forDevice:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  [v12 lineHeight];
  double v14 = v13;
  [v12 descender];
  long long v16 = objc_msgSend(a1, "smallInUpperRightCornerStyleForBounds:withBaselineY:withFont:forDevice:", v12, v11, x, y, width, height, v14 + v15);

  return v16;
}

+ (id)smallInUpperRightCornerStyleForBounds:(CGRect)a3 withBaselineY:(double)a4 withFont:(id)a5 forDevice:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a6;
  id v13 = a5;
  double v14 = objc_alloc_init(NTKDigitalTimeLabelStyle);
  [(CLKUITimeLabelStyle *)v14 setThreeDigitFont:v13];
  [(CLKUITimeLabelStyle *)v14 setFourDigitFont:v13];
  [(CLKUITimeLabelStyle *)v14 setDesignatorFont:v13];
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  _LayoutConstants_11(v12, (uint64_t)&v25);
  double v15 = *(double *)&v26 + *((double *)&v27 + 1);
  [v13 lineHeight];
  double v17 = v16;
  [v13 descender];
  double v19 = a4 - (v17 + v18);
  id v20 = [[NTKLayoutRule alloc] initForDevice:v12];

  v30.origin.CGFloat x = x;
  v30.origin.double y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat v21 = CGRectGetWidth(v30) + -3.0;
  [v13 lineHeight];
  double v23 = v22;

  objc_msgSend(v20, "setReferenceFrame:", 0.0, v15 + y + v19, v21, v23);
  [v20 setHorizontalLayout:2];
  [v20 setVerticalLayout:0];
  [(NTKDigitalTimeLabelStyle *)v14 setLayoutRule:v20];

  return v14;
}

- (NTKLayoutRule)layoutRule
{
  return self->_layoutRule;
}

- (void)setLayoutRule:(id)a3
{
}

- (NSNumber)tracking
{
  return self->_tracking;
}

- (void)setTracking:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracking, 0);
  objc_storeStrong((id *)&self->_layoutRule, 0);
}

@end