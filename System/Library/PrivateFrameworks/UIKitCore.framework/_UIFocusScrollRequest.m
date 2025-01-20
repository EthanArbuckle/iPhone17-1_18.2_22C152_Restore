@interface _UIFocusScrollRequest
- (CGPoint)originatingContentOffset;
- (CGPoint)resolveTargetContentOffsetUsingScrollOffsetResolverClamped:(BOOL)a3;
- (CGPoint)targetContentOffset;
- (CGRect)focusItemFrame;
- (CGRect)originatingBounds;
- (_UIFocusEnvironmentScrollableContainerTuple)environmentScrollableContainer;
- (_UIFocusItemInfo)focusItemInfo;
- (_UIFocusMovementInfo)focusMovement;
- (_UIFocusScrollRequest)initWithBaseRequest:(id)a3 environmentScrollableContainer:(id)a4;
- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemFrame:(CGRect)a4 targetContentOffsetValue:(id)a5;
- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 focusMovement:(id)a5 focusItemFrame:(CGRect)a6 targetContentOffsetValue:(id)a7;
- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 focusUpdateContext:(id)a5;
- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 targetContentOffsetValue:(id)a5;
- (id)description;
- (unint64_t)scrollOffsetResolver;
- (void)reloadFocusItemInfo;
@end

@implementation _UIFocusScrollRequest

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 focusMovement:(id)a5 focusItemFrame:(CGRect)a6 targetContentOffsetValue:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  v79.receiver = self;
  v79.super_class = (Class)_UIFocusScrollRequest;
  v20 = [(_UIFocusScrollRequest *)&v79 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v20->_environmentScrollableContainer, a3);
  objc_storeStrong((id *)&v21->_focusMovement, a5);
  objc_storeStrong((id *)&v21->_focusItemInfo, a4);
  v21->_focusItemFrame.origin.CGFloat x = x;
  v21->_focusItemFrame.origin.CGFloat y = y;
  v21->_focusItemFrame.size.CGFloat width = width;
  v21->_focusItemFrame.size.CGFloat height = height;
  if (v21->_focusItemInfo)
  {
    v81.origin.CGFloat x = x;
    v81.origin.CGFloat y = y;
    v81.size.CGFloat width = width;
    v81.size.CGFloat height = height;
    if (!CGRectIsNull(v81))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_MergedGlobals_936);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v69 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v69, OS_LOG_TYPE_ERROR, "Creating a _UIFocusScrollRequest with non-nil focusItemInfo and non-null focusItemFrame. focusItemFrame will be used instead of converting the frame of the focusItemInfo to the scrollableContainer.coordinateSpace, which may result in stale self.focusItemFrame access after scrolling.", buf, 2u);
        }
      }
    }
    if (v21->_focusItemInfo) {
      goto LABEL_10;
    }
    CGFloat x = v21->_focusItemFrame.origin.x;
    CGFloat y = v21->_focusItemFrame.origin.y;
    CGFloat width = v21->_focusItemFrame.size.width;
    CGFloat height = v21->_focusItemFrame.size.height;
  }
  v82.origin.CGFloat x = x;
  v82.origin.CGFloat y = y;
  v82.size.CGFloat width = width;
  v82.size.CGFloat height = height;
  if (CGRectIsNull(v82))
  {
    v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB25EF30) + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Creating a _UIFocusScrollRequest with nil focusItemInfo and null focusItemFrame. This is uselesss.", buf, 2u);
    }
  }
LABEL_10:
  id v77 = v18;
  id v78 = v16;
  v24 = v21;
  id v76 = v19;
  id v25 = v19;
  v26 = [(_UIFocusEnvironmentScrollableContainerTuple *)v21->_environmentScrollableContainer scrollableContainer];
  v27 = [(_UIFocusEnvironmentScrollableContainerTuple *)v21->_environmentScrollableContainer owningEnvironment];
  v28 = _UIFocusEnvironmentContainingView(v27);
  v29 = [v28 window];

  v30 = +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:v27];
  v31 = [v30 scrollManager];
  v24->_scrollOffsetResolver = _UIFocusItemScrollableContainerScrollOffsetResolverTypeForFocusMovement(v21->_environmentScrollableContainer, v21->_focusMovement);
  [v31 targetContentOffsetForScrollableContainer:v26];
  v24->_originatingContentOffset.CGFloat x = v32;
  v24->_originatingContentOffset.CGFloat y = v33;
  *(CGPoint *)buf = v24->_originatingContentOffset;
  [v26 visibleSize];
  v24->_originatingBounds.origin = *(CGPoint *)buf;
  v24->_originatingBounds.size.CGFloat width = v34;
  v24->_originatingBounds.size.CGFloat height = v35;
  [v26 contentOffset];
  double v37 = v36;
  double v39 = v38;
  [v26 visibleSize];
  double v41 = v40;
  double v43 = v42;
  v44 = [v26 coordinateSpace];
  objc_msgSend(v29, "convertRect:fromCoordinateSpace:", v44, v37, v39, v41, v43);
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;

  [v29 bounds];
  v93.origin.CGFloat x = v53;
  v93.origin.CGFloat y = v54;
  v93.size.CGFloat width = v55;
  v93.size.CGFloat height = v56;
  v83.origin.CGFloat x = v46;
  v83.origin.CGFloat y = v48;
  v83.size.CGFloat width = v50;
  v83.size.CGFloat height = v52;
  CGRect v84 = CGRectIntersection(v83, v93);
  CGFloat v57 = v84.origin.x;
  CGFloat v58 = v84.origin.y;
  CGFloat v59 = v84.size.width;
  CGFloat v60 = v84.size.height;
  if (!CGRectIsNull(v84))
  {
    v85.origin.CGFloat x = v57;
    v85.origin.CGFloat y = v58;
    v85.size.CGFloat width = v59;
    v85.size.CGFloat height = v60;
    double MinY = CGRectGetMinY(v85);
    v86.origin.CGFloat x = v46;
    v86.origin.CGFloat y = v48;
    v86.size.CGFloat width = v50;
    v86.size.CGFloat height = v52;
    double v75 = MinY - CGRectGetMinY(v86);
    v87.origin.CGFloat x = v57;
    v87.origin.CGFloat y = v58;
    v87.size.CGFloat width = v59;
    v87.size.CGFloat height = v60;
    double MinX = CGRectGetMinX(v87);
    v88.origin.CGFloat x = v46;
    v88.origin.CGFloat y = v48;
    v88.size.CGFloat width = v50;
    v88.size.CGFloat height = v52;
    double v73 = MinX - CGRectGetMinX(v88);
    v89.origin.CGFloat x = v46;
    v89.origin.CGFloat y = v48;
    v89.size.CGFloat width = v50;
    v89.size.CGFloat height = v52;
    double MaxY = CGRectGetMaxY(v89);
    v90.origin.CGFloat x = v57;
    v90.origin.CGFloat y = v58;
    v90.size.CGFloat width = v59;
    v90.size.CGFloat height = v60;
    double v71 = MaxY - CGRectGetMaxY(v90);
    v91.origin.CGFloat x = v46;
    v91.origin.CGFloat y = v48;
    v91.size.CGFloat width = v50;
    v91.size.CGFloat height = v52;
    double MaxX = CGRectGetMaxX(v91);
    v92.origin.CGFloat x = v57;
    v92.origin.CGFloat y = v58;
    v92.size.CGFloat width = v59;
    v92.size.CGFloat height = v60;
    CGFloat v62 = CGRectGetMaxX(v92);
    CGFloat v63 = v75 + v24->_originatingBounds.origin.y;
    CGFloat v64 = v24->_originatingBounds.size.width - (v73 + MaxX - v62);
    CGFloat v65 = v24->_originatingBounds.size.height - (v75 + v71);
    v24->_originatingBounds.origin.CGFloat x = v73 + v24->_originatingBounds.origin.x;
    v24->_originatingBounds.origin.CGFloat y = v63;
    v24->_originatingBounds.size.CGFloat width = v64;
    v24->_originatingBounds.size.CGFloat height = v65;
  }
  id v16 = v78;
  if (v25)
  {
    [v25 CGPointValue];
    v24->_targetContentOffset.CGFloat x = v66;
    v24->_targetContentOffset.CGFloat y = v67;
  }
  else
  {
    v24->_targetContentOffset = v24->_originatingContentOffset;
  }

  id v19 = v76;
  id v18 = v77;
LABEL_16:

  return v21;
}

- (_UIFocusScrollRequest)initWithBaseRequest:(id)a3 environmentScrollableContainer:(id)a4
{
  v6 = (double *)a3;
  id v7 = a4;
  v8 = [v6 environmentScrollableContainer];
  v9 = [v8 scrollableContainer];
  v10 = [v9 coordinateSpace];

  v11 = [v7 scrollableContainer];
  v12 = [v11 coordinateSpace];

  double v13 = v6[9];
  double v14 = v6[10];
  double v15 = v6[11];
  double v16 = v6[12];
  v29.origin.CGFloat x = v13;
  v29.origin.CGFloat y = v14;
  v29.size.CGFloat width = v15;
  v29.size.CGFloat height = v16;
  if (CGRectIsNull(v29))
  {
    double v17 = *MEMORY[0x1E4F1DB20];
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v10, v13, v14, v15, v16);
    double v17 = v21;
    double v18 = v22;
    double v19 = v23;
    double v20 = v24;
  }
  id v25 = [v6 focusItemInfo];
  v26 = [v6 focusMovement];
  v27 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", v7, v25, v26, 0, v17, v18, v19, v20);

  return v27;
}

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 focusUpdateContext:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [a5 _focusMovement];
  v11 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", v9, v8, v10, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

  return v11;
}

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 targetContentOffsetValue:(id)a5
{
  return -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", a3, a4, 0, a5, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemFrame:(CGRect)a4 targetContentOffsetValue:(id)a5
{
  return -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", a3, 0, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CGPoint)resolveTargetContentOffsetUsingScrollOffsetResolverClamped:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [(_UIFocusScrollRequest *)self environmentScrollableContainer];
  v6 = [v5 scrollableContainer];

  id v7 = _UIFocusScrollOffsetResolverForOffsetResolverType([(_UIFocusScrollRequest *)self scrollOffsetResolver]);
  id v8 = v7;
  if (v7)
  {
    [v7 contentOffsetForScrollRequest:self];
    double x = v9;
    double y = v11;
  }
  else
  {
    double x = self->_targetContentOffset.x;
    double y = self->_targetContentOffset.y;
    double v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &resolveTargetContentOffsetUsingScrollOffsetResolverClamped____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = v13;
      double v15 = _UIFocusScrollOffsetResolverStringForOffsetResolverType([(_UIFocusScrollRequest *)self scrollOffsetResolver]);
      int v22 = 138412290;
      double v23 = v15;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Failed to get scroll offset resolver for type: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  if (v3)
  {
    double v16 = _UIFocusItemScrollableContainerMinimumContentOffset(v6);
    double v18 = v17;
    double x = fmax(v16, fmin(x, _UIFocusItemScrollableContainerMaximumContentOffset(v6)));
    double y = fmax(v18, fmin(y, v19));
  }
  self->_targetContentOffset.double x = x;
  self->_targetContentOffset.double y = y;

  double v20 = x;
  double v21 = y;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGRect)focusItemFrame
{
  if (CGRectIsNull(self->_focusItemFrame))
  {
    focusItemInfo = self->_focusItemInfo;
    if (focusItemInfo)
    {
      v4 = [(_UIFocusEnvironmentScrollableContainerTuple *)self->_environmentScrollableContainer scrollableContainer];
      v5 = [v4 coordinateSpace];
      [(_UIFocusItemInfo *)focusItemInfo focusedRectInCoordinateSpace:v5];
      CGFloat x = v6;
      CGFloat y = v8;
      CGFloat width = v10;
      CGFloat height = v12;
    }
    else
    {
      CGFloat x = *MEMORY[0x1E4F1DB20];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  else
  {
    CGFloat x = self->_focusItemFrame.origin.x;
    CGFloat y = self->_focusItemFrame.origin.y;
    CGFloat width = self->_focusItemFrame.size.width;
    CGFloat height = self->_focusItemFrame.size.height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)reloadFocusItemInfo
{
  BOOL v3 = [(_UIFocusItemInfo *)self->_focusItemInfo item];
  id v7 = v3;
  if (v3)
  {
    v4 = [(_UIFocusScrollRequest *)self focusItemInfo];
    uint64_t v5 = [v4 useFallbackAncestorScroller];

    BOOL v3 = +[_UIFocusItemInfo infoWithItem:v7 useFallbackAncestorScroller:v5];
  }
  focusItemInfo = self->_focusItemInfo;
  self->_focusItemInfo = v3;
}

- (id)description
{
  BOOL v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(_UIFocusScrollRequest *)self environmentScrollableContainer];
  uint64_t v5 = [v4 owningEnvironment];
  if (v5)
  {
    double v6 = NSString;
    id v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
  }
  else
  {
    double v9 = @"(nil)";
  }
  id v10 = (id)[v3 appendName:@"owningEnvironment" object:v9];

  double v11 = [(_UIFocusScrollRequest *)self environmentScrollableContainer];
  double v12 = [v11 scrollableContainer];
  if (v12)
  {
    double v13 = NSString;
    double v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    double v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
  }
  else
  {
    double v16 = @"(nil)";
  }
  id v17 = (id)[v3 appendName:@"scrollableContainer" object:v16];

  double v18 = _UIFocusScrollOffsetResolverStringForOffsetResolverType([(_UIFocusScrollRequest *)self scrollOffsetResolver]);
  id v19 = (id)[v3 appendName:@"scrollOffsetResolver" object:v18];

  double v20 = [(_UIFocusScrollRequest *)self focusItemInfo];
  double v21 = [v20 shortDescription];
  id v22 = (id)[v3 appendName:@"focusItemInfo" object:v21];

  double v23 = [(_UIFocusScrollRequest *)self focusMovement];
  id v24 = (id)[v3 appendName:@"focusMovement" object:v23];

  [(_UIFocusScrollRequest *)self originatingContentOffset];
  id v25 = NSStringFromCGPoint(v36);
  id v26 = (id)[v3 appendName:@"originatingContentOffset" object:v25];

  [(_UIFocusScrollRequest *)self targetContentOffset];
  v27 = NSStringFromCGPoint(v37);
  id v28 = (id)[v3 appendName:@"targetContentOffset" object:v27];

  [(_UIFocusScrollRequest *)self originatingBounds];
  CGRect v29 = NSStringFromCGRect(v38);
  id v30 = (id)[v3 appendName:@"originatingBounds" object:v29];

  [(_UIFocusScrollRequest *)self focusItemFrame];
  v31 = NSStringFromCGRect(v39);
  id v32 = (id)[v3 appendName:@"focusItemFrame" object:v31];

  CGFloat v33 = [v3 string];

  return v33;
}

- (unint64_t)scrollOffsetResolver
{
  return self->_scrollOffsetResolver;
}

- (CGRect)originatingBounds
{
  double x = self->_originatingBounds.origin.x;
  double y = self->_originatingBounds.origin.y;
  double width = self->_originatingBounds.size.width;
  double height = self->_originatingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)originatingContentOffset
{
  double x = self->_originatingContentOffset.x;
  double y = self->_originatingContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)targetContentOffset
{
  double x = self->_targetContentOffset.x;
  double y = self->_targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_UIFocusItemInfo)focusItemInfo
{
  return self->_focusItemInfo;
}

- (_UIFocusMovementInfo)focusMovement
{
  return self->_focusMovement;
}

- (_UIFocusEnvironmentScrollableContainerTuple)environmentScrollableContainer
{
  return self->_environmentScrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentScrollableContainer, 0);
  objc_storeStrong((id *)&self->_focusMovement, 0);
  objc_storeStrong((id *)&self->_focusItemInfo, 0);
}

@end