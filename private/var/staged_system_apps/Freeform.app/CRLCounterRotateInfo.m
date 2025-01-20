@interface CRLCounterRotateInfo
+ (CGAffineTransform)counterTransformForTransformInRoot:(SEL)a3;
+ (id)infoGeometryForTransformInRoot:(CGAffineTransform *)a3 isChildFlipped:(BOOL)a4;
+ (id)infoGeometryInRootIncludingCounterRotateIfNeededForBoardItem:(id)a3;
+ (id)p_infoGeometryForCounterTransform:(CGAffineTransform *)a3 isChildFlipped:(BOOL)a4;
- (BOOL)isSelectable;
- (BOOL)isSupported;
- (CGAffineTransform)counterTransform;
- (CRLCanvasElementInfo)parentInfo;
- (CRLCanvasInfoGeometry)geometry;
- (CRLCounterRotateInfo)initWithChildInfo:(id)a3 parentGroup:(id)a4 counterTransform:(CGAffineTransform *)a5;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)childInfos;
- (_TtC8Freeform12CRLBoardItem)childInfo;
- (_TtC8Freeform12CRLGroupItem)parentGroup;
- (id)infoForSelectionPath:(id)a3;
- (void)clearBackPointerToParentInfoIfNeeded:(id)a3;
- (void)setCounterTransform:(CGAffineTransform *)a3;
- (void)setGeometry:(id)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation CRLCounterRotateInfo

- (CRLCounterRotateInfo)initWithChildInfo:(id)a3 parentGroup:(id)a4 counterTransform:(CGAffineTransform *)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CRLCounterRotateInfo;
  v10 = [(CRLCounterRotateInfo *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_childInfo, v8);
    objc_storeWeak((id *)&v11->_parentGroup, v9);
    long long v12 = *(_OWORD *)&a5->c;
    v14[0] = *(_OWORD *)&a5->a;
    v14[1] = v12;
    v14[2] = *(_OWORD *)&a5->tx;
    [(CRLCounterRotateInfo *)v11 setCounterTransform:v14];
  }

  return v11;
}

+ (id)infoGeometryForTransformInRoot:(CGAffineTransform *)a3 isChildFlipped:(BOOL)a4
{
  BOOL v4 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v6 = *(_OWORD *)&a3->c;
  long long v9 = *(_OWORD *)&a3->a;
  long long v10 = v6;
  long long v11 = *(_OWORD *)&a3->tx;
  long long v12 = 0u;
  [a1 counterTransformForTransformInRoot:&v9];
  long long v9 = v12;
  long long v10 = v13;
  long long v11 = v14;
  v7 = [a1 p_infoGeometryForCounterTransform:&v9 isChildFlipped:v4];

  return v7;
}

+ (id)p_infoGeometryForCounterTransform:(CGAffineTransform *)a3 isChildFlipped:(BOOL)a4
{
  long long v5 = *(_OWORD *)&a3->c;
  long long v10 = *(_OWORD *)&a3->a;
  long long v11 = v5;
  long long v12 = *(_OWORD *)&a3->tx;
  uint64_t v6 = sub_10007F7EC((double *)&v10) ^ a4;
  long long v7 = *(_OWORD *)&a3->c;
  long long v10 = *(_OWORD *)&a3->a;
  long long v11 = v7;
  long long v12 = *(_OWORD *)&a3->tx;
  id v8 = -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, v6, 0, CGPointZero.x, CGPointZero.y, 10.0, 10.0, -sub_10007F788(&v10));

  return v8;
}

+ (CGAffineTransform)counterTransformForTransformInRoot:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v6.tx = 0.0;
  v6.ty = 0.0;
  return CGAffineTransformInvert(retstr, &v6);
}

+ (id)infoGeometryInRootIncludingCounterRotateIfNeededForBoardItem:(id)a3
{
  id v3 = a3;
  long long v4 = [v3 geometry];
  uint64_t v5 = objc_opt_class();
  CGAffineTransform v6 = [v3 parentInfo];
  long long v7 = sub_1002469D0(v5, v6);

  if ([v3 wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent])
  {
    if (([v3 supportsParentRotation] & 1) == 0)
    {
      id v8 = [v3 containingGroup];

      if (v8)
      {
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x5010000000;
        v37 = "";
        long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
        long long v38 = *(_OWORD *)&CGAffineTransformIdentity.a;
        long long v39 = v9;
        long long v40 = *(_OWORD *)&CGAffineTransformIdentity.tx;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100100FE8;
        v33[3] = &unk_1014D60A8;
        v33[4] = &v34;
        [v7 withTemporaryLayoutPerform:v33];
        if (v7) {
          [v7 transformInRoot];
        }
        else {
          memset(v32, 0, sizeof(v32));
        }
        long long v10 = [v3 geometry];
        long long v11 = v10;
        if (v10) {
          [v10 transform];
        }
        else {
          memset(v31, 0, sizeof(v31));
        }
        long long v12 = +[CRLCounterRotateInfo infoGeometryForTransformInRoot:v32 isChildFlipped:sub_10007F7EC((double *)v31)];

        memset(&v30, 0, sizeof(v30));
        if (v12) {
          [v12 transform];
        }
        else {
          memset(&t1, 0, sizeof(t1));
        }
        long long v13 = *((_OWORD *)v35 + 3);
        *(_OWORD *)&t2.a = *((_OWORD *)v35 + 2);
        *(_OWORD *)&t2.c = v13;
        *(_OWORD *)&t2.tx = *((_OWORD *)v35 + 4);
        CGAffineTransformConcat(&v30, &t1, &t2);
        memset(&t2, 0, sizeof(t2));
        if (v4) {
          [v4 fullTransform];
        }
        else {
          memset(&v27, 0, sizeof(v27));
        }
        CGAffineTransform v26 = v30;
        CGAffineTransformConcat(&t2, &v27, &v26);
        id v14 = [v4 widthValid];
        id v15 = [v4 heightValid];
        CGAffineTransform v26 = t2;
        uint64_t v16 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v26 widthValid:v14 heightValid:v15];

        uint64_t v17 = objc_opt_class();
        v18 = [v7 parentInfo];
        uint64_t v19 = sub_1002469D0(v17, v18);

        _Block_object_dispose(&v34, 8);
        long long v7 = (void *)v19;
        long long v4 = (void *)v16;
      }
    }
  }
  if (v7)
  {
    do
    {
      v20 = [v7 geometry];
      v21 = [v4 geometryWithParentGeometry:v20];

      uint64_t v22 = objc_opt_class();
      v23 = [v7 parentInfo];
      uint64_t v24 = sub_1002469D0(v22, v23);

      long long v4 = v21;
      long long v7 = (void *)v24;
    }
    while (v24);
  }
  else
  {
    v21 = v4;
  }

  return v21;
}

- (void)setCounterTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->a;
  long long v6 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_counterTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_counterTransform.tx = v6;
  *(_OWORD *)&self->_counterTransform.a = v5;
  long long v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_childInfo);
  long long v9 = [WeakRetained geometry];
  long long v10 = v9;
  if (v9) {
    [v9 transform];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  BOOL v11 = sub_10007F7EC((double *)v15);
  long long v12 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->tx;
  long long v13 = [v7 p_infoGeometryForCounterTransform:v14 isChildFlipped:v11];
  [(CRLCounterRotateInfo *)self setGeometry:v13];
}

- (CRLCanvasElementInfo)parentInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentGroup);

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (void)setParentInfo:(id)a3
{
  id v18 = a3;
  uint64_t v4 = objc_opt_class();
  long long v5 = sub_1002469D0(v4, v18);
  if (v18 && !v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D60C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079668();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D60E8);
    }
    long long v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Must provide a group info or nil as parent of a counter rotate info!", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[CRLCounterRotateInfo setParentInfo:]");
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateInfo setParentInfo:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateInfo.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:108 isFatal:1 description:"Must provide a group info or nil as parent of a counter rotate info!"];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v16, v17);
    abort();
  }
  objc_storeWeak((id *)&self->_parentGroup, v5);
}

- (BOOL)isSelectable
{
  return 0;
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  p_parentGroup = &self->_parentGroup;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentGroup);

  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_parentGroup, 0);
  }
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
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6108);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010796F0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6128);
  }
  v2 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v2);
  }
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateInfo editorClass]");
  id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateInfo.m"];
  +[CRLAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:135 isFatal:0 description:"We don't expect this to be called"];

  return 0;
}

- (NSArray)childInfos
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_childInfo);
  id v5 = WeakRetained;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (id)infoForSelectionPath:(id)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6148);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101079778();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6168);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v3);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateInfo infoForSelectionPath:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateInfo.m"];
  +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:146 isFatal:0 description:"We don't expect this to be called"];

  return 0;
}

- (CRLCanvasInfoGeometry)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
}

- (_TtC8Freeform12CRLGroupItem)parentGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentGroup);

  return (_TtC8Freeform12CRLGroupItem *)WeakRetained;
}

- (_TtC8Freeform12CRLBoardItem)childInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_childInfo);

  return (_TtC8Freeform12CRLBoardItem *)WeakRetained;
}

- (CGAffineTransform)counterTransform
{
  long long v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_childInfo);
  objc_destroyWeak((id *)&self->_parentGroup);

  objc_storeStrong((id *)&self->_geometry, 0);
}

@end