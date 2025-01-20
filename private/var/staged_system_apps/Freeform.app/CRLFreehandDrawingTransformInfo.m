@interface CRLFreehandDrawingTransformInfo
- (BOOL)isSelectable;
- (BOOL)isSupported;
- (CRLCanvasElementInfo)parentInfo;
- (CRLCanvasInfoGeometry)geometry;
- (CRLFreehandDrawingTransformInfo)initWithParentInfo:(id)a3;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSSet)representedShapeInfos;
- (void)clearBackPointerToParentInfoIfNeeded:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)setRepresentedShapeInfos:(id)a3 currentlyLaidOutOnLayoutController:(id)a4;
@end

@implementation CRLFreehandDrawingTransformInfo

- (CRLFreehandDrawingTransformInfo)initWithParentInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingTransformInfo;
  v5 = [(CRLFreehandDrawingTransformInfo *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parentInfo, v4);
  }

  return v6;
}

- (NSSet)representedShapeInfos
{
  return self->_representedShapeInfos;
}

- (void)setRepresentedShapeInfos:(id)a3 currentlyLaidOutOnLayoutController:(id)a4
{
  objc_storeStrong((id *)&self->_representedShapeInfos, a3);
  id v7 = a3;
  id v8 = a4;
  id v11 = [v7 allObjects];
  v9 = +[CRLGroupItem groupGeometryFromChildrenInfos:v11 currentlyLaidOutWithLayoutController:v8];

  geometry = self->_geometry;
  self->_geometry = v9;
}

- (CRLCanvasElementInfo)parentInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInfo);

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (void)setParentInfo:(id)a3
{
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  p_parentInfo = &self->_parentInfo;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentInfo);

  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_parentInfo, 0);
  }
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)editorClass
{
  int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DDF00);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101084424(v2, v3);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DDF20);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v4, v2);
  }
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformInfo editorClass]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformInfo.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:74 isFatal:0 description:"We don't expect this to be called"];

  return 0;
}

- (CRLCanvasInfoGeometry)geometry
{
  return self->_geometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_representedShapeInfos, 0);

  objc_destroyWeak((id *)&self->_parentInfo);
}

@end