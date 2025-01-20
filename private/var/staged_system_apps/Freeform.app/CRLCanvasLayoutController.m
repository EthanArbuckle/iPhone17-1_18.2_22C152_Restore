@interface CRLCanvasLayoutController
+ (Class)effectiveLayoutClassForInfo:(id)a3;
+ (void)temporaryLayoutControllerForInfos:(id)a3 useInBlock:(id)a4;
- (CGRect)rectOfTopLevelLayouts;
- (CRLBoardItemOwning)boardItemOwner;
- (CRLCanvas)canvas;
- (CRLCanvasLayoutChangeObserver)i_layoutRegistrationObserver;
- (CRLCanvasLayoutController)initWithCanvas:(id)a3;
- (CRLCanvasRootLayout)rootLayout;
- (id)layoutForInfo:(id)a3;
- (id)layoutForInfo:(id)a3 childOfLayout:(id)a4;
- (id)layoutsForInfo:(id)a3;
- (id)layoutsForInfos:(id)a3;
- (id)layoutsInRect:(CGRect)a3;
- (id)layoutsInRect:(CGRect)a3 deep:(BOOL)a4;
- (id)sortLayoutsForDependencies:(id)a3;
- (id)validatedLayoutForInfo:(id)a3;
- (id)validatedLayoutForInfo:(id)a3 childOfLayout:(id)a4;
- (id)validatedLayoutsForInfo:(id)a3;
- (void)dealloc;
- (void)i_enumerateLayoutsUsingBlock:(id)a3;
- (void)i_registerLayout:(id)a3;
- (void)i_removeAllLayouts;
- (void)i_unregisterLayout:(id)a3;
- (void)invalidateChildrenOfLayout:(id)a3;
- (void)invalidateLayout:(id)a3;
- (void)invalidateLayoutForRecreation:(id)a3;
- (void)notifyThatLayoutsChangedOutsideOfLayout;
- (void)p_recreateLayoutsIfNeededToValidateLayouts:(id)a3;
- (void)p_validateLayouts:(id)a3 shouldMarkValidLayoutsThatDoNotWantValidation:(BOOL)a4;
- (void)setI_layoutRegistrationObserver:(id)a3;
- (void)setInfos:(id)a3;
- (void)validateLayoutWithDependencies:(id)a3;
- (void)validateLayouts;
- (void)validateLayoutsWithDependencies:(id)a3;
@end

@implementation CRLCanvasLayoutController

- (CRLCanvasLayoutController)initWithCanvas:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLCanvasLayoutController;
  v5 = [(CRLCanvasLayoutController *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_canvas, v4);
    v7 = (objc_class *)[v4 rootLayoutClass];
    if (!v7) {
      v7 = (objc_class *)objc_opt_class();
    }
    v8 = (CRLCanvasRootLayout *)[[v7 alloc] initWithLayoutController:v6];
    rootLayout = v6->_rootLayout;
    v6->_rootLayout = v8;

    v10 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:0];
    layoutsByInfo = v6->_layoutsByInfo;
    v6->_layoutsByInfo = v10;

    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidLayouts = v6->_invalidLayouts;
    v6->_invalidLayouts = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidChildrenLayouts = v6->_invalidChildrenLayouts;
    v6->_invalidChildrenLayouts = v14;

    v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    layoutsNeedingRecreating = v6->_layoutsNeedingRecreating;
    v6->_layoutsNeedingRecreating = v16;
  }
  return v6;
}

- (void)dealloc
{
  [(CRLCanvasAbstractLayout *)self->_rootLayout setChildren:&__NSArray0__struct];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasLayoutController;
  [(CRLCanvasLayoutController *)&v3 dealloc];
}

- (CRLBoardItemOwning)boardItemOwner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  objc_super v3 = [WeakRetained boardItemOwner];

  return (CRLBoardItemOwning *)v3;
}

+ (void)temporaryLayoutControllerForInfos:(id)a3 useInBlock:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v11 = [[CRLCanvas alloc] initForTemporaryLayout];
  v7 = [[CRLCanvasLayoutControllerTemporaryCanvasDelegate alloc] initWithInfos:v6];
  [v11 setDelegate:v7];
  v8 = [v11 layoutController];
  [v8 setInfos:v6];

  v9 = [v11 layoutController];
  [v9 validateLayouts];

  v10 = [v11 layoutController];
  v5[2](v5, v10);

  [v11 teardown];
}

- (void)setInfos:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = -[CRLCanvasLayoutController layoutsForInfo:](self, "layoutsForInfo:", v11, (void)v18);
        v13 = v12;
        if (v12)
        {
          id v14 = [v12 allObjects];
          [v5 addObjectsFromArray:v14];
        }
        else
        {
          id v14 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "effectiveLayoutClassForInfo:", v11)), "initWithInfo:", v11);
          [v5 addObject:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v15 = [(CRLCanvasAbstractLayout *)self->_rootLayout children];
  unsigned __int8 v16 = [v15 isEqual:v5];

  if ((v16 & 1) == 0)
  {
    [(CRLCanvasAbstractLayout *)self->_rootLayout setChildren:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    [WeakRetained layoutInvalidated];
  }
  [v5 makeObjectsPerformSelector:@"updateChildrenFromInfo" withObject:v18];
}

- (void)invalidateLayout:(id)a3
{
  if (self->_validatingLayout != a3)
  {
    invalidLayouts = self->_invalidLayouts;
    id v5 = a3;
    [(NSMutableSet *)invalidLayouts addObject:v5];
    sub_1001AF1D4((uint64_t)v5);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    [WeakRetained canvasInvalidatedForLayout:v5];
  }
}

- (void)invalidateChildrenOfLayout:(id)a3
{
  [(NSMutableSet *)self->_invalidChildrenLayouts addObject:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  [WeakRetained layoutInvalidated];
}

- (void)invalidateLayoutForRecreation:(id)a3
{
  [(NSMutableSet *)self->_layoutsNeedingRecreating addObject:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  [WeakRetained layoutInvalidated];
}

+ (Class)effectiveLayoutClassForInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isSupported])
  {
    uint64_t v4 = [v3 layoutClass];
  }
  else
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014E91B0);
    }
    id v5 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Element is not supported: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = objc_opt_class();
  }
  id v6 = (void *)v4;

  return (Class)v6;
}

- (id)layoutForInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasLayoutController *)self layoutsForInfo:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v8 || [*(id *)(*((void *)&v14 + 1) + 8 * i) orderedBefore:v8])
        {
          id v12 = v11;

          int v8 = v12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)layoutsForInfo:(id)a3
{
  id v3 = [(NSMapTable *)self->_layoutsByInfo objectForKey:a3];
  id v4 = [v3 copy];

  return v4;
}

- (id)layoutsForInfos:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[CRLCanvasLayoutController layoutForInfo:](self, "layoutForInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 crl_addNonNilObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)layoutForInfo:(id)a3 childOfLayout:(id)a4
{
  id v6 = a4;
  [(CRLCanvasLayoutController *)self layoutsForInfo:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 parent:v14];
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)layoutsInRect:(CGRect)a3
{
  return -[CRLCanvasLayoutController layoutsInRect:deep:](self, "layoutsInRect:deep:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)layoutsInRect:(CGRect)a3 deep:(BOOL)a4
{
  return -[CRLCanvasRootLayout childLayoutsInRect:deep:](self->_rootLayout, "childLayoutsInRect:deep:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)rectOfTopLevelLayouts
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(CRLCanvasAbstractLayout *)self->_rootLayout children];
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v11 shouldBeIncludedInParentFrameForCulling])
        {
          [v11 frameForCulling];
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          if ((sub_100067C6C() & 1) == 0)
          {
            double x = sub_100064F28(x, y, width, height, v13, v15, v17, v19);
            double y = v20;
            double width = v21;
            double height = v22;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (void)validateLayouts
{
  v2 = self;
  [(CRLCanvasLayoutController *)self p_recreateLayoutsIfNeededToValidateLayouts:0];
  v63 = v2;
  if ([(NSMutableSet *)v2->_invalidChildrenLayouts count])
  {
    id v3 = [(NSMutableSet *)v2->_invalidChildrenLayouts copy];
    [(NSMutableSet *)v2->_invalidChildrenLayouts removeAllObjects];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v72 objects:v92 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v73;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v73 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v72 + 1) + 8 * i) updateChildrenFromInfo];
        }
        id v6 = [v4 countByEnumeratingWithState:&v72 objects:v92 count:16];
      }
      while (v6);
    }

    if ([(NSMutableSet *)v2->_invalidChildrenLayouts intersectsSet:v4])
    {
      id v9 = [(NSMutableSet *)v2->_invalidChildrenLayouts mutableCopy];
      [v9 intersectSet:v4];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v10 = v9;
      uint64_t v11 = (char *)[v10 countByEnumeratingWithState:&v68 objects:v91 count:16];
      if (v11)
      {
        double v12 = v11;
        uint64_t v13 = *(void *)v69;
        double v14 = &stru_101538650;
        do
        {
          double v15 = 0;
          double v16 = v14;
          do
          {
            if (*(void *)v69 != v13) {
              objc_enumerationMutation(v10);
            }
            double v17 = (objc_class *)objc_opt_class();
            double v18 = NSStringFromClass(v17);
            double v14 = +[NSString stringWithFormat:@"%@,%@", v16, v18];

            ++v15;
            double v16 = v14;
          }
          while (v12 != v15);
          double v12 = (char *)[v10 countByEnumeratingWithState:&v68 objects:v91 count:16];
        }
        while (v12);
      }
      else
      {
        double v14 = &stru_101538650;
      }

      unsigned int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E91D0);
      }
      double v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v77 = v19;
        __int16 v78 = 2082;
        v79 = "-[CRLCanvasLayoutController validateLayouts]";
        __int16 v80 = 2082;
        v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
        __int16 v82 = 1024;
        int v83 = 290;
        __int16 v84 = 2114;
        v85 = v14;
        __int16 v86 = 2112;
        id v87 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d one of these layouts had invalidateChildren while updating: %{public}@ %@", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E91F0);
      }
      v2 = v63;
      double v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v21);
      }
      double v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController validateLayouts]");
      double v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v22, v23, 290, 0, "one of these layouts had invalidateChildren while updating: %{public}@ %@", v14, v10 file lineNumber isFatal description];
    }
  }
  if ([(NSMutableSet *)v2->_invalidLayouts count])
  {
    p_vtable = CRLiOSImageHUDSlider.vtable;
    double v25 = &qword_101719A70;
    do
    {
      double v26 = v25;
      id v27 = [(NSMutableSet *)v2->_invalidLayouts copy];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v28 = v27;
      id v29 = [v28 countByEnumeratingWithState:&v64 objects:v90 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v65;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v65 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*((void *)&v64 + 1) + 8 * (void)j) i_willValidateLayout];
          }
          id v30 = [v28 countByEnumeratingWithState:&v64 objects:v90 count:16];
        }
        while (v30);
      }

      double v25 = v26;
      if (([(NSMutableSet *)v2->_invalidLayouts isSubsetOfSet:v28] & 1) == 0)
      {
        id v33 = [(NSMutableSet *)v2->_invalidLayouts copy];
        [v33 minusSet:v28];
        v34 = [v33 crl_setByMappingObjectsUsingBlock:&stru_1014E9210];
        v35 = [v34 allObjects];
        v36 = [v35 componentsJoinedByString:@","];

        unsigned int v37 = [p_vtable + 152 _atomicIncrementAssertCount];
        if (*v26 != -1) {
          dispatch_once(v26, &stru_1014E9230);
        }
        v38 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v55 = v38;
          v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 count]);
          *(_DWORD *)buf = 67110658;
          unsigned int v77 = v37;
          __int16 v78 = 2082;
          v79 = "-[CRLCanvasLayoutController validateLayouts]";
          __int16 v80 = 2082;
          v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
          __int16 v82 = 1024;
          int v83 = 310;
          __int16 v84 = 2114;
          v85 = v36;
          __int16 v86 = 2114;
          id v87 = v56;
          __int16 v88 = 2112;
          id v89 = v33;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d a layout that was not about to be validated was invalidated as part of preparation for validation %{public}@ %{public}@, %@", buf, 0x40u);
        }
        if (*v25 != -1) {
          dispatch_once(v25, &stru_1014E9250);
        }
        v39 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v57 = v39;
          v58 = [p_vtable + 152 packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v77 = v37;
          __int16 v78 = 2114;
          v79 = v58;
          _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        v40 = p_vtable + 152;
        v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController validateLayouts]");
        v42 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"];
        v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 count]);
        [v40 handleFailureInFunction:v41, v42, 310, 0, "a layout that was not about to be validated was invalidated as part of preparation for validation %{public}@ %{public}@, %@", v36, v43, v33 file lineNumber isFatal description];

        p_vtable = CRLiOSImageHUDSlider.vtable;
        v2 = v63;
      }
      [(CRLCanvasLayoutController *)v2 p_validateLayouts:v28 shouldMarkValidLayoutsThatDoNotWantValidation:1];
      if ([(NSMutableSet *)v2->_invalidLayouts intersectsSet:v28])
      {
        id v44 = [(NSMutableSet *)v2->_invalidLayouts mutableCopy];
        [v44 intersectSet:v28];
        v45 = [v44 crl_setByMappingObjectsUsingBlock:&stru_1014E9270];
        v46 = [v45 allObjects];
        v47 = [v46 componentsJoinedByString:@","];

        unsigned int v48 = [p_vtable + 152 _atomicIncrementAssertCount];
        if (*v25 != -1) {
          dispatch_once(v25, &stru_1014E9290);
        }
        v49 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v59 = v49;
          v60 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 count]);
          *(_DWORD *)buf = 67110658;
          unsigned int v77 = v48;
          __int16 v78 = 2082;
          v79 = "-[CRLCanvasLayoutController validateLayouts]";
          __int16 v80 = 2082;
          v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
          __int16 v82 = 1024;
          int v83 = 326;
          __int16 v84 = 2114;
          v85 = v47;
          __int16 v86 = 2114;
          id v87 = v60;
          __int16 v88 = 2112;
          id v89 = v44;
          _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d one of these layouts was invalidated while validating: %{public}@ %{public}@ %@", buf, 0x40u);
        }
        if (*v25 != -1) {
          dispatch_once(v25, &stru_1014E92B0);
        }
        v50 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v61 = v50;
          v62 = [p_vtable + 152 packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v77 = v48;
          __int16 v78 = 2114;
          v79 = v62;
          _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        v51 = p_vtable + 152;
        v52 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController validateLayouts]");
        v53 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"];
        v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v44 count]);
        [v51 handleFailureInFunction:v52, v53, 326, 0, "one of these layouts was invalidated while validating: %{public}@ %{public}@ %@", v47, v54, v44 file lineNumber isFatal description];

        p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
        v2 = v63;
      }
    }
    while ([(NSMutableSet *)v2->_invalidLayouts count]);
  }
}

- (id)sortLayoutsForDependencies:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = [v3 anyObject];
      id v124 = v4;
      id v68 = +[NSArray arrayWithObjects:&v124 count:1];
    }
    else
    {
      id v5 = [v3 mutableCopy];
      +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:[v3 count]];
      id v71 = v3;
      id v7 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:[v3 count]];
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v101 objects:v123 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v102;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v102 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v101 + 1) + 8 * i);
            double v14 = +[NSMutableSet set];
            [v6 setObject:v14 forKey:v13];

            double v15 = +[NSMutableSet set];
            [v7 setObject:v15 forKey:v13];
          }
          id v10 = [v8 countByEnumeratingWithState:&v101 objects:v123 count:16];
        }
        while (v10);
      }

      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id obj = v8;
      id v72 = [obj countByEnumeratingWithState:&v97 objects:v122 count:16];
      if (v72)
      {
        uint64_t v70 = *(void *)v98;
        do
        {
          for (j = 0; j != v72; j = (char *)j + 1)
          {
            if (*(void *)v98 != v70) {
              objc_enumerationMutation(obj);
            }
            double v17 = *(void **)(*((void *)&v97 + 1) + 8 * (void)j);
            double v18 = [v17 dependentLayouts];
            unsigned int v19 = +[NSMutableSet setWithArray:v18];

            double v20 = [v17 reliedOnLayouts];
            double v21 = +[NSMutableSet setWithSet:v20];

            [v21 intersectSet:v71];
            [v19 intersectSet:v71];
            long long v75 = [v7 objectForKey:v17];
            [v75 unionSet:v19];
            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v22 = v21;
            id v23 = [v22 countByEnumeratingWithState:&v93 objects:v121 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v94;
              do
              {
                for (k = 0; k != v24; k = (char *)k + 1)
                {
                  if (*(void *)v94 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  id v27 = [v7 objectForKey:*(void *)(*((void *)&v93 + 1) + 8 * (void)k)];
                  [v27 addObject:v17];
                }
                id v24 = [v22 countByEnumeratingWithState:&v93 objects:v121 count:16];
              }
              while (v24);
            }

            long long v73 = [v6 objectForKey:v17];
            [v73 unionSet:v22];
            long long v91 = 0u;
            long long v92 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            id v28 = v19;
            id v29 = [v28 countByEnumeratingWithState:&v89 objects:v120 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v90;
              do
              {
                for (m = 0; m != v30; m = (char *)m + 1)
                {
                  if (*(void *)v90 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  id v33 = [v6 objectForKey:*(void *)(*((void *)&v89 + 1) + 8 * (void)m)];
                  [v33 addObject:v17];
                }
                id v30 = [v28 countByEnumeratingWithState:&v89 objects:v120 count:16];
              }
              while (v30);
            }
          }
          id v72 = [obj countByEnumeratingWithState:&v97 objects:v122 count:16];
        }
        while (v72);
      }

      v34 = +[NSMutableSet set];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v4 = obj;
      id v35 = [v4 countByEnumeratingWithState:&v85 objects:v119 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v86;
        do
        {
          for (n = 0; n != v36; n = (char *)n + 1)
          {
            if (*(void *)v86 != v37) {
              objc_enumerationMutation(v4);
            }
            uint64_t v39 = *(void *)(*((void *)&v85 + 1) + 8 * (void)n);
            v40 = [v6 objectForKey:v39];
            if (![v40 count]) {
              [v34 addObject:v39];
            }
          }
          id v36 = [v4 countByEnumeratingWithState:&v85 objects:v119 count:16];
        }
        while (v36);
      }

      if ([v4 count])
      {
        long long v74 = v4;
        while ([v34 count])
        {
          v41 = [v34 anyObject];
          [v34 removeObject:v41];
          [v4 removeObject:v41];
          [v68 addObject:v41];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          v42 = [v7 objectForKey:v41];
          id v43 = [v42 countByEnumeratingWithState:&v77 objects:v105 count:16];
          if (v43)
          {
            id v44 = v43;
            uint64_t v45 = *(void *)v78;
            do
            {
              for (ii = 0; ii != v44; ii = (char *)ii + 1)
              {
                if (*(void *)v78 != v45) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v47 = *(void *)(*((void *)&v77 + 1) + 8 * (void)ii);
                unsigned int v48 = [v6 objectForKey:v47];
                if ([v48 count] == (id)1) {
                  [v34 addObject:v47];
                }
                else {
                  [v48 removeObject:v41];
                }
              }
              id v44 = [v42 countByEnumeratingWithState:&v77 objects:v105 count:16];
            }
            while (v44);
          }

          id v4 = v74;
          if (![v74 count]) {
            goto LABEL_75;
          }
        }
        v49 = +[NSMutableString string];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v50 = v4;
        v51 = (char *)[v50 countByEnumeratingWithState:&v81 objects:v118 count:16];
        if (v51)
        {
          v52 = v51;
          v53 = 0;
          uint64_t v54 = *(void *)v82;
          do
          {
            v55 = 0;
            v76 = v53;
            v56 = v53 + 1;
            do
            {
              if (*(void *)v82 != v54) {
                objc_enumerationMutation(v50);
              }
              v57 = (objc_class *)objc_opt_class();
              v58 = NSStringFromClass(v57);
              [v49 appendString:v58];

              if (&v55[(void)v56] < [v50 count]) {
                [v49 appendString:@", "];
              }
              ++v55;
            }
            while (v52 != v55);
            v53 = &v52[(void)v76];
            v52 = (char *)[v50 countByEnumeratingWithState:&v81 objects:v118 count:16];
          }
          while (v52);
        }

        unsigned int v59 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E92D0);
        }
        v60 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          long long v66 = v60;
          id v67 = [v50 count];
          *(_DWORD *)buf = 67110402;
          unsigned int v107 = v59;
          __int16 v108 = 2082;
          v109 = "-[CRLCanvasLayoutController sortLayoutsForDependencies:]";
          __int16 v110 = 2082;
          v111 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m";
          __int16 v112 = 1024;
          int v113 = 400;
          __int16 v114 = 2048;
          id v115 = v67;
          __int16 v116 = 2114;
          v117 = v49;
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Layout dependency loop. %lu total. %{public}@", buf, 0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E92F0);
        }
        v61 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v61);
        }
        v62 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController sortLayoutsForDependencies:]");
        v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v62, v63, 400, 0, "Layout dependency loop. %lu total. %{public}@", [v50 count], v49);

        long long v64 = [v50 allObjects];
        [v68 addObjectsFromArray:v64];

        id v4 = v74;
      }
LABEL_75:

      id v3 = v71;
    }
  }
  else
  {
    id v68 = &__NSArray0__struct;
  }

  return v68;
}

- (void)p_validateLayouts:(id)a3 shouldMarkValidLayoutsThatDoNotWantValidation:(BOOL)a4
{
  id v6 = [(CRLCanvasLayoutController *)self sortLayoutsForDependencies:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    p_validatingLayout = &self->_validatingLayout;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 shouldValidate])
        {
          objc_storeStrong((id *)&self->_validatingLayout, v12);
          [v12 validate];
          uint64_t v13 = *p_validatingLayout;
          *p_validatingLayout = 0;

          [v12 i_didValidateLayout];
        }
        else if (!a4)
        {
          continue;
        }
        [(NSMutableSet *)self->_invalidLayouts removeObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)validateLayoutsWithDependencies:(id)a3
{
  id v4 = a3;
  [(CRLCanvasLayoutController *)self p_recreateLayoutsIfNeededToValidateLayouts:v4];
  id v28 = objc_alloc_init((Class)NSMutableSet);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  id v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v7 = objc_alloc_init((Class)NSMutableSet);
        do
        {
          [v7 removeAllObjects];
          [v6 recursivelyAddLayoutAndDependentLayoutsToValidateSet:v7];
          if (![(NSMutableSet *)self->_invalidChildrenLayouts count]) {
            break;
          }
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v8 = v7;
          id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (!v9)
          {

            break;
          }
          id v10 = v9;
          char v11 = 0;
          uint64_t v12 = *(void *)v31;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v8);
              }
              long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
              if ([(NSMutableSet *)self->_invalidChildrenLayouts containsObject:v14])
              {
                [v14 updateChildrenFromInfo];
                [(NSMutableSet *)self->_invalidChildrenLayouts removeObject:v14];
                [(NSMutableSet *)self->_invalidLayouts addObject:v14];
                char v11 = 1;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v10);
        }
        while ((v11 & 1) != 0);
        long long v15 = [v6 rootLayout];
        long long v16 = [(CRLCanvasLayoutController *)self rootLayout];

        if (v15 == v16) {
          [v7 intersectSet:self->_invalidLayouts];
        }
        [v28 unionSet:v7];
      }
      id v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v29);
  }

  [(CRLCanvasLayoutController *)self p_validateLayouts:v28 shouldMarkValidLayoutsThatDoNotWantValidation:0];
  p_canvas = &self->_canvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  uint64_t v19 = [WeakRetained delegate];
  if (!v19) {
    goto LABEL_27;
  }
  double v20 = (void *)v19;
  id v21 = objc_loadWeakRetained((id *)p_canvas);
  id v22 = [v21 delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_canvas);
    id v24 = [WeakRetained delegate];
    id v25 = objc_loadWeakRetained((id *)p_canvas);
    [v24 canvasDidValidateLayoutsWithDependencies:v25];

LABEL_27:
  }
}

- (void)validateLayoutWithDependencies:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  [(CRLCanvasLayoutController *)self validateLayoutsWithDependencies:v4];
}

- (id)validatedLayoutForInfo:(id)a3
{
  id v3 = [(CRLCanvasLayoutController *)self validatedLayoutsForInfo:a3];
  id v4 = [v3 anyObject];

  return v4;
}

- (id)validatedLayoutsForInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasLayoutController *)self layoutsForInfo:v4];
  if (!v5)
  {
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "effectiveLayoutClassForInfo:", v4)), "initWithInfo:", v4);
    if (v6)
    {
      id v5 = +[NSSet setWithObject:v6];
      [(CRLCanvasAbstractLayout *)self->_rootLayout addChild:v6];
      [(NSMutableSet *)self->_invalidChildrenLayouts addObject:v6];
      [(NSMutableSet *)self->_invalidLayouts addObject:v6];
    }
    else
    {
      id v5 = 0;
    }
  }
  if ([v5 count]
    && [(NSMutableSet *)self->_invalidChildrenLayouts intersectsSet:v5])
  {
    [v5 makeObjectsPerformSelector:"updateChildrenFromInfo"];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [(NSMutableSet *)self->_invalidChildrenLayouts removeObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }
  }
  if ([v5 count]
    && [(NSMutableSet *)self->_invalidLayouts intersectsSet:v5])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v5;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[CRLCanvasLayoutController validateLayoutWithDependencies:](self, "validateLayoutWithDependencies:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
        }
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }

  return v5;
}

- (id)validatedLayoutForInfo:(id)a3 childOfLayout:(id)a4
{
  id v6 = a4;
  [(CRLCanvasLayoutController *)self validatedLayoutsForInfo:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        char v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 parent:v14];
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)notifyThatLayoutsChangedOutsideOfLayout
{
  if (+[NSThread isMainThread])
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"CRLCanvasLayoutsChangedForCanvasNotification" object:self];
  }
  else
  {
    Main = CFRunLoopGetMain();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002AC5EC;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
    CFRunLoopWakeUp(Main);
  }
}

- (void)i_registerLayout:(id)a3
{
  id v7 = a3;
  [v7 willBeAddedToLayoutController:self];
  if (v7 && self->_layoutsByInfo)
  {
    id v4 = [v7 info];
    if (v4)
    {
      id v5 = [(NSMapTable *)self->_layoutsByInfo objectForKey:v4];
      if (!v5)
      {
        id v5 = +[NSMutableSet set];
        [(NSMapTable *)self->_layoutsByInfo setObject:v5 forKey:v4];
      }
      [v5 addObject:v7];
      [(CRLCanvasLayoutChangeObserver *)self->_layoutRegistrationObserver i_layoutRegistered:v7];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  [WeakRetained layoutInvalidated];
}

- (void)i_unregisterLayout:(id)a3
{
  id v8 = a3;
  [v8 willBeRemovedFromLayoutController:self];
  if (v8 && self->_layoutsByInfo)
  {
    id v4 = [v8 info];
    if (v4)
    {
      id v5 = [(NSMapTable *)self->_layoutsByInfo objectForKey:v4];
      id v6 = v5;
      if (v5)
      {
        [v5 removeObject:v8];
        if (![v6 count]) {
          [(NSMapTable *)self->_layoutsByInfo removeObjectForKey:v4];
        }
      }
      [(CRLCanvasLayoutChangeObserver *)self->_layoutRegistrationObserver i_layoutUnregistered:v8];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  [WeakRetained layoutInvalidated];

  [(NSMutableSet *)self->_invalidLayouts removeObject:v8];
  [(NSMutableSet *)self->_invalidChildrenLayouts removeObject:v8];
}

- (void)i_removeAllLayouts
{
  [(CRLCanvasAbstractLayout *)self->_rootLayout setChildren:&__NSArray0__struct];
  [(NSMapTable *)self->_layoutsByInfo removeAllObjects];
  [(NSMutableSet *)self->_invalidLayouts removeAllObjects];
  invalidChildrenLayouts = self->_invalidChildrenLayouts;

  [(NSMutableSet *)invalidChildrenLayouts removeAllObjects];
}

- (void)i_enumerateLayoutsUsingBlock:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMapTable *)self->_layoutsByInfo objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1002AC9F0;
        v11[3] = &unk_1014E9318;
        id v12 = v4;
        [v10 enumerateObjectsUsingBlock:v11];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)p_recreateLayoutsIfNeededToValidateLayouts:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_layoutsNeedingRecreating count])
  {
    if ([v4 intersectsSet:self->_layoutsNeedingRecreating])
    {
      int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9338);
      }
      id v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101096F00(v5, v6);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9358);
      }
      id v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v7);
      }
      uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutController p_recreateLayoutsIfNeededToValidateLayouts:]");
      uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:637 isFatal:0 description:"Shouldn't be validating layouts that need recreating"];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = self->_layoutsNeedingRecreating;
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v16 = objc_opt_class();
          long long v17 = [v15 info:v22];
          id v18 = objc_alloc((Class)[v16 effectiveLayoutClassForInfo:v17]);
          long long v19 = [v15 info];
          id v20 = [v18 initWithInfo:v19];

          [(NSMutableSet *)self->_invalidLayouts removeObject:v15];
          [(NSMutableSet *)self->_invalidLayouts addObject:v20];
          long long v21 = [v15 parent];
          [v21 replaceChild:v15 with:v20];

          [(CRLCanvasLayoutController *)self invalidateChildrenOfLayout:v20];
        }
        id v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    [(NSMutableSet *)self->_layoutsNeedingRecreating removeAllObjects];
  }
}

- (CRLCanvas)canvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);

  return (CRLCanvas *)WeakRetained;
}

- (CRLCanvasRootLayout)rootLayout
{
  return self->_rootLayout;
}

- (CRLCanvasLayoutChangeObserver)i_layoutRegistrationObserver
{
  return self->_layoutRegistrationObserver;
}

- (void)setI_layoutRegistrationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRegistrationObserver, 0);
  objc_storeStrong((id *)&self->_validatingLayout, 0);
  objc_storeStrong((id *)&self->_invalidChildrenLayouts, 0);
  objc_storeStrong((id *)&self->_layoutsNeedingRecreating, 0);
  objc_storeStrong((id *)&self->_invalidLayouts, 0);
  objc_storeStrong((id *)&self->_layoutsByInfo, 0);
  objc_storeStrong((id *)&self->_rootLayout, 0);

  objc_destroyWeak((id *)&self->_canvas);
}

@end