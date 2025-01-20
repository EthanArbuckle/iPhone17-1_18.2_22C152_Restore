@interface THGuidedPanColumnTarget
- (BOOL)guidedPanTargetIsTargeted;
- (CGRect)guidedPanTargetUnscaledPageRect;
- (CGRect)guidedPanTargetUnscaledRect;
- (THGuidedPanColumnTarget)initWithLayout:(id)a3 column:(id)a4;
- (TSWPColumn)column;
- (TSWPLayoutTarget)layout;
- (double)viewScaleWithController:(id)a3;
- (id)p_wellForTarget:(id)a3 wellRect:(CGRect)a4 blendDistance:(double)a5 prev:(BOOL)a6;
- (int)guidedPanTargetKind;
- (int64_t)guidedPanRelativePageIndexWithController:(id)a3;
- (void)dealloc;
- (void)guidedPanTargetAddWellsToArray:(id)a3 withController:(id)a4;
- (void)setColumn:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation THGuidedPanColumnTarget

- (THGuidedPanColumnTarget)initWithLayout:(id)a3 column:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THGuidedPanColumnTarget;
  v6 = [(THGuidedPanColumnTarget *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      [(THGuidedPanColumnTarget *)v6 setLayout:a3];
      [(THGuidedPanColumnTarget *)v7 setColumn:a4];
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  [(THGuidedPanColumnTarget *)self setLayout:0];
  [(THGuidedPanColumnTarget *)self setColumn:0];
  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanColumnTarget;
  [(THGuidedPanColumnTarget *)&v3 dealloc];
}

- (CGRect)guidedPanTargetUnscaledRect
{
  layout = self->_layout;
  [(TSWPColumn *)self->_column typographicBounds];
  -[TSWPLayoutTarget rectInRoot:](layout, "rectInRoot:");

  return CGRectInset(*(CGRect *)&v3, -15.0, -15.0);
}

- (CGRect)guidedPanTargetUnscaledPageRect
{
  id v2 = [(TSWPLayoutTarget *)self->_layout pageLayout];

  [v2 frameInRoot];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)viewScaleWithController:(id)a3
{
  [(THGuidedPanColumnTarget *)self guidedPanTargetUnscaledRect];

  [a3 viewScaleForUnscaledRect:0];
  return result;
}

- (id)p_wellForTarget:(id)a3 wellRect:(CGRect)a4 blendDistance:(double)a5 prev:(BOOL)a6
{
  return sub_17CC1C(a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)guidedPanTargetAddWellsToArray:(id)a3 withController:(id)a4
{
  [(THGuidedPanColumnTarget *)self guidedPanTargetUnscaledRect];
  double x = v45.origin.x;
  double y = v45.origin.y;
  double width = v45.size.width;
  double height = v45.size.height;
  CGFloat MidX = CGRectGetMidX(v45);
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  CGFloat MinY = CGRectGetMinY(v46);
  [a4 viewScaleForUnscaledRect:0 forPage:x y:y width:width height:height];
  double v14 = v13;
  CGFloat v15 = -10.0 / v13;
  v47.size.double width = 0.0;
  v47.origin.double x = MidX;
  v47.origin.double y = MinY;
  v47.size.double height = height;
  CGRect v48 = CGRectInset(v47, v15, 0.0);
  v16 = -[THGuidedPanRectWell initWithUnscaledRect:wellRect:target:]([THGuidedPanRectWell alloc], "initWithUnscaledRect:wellRect:target:", self, x, y, width, height, v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
  [(THGuidedPanRectWell *)v16 setAllowVerticalMovementInWell:1];
  [(THGuidedPanRectWell *)v16 setIdentifier:@"column"];
  [(THGuidedPanRectWell *)v16 setSmoothWeight:0.2];
  [(THGuidedPanRectWell *)v16 setCurrentWeight:1.0];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_17D1A0;
  v44[3] = &unk_45A2D0;
  v44[4] = v16;
  v44[5] = a4;
  *(double *)&v44[6] = 240.0 / v14;
  [(THGuidedPanRectWell *)v16 setWeightBlock:v44];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_17D238;
  v43[3] = &unk_45A2F8;
  v43[4] = v16;
  [(THGuidedPanRectWell *)v16 setRatingBlock:v43];
  [a3 addObject:v16];

  id v17 = [(TSWPLayoutTarget *)self->_layout previousTargetFromLayout:self->_layout column:self->_column];
  if (v17)
  {
    id v18 = v17;
    [v17 guidedPanTargetUnscaledRect];
    CGFloat v19 = v49.origin.x;
    CGFloat v20 = v49.origin.y;
    CGFloat v21 = v49.size.width;
    CGFloat v22 = v49.size.height;
    CGFloat v23 = CGRectGetMidX(v49);
    v50.origin.double x = v19;
    v50.origin.double y = v20;
    v50.size.double width = v21;
    v50.size.double height = v22;
    CGFloat v24 = CGRectGetMinY(v50);
    v51.origin.double x = v19;
    v51.origin.double y = v20;
    v51.size.double width = v21;
    v51.size.double height = v22;
    v52.size.double height = CGRectGetHeight(v51);
    v52.size.double width = 0.0;
    v52.origin.double x = v23;
    v52.origin.double y = v24;
    CGRect v53 = CGRectInset(v52, -50.0, 0.0);
    double v25 = v53.origin.x;
    double v26 = v53.origin.y;
    double v27 = v53.size.width;
    double v28 = v53.size.height;
    v53.origin.double x = v19;
    v53.origin.double y = v20;
    v53.size.double width = v21;
    v53.size.double height = v22;
    id v29 = -[THGuidedPanColumnTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v18, 1, v25, v26, v27, v28, fmax(CGRectGetWidth(v53), 300.0));
    [v29 setIdentifier:@"prev"];
    [a3 addObject:v29];
  }
  id v30 = [(TSWPLayoutTarget *)self->_layout nextTargetFromLayout:self->_layout column:self->_column];
  if (v30)
  {
    id v31 = v30;
    [v30 guidedPanTargetUnscaledRect];
    CGFloat v32 = v54.origin.x;
    CGFloat v33 = v54.origin.y;
    CGFloat v34 = v54.size.width;
    CGFloat v35 = v54.size.height;
    CGFloat v36 = CGRectGetMidX(v54);
    v55.origin.double x = v32;
    v55.origin.double y = v33;
    v55.size.double width = v34;
    v55.size.double height = v35;
    CGFloat v37 = CGRectGetMinY(v55);
    v56.origin.double x = v32;
    v56.origin.double y = v33;
    v56.size.double width = v34;
    v56.size.double height = v35;
    v57.size.double height = CGRectGetHeight(v56);
    v57.size.double width = 0.0;
    v57.origin.double x = v36;
    v57.origin.double y = v37;
    CGRect v58 = CGRectInset(v57, -50.0, 0.0);
    double v38 = v58.origin.x;
    double v39 = v58.origin.y;
    double v40 = v58.size.width;
    double v41 = v58.size.height;
    v58.origin.double x = v32;
    v58.origin.double y = v33;
    v58.size.double width = v34;
    v58.size.double height = v35;
    id v42 = -[THGuidedPanColumnTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v31, 0, v38, v39, v40, v41, fmax(CGRectGetWidth(v58), 300.0));
    [v42 setIdentifier:@"next"];
    [a3 addObject:v42];
  }
}

- (int)guidedPanTargetKind
{
  return 1;
}

- (int64_t)guidedPanRelativePageIndexWithController:(id)a3
{
  return (int64_t)[a3 relativePageIndexForLayout:self->_layout];
}

- (BOOL)guidedPanTargetIsTargeted
{
  return 1;
}

- (TSWPLayoutTarget)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (TSWPColumn)column
{
  return self->_column;
}

- (void)setColumn:(id)a3
{
}

@end