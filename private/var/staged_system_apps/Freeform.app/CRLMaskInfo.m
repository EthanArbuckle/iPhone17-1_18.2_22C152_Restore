@interface CRLMaskInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMaskInfo:(id)a3;
- (BOOL)isSelectable;
- (BOOL)isSupported;
- (CRLCanvasElementInfo)parentInfo;
- (CRLCanvasInfoGeometry)geometry;
- (CRLMaskInfo)initWithImageItem:(id)a3 geometry:(id)a4 pathSource:(id)a5;
- (CRLPathSource)pathSource;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (_TtC8Freeform12CRLImageItem)parentImageItem;
- (void)setGeometry:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)setPathSource:(id)a3;
@end

@implementation CRLMaskInfo

- (CRLMaskInfo)initWithImageItem:(id)a3 geometry:(id)a4 pathSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLMaskInfo;
  v11 = [(CRLMaskInfo *)&v22 init];
  if (v11)
  {
    if (v10)
    {
      if (v9) {
        goto LABEL_4;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0438);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101088370();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0458);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo initWithImageItem:geometry:pathSource:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 31, 0, "invalid nil value for '%{public}s'", "pathSource");

      if (v9)
      {
LABEL_4:
        if (v8)
        {
LABEL_33:
          [(CRLMaskInfo *)v11 setGeometry:v9];
          [(CRLMaskInfo *)v11 setParentInfo:v8];
          [(CRLMaskInfo *)v11 setPathSource:v10];
          goto LABEL_34;
        }
LABEL_24:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E04B8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101088248();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E04D8);
        }
        v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v18);
        }
        v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo initWithImageItem:geometry:pathSource:]");
        v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 33, 0, "invalid nil value for '%{public}s'", "imageItem");

        goto LABEL_33;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0478);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010882DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0498);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo initWithImageItem:geometry:pathSource:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 32, 0, "invalid nil value for '%{public}s'", "geometry");

    if (v8) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }
LABEL_34:

  return v11;
}

- (_TtC8Freeform12CRLImageItem)parentImageItem
{
  v3 = (objc_class *)objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInfo);
  v5 = sub_10024715C(v3, WeakRetained);

  return (_TtC8Freeform12CRLImageItem *)v5;
}

- (BOOL)isEqualToMaskInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CRLMaskInfo *)self geometry];
    v6 = [v4 geometry];
    if ([v5 isEqual:v6])
    {
      v7 = [(CRLMaskInfo *)self pathSource];
      id v8 = [v7 bezierPath];
      id v9 = [v4 pathSource];
      id v10 = [v9 bezierPath];
      unsigned __int8 v11 = [v8 isEqual:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  v7 = [(CRLMaskInfo *)self parentInfo];
  id v8 = [v6 parentInfo];
  if (v7 == v8) {
    BOOL v9 = [(CRLMaskInfo *)self isEqualToMaskInfo:v6];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
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
  return 0;
}

- (Class)editorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isSelectable
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  if (([v4 allValuesValidNumbers] & 1) == 0)
  {
    unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E04F8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v23 = v6;
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 67110402;
      unsigned int v27 = v5;
      __int16 v28 = 2082;
      v29 = "-[CRLMaskInfo setGeometry:]";
      __int16 v30 = 2082;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m";
      __int16 v32 = 1024;
      int v33 = 89;
      __int16 v34 = 2114;
      v35 = v25;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempting to set geometry with invalid properties on %{public}@! %@", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0518);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo setGeometry:]");
    BOOL v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"];
    id v10 = (objc_class *)objc_opt_class();
    unsigned __int8 v11 = NSStringFromClass(v10);
    +[CRLAssertionHandler handleFailureInFunction:v8, v9, 89, 0, "Attempting to set geometry with invalid properties on %{public}@! %@", v11, v4 file lineNumber isFatal description];

    uint64_t v12 = [v4 geometryWithValidNumbers];

    id v4 = (id)v12;
  }
  if (([v4 isEqual:self->_geometry] & 1) == 0)
  {
    v13 = (CRLCanvasInfoGeometry *)[v4 copy];
    geometry = self->_geometry;
    self->_geometry = v13;

    v15 = [(CRLMaskInfo *)self geometry];
    [v15 size];
    double v17 = v16;
    double v19 = v18;

    [(CRLPathSource *)self->_pathSource naturalSize];
    if (v21 != v17 || v20 != v19) {
      -[CRLPathSource setNaturalSize:](self->_pathSource, "setNaturalSize:", v17, v19);
    }
  }
}

- (void)setPathSource:(id)a3
{
  id v4 = (CRLPathSource *)a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0538);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088404();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0558);
    }
    unsigned int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo setPathSource:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 104, 0, "invalid nil value for '%{public}s'", "newPathSource");
  }
  if (self->_pathSource != v4)
  {
    id v8 = (CRLPathSource *)[(CRLPathSource *)v4 copy];
    pathSource = self->_pathSource;
    self->_pathSource = v8;

    [(CRLPathSource *)self->_pathSource naturalSize];
    double v11 = v10;
    double v13 = v12;
    v14 = [(CRLMaskInfo *)self geometry];
    [v14 size];
    BOOL v17 = sub_100064084(v11, v13, v15, v16);

    if (!v17)
    {
      unsigned int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0578);
      }
      double v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v26 = self->_pathSource;
        unsigned int v27 = v19;
        [(CRLPathSource *)v26 naturalSize];
        __int16 v28 = NSStringFromCGSize(v45);
        v29 = [(CRLMaskInfo *)self geometry];
        [v29 size];
        __int16 v30 = NSStringFromCGSize(v46);
        *(_DWORD *)buf = 67110402;
        unsigned int v32 = v18;
        __int16 v33 = 2082;
        __int16 v34 = "-[CRLMaskInfo setPathSource:]";
        __int16 v35 = 2082;
        __int16 v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m";
        __int16 v37 = 1024;
        int v38 = 110;
        __int16 v39 = 2114;
        v40 = v28;
        __int16 v41 = 2114;
        v42 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Path source set on mask info that doesn't have a natural size that aligns with the mask's info geometry! Path Source Size: %{public}@ Geometry Size: %{public}@", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0598);
      }
      double v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo setPathSource:]");
      objc_super v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"];
      [(CRLPathSource *)self->_pathSource naturalSize];
      v23 = NSStringFromCGSize(v43);
      v24 = [(CRLMaskInfo *)self geometry];
      [v24 size];
      v25 = NSStringFromCGSize(v44);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 110, 0, "Path source set on mask info that doesn't have a natural size that aligns with the mask's info geometry! Path Source Size: %{public}@ Geometry Size: %{public}@", v23, v25);
    }
  }
}

- (CRLPathSource)pathSource
{
  return self->_pathSource;
}

- (CRLCanvasInfoGeometry)geometry
{
  return self->_geometry;
}

- (CRLCanvasElementInfo)parentInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInfo);

  return (CRLCanvasElementInfo *)WeakRetained;
}

- (void)setParentInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentInfo);
  objc_storeStrong((id *)&self->_geometry, 0);

  objc_storeStrong((id *)&self->_pathSource, 0);
}

@end