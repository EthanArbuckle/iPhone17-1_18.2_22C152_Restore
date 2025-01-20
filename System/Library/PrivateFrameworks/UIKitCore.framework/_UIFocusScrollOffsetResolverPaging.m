@interface _UIFocusScrollOffsetResolverPaging
- (CGPoint)contentOffsetForScrollRequest:(id)a3;
- (unint64_t)scrollOffsetResolverType;
@end

@implementation _UIFocusScrollOffsetResolverPaging

- (unint64_t)scrollOffsetResolverType
{
  return 1;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 environmentScrollableContainer];
  v5 = [v4 scrollableContainer];

  [v3 focusItemFrame];
  CGFloat v47 = v7;
  CGFloat v48 = v6;
  CGFloat v45 = v9;
  CGFloat v46 = v8;
  int CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
  int CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
  int v12 = objc_msgSend(v5, "__isKindOfUIScrollView");
  if (v12) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  if (v12)
  {
    [v5 _interpageSpacing];
    double v16 = v15;
    double v44 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v44 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [v5 visibleSize];
  double v19 = v18;
  [v5 visibleSize];
  uint64_t v42 = v20;
  if (v12)
  {
    [v5 _pagingOrigin];
    double v22 = v21;
    double v24 = v23;
    [v5 _firstPageOffset];
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DAD8];
    double v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v26 = 0.0;
    double v28 = 0.0;
  }
  objc_msgSend(v3, "targetContentOffset", v42);
  double v31 = v30;
  if (!CanScrollX)
  {
    double v36 = v29;
    if (!CanScrollY) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  double v32 = v16 + v19;
  v50.origin.y = v47;
  v50.origin.x = v48;
  v50.size.height = v45;
  v50.size.width = v46;
  double v33 = (CGRectGetMidX(v50) - v22) / v32;
  unint64_t v34 = vcvtmd_s64_f64(v33);
  double v35 = v32 * (double)(uint64_t)floor(v33);
  if (!v34) {
    double v35 = v26;
  }
  double v36 = v22 + v35;
  if (CanScrollY)
  {
LABEL_16:
    v51.origin.y = v47;
    v51.origin.x = v48;
    v51.size.height = v45;
    v51.size.width = v46;
    double v37 = (CGRectGetMidY(v51) - v24) / (v44 + v43);
    unint64_t v38 = vcvtmd_s64_f64(v37);
    double v39 = (v44 + v43) * (double)(uint64_t)floor(v37);
    if (!v38) {
      double v39 = v28;
    }
    double v31 = v24 + v39;
  }
LABEL_19:

  double v40 = v36;
  double v41 = v31;
  result.y = v41;
  result.x = v40;
  return result;
}

@end