@interface CRLInteractiveCanvasRepContentPlatformViewPile
- (BOOL)isContentEqualToContentOfRepContentPile:(id)a3;
- (CGRect)contentPlatformViewFrame;
- (CGRect)contentPlatformViewMaskRect;
- (CRLInteractiveCanvasRepContentPlatformViewPile)initWithRep:(id)a3;
- (CRLInteractiveCanvasRepContentPlatformViewPile)initWithRep:(id)a3 kind:(unint64_t)a4;
- (CRLPlatformView)contentPlatformView;
- (NSString)description;
@end

@implementation CRLInteractiveCanvasRepContentPlatformViewPile

- (CRLInteractiveCanvasRepContentPlatformViewPile)initWithRep:(id)a3 kind:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLInteractiveCanvasRepContentPlatformViewPile;
  v8 = [(CRLInteractiveCanvasRepContentPlatformViewPile *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_rep, a3);
    v9->_kind = a4;
  }

  return v9;
}

- (CRLInteractiveCanvasRepContentPlatformViewPile)initWithRep:(id)a3
{
  return [(CRLInteractiveCanvasRepContentPlatformViewPile *)self initWithRep:a3 kind:1];
}

- (NSString)description
{
  unint64_t kind = self->_kind;
  if (kind > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_1014F80B8 + kind);
  }
  return +[NSString stringWithFormat:@"<%@ %p rep=%@ kind=%@>", objc_opt_class(), self, self->_rep, v3];
}

- (BOOL)isContentEqualToContentOfRepContentPile:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = sub_1002469D0(v5, v4);

  BOOL v7 = v6 && self->_rep == *(CRLCanvasRep **)(v6 + 8) && self->_kind == *(void *)(v6 + 16);
  return v7;
}

- (CRLPlatformView)contentPlatformView
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8078);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B0254();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8098);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentPlatformViewPile contentPlatformView]");
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentPile.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:275 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  unint64_t kind = self->_kind;
  if (kind == 2)
  {
    BOOL v7 = [(CRLCanvasRep *)self->_rep additionalPlatformViewOverRenderable];
  }
  else if (kind == 1)
  {
    BOOL v7 = [(CRLCanvasRep *)self->_rep contentPlatformView];
  }
  else if (kind)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(CRLCanvasRep *)self->_rep additionalPlatformViewUnderRenderable];
  }

  return (CRLPlatformView *)v7;
}

- (CGRect)contentPlatformViewFrame
{
  [(CRLCanvasRep *)self->_rep layerFrameInScaledCanvas];

  return CGRectIntegral(*(CGRect *)&v2);
}

- (CGRect)contentPlatformViewMaskRect
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  uint64_t v6 = [(CRLCanvasRep *)self->_rep parentRep];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    do
    {
      if ([v7 masksToBounds])
      {
        [v7 layerFrameInScaledCanvas];
        CGFloat v8 = v21.origin.x;
        CGFloat v9 = v21.origin.y;
        CGFloat v10 = v21.size.width;
        CGFloat v11 = v21.size.height;
        CGRect v22 = CGRectIntegral(v21);
        CGFloat v19 = v22.origin.y;
        CGFloat v20 = v22.origin.x;
        CGFloat v17 = v22.size.height;
        CGFloat v18 = v22.size.width;
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        if (CGRectIsNull(v22))
        {
          CGFloat height = v11;
          CGFloat width = v10;
          CGFloat y = v9;
          CGFloat x = v8;
        }
        else
        {
          v23.origin.CGFloat x = x;
          v23.origin.CGFloat y = y;
          v23.size.CGFloat width = width;
          v23.size.CGFloat height = height;
          v26.origin.CGFloat y = v19;
          v26.origin.CGFloat x = v20;
          v26.size.CGFloat height = v17;
          v26.size.CGFloat width = v18;
          CGRect v24 = CGRectIntersection(v23, v26);
          CGFloat x = v24.origin.x;
          CGFloat y = v24.origin.y;
          CGFloat width = v24.size.width;
          CGFloat height = v24.size.height;
        }
      }
      uint64_t v12 = [v7 parentRep:v17, v18, v19, v20];

      BOOL v7 = (void *)v12;
    }
    while (v12);
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void).cxx_destruct
{
}

@end