@interface _UIViewLayoutFeedbackLoopDebugger
+ (id)layoutFeedbackLoopDebugger;
+ (void)createLayoutFeedbackLoopDebuggerForUnitTests;
+ (void)destroyLayoutFeedbackLoopDebuggerForUnitTests;
- (UIView)currentLayoutView;
- (id)description;
- (id)topLevelViewHierarchyTrace;
- (id)turningPointViewsCreateIfNecessary;
- (id)viewsWithChangingGeometryCreateIfNecessary;
- (id)viewsWithVariableChangesTriggeringLayoutCreateIfNecessary;
- (void)_recordSetNeedsLayoutToLayerOfView:(id)a3;
- (void)didEnterLayoutSublayersOfLayerForView:(id)a3;
- (void)didSendLayoutSubviewsToView:(id)a3;
- (void)didSendViewDidLayoutSubviewsToViewControllerOfView:(id)a3;
- (void)didSendViewWillLayoutSubviewsToViewControllerOfView:(id)a3;
- (void)didUpdateLayoutMargins:(UIEdgeInsets)a3 ofView:(id)a4;
- (void)didUpdateSafeAreaInsets:(UIEdgeInsets)a3 ofView:(id)a4;
- (void)dumpInfoWithInfoCollectionSuccess:(BOOL)a3;
- (void)setCurrentLayoutView:(id)a3;
- (void)willChangeGeometryForLayerOfView:(id)a3;
- (void)willExitLayoutSublayersOfLayerForView:(id)a3;
- (void)willSendLayoutSubviewsToView:(id)a3;
- (void)willSendSetAnchorPoint:(CGPoint)a3 toLayerOfView:(id)a4;
- (void)willSendSetBounds:(CGRect)a3 toLayerOfView:(id)a4;
- (void)willSendSetFrame:(CGRect)a3 toLayerOfView:(id)a4;
- (void)willSendSetNeedsLayoutToView:(id)a3 becauseOfChangeInVariable:(id)a4 inLayoutEngine:(id)a5;
- (void)willSendSetPosition:(CGPoint)a3 toLayerOfView:(id)a4;
- (void)willSendViewDidLayoutSubviewsToViewControllerOfView:(id)a3;
- (void)willSendViewWillLayoutSubviewsToViewControllerOfView:(id)a3;
@end

@implementation _UIViewLayoutFeedbackLoopDebugger

+ (id)layoutFeedbackLoopDebugger
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___UIViewLayoutFeedbackLoopDebugger_layoutFeedbackLoopDebugger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25EA48 != -1) {
    dispatch_once(&qword_1EB25EA48, block);
  }
  v2 = (void *)qword_1EB25EA40;
  return v2;
}

- (void)didEnterLayoutSublayersOfLayerForView:(id)a3
{
  id v5 = a3;
  if (self->_debuggingState >= 2)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_currentLayoutView, a3);
    objc_msgSend(v6, "_lfld_pushCurrentLayoutMethodName:", @"layoutSublayersOfLayer:");
    id v5 = v6;
  }
}

- (void)willExitLayoutSublayersOfLayerForView:(id)a3
{
  if (self->_debuggingState >= 2)
  {
    currentLayoutView = self->_currentLayoutView;
    self->_currentLayoutView = 0;
    id v4 = a3;

    objc_msgSend(v4, "_lfld_discardLastCurrentLayoutMethodName");
  }
}

- (void)willSendLayoutSubviewsToView:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = (UIView *)a3;
  [(UIView *)v5 _lfld_incrementCount];
  [(UIView *)v5 _lfld_prepareToResetCountIfNecessary];
  uint64_t v6 = [(UIView *)v5 _lfld_count];
  uint64_t v7 = qword_1EB25EA68;
  if (v6 > qword_1EB25EA68)
  {
    self->_debuggingState = 3;
LABEL_6:
    [(_UIViewLayoutFeedbackLoopDebugger *)self dumpInfoWithInfoCollectionSuccess:v6 <= v7];
    goto LABEL_7;
  }
  switch(self->_debuggingState)
  {
    case 0:
      uint64_t v8 = [(UIView *)v5 _lfld_count];
      if (v8 != qword_1EB25EA50) {
        goto LABEL_7;
      }
      objc_storeStrong((id *)&self->_rootView, a3);
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      layoutList = self->_layoutList;
      self->_layoutList = v9;

      v11 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v5, 0);
      involvedViews = self->_involvedViews;
      self->_involvedViews = v11;

      int64_t v13 = 1;
      goto LABEL_56;
    case 1:
      [(NSMutableArray *)self->_layoutList addObject:v5];
      [(NSMutableSet *)self->_involvedViews addObject:v5];
      p_rootView = &self->_rootView;
      rootView = self->_rootView;
      if (rootView != v5 && [(UIView *)rootView isDescendantOfView:v5]) {
        objc_storeStrong((id *)&self->_rootView, a3);
      }
      uint64_t v16 = [(NSMutableArray *)self->_layoutList count];
      if (v16 != qword_1EB25EA60) {
        goto LABEL_7;
      }
      self->_rootViewConfirmed = 1;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v17 = self->_involvedViews;
      uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v57 objects:v68 count:16];
      if (!v18) {
        goto LABEL_27;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v58;
      break;
    case 2:
      if (self->_rootView == v5)
      {
        int64_t rootViewLayoutCount = self->_rootViewLayoutCount;
        self->_int64_t rootViewLayoutCount = rootViewLayoutCount + 1;
        if (rootViewLayoutCount >= 10) {
          self->_debuggingState = 3;
        }
      }
      [(UIView *)v5 _lfld_pushCurrentLayoutMethodName:@"layoutSubviews"];
      v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutLoop", &qword_1EB25EA78) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        v25 = [(UIView *)v5 _lfld_minimalDescription];
        v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412802;
        v62 = @"layoutSubviews";
        __int16 v63 = 2112;
        v64 = v25;
        __int16 v65 = 2112;
        v66 = v26;
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "About to send -%@ to %@. \n%@", buf, 0x20u);
      }
      goto LABEL_7;
    case 3:
      goto LABEL_6;
    default:
      goto LABEL_7;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v58 != v20) {
        objc_enumerationMutation(v17);
      }
      if (([*(id *)(*((void *)&v57 + 1) + 8 * i) isDescendantOfView:*p_rootView] & 1) == 0)
      {
        self->_rootViewConfirmed = 0;
        goto LABEL_27;
      }
    }
    uint64_t v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_27:

  if (self->_rootViewConfirmed)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28 = (void *)[(NSMutableArray *)self->_layoutList copy];
    uint64_t v29 = [v28 indexOfObject:self->_rootView];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = v28;
    }
    else
    {
      v31 = (void *)MEMORY[0x1E4F1CBF0];
      do
      {
        unint64_t v32 = v29 + 1;
        v33 = objc_msgSend(v28, "subarrayWithRange:", 0, v29 + 1);
        [v27 addObject:v33];

        v30 = v31;
        if (v32 < [v28 count])
        {
          v30 = objc_msgSend(v28, "subarrayWithRange:", v32, objc_msgSend(v28, "count") - v32);
        }

        uint64_t v29 = [v30 indexOfObject:*p_rootView];
        v28 = v30;
      }
      while (v29 != 0x7FFFFFFFFFFFFFFFLL);
    }
    if ([v27 count]) {
      [v27 removeObjectAtIndex:0];
    }
    if ((unint64_t)[v27 count] < 2) {
      goto LABEL_54;
    }
    v34 = [v27 firstObject];
    self->_feedbackLoopConfirmed = 1;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v35 = v27;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v54;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          if (([*(id *)(*((void *)&v53 + 1) + 8 * j) isEqualToArray:v34] & 1) == 0)
          {
            self->_feedbackLoopConfirmed = 0;
            goto LABEL_47;
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }
LABEL_47:

    if (self->_feedbackLoopConfirmed)
    {
      v40 = v34;
      reducedLayoutList = self->_reducedLayoutList;
      self->_reducedLayoutList = v40;
    }
    else
    {
      if ((unint64_t)[v35 count] < 4)
      {
LABEL_50:
        if (self->_feedbackLoopConfirmed)
        {
          uint64_t v42 = [(NSMutableSet *)self->_involvedViews count];
          v43 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_reducedLayoutList];
          uint64_t v44 = [v43 count];

          if (v42 != v44) {
            self->_feedbackLoopConfirmed = 0;
          }
        }

LABEL_54:
        goto LABEL_55;
      }
      self->_feedbackLoopConfirmed = 1;
      v45 = [v35 firstObject];
      v46 = [v35 objectAtIndexedSubscript:1];
      obuint64_t j = [v45 arrayByAddingObjectsFromArray:v46];

      if ((unint64_t)([v35 count] - 4) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        unint64_t v47 = 2;
        while (1)
        {
          v48 = [v35 objectAtIndexedSubscript:v47];
          unint64_t v49 = v47 + 1;
          v50 = [v35 objectAtIndexedSubscript:v49];
          v51 = [v48 arrayByAddingObjectsFromArray:v50];

          if (([v51 isEqualToArray:obj] & 1) == 0) {
            break;
          }

          unint64_t v47 = v49 + 1;
          if (v47 >= [v35 count] - 1) {
            goto LABEL_64;
          }
        }
        self->_feedbackLoopConfirmed = 0;
      }
LABEL_64:
      reducedLayoutList = obj;
      if (self->_feedbackLoopConfirmed) {
        objc_storeStrong((id *)&self->_reducedLayoutList, obj);
      }
    }

    goto LABEL_50;
  }
LABEL_55:
  int64_t v13 = 2;
LABEL_56:
  self->_debuggingState = v13;
LABEL_7:
}

- (void)didSendLayoutSubviewsToView:(id)a3
{
  if (self->_debuggingState >= 2) {
    objc_msgSend(a3, "_lfld_discardLastCurrentLayoutMethodName");
  }
}

- (void)willSendViewWillLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2) {
    objc_msgSend(a3, "_lfld_pushCurrentLayoutMethodName:", @"viewWillLayoutSubviews");
  }
}

- (void)didSendViewWillLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2) {
    objc_msgSend(a3, "_lfld_discardLastCurrentLayoutMethodName");
  }
}

- (void)willSendViewDidLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2) {
    objc_msgSend(a3, "_lfld_pushCurrentLayoutMethodName:", @"viewDidLayoutSubviews");
  }
}

- (void)didSendViewDidLayoutSubviewsToViewControllerOfView:(id)a3
{
  if (self->_debuggingState >= 2) {
    objc_msgSend(a3, "_lfld_discardLastCurrentLayoutMethodName");
  }
}

- (id)viewsWithVariableChangesTriggeringLayoutCreateIfNecessary
{
  viewsWithVariableChangesTriggeringLayout = self->_viewsWithVariableChangesTriggeringLayout;
  if (!viewsWithVariableChangesTriggeringLayout)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_viewsWithVariableChangesTriggeringLayout;
    self->_viewsWithVariableChangesTriggeringLayout = v4;

    viewsWithVariableChangesTriggeringLayout = self->_viewsWithVariableChangesTriggeringLayout;
  }
  return viewsWithVariableChangesTriggeringLayout;
}

- (void)willSendSetNeedsLayoutToView:(id)a3 becauseOfChangeInVariable:(id)a4 inLayoutEngine:(id)a5
{
  if (self->_debuggingState >= 2)
  {
    id v7 = a5;
    id v8 = a4;
    id v10 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithVariableChangesTriggeringLayoutCreateIfNecessary];
    v9 = [v8 delegate];
    [v10 addObject:v9];
    objc_msgSend(v9, "_lfld_addVariableChangeRecordForVariable:inLayoutEngine:", v8, v7);
  }
}

- (id)turningPointViewsCreateIfNecessary
{
  turningPointViews = self->_turningPointViews;
  if (!turningPointViews)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_turningPointViews;
    self->_turningPointViews = v4;

    turningPointViews = self->_turningPointViews;
  }
  return turningPointViews;
}

- (void)_recordSetNeedsLayoutToLayerOfView:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (UIView *)a3;
  if (self->_debuggingState >= 2)
  {
    currentLayoutView = self->_currentLayoutView;
    if (!currentLayoutView)
    {
      if (self->_rootView != v4) {
        goto LABEL_13;
      }
      uint64_t v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutLoop", &qword_1EB25EA88) + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v14 = v16;
      v17 = [(UIView *)v4 _lfld_minimalDescription];
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v19 = 138412546;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "About to send -setNeedsLayout to layer for %@ \n%@", (uint8_t *)&v19, 0x16u);

LABEL_10:
LABEL_11:
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      [(UIView *)v4 _lfld_addSetNeedsLayoutCallStack:v15];

      goto LABEL_13;
    }
    BOOL v6 = [(UIView *)currentLayoutView isDescendantOfView:v4];
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutLoop", &qword_1EB25EA80) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v6) {
        id v8 = @">>>UPSTREAM LAYOUT DIRTYING<<< ";
      }
      else {
        id v8 = &stru_1ED0E84C0;
      }
      v9 = v7;
      id v10 = [(UIView *)v4 _lfld_minimalDescription];
      v11 = [(UIView *)self->_currentLayoutView _lfld_currentLayoutMethodName];
      v12 = [(UIView *)self->_currentLayoutView _lfld_minimalDescription];
      int64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v19 = 138413314;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@About to send -setNeedsLayout to layer for %@ under -%@ for %@ \n%@", (uint8_t *)&v19, 0x34u);
    }
    if (v6)
    {
      v14 = [(_UIViewLayoutFeedbackLoopDebugger *)self turningPointViewsCreateIfNecessary];
      [v14 addObject:v4];
      goto LABEL_10;
    }
  }
LABEL_13:
}

- (id)viewsWithChangingGeometryCreateIfNecessary
{
  viewsWithChangingGeometry = self->_viewsWithChangingGeometry;
  if (!viewsWithChangingGeometry)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_viewsWithChangingGeometry;
    self->_viewsWithChangingGeometry = v4;

    viewsWithChangingGeometry = self->_viewsWithChangingGeometry;
  }
  return viewsWithChangingGeometry;
}

- (void)willChangeGeometryForLayerOfView:(id)a3
{
  id v11 = a3;
  id v4 = [v11 layer];
  int v5 = [v4 needsLayoutOnGeometryChange];

  BOOL v6 = v11;
  if (v5)
  {
    [(_UIViewLayoutFeedbackLoopDebugger *)self willSendSetNeedsLayoutToLayerOfView:v11];
    id v7 = [v11 superview];
    id v8 = v7;
    if (v7)
    {
      v9 = [v7 layer];
      char v10 = [v9 layoutIsActive];

      if ((v10 & 1) == 0) {
        [(_UIViewLayoutFeedbackLoopDebugger *)self willSendSetNeedsLayoutToLayerOfView:v8];
      }
    }

    BOOL v6 = v11;
  }
}

- (void)willSendSetBounds:(CGRect)a3 toLayerOfView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  -[_UIViewLayoutFeedbackLoopDebugger willChangeGeometryForLayerOfView:](self, "willChangeGeometryForLayerOfView:");
  if (self->_debuggingState >= 2)
  {
    v9 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithChangingGeometryCreateIfNecessary];
    [v9 addObject:v11];
    char v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    objc_msgSend(v11, "_lfld_addGeometryChangeRecordWithPropertyName:value:", @"bounds", v10);
  }
}

- (void)willSendSetPosition:(CGPoint)a3 toLayerOfView:(id)a4
{
  if (self->_debuggingState >= 2)
  {
    double y = a3.y;
    double x = a3.x;
    id v7 = a4;
    id v9 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithChangingGeometryCreateIfNecessary];
    [v9 addObject:v7];
    id v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    objc_msgSend(v7, "_lfld_addGeometryChangeRecordWithPropertyName:value:", @"center", v8);
  }
}

- (void)willSendSetFrame:(CGRect)a3 toLayerOfView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  -[_UIViewLayoutFeedbackLoopDebugger willChangeGeometryForLayerOfView:](self, "willChangeGeometryForLayerOfView:");
  if (self->_debuggingState >= 2)
  {
    id v9 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithChangingGeometryCreateIfNecessary];
    [v9 addObject:v11];
    char v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    objc_msgSend(v11, "_lfld_addGeometryChangeRecordWithPropertyName:value:", @"frame", v10);
  }
}

- (void)willSendSetAnchorPoint:(CGPoint)a3 toLayerOfView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  -[_UIViewLayoutFeedbackLoopDebugger willChangeGeometryForLayerOfView:](self, "willChangeGeometryForLayerOfView:");
  if (self->_debuggingState >= 2)
  {
    id v7 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithChangingGeometryCreateIfNecessary];
    [v7 addObject:v9];
    id v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    objc_msgSend(v9, "_lfld_addGeometryChangeRecordWithPropertyName:value:", @"anchorPoint", v8);
  }
}

- (void)didUpdateSafeAreaInsets:(UIEdgeInsets)a3 ofView:(id)a4
{
  if (self->_debuggingState >= 2)
  {
    double right = a3.right;
    double bottom = a3.bottom;
    double left = a3.left;
    double top = a3.top;
    id v9 = a4;
    id v11 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithChangingGeometryCreateIfNecessary];
    [v11 addObject:v9];
    char v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", top, left, bottom, right);
    objc_msgSend(v9, "_lfld_addGeometryChangeRecordWithPropertyName:value:", @"safeAreaInsets", v10);
  }
}

- (void)didUpdateLayoutMargins:(UIEdgeInsets)a3 ofView:(id)a4
{
  if (self->_debuggingState >= 2)
  {
    double right = a3.right;
    double bottom = a3.bottom;
    double left = a3.left;
    double top = a3.top;
    id v9 = a4;
    id v11 = [(_UIViewLayoutFeedbackLoopDebugger *)self viewsWithChangingGeometryCreateIfNecessary];
    [v11 addObject:v9];
    char v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", top, left, bottom, right);
    objc_msgSend(v9, "_lfld_addGeometryChangeRecordWithPropertyName:value:", @"layoutMargins", v10);
  }
}

- (void)dumpInfoWithInfoCollectionSuccess:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(@"Degenerate layout!", "mutableCopy", a3);
  int v5 = v4;
  if (self->_feedbackLoopConfirmed)
  {
    [v4 appendString:@" Layout feedback loop detected"];
    if (self->_rootViewConfirmed)
    {
      BOOL v6 = [(UIView *)self->_rootView _lfld_description];
      [v5 appendFormat:@" in subtree of %@. ", v6];
    }
    else
    {
      BOOL v6 = [(NSMutableSet *)self->_involvedViews allObjects];
      id v7 = _UIViewLFLDDescriptionForArray(v6);
      [v5 appendFormat:@" involving\n%@\n", v7];
    }
  }
  else
  {
    BOOL v6 = [(UIView *)self->_rootView _lfld_description];
    [v5 appendFormat:@" Layout feedback loop suspected in subtree of %@, but the information is incomplete. ", v6];
  }

  id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutLoop", &dumpInfoWithInfoCollectionSuccess____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    int64_t v13 = self;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%@\n%@", buf, 0x16u);
  }
  [v5 appendFormat:@"More info may be available in the log for %s.%@", "com.apple.UIKit", @"LayoutLoop"];
  id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v5 userInfo:0];
  [v9 raise];
}

- (id)description
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[@"\n" mutableCopy];
  id v4 = v3;
  if (!self->_feedbackLoopConfirmed)
  {
    if (qword_1EB25EA50 >= 10000)
    {
      [v3 appendFormat:@"Unable to confirm the layout feedback loop. %@\n", @"The following information is likely to be incomplete."];
    }
    else
    {
      int v5 = [NSString stringWithFormat:@"The loop trigger threshold is %ld and may be too low. Use the -%s launch argument to try a higher threshold, up to %ld.", qword_1EB25EA50, "UIViewLayoutFeedbackLoopDebuggingThreshold", 10000];
      [v4 appendFormat:@"Unable to confirm the layout feedback loop. %@\n", v5];
    }
  }
  rootView = self->_rootView;
  if (rootView)
  {
    id v7 = [(UIView *)rootView _lfld_description];
    [v4 appendFormat:@"Top-level view = %@\n\n", v7];
  }
  if ((unint64_t)[(NSMutableSet *)self->_involvedViews count] >= 2)
  {
    id v8 = [(_UIViewLayoutFeedbackLoopDebugger *)self topLevelViewHierarchyTrace];
    [v4 appendFormat:@"Views caught in loop: %@\n\n", v8];
  }
  if ([(NSArray *)self->_reducedLayoutList count])
  {
    id v9 = _UIViewLFLDDescriptionForArray(self->_reducedLayoutList);
    [v4 appendFormat:@"Views receiving layout in order: %@\n\n", v9];
  }
  uint64_t v10 = [(NSMutableSet *)self->_viewsWithVariableChangesTriggeringLayout count];
  uint64_t v11 = [(NSMutableSet *)self->_viewsWithChangingGeometry count];
  uint64_t v59 = v10;
  if (v10)
  {
    [v4 appendString:@"\n*** Views With Variable Changes Triggering Layout ***\n"];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = self->_viewsWithVariableChangesTriggeringLayout;
    uint64_t v63 = [(NSMutableSet *)obj countByEnumeratingWithState:&v88 objects:v96 count:16];
    if (v63)
    {
      uint64_t v61 = *(void *)v89;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v89 != v61) {
            objc_enumerationMutation(obj);
          }
          uint64_t v64 = v12;
          int64_t v13 = *(void **)(*((void *)&v88 + 1) + 8 * v12);
          uint64_t v14 = objc_msgSend(v13, "_lfld_minimalDescription");
          v15 = objc_msgSend(v13, "_lfld_variableChangeRecords");
          [v4 appendFormat:@"\nVariable change records for %@:\n%@\n", v14, v15];

          char v62 = [v13 hasAmbiguousLayout];
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          objc_msgSend(v13, "_lfld_variableChangeRecords");
          id v68 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [v68 countByEnumeratingWithState:&v84 objects:v95 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v85;
            uint64_t v65 = *(void *)v85;
            id v66 = v16;
            do
            {
              uint64_t v20 = 0;
              uint64_t v67 = v18;
              do
              {
                if (*(void *)v85 != v19) {
                  objc_enumerationMutation(v68);
                }
                __int16 v21 = [*(id *)(*((void *)&v84 + 1) + 8 * v20) variable];
                if (([v16 containsObject:v21] & 1) == 0)
                {
                  [v16 addObject:v21];
                  v22 = [v21 delegate];
                  if (([v22 conformsToProtocol:&unk_1ED400E78] & 1) == 0)
                  {

                    v22 = 0;
                  }
                  __int16 v23 = [v22 _referenceView];
                  if (v23)
                  {
                    v70 = v22;
                    uint64_t v71 = v20;
                    id v69 = v23;
                    v24 = objc_msgSend(v23, "_lfld_constraintsAffectingVariableValueChanges");
                    __int16 v25 = [v24 objectForKey:v21];

                    long long v82 = 0u;
                    long long v83 = 0u;
                    long long v80 = 0u;
                    long long v81 = 0u;
                    v26 = [v25 keyEnumerator];
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v80 objects:v94 count:16];
                    if (v27)
                    {
                      uint64_t v28 = v27;
                      uint64_t v29 = *(void *)v81;
                      do
                      {
                        for (uint64_t i = 0; i != v28; ++i)
                        {
                          if (*(void *)v81 != v29) {
                            objc_enumerationMutation(v26);
                          }
                          uint64_t v31 = *(void *)(*((void *)&v80 + 1) + 8 * i);
                          unint64_t v32 = [v25 objectForKey:v31];
                          [v4 appendFormat:@"\nConstraints contributing to value of %@ for %@\n %@\n", v31, v21, v32];
                        }
                        uint64_t v28 = [v26 countByEnumeratingWithState:&v80 objects:v94 count:16];
                      }
                      while (v28);
                    }

                    uint64_t v19 = v65;
                    id v16 = v66;
                    uint64_t v18 = v67;
                    v22 = v70;
                    uint64_t v20 = v71;
                    __int16 v23 = v69;
                  }
                }
                ++v20;
              }
              while (v20 != v18);
              uint64_t v18 = [v68 countByEnumeratingWithState:&v84 objects:v95 count:16];
            }
            while (v18);
          }

          uint64_t v12 = v64 + 1;
        }
        while (v64 + 1 != v63);
        uint64_t v63 = [(NSMutableSet *)obj countByEnumeratingWithState:&v88 objects:v96 count:16];
      }
      while (v63);
      goto LABEL_49;
    }
LABEL_48:
    char v62 = 0;
LABEL_49:

    goto LABEL_50;
  }
  if (v11)
  {
    [v4 appendString:@"\n*** Views With Geometry Changes ***\n"];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = self->_viewsWithChangingGeometry;
    uint64_t v33 = [(NSMutableSet *)obj countByEnumeratingWithState:&v76 objects:v93 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v77 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          uint64_t v38 = objc_msgSend(v37, "_lfld_minimalDescription");
          v39 = objc_msgSend(v37, "_lfld_geometryChangeRecords");
          [v4 appendFormat:@"Geometry change records for %@:\n%@\n", v38, v39];
        }
        uint64_t v34 = [(NSMutableSet *)obj countByEnumeratingWithState:&v76 objects:v93 count:16];
      }
      while (v34);
    }
    goto LABEL_48;
  }
  char v62 = 0;
LABEL_50:
  v40 = [(UIView *)self->_rootView _lfld_setNeedsLayoutCallStacks];
  uint64_t v41 = [v40 count];

  if (v41)
  {
    uint64_t v42 = [(UIView *)self->_rootView _lfld_setNeedsLayoutCallStacks];
    v43 = v42;
    if (v59)
    {
      uint64_t v44 = [v42 anyObject];
      [v4 appendFormat:@"\n*** Representative call stack where -setNeedsLayout is sent to the top-level view ***\n%@\n", v44];
    }
    else
    {
      [v4 appendFormat:@"\n*** Call stacks where -setNeedsLayout is sent to the top-level view ***\n%@\n", v42];
    }
  }
  if ((unint64_t)[(NSMutableSet *)self->_turningPointViews count] > 1
    || [(NSMutableSet *)self->_turningPointViews count] == 1
    && ([(NSMutableSet *)self->_turningPointViews anyObject],
        v45 = (UIView *)objc_claimAutoreleasedReturnValue(),
        v46 = self->_rootView,
        v45,
        v45 != v46))
  {
    [v4 appendString:@"\n*** Additional (non-top-level) Views Receiving Upstream Layout Dirtying ***\n"];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    unint64_t v47 = self;
    v48 = self->_turningPointViews;
    uint64_t v49 = [(NSMutableSet *)v48 countByEnumeratingWithState:&v72 objects:v92 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v73 != v51) {
            objc_enumerationMutation(v48);
          }
          long long v53 = *(UIView **)(*((void *)&v72 + 1) + 8 * k);
          if (v53 != v47->_rootView)
          {
            long long v54 = objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * k), "_lfld_minimalDescription");
            long long v55 = [(UIView *)v53 _lfld_setNeedsLayoutCallStacks];
            [v4 appendFormat:@"\n\t>>> Call stacks where -setNeedsLayout is sent upstream to %@\n%@\n", v54, v55];
          }
        }
        uint64_t v50 = [(NSMutableSet *)v48 countByEnumeratingWithState:&v72 objects:v92 count:16];
      }
      while (v50);
    }
  }
  if (v62)
  {
    id v56 = [NSString stringWithFormat:@"Ambiguous layout suspected as a cause of this layout feedback loop.%@", v4];
  }
  else
  {
    id v56 = v4;
  }
  long long v57 = v56;

  return v57;
}

- (id)topLevelViewHierarchyTrace
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__242;
  uint64_t v11 = __Block_byref_object_dispose__242;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIViewLayoutFeedbackLoopDebugger_topLevelViewHierarchyTrace__block_invoke;
  v6[3] = &unk_1E53108F0;
  v6[4] = self;
  v6[5] = &v7;
  v2 = _Block_copy(v6);
  v3 = (void *)v8[5];
  v8[5] = (uint64_t)v2;

  id v4 = (*(void (**)(void))(v8[5] + 16))();
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (UIView)currentLayoutView
{
  return self->_currentLayoutView;
}

- (void)setCurrentLayoutView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutView, 0);
  objc_storeStrong((id *)&self->_reducedLayoutList, 0);
  objc_storeStrong((id *)&self->_layoutList, 0);
  objc_storeStrong((id *)&self->_involvedViews, 0);
  objc_storeStrong((id *)&self->_turningPointViews, 0);
  objc_storeStrong((id *)&self->_viewsWithVariableChangesTriggeringLayout, 0);
  objc_storeStrong((id *)&self->_viewsWithChangingGeometry, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
}

+ (void)createLayoutFeedbackLoopDebuggerForUnitTests
{
  if (!qword_1EB25EA40)
  {
    qword_1EB25EA50 = 100;
    qword_1EB25EA60 = 100;
    qword_1EB25EA68 = 1000;
    id v2 = objc_alloc_init((Class)a1);
    v3 = (void *)qword_1EB25EA40;
    qword_1EB25EA40 = (uint64_t)v2;
  }
}

+ (void)destroyLayoutFeedbackLoopDebuggerForUnitTests
{
  qword_1EB25EA50 = 0;
  qword_1EB25EA60 = 0;
  qword_1EB25EA68 = 0;
  id v2 = (void *)qword_1EB25EA40;
  qword_1EB25EA40 = 0;
}

@end