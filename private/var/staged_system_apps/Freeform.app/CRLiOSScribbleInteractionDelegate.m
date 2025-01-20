@interface CRLiOSScribbleInteractionDelegate
- (BOOL)_indirectScribbleInteractionShouldDisableInputAssistant:(id)a3;
- (BOOL)_scribbleInteractionShouldDisableInputAssistant:(id)a3;
- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4;
- (BOOL)indirectScribbleInteraction:(id)a3 shouldDelayFocusForElement:(id)a4;
- (BOOL)p_isElementFocused:(id)a3;
- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4;
- (CGRect)p_expandedScribbleFrameForElement:(id)a3;
- (CRLiOSScribbleInteractionDelegate)initWithEditingProvider:(id)a3 scribbleInteractionObserver:(id)a4;
- (CRLiOSScribbleInteractionEditingProvider)editingProvider;
- (CRLiOSScribbleInteractionObserver)scribbleObserver;
- (NSUUID)rootIdentifier;
- (id)p_absoluteScribbleCapableElementWithIdentifier:(id)a3;
- (id)p_containedScribbleElementForContainerScribbleElement:(id)a3;
- (id)p_currentEditingTextInputResponderForElementIdentifer:(id)a3;
- (id)p_insertedScribbleElementProvider;
- (id)p_scribbleCapableElementsForRect:(CGRect)a3;
- (id)p_scribbleElementIdentifiersInRect:(CGRect)a3;
- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6;
- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)setEditingProvider:(id)a3;
- (void)setRootIdentifier:(id)a3;
- (void)setScribbleObserver:(id)a3;
@end

@implementation CRLiOSScribbleInteractionDelegate

- (CRLiOSScribbleInteractionDelegate)initWithEditingProvider:(id)a3 scribbleInteractionObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLiOSScribbleInteractionDelegate;
  v8 = [(CRLiOSScribbleInteractionDelegate *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_editingProvider, v6);
    uint64_t v10 = +[NSUUID UUID];
    rootIdentifier = v9->_rootIdentifier;
    v9->_rootIdentifier = (NSUUID *)v10;

    objc_storeWeak((id *)&v9->_scribbleObserver, v7);
  }

  return v9;
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, void *))a6;
  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCCB8);
  }
  v15 = &OBJC_PROTOCOL___CRLScrollViewDelegate;
  v16 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG))
  {
    v37 = v16;
    v38 = NSStringFromSelector(a2);
    v47.double x = x;
    v47.double y = y;
    v39 = NSStringFromCGPoint(v47);
    *(_DWORD *)buf = 138543874;
    v42 = v38;
    __int16 v43 = 2114;
    id v44 = v13;
    __int16 v45 = 2114;
    v46 = v39;
    _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@, focusReferencePoint: %{public}@", buf, 0x20u);
  }
  v17 = (objc_class *)objc_opt_class();
  v18 = sub_10024715C(v17, v13);
  v19 = [(CRLiOSScribbleInteractionDelegate *)self p_absoluteScribbleCapableElementWithIdentifier:v18];
  v20 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];

  if (v18 != v20)
  {
    if (v19) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  v21 = [(CRLiOSScribbleInteractionDelegate *)self p_insertedScribbleElementProvider];
  if (objc_msgSend(v21, "canInsertScribbleElementAtPoint:", x, y))
  {
    v22 = [v21 insertedScribbleElementAtPoint:x, y];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;

      v19 = v24;
      v15 = &OBJC_PROTOCOL___CRLScrollViewDelegate;
    }
  }
  if (!v19)
  {
LABEL_13:
    LODWORD(v40) = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FCCD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7B70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FCCF8);
    }
    v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v25);
    }
    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSScribbleInteractionDelegate indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:]");
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 67, 0, "invalid nil value for '%{public}s'", "scribbleElement", v40);

    v15 = &OBJC_PROTOCOL___CRLScrollViewDelegate;
  }
LABEL_22:
  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCD18);
  }
  prots = v15[28].prots;
  if (os_log_type_enabled(prots, OS_LOG_TYPE_DEBUG)) {
    sub_1010B7AF8((uint64_t)v19, prots);
  }
  if (([v19 scribbleElementIsFocused] & 1) == 0)
  {
    v29 = [v19 scribbleEditingBlock];

    if (v29)
    {
      v30 = [v19 scribbleEditingBlock];
      v30[2](v30, 0, x, y);
    }
  }
  v31 = [v19 scribbleIdentifier];
  v32 = [(CRLiOSScribbleInteractionDelegate *)self p_currentEditingTextInputResponderForElementIdentifer:v31];

  if (v32)
  {
    v33 = [v19 prepareForScribbleBlock];

    if (!v33) {
      goto LABEL_42;
    }
    v34 = [v19 prepareForScribbleBlock];
    v34[2](x, y);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FCD38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7A48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FCD58);
    }
    v35 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v35);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSScribbleInteractionDelegate indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:]");
    v34 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
    v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionDelegate.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v36, 78, 0, "invalid nil value for '%{public}s'", "inputResponder");
  }
LABEL_42:
  if (v14) {
    v14[2](v14, v32);
  }
}

- (BOOL)indirectScribbleInteraction:(id)a3 shouldDelayFocusForElement:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];

  if (v7 == v6)
  {
    unsigned int v10 = 1;
  }
  else
  {
    v8 = [(CRLiOSScribbleInteractionDelegate *)self p_absoluteScribbleCapableElementWithIdentifier:v6];
    v9 = v8;
    if (v8) {
      unsigned int v10 = [v8 shouldDelayScribbleFocus];
    }
    else {
      unsigned int v10 = 0;
    }
  }
  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCD78);
  }
  v11 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG))
  {
    id v13 = v11;
    v14 = NSStringFromSelector(a2);
    v15 = @"NO";
    if (v10) {
      v15 = @"YES";
    }
    v16 = v15;
    int v17 = 138543874;
    v18 = v14;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    v22 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v17, 0x20u);
  }
  return v10;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleObserver);
  [WeakRetained willBeginScribbleWithDelegate:self];

  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCD98);
  }
  id v7 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG)) {
    sub_1010B7C20(v7);
  }
  v8 = [(CRLiOSScribbleInteractionDelegate *)self p_absoluteScribbleCapableElementWithIdentifier:v5];
  v9 = v8;
  if (v8)
  {
    unsigned int v10 = [v8 willBeginWritingBlock];

    if (v10)
    {
      v11 = [v9 willBeginWritingBlock];
      v11[2]();
    }
  }
  id v12 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  id v13 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];
  [v12 scribbleInteractionWillBeginWritingScribbleElementWillBeInserted:v13 == v5];
}

- (BOOL)p_isElementFocused:(id)a3
{
  v4 = [(CRLiOSScribbleInteractionDelegate *)self p_absoluteScribbleCapableElementWithIdentifier:a3];
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 scribbleElementIsFocused];
    id v7 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
    v8 = [v7 currentEditingTextInputResponder];

    if (v6 && !v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FCDB8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B7CBC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FCDD8);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      unsigned int v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSScribbleInteractionDelegate p_isElementFocused:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionDelegate.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:125 isFatal:0 description:"Element says it is focused but we have no editing TIR"];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CRLiOSScribbleInteractionDelegate *)self p_isElementFocused:v6];
  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCDF8);
  }
  v8 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v10 = v8;
    v11 = NSStringFromSelector(a2);
    id v12 = @"NO";
    if (v7) {
      id v12 = @"YES";
    }
    id v13 = v12;
    int v14 = 138543874;
    v15 = v11;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    __int16 v19 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v14, 0x20u);
  }
  return v7;
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (objc_class *)objc_opt_class();
  unsigned int v10 = sub_10024715C(v9, v8);
  v11 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];

  if (v10 == v11)
  {
    id v17 = [v7 view];
    [v17 bounds];
    CGFloat x = v18;
    CGFloat y = v20;
    CGFloat width = v22;
    CGFloat height = v24;

    v26 = [(CRLiOSScribbleInteractionDelegate *)self p_insertedScribbleElementProvider];
    id v12 = v26;
    if (!v26) {
      goto LABEL_8;
    }
    [v26 rectForInsertingScribbleElements];
    goto LABEL_6;
  }
  id v12 = [(CRLiOSScribbleInteractionDelegate *)self p_absoluteScribbleCapableElementWithIdentifier:v8];
  if (v12)
  {
    [(CRLiOSScribbleInteractionDelegate *)self p_expandedScribbleFrameForElement:v12];
LABEL_6:
    CGFloat x = v13;
    CGFloat y = v14;
    CGFloat width = v15;
    CGFloat height = v16;
    goto LABEL_8;
  }
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
LABEL_8:

  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCE18);
  }
  v27 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG))
  {
    v32 = v27;
    v33 = NSStringFromSelector(a2);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    v34 = NSStringFromCGRect(v41);
    int v35 = 138543874;
    v36 = v33;
    __int16 v37 = 2114;
    id v38 = v8;
    __int16 v39 = 2114;
    uint64_t v40 = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v35, 0x20u);
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  double v13 = (void (**)(id, void *))a5;
  if (width < 300.0 || height < 300.0)
  {
    if (qword_101719D18 != -1) {
      dispatch_once(&qword_101719D18, &stru_1014FCE38);
    }
    double v14 = off_10166E7F0;
    if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG)) {
      sub_1010B7D5C(v14, a2, x, y, width, height);
    }
    double v15 = sub_100065738(x, y, width, height);
    double v17 = v16;
    double v18 = sub_100064F14(width, height, 300.0);
    double x = sub_10006402C(v15, v17, v18);
    CGFloat y = v19;
    double width = v20;
    double height = v21;
  }
  double v22 = -[CRLiOSScribbleInteractionDelegate p_scribbleElementIdentifiersInRect:](self, "p_scribbleElementIdentifiersInRect:", x, y, width, height);
  v13[2](v13, v22);
  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCE58);
  }
  v23 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG))
  {
    double v24 = v23;
    v25 = NSStringFromSelector(a2);
    v33.origin.double x = x;
    v33.origin.CGFloat y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    v26 = NSStringFromCGRect(v33);
    int v27 = 138543874;
    double v28 = v25;
    __int16 v29 = 2114;
    double v30 = v26;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v27, 0x20u);
  }
}

- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleObserver);
  [WeakRetained didFinishScribbleWithDelegate:self];

  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCE78);
  }
  id v7 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG)) {
    sub_1010B7C20(v7);
  }
  id v8 = (objc_class *)objc_opt_class();
  v9 = sub_10024715C(v8, v5);
  unsigned int v10 = [(CRLiOSScribbleInteractionDelegate *)self p_absoluteScribbleCapableElementWithIdentifier:v9];
  v11 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];

  if (v9 == v11 || v10)
  {
    id v12 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
    [v12 scribbleInteractionDidFinishWriting];
  }
}

- (BOOL)_indirectScribbleInteractionShouldDisableInputAssistant:(id)a3
{
  v3 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  char v4 = [v3 wantsSystemInputAssistantForScribble] ^ 1;

  return v4;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  unsigned int v8 = [v7 shouldBeginScribblingAtPoint:x, y];

  if (qword_101719D18 != -1) {
    dispatch_once(&qword_101719D18, &stru_1014FCE98);
  }
  v9 = off_10166E7F0;
  if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG))
  {
    v11 = v9;
    id v12 = NSStringFromSelector(a2);
    v22.double x = x;
    v22.double y = y;
    double v13 = NSStringFromCGPoint(v22);
    double v14 = @"NO";
    if (v8) {
      double v14 = @"YES";
    }
    double v15 = v14;
    int v16 = 138543874;
    double v17 = v12;
    __int16 v18 = 2114;
    double v19 = v13;
    __int16 v20 = 2114;
    double v21 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v16, 0x20u);
  }
  return v8;
}

- (BOOL)_scribbleInteractionShouldDisableInputAssistant:(id)a3
{
  v3 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  char v4 = [v3 wantsSystemInputAssistantForScribble] ^ 1;

  return v4;
}

- (id)p_currentEditingTextInputResponderForElementIdentifer:(id)a3
{
  if ([(CRLiOSScribbleInteractionDelegate *)self p_isElementFocused:a3])
  {
    char v4 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
    id v5 = [v4 currentEditingTextInputResponder];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)p_insertedScribbleElementProvider
{
  v2 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLiOSScribbleInteractionInsertedScribbleElementProvider);

  return v9;
}

- (id)p_containedScribbleElementForContainerScribbleElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
    uint64_t v8 = [v7 containedScribbleElementForContainerScribbleElement:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)p_absoluteScribbleCapableElementWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  char v6 = sub_10024715C(v5, v4);

  uint64_t v7 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];

  if (v6 == v7 || v6 == 0)
  {
    unsigned int v10 = 0;
  }
  else
  {
    v9 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
    unsigned int v10 = [v9 scribbleCapableElementWithIdentifier:v6];

    if (v10)
    {
      v11 = [(CRLiOSScribbleInteractionDelegate *)self p_containedScribbleElementForContainerScribbleElement:v10];
      id v12 = v11;
      if (v11)
      {
        id v13 = v11;

        unsigned int v10 = v13;
      }
    }
  }

  return v10;
}

- (id)p_scribbleCapableElementsForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(CRLiOSScribbleInteractionDelegate *)self editingProvider];
  uint64_t v8 = [v7 scribbleCapableElementsForRect:x, y, width, height];

  return v8;
}

- (CGRect)p_expandedScribbleFrameForElement:(id)a3
{
  id v4 = a3;
  [v4 scaledScribbleEditingFrame];
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  [v4 hitToleranceInsetsWithDefaultInsets:-60.0, -60.0, -60.0, -60.0];
  double v76 = v16;
  double v77 = v13;
  double v17 = v15;
  if (v14 == 0.0)
  {
    double v27 = v13;
  }
  else
  {
    double v18 = v14;
    double v75 = v15;
    v98.origin.double x = v6;
    v98.origin.double y = v8;
    v98.size.double width = v10;
    v98.size.double height = v12;
    double MinX = CGRectGetMinX(v98);
    v99.origin.double x = v6;
    v99.origin.double y = v8;
    v99.size.double width = v10;
    v99.size.double height = v12;
    CGFloat v20 = CGRectGetMaxY(v99) + 0.001;
    double v21 = -v18;
    v100.origin.double x = MinX;
    v100.origin.double y = v20;
    v100.size.double width = v10;
    v100.size.double height = -v18;
    double MaxY = CGRectGetMaxY(v100);
    v23 = -[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", MinX, v20, v10, v21);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v24 = [v23 countByEnumeratingWithState:&v90 objects:v97 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v91;
      double v27 = v77;
      double v17 = v75;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v91 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * i) scaledScribbleEditingFrame];
          double MinY = CGRectGetMinY(v101);
          if (MinY < MaxY) {
            double MaxY = MinY;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v90 objects:v97 count:16];
      }
      while (v25);
    }
    else
    {
      double v27 = v77;
      double v17 = v75;
    }
    v102.origin.double x = v6;
    v102.origin.double y = v8;
    v102.size.double width = v10;
    v102.size.double height = v12;
    if (MaxY > CGRectGetMaxY(v102))
    {
      double v6 = sub_100065928(v6, v8, v10, v12, v6);
      CGFloat v8 = v30;
      double v10 = v31;
      CGFloat v12 = v32;
    }
  }
  if (v17 != 0.0)
  {
    v103.origin.double x = v6;
    v103.origin.double y = v8;
    v103.size.double width = v10;
    v103.size.double height = v12;
    CGFloat v33 = CGRectGetMaxX(v103) + 0.001;
    v104.origin.double x = v6;
    v104.origin.double y = v8;
    v104.size.double width = v10;
    v104.size.double height = v12;
    double v34 = CGRectGetMinY(v104);
    double v35 = -v17;
    v105.origin.double x = v33;
    v105.origin.double y = v34;
    v105.size.double width = -v17;
    v105.size.double height = v12;
    double MaxX = CGRectGetMaxX(v105);
    __int16 v37 = -[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", v33, v34, v35, v12);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v38 = [v37 countByEnumeratingWithState:&v86 objects:v96 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v87;
      double v27 = v77;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v87 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v86 + 1) + 8 * (void)j) scaledScribbleEditingFrame];
          double v42 = CGRectGetMinX(v106);
          if (v42 < MaxX) {
            double MaxX = v42;
          }
        }
        id v39 = [v37 countByEnumeratingWithState:&v86 objects:v96 count:16];
      }
      while (v39);
    }
    else
    {
      double v27 = v77;
    }
    v107.origin.double x = v6;
    v107.origin.double y = v8;
    v107.size.double width = v10;
    v107.size.double height = v12;
    if (MaxX > CGRectGetMaxX(v107))
    {
      double v6 = sub_100065928(v6, v8, v10, v12, MaxX);
      CGFloat v8 = v43;
      double v10 = v44;
      CGFloat v12 = v45;
    }
  }
  if (v27 != 0.0)
  {
    v108.origin.double x = v6;
    v108.origin.double y = v8;
    v108.size.double width = v10;
    v108.size.double height = v12;
    double v46 = CGRectGetMinX(v108);
    v109.origin.double x = v6;
    v109.origin.double y = v8;
    v109.size.double width = v10;
    v109.size.double height = v12;
    CGFloat v47 = v27 + CGRectGetMinY(v109) + -0.001;
    double v48 = -v27;
    v110.origin.double x = v46;
    v110.origin.double y = v47;
    v110.size.double width = v10;
    v110.size.double height = -v27;
    double v49 = CGRectGetMinY(v110);
    v50 = -[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", v46, v47, v10, v48);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v51 = [v50 countByEnumeratingWithState:&v82 objects:v95 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v83;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v83 != v53) {
            objc_enumerationMutation(v50);
          }
          [*(id *)(*((void *)&v82 + 1) + 8 * (void)k) scaledScribbleEditingFrame];
          double v55 = CGRectGetMaxY(v111);
          if (v55 > v49) {
            double v49 = v55;
          }
        }
        id v52 = [v50 countByEnumeratingWithState:&v82 objects:v95 count:16];
      }
      while (v52);
    }
    v112.origin.double x = v6;
    v112.origin.double y = v8;
    v112.size.double width = v10;
    v112.size.double height = v12;
    if (v49 < CGRectGetMinY(v112))
    {
      double v6 = sub_100065928(v6, v8, v10, v12, v6);
      CGFloat v8 = v56;
      double v10 = v57;
      CGFloat v12 = v58;
    }
  }
  if (v76 != 0.0)
  {
    v113.origin.double x = v6;
    v113.origin.double y = v8;
    v113.size.double width = v10;
    v113.size.double height = v12;
    CGFloat v59 = v76 + CGRectGetMinX(v113) + -0.001;
    v114.origin.double x = v6;
    v114.origin.double y = v8;
    v114.size.double width = v10;
    v114.size.double height = v12;
    double v60 = CGRectGetMinY(v114);
    v115.origin.double x = v59;
    v115.origin.double y = v60;
    v115.size.double width = -v76;
    v115.size.double height = v12;
    double v61 = CGRectGetMinX(v115);
    v62 = -[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", v59, v60, -v76, v12);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v63 = [v62 countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v79;
      do
      {
        for (m = 0; m != v64; m = (char *)m + 1)
        {
          if (*(void *)v79 != v65) {
            objc_enumerationMutation(v62);
          }
          [*(id *)(*((void *)&v78 + 1) + 8 * (void)m) scaledScribbleEditingFrame];
          double v67 = CGRectGetMaxX(v116);
          if (v67 > v61) {
            double v61 = v67;
          }
        }
        id v64 = [v62 countByEnumeratingWithState:&v78 objects:v94 count:16];
      }
      while (v64);
    }
    v117.origin.double x = v6;
    v117.origin.double y = v8;
    v117.size.double width = v10;
    v117.size.double height = v12;
    if (v61 < CGRectGetMinX(v117))
    {
      double v6 = sub_100065928(v6, v8, v10, v12, v61);
      CGFloat v8 = v68;
      double v10 = v69;
      CGFloat v12 = v70;
    }
  }
  double v71 = v6;
  double v72 = v8;
  double v73 = v10;
  double v74 = v12;
  result.size.double height = v74;
  result.size.double width = v73;
  result.origin.double y = v72;
  result.origin.double x = v71;
  return result;
}

- (id)p_scribbleElementIdentifiersInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  double v10 = -[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", x, y, width, height);
  double v11 = [(CRLiOSScribbleInteractionDelegate *)self p_insertedScribbleElementProvider];
  if (v11 && objc_msgSend(v11, "canInsertScribbleElementAtPoint:", sub_100065738(x, y, width, height)))
  {
    CGFloat v12 = [(CRLiOSScribbleInteractionDelegate *)self rootIdentifier];
    [v9 addObject:v12];

    if (qword_101719D18 != -1) {
      dispatch_once(&qword_101719D18, &stru_1014FCEB8);
    }
    double v13 = off_10166E7F0;
    if (os_log_type_enabled((os_log_t)off_10166E7F0, OS_LOG_TYPE_DEBUG)) {
      sub_1010B7E58(v13, (uint64_t)a2, self);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = [*(id *)(*((void *)&v21 + 1) + 8 * i) scribbleIdentifier:v21];
        [v9 crl_addNonNilObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v9;
}

- (CRLiOSScribbleInteractionEditingProvider)editingProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingProvider);

  return (CRLiOSScribbleInteractionEditingProvider *)WeakRetained;
}

- (void)setEditingProvider:(id)a3
{
}

- (NSUUID)rootIdentifier
{
  return self->_rootIdentifier;
}

- (void)setRootIdentifier:(id)a3
{
}

- (CRLiOSScribbleInteractionObserver)scribbleObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleObserver);

  return (CRLiOSScribbleInteractionObserver *)WeakRetained;
}

- (void)setScribbleObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scribbleObserver);
  objc_storeStrong((id *)&self->_rootIdentifier, 0);

  objc_destroyWeak((id *)&self->_editingProvider);
}

@end