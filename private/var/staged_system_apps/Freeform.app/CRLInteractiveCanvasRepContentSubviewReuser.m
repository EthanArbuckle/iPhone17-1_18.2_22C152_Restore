@interface CRLInteractiveCanvasRepContentSubviewReuser
- (BOOL)canReuseForRepContentLayersDuringBackgroundUpdate;
- (BOOL)canReuseUnmodifiedForRepContentPile:(id)a3;
- (CRLInteractiveCanvasRepContentSubviewReuser)initWithSubview:(id)a3 originalRepContentPile:(id)a4;
- (void)removeRepContentPlatformViews;
- (void)reuseForRepContentLayers:(id)a3;
@end

@implementation CRLInteractiveCanvasRepContentSubviewReuser

- (CRLInteractiveCanvasRepContentSubviewReuser)initWithSubview:(id)a3 originalRepContentPile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLInteractiveCanvasRepContentSubviewReuser;
  v8 = [(CRLInteractiveCanvasRepContentSubviewReuser *)&v16 init];
  if (v8)
  {
    if ([v7 conformsToProtocol:&OBJC_PROTOCOL___CRLInteractiveCanvasRepLayerPile])
    {
      uint64_t v9 = [v6 layer];
      reusableSubviewLayer = v8->_reusableSubviewLayer;
      v8->_reusableSubviewLayer = (CALayer *)v9;
    }
    else if ([v7 conformsToProtocol:&OBJC_PROTOCOL___CRLInteractiveCanvasRepContentPlatformViewPile])
    {
      objc_storeStrong((id *)&v8->_originalRepContentPile, a4);
      reusableSubviewLayer = [v6 subviews];
      v11 = (NSArray *)[reusableSubviewLayer copy];
      repContentPlatformViews = v8->_repContentPlatformViews;
      v8->_repContentPlatformViews = v11;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3AD0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108DEAC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3AF0);
      }
      v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      reusableSubviewLayer = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewReuser initWithSubview:originalRepContentPile:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
      +[CRLAssertionHandler handleFailureInFunction:reusableSubviewLayer, v14, 435, 0, "Rep content pile did not implement either CRLInteractiveCanvasRepLayerPile or CRLInteractiveCanvasRepContentPlatformViewPile: %@", v7 file lineNumber isFatal description];
    }
  }

  return v8;
}

- (BOOL)canReuseForRepContentLayersDuringBackgroundUpdate
{
  return self->_reusableSubviewLayer != 0;
}

- (void)reuseForRepContentLayers:(id)a3
{
  id v4 = a3;
  if (![(CRLInteractiveCanvasRepContentSubviewReuser *)self canReuseForRepContentLayersDuringBackgroundUpdate])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3B10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DF40();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3B30);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewReuser reuseForRepContentLayers:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:449 isFatal:0 description:"Reusing the subview for rep content layers must be allowed."];
  }
  v8 = [(CALayer *)self->_reusableSubviewLayer sublayers];
  unsigned __int8 v9 = [v4 isEqualToArray:v8];

  if ((v9 & 1) == 0) {
    [(CALayer *)self->_reusableSubviewLayer setSublayers:v4];
  }
}

- (BOOL)canReuseUnmodifiedForRepContentPile:(id)a3
{
  originalRepContentPile = self->_originalRepContentPile;
  if (originalRepContentPile) {
    LOBYTE(originalRepContentPile) = [(CRLInteractiveCanvasRepContentPile *)originalRepContentPile isContentEqualToContentOfRepContentPile:a3];
  }
  return (char)originalRepContentPile;
}

- (void)removeRepContentPlatformViews
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3B50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DFC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3B70);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewReuser removeRepContentPlatformViews]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:464 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_repContentPlatformViews;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) removeFromSuperview];
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repContentPlatformViews, 0);
  objc_storeStrong((id *)&self->_originalRepContentPile, 0);

  objc_storeStrong((id *)&self->_reusableSubviewLayer, 0);
}

@end