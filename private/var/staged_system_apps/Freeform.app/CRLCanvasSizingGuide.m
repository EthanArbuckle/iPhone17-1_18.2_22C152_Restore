@interface CRLCanvasSizingGuide
- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3;
- (CRLCanvasSizingGuide)initWithType:(int64_t)a3 frame:(CGRect)a4;
- (id)description;
- (id)renderableWithICC:(id)a3;
@end

@implementation CRLCanvasSizingGuide

- (CRLCanvasSizingGuide)initWithType:(int64_t)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLCanvasSizingGuide;
  v9 = [(CRLCanvasAbstractGuide *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->mAlignmentFrame.origin.CGFloat x = x;
    v9->mAlignmentFrame.origin.CGFloat y = y;
    v9->mAlignmentFrame.size.double width = width;
    v9->mAlignmentFrame.size.double height = height;
    v9->mIsHorizontal = a3 == 0;
    if (a3) {
      double v11 = height;
    }
    else {
      double v11 = width;
    }
    [(CRLCanvasAbstractGuide *)v9 setOffset:v11];
  }
  return v10;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  return sub_10006525C(self->mAlignmentFrame.origin.x, self->mAlignmentFrame.origin.y, self->mAlignmentFrame.size.width, self->mAlignmentFrame.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)renderableWithICC:(id)a3
{
  id v4 = a3;
  v5 = +[CRLCanvasRenderable renderable];
  id v6 = -[CRLCanvasSizingGuideUILayer initForRect:withICC:showWidth:showHeight:]([CRLCanvasSizingGuideUILayer alloc], "initForRect:withICC:showWidth:showHeight:", v4, self->mAlignmentFrame.origin.x, self->mAlignmentFrame.origin.y, self->mAlignmentFrame.size.width, self->mAlignmentFrame.size.height);
  v7 = +[CRLCanvasRenderable renderableFromLayer:v6];
  [v5 addSubrenderable:v7];

  v8 = [CRLCanvasSizingGuideUILayer alloc];
  [(CRLCanvasAbstractGuide *)self snappingObjectFrame];
  id v9 = -[CRLCanvasSizingGuideUILayer initForRect:withICC:showWidth:showHeight:](v8, "initForRect:withICC:showWidth:showHeight:", v4);

  v10 = +[CRLCanvasRenderable renderableFromLayer:v9];
  [v5 addSubrenderable:v10];

  return v5;
}

- (id)description
{
  if (self->mIsHorizontal) {
    CFStringRef v2 = @"Horizontal";
  }
  else {
    CFStringRef v2 = @"Vertical";
  }
  return +[NSString stringWithFormat:@"<CRLCanvasSizingGuide %p: %@ sizing guide with offset %f>", self, v2, *(void *)&self->super.mOffset];
}

- (void).cxx_destruct
{
}

@end