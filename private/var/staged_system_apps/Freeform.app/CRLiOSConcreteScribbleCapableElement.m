@interface CRLiOSConcreteScribbleCapableElement
- (BOOL)scribbleElementIsFocused;
- (BOOL)shouldDelayScribbleFocus;
- (CGRect)scaledScribbleEditingFrame;
- (CRLiOSConcreteScribbleCapableElement)initWithEditingFrame:(CGRect)a3 identifier:(id)a4 scribbleEditingBlock:(id)a5 scribbleElementIsFocusedBlock:(id)a6 shouldDelayFocus:(BOOL)a7 hitToleranceInsetsWithDefaultInsetsBlock:(id)a8;
- (NSUUID)scribbleIdentifier;
- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3;
- (id)hitToleranceInsetsWithDefaultInsetsBlock;
- (id)prepareForScribbleBlock;
- (id)scribbleEditingBlock;
- (id)scribbleElementIsFocusedBlock;
- (id)willBeginWritingBlock;
- (void)setHitToleranceInsetsWithDefaultInsetsBlock:(id)a3;
- (void)setScribbleElementIsFocusedBlock:(id)a3;
- (void)setScribbleIdentifier:(id)a3;
@end

@implementation CRLiOSConcreteScribbleCapableElement

- (CRLiOSConcreteScribbleCapableElement)initWithEditingFrame:(CGRect)a3 identifier:(id)a4 scribbleEditingBlock:(id)a5 scribbleElementIsFocusedBlock:(id)a6 shouldDelayFocus:(BOOL)a7 hitToleranceInsetsWithDefaultInsetsBlock:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  v36.receiver = self;
  v36.super_class = (Class)CRLiOSConcreteScribbleCapableElement;
  v21 = [(CRLiOSConcreteScribbleCapableElement *)&v36 init];
  if (v21)
  {
    if (sub_100064EF4(width, height))
    {
      int v35 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6348);
      }
      v22 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101079C40(v35, v22);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6368);
      }
      v23 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v23, v35);
      }
      v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSConcreteScribbleCapableElement initWithEditingFrame:identifier:scribbleEditingBlock:scribbleElementIsFocusedBlock:shouldDelayFocus:hitToleranceInsetsWithDefaultInsetsBlock:]");
      v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSConcreteScribbleCapableElement.m"];
      +[CRLAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:37 isFatal:0 description:"Got empty editing frame"];
    }
    id v26 = objc_retainBlock(v18);
    id scribbleEditingBlock = v21->_scribbleEditingBlock;
    v21->_id scribbleEditingBlock = v26;

    v21->_scaledScribbleEditingFrame.origin.CGFloat x = x;
    v21->_scaledScribbleEditingFrame.origin.CGFloat y = y;
    v21->_scaledScribbleEditingFrame.size.double width = width;
    v21->_scaledScribbleEditingFrame.size.double height = height;
    if (v17)
    {
      v28 = (NSUUID *)v17;
    }
    else
    {
      v28 = +[NSUUID UUID];
    }
    scribbleIdentifier = v21->_scribbleIdentifier;
    v21->_scribbleIdentifier = v28;

    v21->_shouldDelayScribbleFocus = a7;
    id v30 = objc_retainBlock(v19);
    id scribbleElementIsFocusedBlock = v21->_scribbleElementIsFocusedBlock;
    v21->_id scribbleElementIsFocusedBlock = v30;

    id v32 = objc_retainBlock(v20);
    id hitToleranceInsetsWithDefaultInsetsBlock = v21->_hitToleranceInsetsWithDefaultInsetsBlock;
    v21->_id hitToleranceInsetsWithDefaultInsetsBlock = v32;
  }
  return v21;
}

- (BOOL)scribbleElementIsFocused
{
  v3 = [(CRLiOSConcreteScribbleCapableElement *)self scribbleElementIsFocusedBlock];

  if (!v3) {
    return 0;
  }
  v4 = [(CRLiOSConcreteScribbleCapableElement *)self scribbleElementIsFocusedBlock];
  char v5 = v4[2]();

  return v5;
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v8 = [(CRLiOSConcreteScribbleCapableElement *)self hitToleranceInsetsWithDefaultInsetsBlock];

  if (v8)
  {
    v9 = [(CRLiOSConcreteScribbleCapableElement *)self hitToleranceInsetsWithDefaultInsetsBlock];
    double top = v9[2](top, left, bottom, right);
    double left = v10;
    double bottom = v11;
    double right = v12;
  }
  double v13 = top;
  double v14 = left;
  double v15 = bottom;
  double v16 = right;
  result.double right = v16;
  result.double bottom = v15;
  result.double left = v14;
  result.double top = v13;
  return result;
}

- (NSUUID)scribbleIdentifier
{
  return self->_scribbleIdentifier;
}

- (void)setScribbleIdentifier:(id)a3
{
}

- (BOOL)shouldDelayScribbleFocus
{
  return self->_shouldDelayScribbleFocus;
}

- (id)willBeginWritingBlock
{
  return self->_willBeginWritingBlock;
}

- (id)prepareForScribbleBlock
{
  return self->_prepareForScribbleBlock;
}

- (id)scribbleEditingBlock
{
  return self->_scribbleEditingBlock;
}

- (CGRect)scaledScribbleEditingFrame
{
  double x = self->_scaledScribbleEditingFrame.origin.x;
  double y = self->_scaledScribbleEditingFrame.origin.y;
  double width = self->_scaledScribbleEditingFrame.size.width;
  double height = self->_scaledScribbleEditingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)scribbleElementIsFocusedBlock
{
  return self->_scribbleElementIsFocusedBlock;
}

- (void)setScribbleElementIsFocusedBlock:(id)a3
{
}

- (id)hitToleranceInsetsWithDefaultInsetsBlock
{
  return self->_hitToleranceInsetsWithDefaultInsetsBlock;
}

- (void)setHitToleranceInsetsWithDefaultInsetsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hitToleranceInsetsWithDefaultInsetsBlock, 0);
  objc_storeStrong(&self->_scribbleElementIsFocusedBlock, 0);
  objc_storeStrong(&self->_scribbleEditingBlock, 0);
  objc_storeStrong(&self->_prepareForScribbleBlock, 0);
  objc_storeStrong(&self->_willBeginWritingBlock, 0);

  objc_storeStrong((id *)&self->_scribbleIdentifier, 0);
}

@end