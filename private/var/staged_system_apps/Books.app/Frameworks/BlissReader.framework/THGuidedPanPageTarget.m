@interface THGuidedPanPageTarget
+ (id)guidedPanTargetForPageAtLocation:(id)a3 controller:(id)a4;
+ (id)p_childPageLayoutAtCenterFromLayout:(id)a3 visibleUnscaledCenter:(CGPoint)a4;
- (BOOL)guidedPanTargetIsTargeted;
- (BOOL)targeted;
- (CGRect)guidedPanTargetUnscaledPageRect;
- (CGRect)guidedPanTargetUnscaledRect;
- (CGRect)unscaledFrame;
- (THGuidedPanPageTarget)initWithLayout:(id)a3 targeted:(BOOL)a4;
- (THPageLayout)layout;
- (double)viewScaleWithController:(id)a3;
- (id)guidedPanTargetUpdatedTargetForLocation:(id)a3 withController:(id)a4;
- (id)p_wellForTarget:(id)a3 wellRect:(CGRect)a4 blendDistance:(double)a5 prev:(BOOL)a6;
- (int)guidedPanTargetKind;
- (int64_t)guidedPanRelativePageIndexWithController:(id)a3;
- (void)dealloc;
- (void)guidedPanTargetAddWellsToArray:(id)a3 withController:(id)a4;
@end

@implementation THGuidedPanPageTarget

- (THGuidedPanPageTarget)initWithLayout:(id)a3 targeted:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)THGuidedPanPageTarget;
  v6 = [(THGuidedPanPageTarget *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_targeted = a4;
    [a3 frameInRoot];
    v7->_unscaledFrame.origin.x = v8;
    v7->_unscaledFrame.origin.y = v9;
    v7->_unscaledFrame.size.width = v10;
    v7->_unscaledFrame.size.height = v11;
    v7->_layout = (THPageLayout *)a3;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanPageTarget;
  [(THGuidedPanPageTarget *)&v3 dealloc];
}

- (BOOL)guidedPanTargetIsTargeted
{
  return self->_targeted;
}

- (CGRect)guidedPanTargetUnscaledRect
{
  double x = self->_unscaledFrame.origin.x;
  double y = self->_unscaledFrame.origin.y;
  double width = self->_unscaledFrame.size.width;
  double height = self->_unscaledFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)guidedPanTargetUnscaledPageRect
{
  double x = self->_unscaledFrame.origin.x;
  double y = self->_unscaledFrame.origin.y;
  double width = self->_unscaledFrame.size.width;
  double height = self->_unscaledFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)viewScaleWithController:(id)a3
{
  id v3 = [a3 delegate];

  [v3 guidedPanZoomedOutViewScale];
  return result;
}

- (id)p_wellForTarget:(id)a3 wellRect:(CGRect)a4 blendDistance:(double)a5 prev:(BOOL)a6
{
  return sub_17CC1C(a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)guidedPanTargetAddWellsToArray:(id)a3 withController:(id)a4
{
  if (self->_targeted)
  {
    id v6 = [(THPageLayout *)self->_layout previousTargetFromLayout:self->_layout column:0];
    if (v6)
    {
      id v7 = v6;
      [v6 guidedPanTargetUnscaledRect];
      CGFloat x = v32.origin.x;
      CGFloat y = v32.origin.y;
      CGFloat width = v32.size.width;
      CGFloat height = v32.size.height;
      CGFloat MidX = CGRectGetMidX(v32);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v33);
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      v35.size.CGFloat height = CGRectGetHeight(v34);
      v35.size.CGFloat width = 0.0;
      v35.origin.CGFloat x = MidX;
      v35.origin.CGFloat y = MinY;
      CGRect v36 = CGRectInset(v35, -50.0, 0.0);
      double v14 = v36.origin.x;
      double v15 = v36.origin.y;
      double v16 = v36.size.width;
      double v17 = v36.size.height;
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      id v18 = -[THGuidedPanPageTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v7, 1, v14, v15, v16, v17, fmax(CGRectGetWidth(v36), 300.0));
      [v18 setIdentifier:@"prev"];
      [a3 addObject:v18];
    }
    id v19 = [(THPageLayout *)self->_layout firstChildTarget];
    if (v19
      || (id v19 = [(THPageLayout *)self->_layout nextTargetFromLayout:self->_layout column:0]) != 0)
    {
      [v19 guidedPanTargetUnscaledRect];
      CGFloat v20 = v37.origin.x;
      CGFloat v21 = v37.origin.y;
      CGFloat v22 = v37.size.width;
      CGFloat v23 = v37.size.height;
      CGFloat v24 = CGRectGetMidX(v37);
      v38.origin.CGFloat x = v20;
      v38.origin.CGFloat y = v21;
      v38.size.CGFloat width = v22;
      v38.size.CGFloat height = v23;
      CGFloat v25 = CGRectGetMinY(v38);
      v39.origin.CGFloat x = v20;
      v39.origin.CGFloat y = v21;
      v39.size.CGFloat width = v22;
      v39.size.CGFloat height = v23;
      v40.size.CGFloat height = CGRectGetHeight(v39);
      v40.size.CGFloat width = 0.0;
      v40.origin.CGFloat x = v24;
      v40.origin.CGFloat y = v25;
      CGRect v41 = CGRectInset(v40, -50.0, 0.0);
      double v26 = v41.origin.x;
      double v27 = v41.origin.y;
      double v28 = v41.size.width;
      double v29 = v41.size.height;
      v41.origin.CGFloat x = v20;
      v41.origin.CGFloat y = v21;
      v41.size.CGFloat width = v22;
      v41.size.CGFloat height = v23;
      id v30 = -[THGuidedPanPageTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v19, 0, v26, v27, v28, v29, fmax(CGRectGetWidth(v41), 300.0));
      [v30 setIdentifier:@"next"];
      [a3 addObject:v30];
    }
  }
}

- (int)guidedPanTargetKind
{
  return 0;
}

- (int64_t)guidedPanRelativePageIndexWithController:(id)a3
{
  return (int64_t)[a3 relativePageIndexForLayout:self->_layout];
}

+ (id)p_childPageLayoutAtCenterFromLayout:(id)a3 visibleUnscaledCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [a3 children];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  CGFloat v10 = 0;
  uint64_t v11 = *(void *)v20;
  double v12 = 1.79769313e308;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      id v15 = (id)TSUDynamicCast();
      if (!v15)
      {
        id v15 = [a1 p_childPageLayoutAtCenterFromLayout:v14 visibleUnscaledCenter:x, y];
        if (!v15) {
          continue;
        }
      }
      [v15 frameInRoot];
      double v16 = vabdd_f64(CGRectGetMidX(v24), x);
      if (v16 < v12 || v10 == 0)
      {
        CGFloat v10 = v15;
        double v12 = v16;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);
  return v10;
}

+ (id)guidedPanTargetForPageAtLocation:(id)a3 controller:(id)a4
{
  id v6 = [[[a4 interactiveCanvasController] layoutController] rootLayout];
  [a3 unscaledPoint];
  id result = [a1 p_childPageLayoutAtCenterFromLayout:v6];
  if (result)
  {
    id v8 = [[THGuidedPanPageTarget alloc] initWithLayout:result targeted:0];
    return v8;
  }
  return result;
}

- (id)guidedPanTargetUpdatedTargetForLocation:(id)a3 withController:(id)a4
{
  id v6 = objc_opt_class();
  id v7 = [[[[a4 interactiveCanvasController] layoutController] rootLayout];
  [a3 unscaledPoint];
  id result = [v6 p_childPageLayoutAtCenterFromLayout:v7];
  if (result)
  {
    id v9 = [objc_alloc((Class)objc_opt_class()) initWithLayout:result targeted:0];
    return v9;
  }
  return result;
}

- (BOOL)targeted
{
  return self->_targeted;
}

- (THPageLayout)layout
{
  return self->_layout;
}

- (CGRect)unscaledFrame
{
  double x = self->_unscaledFrame.origin.x;
  double y = self->_unscaledFrame.origin.y;
  double width = self->_unscaledFrame.size.width;
  double height = self->_unscaledFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end