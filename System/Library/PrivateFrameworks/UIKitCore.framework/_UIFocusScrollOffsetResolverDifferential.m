@interface _UIFocusScrollOffsetResolverDifferential
- (CGPoint)contentOffsetForScrollRequest:(id)a3;
- (unint64_t)scrollOffsetResolverType;
@end

@implementation _UIFocusScrollOffsetResolverDifferential

- (unint64_t)scrollOffsetResolverType
{
  return 2;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 environmentScrollableContainer];
  v5 = [v4 scrollableContainer];

  v6 = [v3 focusItemInfo];
  [v3 focusItemFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v3 focusMovement];
  char v16 = [v15 heading];

  [v3 targetContentOffset];
  double v66 = v17;
  double v67 = v18;
  [v3 originatingBounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v65 = v25;
  double v26 = 80.0;
  if (v16) {
    double v27 = 80.0;
  }
  else {
    double v27 = 10.0;
  }
  if ((v16 & 4) != 0) {
    double v28 = 80.0;
  }
  else {
    double v28 = 10.0;
  }
  if ((v16 & 2) != 0) {
    double v29 = 80.0;
  }
  else {
    double v29 = 10.0;
  }
  if ((v16 & 8) == 0) {
    double v26 = 10.0;
  }
  double v62 = v10;
  double v63 = v8;
  double v70 = v10 - v27;
  double v71 = v8 - v28;
  double v60 = v14;
  double v61 = v12;
  double v68 = v14 - (-v29 - v27);
  double v69 = v12 - (-v26 - v28);
  int v30 = objc_msgSend(v5, "__isKindOfUIScrollView");
  double v31 = 0.0;
  double v32 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  if (v30) {
    objc_msgSend(v5, "_effectiveContentInset", 0.0, 0.0, 0.0, 0.0);
  }
  double v35 = v20 + v32;
  double v36 = v22 + v31;
  double v37 = v24 - (v32 + v34);
  double v38 = v65 - (v31 + v33);
  v80.origin.x = v20 + v32;
  v80.origin.y = v36;
  v80.size.width = v37;
  v80.size.height = v38;
  CGFloat Width = CGRectGetWidth(v80);
  BOOL v40 = Width <= 160.0;
  if (Width <= 160.0) {
    double v41 = v24;
  }
  else {
    double v41 = v37;
  }
  CGFloat v64 = v41;
  if (v40) {
    double v42 = v20;
  }
  else {
    double v42 = v35;
  }
  v81.origin.x = v35;
  v81.origin.y = v36;
  v81.size.width = v37;
  v81.size.height = v38;
  CGFloat Height = CGRectGetHeight(v81);
  BOOL v44 = Height <= 160.0;
  if (Height <= 160.0) {
    double v45 = v65;
  }
  else {
    double v45 = v38;
  }
  double v46 = v42;
  if (v44) {
    double v47 = v22;
  }
  else {
    double v47 = v36;
  }
  CGFloat v48 = v45;
  v82.origin.x = v46;
  v82.origin.y = v47;
  v82.size.width = v64;
  v82.size.height = v48;
  v84.origin.x = v71;
  v84.origin.y = v70;
  v84.size.width = v69;
  v84.size.height = v68;
  if (CGRectContainsRect(v82, v84)) {
    goto LABEL_28;
  }
  v83.origin.x = v71;
  v83.origin.y = v70;
  v83.size.width = v69;
  v83.size.height = v68;
  v85.origin.x = v46;
  v85.origin.y = v47;
  v85.size.width = v64;
  v85.size.height = v48;
  if (CGRectContainsRect(v83, v85))
  {
LABEL_28:
    double v49 = _UIAXAdjustContentOffsetForDifferentialScrollingIfNecessary(v5, v6, v66, v67);
    double v51 = v50;
  }
  else
  {
    int CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
    int CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
    uint64_t v73 = 0;
    v74 = (double *)&v73;
    uint64_t v75 = 0x3010000000;
    v76 = &unk_186D7DBA7;
    double v77 = v66;
    double v78 = v67;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74___UIFocusScrollOffsetResolverDifferential_contentOffsetForScrollRequest___block_invoke;
    aBlock[3] = &unk_1E5308C38;
    *(double *)&aBlock[5] = v46;
    *(double *)&aBlock[6] = v47;
    *(CGFloat *)&aBlock[7] = v64;
    *(CGFloat *)&aBlock[8] = v48;
    *(double *)&aBlock[9] = v71;
    *(double *)&aBlock[10] = v70;
    *(double *)&aBlock[11] = v69;
    *(double *)&aBlock[12] = v68;
    *(double *)&aBlock[13] = v63 + -80.0;
    *(double *)&aBlock[14] = v62 + -80.0;
    *(double *)&aBlock[15] = v61 + 160.0;
    *(double *)&aBlock[16] = v60 + 160.0;
    *(double *)&aBlock[17] = v63;
    *(double *)&aBlock[18] = v62;
    *(double *)&aBlock[19] = v61;
    *(double *)&aBlock[20] = v60;
    *(double *)&aBlock[21] = v66 - v46;
    *(double *)&aBlock[22] = v67 - v47;
    aBlock[4] = &v73;
    v54 = _Block_copy(aBlock);
    v55 = (void (**)(void, void))v54;
    if (CanScrollX) {
      (*((void (**)(void *, uint64_t))v54 + 2))(v54, 1);
    }
    if (CanScrollY) {
      v55[2](v55, 2);
    }
    double v49 = _UIAXAdjustContentOffsetForDifferentialScrollingIfNecessary(v5, v6, v74[4], v74[5]);
    double v51 = v56;
    v57 = v74;
    v74[4] = v49;
    v57[5] = v56;

    _Block_object_dispose(&v73, 8);
  }

  double v58 = v49;
  double v59 = v51;
  result.y = v59;
  result.x = v58;
  return result;
}

@end