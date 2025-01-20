@interface CRLMultiselectResizeLayout
- (BOOL)p_atLeastOneLayoutSupportsRotation;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)supportsRotation;
- (CGSize)minimumSize;
- (NSSet)representedSelectedLayouts;
- (id)computeLayoutGeometry;
- (id)layoutsForProvidingGuidesForChildLayouts;
- (id)p_multiselectInfo;
- (id)reliedOnLayouts;
- (void)invalidate;
- (void)recursivelyAddLayoutAndDependentLayoutsToValidateSet:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
@end

@implementation CRLMultiselectResizeLayout

- (NSSet)representedSelectedLayouts
{
  v3 = [(CRLCanvasLayout *)self layoutController];
  v4 = [(CRLMultiselectResizeLayout *)self p_multiselectInfo];
  v5 = [v4 representedSelectedBoardItems];
  v6 = [v3 layoutsForInfos:v5];

  return (NSSet *)v6;
}

- (BOOL)supportsRotation
{
  return [(CRLMultiselectResizeLayout *)self p_atLeastOneLayoutSupportsRotation];
}

- (BOOL)p_atLeastOneLayoutSupportsRotation
{
  [(CRLMultiselectResizeLayout *)self representedSelectedLayouts];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "supportsRotation", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  v5 = v4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  if (v4) {
    [v4 transformForLayout:self];
  }
  v6 = [(CRLCanvasLayout *)self originalGeometry];
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  long long v7 = [v6 geometryByTransformingBy:v18];

  [(CRLCanvasLayout *)self setDynamicGeometry:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v8 = [(CRLMultiselectResizeLayout *)self representedSelectedLayouts];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(CRLMultiselectResizeLayout **)(*((void *)&v14 + 1) + 8 * i);
        if (v13 != self) {
          [(CRLMultiselectResizeLayout *)v13 takeSizeFromTracker:v5];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  [(CRLCanvasLayout *)self invalidateFrame];
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)CRLMultiselectResizeLayout;
  [(CRLCanvasLayout *)&v3 invalidate];
  if (![(CRLCanvasLayout *)self invalidGeometry]) {
    [(CRLCanvasLayout *)self invalidateFrame];
  }
}

- (void)recursivelyAddLayoutAndDependentLayoutsToValidateSet:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLMultiselectResizeLayout;
  id v5 = a3;
  [(CRLCanvasLayout *)&v7 recursivelyAddLayoutAndDependentLayoutsToValidateSet:v5];
  v6 = [(CRLMultiselectResizeLayout *)self representedSelectedLayouts];
  [v6 makeObjectsPerformSelector:a2 withObject:v5];
}

- (id)computeLayoutGeometry
{
  objc_super v3 = [(CRLCanvasLayout *)self layoutController];

  if (v3)
  {
    id v4 = [(CRLCanvasLayout *)self layoutController];
    id v5 = [(CRLMultiselectResizeLayout *)self p_multiselectInfo];
    v6 = [v5 representedSelectedBoardItems];
    objc_super v7 = [v4 layoutsForInfos:v6];
  }
  else
  {
    long long v8 = [(CRLCanvasAbstractLayout *)self parent];
    id v9 = [v8 children];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100071674;
    v37[3] = &unk_1014CFA58;
    v37[4] = self;
    id v10 = [v9 crl_arrayOfObjectsPassingTest:v37];
    objc_super v7 = +[NSSet setWithArray:v10];
  }
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = [*(id *)(*((void *)&v33 + 1) + 8 * i) pureGeometry];
        [v20 frame];
        v43.origin.CGFloat x = v21;
        v43.origin.CGFloat y = v22;
        v43.size.double width = v23;
        v43.size.double height = v24;
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.double width = width;
        v40.size.double height = height;
        CGRect v41 = CGRectUnion(v40, v43);
        CGFloat x = v41.origin.x;
        CGFloat y = v41.origin.y;
        double width = v41.size.width;
        double height = v41.size.height;
      }
      id v17 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v17);
  }

  if (!sub_100065AF4(x, y, width, height))
  {
    int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFA78);
    }
    v26 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106DBAC(v26, v25, x, y, width, height);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFA98);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v27);
    }
    v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiselectResizeLayout computeLayoutGeometry]");
    v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiselectResizeLayout.m"];
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    v30 = NSStringFromCGRect(v42);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 97, 0, "Unable to determine proper layout geometry! Got %{public}@", v30);

    CGFloat y = 0.0;
    double height = 1.0;
    double width = 1.0;
    CGFloat x = 0.0;
  }
  v31 = -[CRLCanvasLayoutGeometry initWithFrame:]([CRLCanvasLayoutGeometry alloc], "initWithFrame:", x, y, width, height);

  return v31;
}

- (id)reliedOnLayouts
{
  objc_super v3 = [(CRLCanvasLayout *)self layoutController];

  if (!v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFAB8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106DCC8(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFAD8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    objc_super v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultiselectResizeLayout reliedOnLayouts]");
    long long v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMultiselectResizeLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 105, 0, "invalid nil value for '%{public}s'", "self.layoutController");
  }
  id v9 = [(CRLCanvasLayout *)self layoutController];
  id v10 = [(CRLMultiselectResizeLayout *)self p_multiselectInfo];
  uint64_t v11 = [v10 representedSelectedBoardItems];
  v12 = [v9 layoutsForInfos:v11];

  return v12;
}

- (BOOL)resizeMayChangeAspectRatio
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v3 = [(CRLMultiselectResizeLayout *)self p_multiselectInfo];
  int v4 = [v3 representedSelectedBoardItems];

  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v4);
      }
      if (![*(id *)(*((void *)&v22 + 1) + 8 * v8) allowsParentGroupToBeResizedWithoutAspectRatioLock])break; {
      if (v6 == (id)++v8)
      }
      {
        id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [(CRLCanvasLayout *)self layoutController];
    id v10 = [(CRLMultiselectResizeLayout *)self p_multiselectInfo];
    uint64_t v11 = [v10 representedSelectedBoardItems];
    int v4 = [v9 layoutsForInfos:v11];

    id v12 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (!v12)
    {
      BOOL v16 = 1;
      goto LABEL_19;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v4);
      }
      if (![*(id *)(*((void *)&v18 + 1) + 8 * v15) resizeMayChangeAspectRatio]) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
        BOOL v16 = 1;
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
  }
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (CGSize)minimumSize
{
  objc_super v3 = [(CRLCanvasAbstractLayout *)self geometry];
  [v3 size];
  double v44 = v4;
  double v6 = v5;

  unsigned __int8 v7 = [(CRLMultiselectResizeLayout *)self resizeMayChangeAspectRatio];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v8 = [(CRLCanvasLayout *)self layoutController];
  id v9 = [(CRLMultiselectResizeLayout *)self p_multiselectInfo];
  id v10 = [v9 representedSelectedBoardItems];
  uint64_t v11 = [v8 layoutsForInfos:v10];

  id v12 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v47;
    double v15 = 0.0;
    double v16 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v18 minimumSize];
        double v20 = v19;
        double v22 = v21;
        if ((v7 & 1) == 0)
        {
          long long v23 = [v18 pureGeometry];
          [v23 size];
          sub_100066FC4(v20, v22, v24, v25);
        }
        double v26 = sub_100064070();
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        long long v33 = [v18 pureGeometry];
        long long v34 = v33;
        if (v33) {
          [v33 transform];
        }
        else {
          memset(&v45, 0, sizeof(v45));
        }
        v52.origin.CGFloat x = v26;
        v52.origin.CGFloat y = v28;
        v52.size.double width = v30;
        v52.size.double height = v32;
        CGRect v53 = CGRectApplyAffineTransform(v52, &v45);
        double width = v53.size.width;
        double height = v53.size.height;

        v37 = [v18 pureGeometry];
        [v37 frame];
        double v39 = v38;
        double v41 = v40;

        if (v39 > 1.0e-11) {
          double v16 = fmax(v16, width / v39);
        }
        if (v41 > 1.0e-11) {
          double v15 = fmax(v15, height / v41);
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
    double v16 = 0.0;
  }

  double v42 = v44 * v16;
  double v43 = v6 * v15;
  result.double height = v43;
  result.double width = v42;
  return result;
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  v9.receiver = self;
  v9.super_class = (Class)CRLMultiselectResizeLayout;
  objc_super v3 = [(CRLCanvasAbstractLayout *)&v9 parentLayoutForProvidingGuides];
  double v4 = [v3 layoutsForProvidingGuidesForChildLayouts];
  id v5 = [v4 mutableCopy];

  double v6 = [(CRLMultiselectResizeLayout *)self representedSelectedLayouts];
  unsigned __int8 v7 = [v6 allObjects];
  [v5 removeObjectsInArray:v7];

  return v5;
}

- (id)p_multiselectInfo
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasLayout *)self info];
  id v5 = sub_1002469D0(v3, v4);

  return v5;
}

@end