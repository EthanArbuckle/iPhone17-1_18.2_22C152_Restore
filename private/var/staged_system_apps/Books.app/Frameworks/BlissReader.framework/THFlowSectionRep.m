@interface THFlowSectionRep
- (void)canvasDidScrollInFlowMode;
@end

@implementation THFlowSectionRep

- (void)canvasDidScrollInFlowMode
{
  if (!objc_msgSend(objc_msgSend(-[THFlowSectionRep layout](self, "layout"), "children"), "count"))
  {
    [self interactiveCanvasController].visibleUnscaledRectForContent;
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(THFlowSectionRep *)self frameInUnscaledCanvas];
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
    CGFloat rect = v20.origin.x;
    double MaxY = CGRectGetMaxY(v20);
    v21.origin.x = v4;
    v21.origin.CGFloat y = v6;
    v21.size.CGFloat width = v8;
    v21.size.CGFloat height = v10;
    if (MaxY > CGRectGetMinY(v21))
    {
      v22.origin.x = rect;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v22);
      v23.origin.x = v4;
      v23.origin.CGFloat y = v6;
      v23.size.CGFloat width = v8;
      v23.size.CGFloat height = v10;
      if (MinY < CGRectGetMaxY(v23))
      {
        id v16 = [(THFlowSectionRep *)self interactiveCanvasController];
        id v17 = [(THFlowSectionRep *)self layout];
        [v16 invalidateLayoutInBackground:v17];
      }
    }
  }
}

@end