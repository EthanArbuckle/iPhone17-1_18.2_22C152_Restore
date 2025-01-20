@interface CRLCanvasSizingGuideUILayer
- (id)initForLayout:(id)a3 withICC:(id)a4 showWidth:(BOOL)a5 showHeight:(BOOL)a6;
- (id)initForRect:(CGRect)a3 withICC:(id)a4 showWidth:(BOOL)a5 showHeight:(BOOL)a6;
@end

@implementation CRLCanvasSizingGuideUILayer

- (id)initForRect:(CGRect)a3 withICC:(id)a4 showWidth:(BOOL)a5 showHeight:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRLCanvasSizingGuideUILayer;
  v14 = [(CRLCanvasSizingGuideUILayer *)&v18 init];
  if (v14)
  {
    if (v7)
    {
      v15 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", 0, v13, 0, x, y - (15.0 + 7.0), width, 15.0);
      [(CRLCanvasSizingGuideUILayer *)v14 addSublayer:v15];
    }
    if (v6)
    {
      v16 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", 1, v13, 0, x - (15.0 + 7.0), y, 15.0, height);
      [(CRLCanvasSizingGuideUILayer *)v14 addSublayer:v16];
    }
  }

  return v14;
}

- (id)initForLayout:(id)a3 withICC:(id)a4 showWidth:(BOOL)a5 showHeight:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  [v11 viewScale];
  double v13 = v12;
  [v10 boundsForStandardKnobs];
  id v14 = -[CRLCanvasSizingGuideUILayer initForRect:withICC:showWidth:showHeight:](self, "initForRect:withICC:showWidth:showHeight:", v11, v7, v6);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  if (v10)
  {
    [v10 transformInRoot];
    double v15 = *(double *)&v20;
  }
  else
  {
    double v15 = 0.0;
  }
  *(void *)&long long v20 = sub_100407DFC(v13 * v15);
  *((void *)&v20 + 1) = sub_100407DFC(v13 * *((double *)&v20 + 1));
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  [v14 setAffineTransform:v17];

  return v14;
}

@end