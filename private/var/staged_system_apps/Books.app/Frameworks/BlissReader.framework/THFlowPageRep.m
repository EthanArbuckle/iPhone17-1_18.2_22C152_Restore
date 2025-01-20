@interface THFlowPageRep
- (BOOL)drawsPageBackground;
- (id)p_desiredVisibleLayoutsForRect:(CGRect)a3;
- (int)marginNoteSideForPageRelativeRect:(CGRect)a3;
- (void)canvasDidScrollInFlowMode;
- (void)updateChildrenFromLayout;
@end

@implementation THFlowPageRep

- (void)canvasDidScrollInFlowMode
{
  if (objc_msgSend(-[THFlowPageRep layout](self, "layout"), "parent"))
  {
    if (objc_msgSend(-[THFlowPageRep layout](self, "layout"), "layoutController"))
    {
      id v3 = [(-[THFlowPageRep childReps](self, "childReps")) arrayPiecewiseTransformedBy:&stru_459B50];
      [self interactiveCanvasController].visibleUnscaledRectForContent;
      if ([[[self p_desiredVisibleLayoutsForRect:] isEqualToArray:v3] & 1] == 0)[[self interactiveCanvasController] invalidateRepsInBackground]; {
    }
      }
    id v4 = [(THFlowPageRep *)self layout];
    [v4 canvasDidScroll];
  }
}

- (void)updateChildrenFromLayout
{
  [self interactiveCanvasController].visibleUnscaledRectForContent;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11EFE8;
  v4[3] = &unk_459B78;
  v4[4] = self;
  -[THPageRep setChildReps:[self p_desiredVisibleLayoutsForRect:] arrayPiecewiseTransformedBy:v4];
  [self childReps makeObjectsPerformSelector:a2];
}

- (id)p_desiredVisibleLayoutsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [self layout].children;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v14 frameInRoot];
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        if (CGRectIntersectsRect(v21, v22)) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  return v8;
}

- (BOOL)drawsPageBackground
{
  return 0;
}

- (int)marginNoteSideForPageRelativeRect:(CGRect)a3
{
  return [self layout:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height].isMaxXEdgeObscured ^ 1;
}

@end