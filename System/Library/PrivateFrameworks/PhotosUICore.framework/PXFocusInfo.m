@interface PXFocusInfo
+ (PXFocusInfo)focusInfoWithView:(id)a3;
+ (PXFocusInfo)focusInfoWithView:(id)a3 cornerRadius:(double)a4 cornerCurve:(id)a5;
- (BOOL)wantsInnerBorder;
- (BOOL)wantsOuterBorder;
- (NSString)cornerCurve;
- (UIView)view;
- (double)cornerRadius;
- (id)makeHaloEffectForSourceView:(id)a3;
- (void)setWantsInnerBorder:(BOOL)a3;
- (void)setWantsOuterBorder:(BOOL)a3;
@end

@implementation PXFocusInfo

+ (PXFocusInfo)focusInfoWithView:(id)a3
{
  id v4 = a3;
  v5 = [v4 layer];
  [v5 cornerRadius];
  double v7 = v6;
  v8 = [v5 cornerCurve];
  v9 = [a1 focusInfoWithView:v4 cornerRadius:v8 cornerCurve:v7];

  return (PXFocusInfo *)v9;
}

+ (PXFocusInfo)focusInfoWithView:(id)a3 cornerRadius:(double)a4 cornerCurve:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (double *)objc_alloc_init((Class)a1);
  v11 = (void *)*((void *)v10 + 2);
  *((void *)v10 + 2) = v8;
  id v12 = v8;

  v10[3] = a4;
  v13 = (void *)*((void *)v10 + 4);
  *((void *)v10 + 4) = v9;

  return (PXFocusInfo *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIView)view
{
  return self->_view;
}

- (void)setWantsOuterBorder:(BOOL)a3
{
  self->_wantsOuterBorder = a3;
}

- (BOOL)wantsOuterBorder
{
  return self->_wantsOuterBorder;
}

- (void)setWantsInnerBorder:(BOOL)a3
{
  self->_wantsInnerBorder = a3;
}

- (BOOL)wantsInnerBorder
{
  return self->_wantsInnerBorder;
}

- (id)makeHaloEffectForSourceView:(id)a3
{
  view = self->_view;
  id v5 = a3;
  [(UIView *)view bounds];
  objc_msgSend(v5, "convertRect:fromView:", self->_view);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = (void *)MEMORY[0x1E4FB1788];
  double cornerRadius = self->_cornerRadius;
  cornerCurve = self->_cornerCurve;
  return (id)objc_msgSend(v14, "effectWithRoundedRect:cornerRadius:curve:", cornerCurve, v7, v9, v11, v13, cornerRadius);
}

@end