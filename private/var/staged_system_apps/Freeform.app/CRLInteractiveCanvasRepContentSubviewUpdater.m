@interface CRLInteractiveCanvasRepContentSubviewUpdater
+ (id)p_contentPlatformViewForRepContentPlatformViewPile:(id)a3 layerDelegate:(id)a4 reusableMaskView:(id *)a5;
- (BOOL)needsUpdateOnMainThread;
- (CRLInteractiveCanvasRepContentSubviewUpdater)initWithRepContainerView:(id)a3;
- (void)p_backgroundThreadUpdateSubviewsFromRepContentPiles:(id)a3;
- (void)p_mainThreadUpdateSubviewsFromRepContentPiles:(id)a3;
- (void)updateSubviewFrames;
- (void)updateSubviewsFromRepContentPiles:(id)a3;
@end

@implementation CRLInteractiveCanvasRepContentSubviewUpdater

- (CRLInteractiveCanvasRepContentSubviewUpdater)initWithRepContainerView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLInteractiveCanvasRepContentSubviewUpdater;
  v6 = [(CRLInteractiveCanvasRepContentSubviewUpdater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_repContainerView, a3);
  }

  return v7;
}

- (void)updateSubviewsFromRepContentPiles:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread]) {
    [(CRLInteractiveCanvasRepContentSubviewUpdater *)self p_mainThreadUpdateSubviewsFromRepContentPiles:v4];
  }
  else {
    [(CRLInteractiveCanvasRepContentSubviewUpdater *)self p_backgroundThreadUpdateSubviewsFromRepContentPiles:v4];
  }
}

- (void)p_mainThreadUpdateSubviewsFromRepContentPiles:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3868);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DAC0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3888);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_mainThreadUpdateSubviewsFromRepContentPiles:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:86 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  ++self->_lastMainThreadUpdateSeed;
  self->_needsUpdateOnMainThread = 0;
  [(CRLCanvasSubview *)self->_repContainerView frame];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  id v16 = [v4 count];
  id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v16];
  v18 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v16];
  v19 = [(CRLCanvasSubview *)self->_repContainerView subviews];
  id v20 = [v19 count];
  v21 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:v16];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10022C700;
  v27[3] = &unk_1014E3930;
  v27[4] = v19;
  v27[5] = self;
  v27[10] = v9;
  v27[11] = v11;
  v27[12] = v13;
  v27[13] = v15;
  v27[6] = v17;
  v27[7] = v21;
  v27[8] = v18;
  v27[9] = v20;
  [v4 enumerateObjectsUsingBlock:v27];

  v22 = [(CRLCanvasSubview *)self->_repContainerView subviews];
  LOBYTE(v20) = [v17 isEqualToArray:v22];

  if ((v20 & 1) == 0) {
    [(CRLCanvasSubview *)self->_repContainerView setSubviews:v17];
  }
  backgroundUpdateSubviewReusers = self->_backgroundUpdateSubviewReusers;
  self->_backgroundUpdateSubviewReusers = v18;
  v24 = v18;

  reusableMaskViewsForRepContainerSubviews = self->_reusableMaskViewsForRepContainerSubviews;
  self->_reusableMaskViewsForRepContainerSubviews = v21;
  v26 = v21;
}

+ (id)p_contentPlatformViewForRepContentPlatformViewPile:(id)a3 layerDelegate:(id)a4 reusableMaskView:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 contentPlatformView];
  if (v9)
  {
    [v7 contentPlatformViewFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v7 contentPlatformViewMaskRect];
    double x = v29.origin.x;
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
    if (CGRectIsNull(v29)) {
      goto LABEL_4;
    }
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    v33.origin.double x = v11;
    v33.origin.double y = v13;
    v33.size.double width = v15;
    v33.size.double height = v17;
    if (CGRectContainsRect(v30, v33)) {
      goto LABEL_4;
    }
    v23 = (CRLCanvasSubview *)*a5;
    if (v23)
    {
      v22 = v23;
      -[CRLCanvasSubview setFrame:](v23, "setFrame:", x, y, width, height);
    }
    else
    {
      v24 = objc_alloc_init(CRLCanvasSubview);
      [(CRLCanvasSubview *)v24 setLayerDelegate:v8];
      [(CRLCanvasSubview *)v24 setClipsToBounds:1];
      v22 = v24;
      *a5 = v22;
      -[CRLCanvasSubview setFrame:](v22, "setFrame:", x, y, width, height);
      if (!v22)
      {
LABEL_4:
        [v9 setFrame:v11, v13, v15, v17];
        v22 = v9;
        goto LABEL_10;
      }
    }
    v31.origin.double x = v11;
    v31.origin.double y = v13;
    v31.size.double width = v15;
    v31.size.double height = v17;
    CGRect v32 = CGRectOffset(v31, -x, -y);
    [v9 setFrame:v32.origin.x, v32.origin.y, v32.size.width, v32.size.height];
    v27 = v9;
    v25 = +[NSArray arrayWithObjects:&v27 count:1];
    [(CRLCanvasSubview *)v22 setSubviews:v25];
  }
  else
  {
    v22 = 0;
  }
LABEL_10:

  return v22;
}

- (void)p_backgroundThreadUpdateSubviewsFromRepContentPiles:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSArray *)self->_backgroundUpdateSubviewReusers count];
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3950);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DD9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3970);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:260 isFatal:0 description:"Layout should have run at least once on the main thread."];
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v71 = objc_alloc_init((Class)NSMutableArray);
  id v72 = objc_alloc_init((Class)NSMutableArray);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v4;
  id v10 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
  if (v10)
  {
    id v17 = v10;
    os_log_t log = 0;
    unint64_t v18 = v5 - 1;
    v19 = &off_101557000;
    uint64_t v81 = *(void *)v88;
    unint64_t v75 = v5;
    do
    {
      id v20 = 0;
      id v78 = v17;
      do
      {
        if (*(void *)v88 != v81) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v20);
        v22 = sub_100246AC8(v21, 1, v11, v12, v13, v14, v15, v16, (uint64_t)v19[453]);
        CGRect v29 = v22;
        if (v22)
        {
          CGRect v30 = [v22 contentLayers];
          [v9 addObjectsFromArray:v30];
        }
        else
        {
          uint64_t v31 = sub_100246AC8(v21, 1, v23, v24, v25, v26, v27, v28, (uint64_t)&OBJC_PROTOCOL___CRLInteractiveCanvasRepContentPlatformViewPile);
          if (v31)
          {
            CGRect v30 = (void *)v31;
            v79 = v9;
            id v32 = objc_alloc_init((Class)NSMutableArray);
            id v33 = objc_alloc_init((Class)NSMutableArray);
            if ((unint64_t)&log->isa + 1 >= v5) {
              goto LABEL_35;
            }
            os_log_t v34 = log;
            while (1)
            {
              v35 = (char *)&v34->isa + 1;
              v36 = [(NSArray *)self->_backgroundUpdateSubviewReusers objectAtIndexedSubscript:(char *)&v34->isa + 1];
              unsigned __int8 v37 = [v36 canReuseForRepContentLayersDuringBackgroundUpdate];
              v38 = v32;
              if ((v37 & 1) == 0)
              {
                unsigned __int8 v39 = [v36 canReuseUnmodifiedForRepContentPile:v30];
                v38 = v33;
                if (v39) {
                  break;
                }
              }
              [v38 addObject:v36];

              os_log_t v34 = (os_log_t)((char *)v34 + 1);
              if ((char *)v18 == v35) {
                goto LABEL_35;
              }
            }

            if (v34 == (os_log_t)0x7FFFFFFFFFFFFFFELL)
            {
LABEL_35:
              self->_needsUpdateOnMainThread = 1;
            }
            else
            {
              v74 = [(NSArray *)self->_backgroundUpdateSubviewReusers objectAtIndexedSubscript:log];
              if (([v74 canReuseForRepContentLayersDuringBackgroundUpdate] & 1) == 0)
              {
                unsigned int v44 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E3990);
                }
                v45 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  unsigned int v93 = v44;
                  __int16 v94 = 2082;
                  v95 = "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]";
                  __int16 v96 = 2082;
                  v97 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m";
                  __int16 v98 = 1024;
                  int v99 = 318;
                  _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Rep content subviews with platform views should always be sandwiched between rep content subviews with layers", buf, 0x22u);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E39B0);
                }
                v46 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  loga = v46;
                  v52 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  unsigned int v93 = v44;
                  __int16 v94 = 2114;
                  v95 = v52;
                  _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]");
                v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
                +[CRLAssertionHandler handleFailureInFunction:v47 file:v48 lineNumber:318 isFatal:0 description:"Rep content subviews with platform views should always be sandwiched between rep content subviews with layers"];
              }
              [v74 reuseForRepContentLayers:v79];
              id v73 = objc_alloc_init((Class)NSMutableArray);

              os_log_t log = (os_log_t)((char *)&v34->isa + 2);
              [v71 addObjectsFromArray:v32];
              [v72 addObjectsFromArray:v33];

              v79 = v73;
            }

            unint64_t v5 = v75;
            id v9 = v79;
          }
          else
          {
            unsigned int v40 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E39D0);
            }
            v41 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v93 = v40;
              __int16 v94 = 2082;
              v95 = "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]";
              __int16 v96 = 2082;
              v97 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m";
              __int16 v98 = 1024;
              int v99 = 342;
              __int16 v100 = 2112;
              v101 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Rep content pile did not implement either CRLInteractiveCanvasRepLayerPile or CRLInteractiveCanvasRepContentPlatformViewPile: %@", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E39F0);
            }
            v42 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              id v49 = v9;
              v50 = v42;
              v51 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v93 = v40;
              __int16 v94 = 2114;
              v95 = v51;
              _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              id v9 = v49;
            }
            CGRect v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]");
            v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
            +[CRLAssertionHandler handleFailureInFunction:v30, v43, 342, 0, "Rep content pile did not implement either CRLInteractiveCanvasRepLayerPile or CRLInteractiveCanvasRepContentPlatformViewPile: %@", v21 file lineNumber isFatal description];
          }
          v19 = &off_101557000;
          id v17 = v78;
        }

        id v20 = (char *)v20 + 1;
      }
      while (v20 != v17);
      id v53 = [obj countByEnumeratingWithState:&v87 objects:v102 count:16];
      id v17 = v53;
    }
    while (v53);
  }
  else
  {
    os_log_t log = 0;
  }

  os_log_t v54 = log;
  if ((unint64_t)log >= v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    v56 = v72;
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3A10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DD14();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3A30);
    }
    v60 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v60);
    }
    v55 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]");
    v61 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
    +[CRLAssertionHandler handleFailureInFunction:v55 file:v61 lineNumber:348 isFatal:0 description:"There should always be a rep content subview with layers on top."];
  }
  else
  {
    v55 = [(NSArray *)self->_backgroundUpdateSubviewReusers objectAtIndexedSubscript:log];
    v56 = v72;
    if (([v55 canReuseForRepContentLayersDuringBackgroundUpdate] & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3A50);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108DC8C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3A70);
      }
      v57 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v57);
      }
      v58 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater p_backgroundThreadUpdateSubviewsFromRepContentPiles:]");
      v59 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
      +[CRLAssertionHandler handleFailureInFunction:v58 file:v59 lineNumber:351 isFatal:0 description:"The topmost rep content subview should always contain layers"];

      os_log_t v54 = log;
    }
    [v55 reuseForRepContentLayers:v9];
  }

  v62 = (char *)&v54->isa + 1;
  if ((unint64_t)&v54->isa + 1 < v5)
  {
    do
    {
      v63 = [(NSArray *)self->_backgroundUpdateSubviewReusers objectAtIndexedSubscript:v62];
      if ([v63 canReuseForRepContentLayersDuringBackgroundUpdate]) {
        v64 = v71;
      }
      else {
        v64 = v56;
      }
      [v64 addObject:v63];

      ++v62;
    }
    while ((char *)v5 != v62);
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v65 = v71;
  id v66 = [v65 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v84;
    do
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v84 != v68) {
          objc_enumerationMutation(v65);
        }
        [*(id *)(*((void *)&v83 + 1) + 8 * i) reuseForRepContentLayers:&__NSArray0__struct];
      }
      id v67 = [v65 countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v67);
  }

  if ([v56 count])
  {
    unint64_t lastMainThreadUpdateSeed = self->_lastMainThreadUpdateSeed;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10022DE8C;
    block[3] = &unk_1014CD770;
    block[5] = v56;
    block[6] = lastMainThreadUpdateSeed;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateSubviewFrames
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3A90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DE24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3AB0);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentSubviewUpdater updateSubviewFrames]");
    unint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentSubviewUpdater.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:398 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLCanvasSubview *)self->_repContainerView frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [(CRLCanvasSubview *)self->_repContainerView subviews];
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v19 setFrame:v7, v9, v11, v13];
        [v19 setBounds:v7, v9, v11, v13];
      }
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

- (BOOL)needsUpdateOnMainThread
{
  return self->_needsUpdateOnMainThread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableMaskViewsForRepContainerSubviews, 0);
  objc_storeStrong((id *)&self->_backgroundUpdateSubviewReusers, 0);

  objc_storeStrong((id *)&self->_repContainerView, 0);
}

@end