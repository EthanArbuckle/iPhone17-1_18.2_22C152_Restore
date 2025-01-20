@interface TSKScrollView
- (BOOL)isScrolling;
- (BOOL)mayPassScrollEventsToNextResponder;
- (BOOL)shouldDisableScrollingWhenCursorIsHidden;
- (CGRect)scrollableAreaBounds;
- (void)hideScrollIndicators;
- (void)layoutSubviews;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setMayPassScrollEventsToNextResponder:(BOOL)a3;
- (void)setShouldDisableScrollingWhenCursorIsHidden:(BOOL)a3;
@end

@implementation TSKScrollView

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v10 = *MEMORY[0x263F001A8];
  CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(TSKScrollView *)self contentSize];
  v127.size.CGFloat width = v12;
  v127.size.CGFloat height = v13;
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.CGFloat width = width;
  v77.size.CGFloat height = height;
  v127.origin.CGFloat x = v10;
  v127.origin.CGFloat y = v11;
  CGRect v78 = CGRectIntersection(v77, v127);
  CGFloat v14 = v78.origin.y;
  CGFloat v15 = v78.size.width;
  CGFloat v16 = v78.size.height;
  CGFloat rect = v78.origin.x;
  if (CGRectIsEmpty(v78)) {
    return;
  }
  [(TSKScrollView *)self visibleFrame];
  -[TSKScrollView convertRect:fromView:](self, "convertRect:fromView:", [(TSKScrollView *)self superview], v17, v18, v19, v20);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [(TSKScrollView *)self contentOffset];
  double v73 = v29;
  double v71 = v30;
  v79.origin.CGFloat x = v22;
  v79.origin.CGFloat y = v24;
  v79.size.CGFloat width = v26;
  v79.size.CGFloat height = v28;
  double MaxX = CGRectGetMaxX(v79);
  v80.origin.CGFloat x = rect;
  v80.origin.CGFloat y = v14;
  v80.size.CGFloat width = v15;
  v80.size.CGFloat height = v16;
  CGFloat v72 = v16;
  if (MaxX <= CGRectGetMaxX(v80)) {
    goto LABEL_6;
  }
  v81.origin.CGFloat x = v22;
  v81.origin.CGFloat y = v24;
  v81.size.CGFloat width = v26;
  v81.size.CGFloat height = v28;
  double MinX = CGRectGetMinX(v81);
  v82.origin.CGFloat x = rect;
  v82.origin.CGFloat y = v14;
  v82.size.CGFloat width = v15;
  v82.size.CGFloat height = v16;
  if (MinX <= CGRectGetMinX(v82))
  {
LABEL_6:
    v89.origin.CGFloat x = v22;
    v89.origin.CGFloat y = v24;
    v89.size.CGFloat width = v26;
    v89.size.CGFloat height = v28;
    double v35 = CGRectGetMinX(v89);
    v90.origin.CGFloat x = rect;
    v90.origin.CGFloat y = v14;
    v90.size.CGFloat width = v15;
    v90.size.CGFloat height = v16;
    if (v35 >= CGRectGetMinX(v90))
    {
      CGFloat v36 = rect;
      goto LABEL_16;
    }
    v91.origin.CGFloat x = v22;
    v91.origin.CGFloat y = v24;
    v91.size.CGFloat width = v26;
    v91.size.CGFloat height = v28;
    double v64 = CGRectGetMaxX(v91);
    v92.origin.CGFloat x = rect;
    v92.origin.CGFloat y = v14;
    v92.size.CGFloat width = v15;
    v92.size.CGFloat height = v16;
    CGFloat v36 = rect;
    if (v64 >= CGRectGetMaxX(v92)) {
      goto LABEL_16;
    }
    v93.origin.CGFloat x = rect;
    v93.origin.CGFloat y = v14;
    v93.size.CGFloat width = v15;
    v93.size.CGFloat height = v72;
    double v65 = CGRectGetMinX(v93);
    v94.origin.CGFloat x = v22;
    v94.origin.CGFloat y = v24;
    v94.size.CGFloat width = v26;
    v94.size.CGFloat height = v28;
    double v66 = v65 - CGRectGetMinX(v94);
    v95.origin.CGFloat x = rect;
    v95.origin.CGFloat y = v14;
    v95.size.CGFloat width = v15;
    v95.size.CGFloat height = v72;
    double v37 = CGRectGetMaxX(v95);
    CGFloat v57 = v22;
    CGFloat v59 = v28;
    v96.origin.CGFloat x = v22;
    double v38 = v24;
    v96.origin.CGFloat y = v24;
    v96.size.CGFloat width = v26;
    v96.size.CGFloat height = v28;
    if (v66 >= v37 - CGRectGetMaxX(v96))
    {
      v101.origin.CGFloat x = rect;
      v101.origin.CGFloat y = v14;
      v101.size.CGFloat width = v15;
      v101.size.CGFloat height = v72;
      double v39 = CGRectGetMaxX(v101);
      double v40 = v57;
      v102.origin.CGFloat x = v57;
      v102.origin.CGFloat y = v24;
      v102.size.CGFloat width = v26;
      double v41 = v59;
      v102.size.CGFloat height = v59;
      double v42 = CGRectGetMaxX(v102);
    }
    else
    {
      v97.origin.CGFloat x = rect;
      v97.origin.CGFloat y = v14;
      v97.size.CGFloat width = v15;
      v97.size.CGFloat height = v72;
      double v39 = CGRectGetMinX(v97);
      double v40 = v57;
      v98.origin.CGFloat x = v57;
      v98.origin.CGFloat y = v24;
      v98.size.CGFloat width = v26;
      double v41 = v59;
      v98.size.CGFloat height = v59;
      double v42 = CGRectGetMinX(v98);
    }
    double v44 = v39 - v42;
    CGFloat v28 = v41;
    CGFloat v24 = v38;
    CGFloat v22 = v40;
    CGFloat v36 = rect;
    double v43 = v73 + v44;
  }
  else
  {
    v83.origin.CGFloat x = v22;
    v83.origin.CGFloat y = v24;
    v83.size.CGFloat width = v26;
    v83.size.CGFloat height = v28;
    double v61 = CGRectGetMaxX(v83);
    v84.origin.CGFloat x = rect;
    v84.origin.CGFloat y = v14;
    v84.size.CGFloat width = v15;
    v84.size.CGFloat height = v16;
    double v62 = v61 - CGRectGetMaxX(v84);
    v85.origin.CGFloat x = v22;
    v85.origin.CGFloat y = v24;
    v85.size.CGFloat width = v26;
    v85.size.CGFloat height = v28;
    double v58 = CGRectGetMinX(v85);
    v86.origin.CGFloat x = rect;
    v86.origin.CGFloat y = v14;
    v86.size.CGFloat width = v15;
    v86.size.CGFloat height = v16;
    if (v62 >= v58 - CGRectGetMinX(v86))
    {
      v99.origin.CGFloat x = v22;
      v99.origin.CGFloat y = v24;
      v99.size.CGFloat width = v26;
      v99.size.CGFloat height = v28;
      double v63 = CGRectGetMinX(v99);
      double v33 = rect;
      v100.origin.CGFloat x = rect;
      v100.origin.CGFloat y = v14;
      v100.size.CGFloat width = v15;
      v100.size.CGFloat height = v16;
      double v34 = CGRectGetMinX(v100);
    }
    else
    {
      v87.origin.CGFloat x = v22;
      v87.origin.CGFloat y = v24;
      v87.size.CGFloat width = v26;
      v87.size.CGFloat height = v28;
      double v63 = CGRectGetMaxX(v87);
      double v33 = rect;
      v88.origin.CGFloat x = rect;
      v88.origin.CGFloat y = v14;
      v88.size.CGFloat width = v15;
      v88.size.CGFloat height = v16;
      double v34 = CGRectGetMaxX(v88);
    }
    CGFloat v36 = v33;
    double v43 = v73 - (v63 - v34);
  }
  double v73 = v43;
LABEL_16:
  CGFloat v74 = v24;
  v103.origin.CGFloat x = v22;
  v103.origin.CGFloat y = v24;
  CGFloat v45 = v22;
  v103.size.CGFloat width = v26;
  v103.size.CGFloat height = v28;
  double MaxY = CGRectGetMaxY(v103);
  v104.origin.CGFloat x = v36;
  v104.origin.CGFloat y = v14;
  v104.size.CGFloat width = v15;
  v104.size.CGFloat height = v72;
  if (MaxY <= CGRectGetMaxY(v104)) {
    goto LABEL_20;
  }
  v105.origin.CGFloat x = v22;
  v105.origin.CGFloat y = v74;
  v105.size.CGFloat width = v26;
  v105.size.CGFloat height = v28;
  double MinY = CGRectGetMinY(v105);
  v106.origin.CGFloat x = v36;
  v106.origin.CGFloat y = v14;
  v106.size.CGFloat width = v15;
  v106.size.CGFloat height = v72;
  if (MinY <= CGRectGetMinY(v106))
  {
LABEL_20:
    v113.origin.CGFloat x = v22;
    v113.origin.CGFloat y = v74;
    v113.size.CGFloat width = v26;
    v113.size.CGFloat height = v28;
    double v51 = CGRectGetMinY(v113);
    v114.origin.CGFloat x = v36;
    v114.origin.CGFloat y = v14;
    v114.size.CGFloat width = v15;
    v114.size.CGFloat height = v72;
    if (v51 >= CGRectGetMinY(v114))
    {
      double v54 = v71;
    }
    else
    {
      v115.origin.CGFloat x = v22;
      v115.origin.CGFloat y = v74;
      v115.size.CGFloat width = v26;
      v115.size.CGFloat height = v28;
      double v52 = CGRectGetMaxY(v115);
      v116.origin.CGFloat x = v36;
      v116.origin.CGFloat y = v14;
      v116.size.CGFloat width = v15;
      v116.size.CGFloat height = v72;
      CGFloat v53 = CGRectGetMaxY(v116);
      double v54 = v71;
      if (v52 < v53)
      {
        v117.origin.CGFloat x = v36;
        v117.origin.CGFloat y = v14;
        v117.size.CGFloat width = v15;
        v117.size.CGFloat height = v72;
        double v69 = CGRectGetMinY(v117);
        v118.origin.CGFloat x = v22;
        v118.origin.CGFloat y = v74;
        v118.size.CGFloat width = v26;
        v118.size.CGFloat height = v28;
        double v70 = v69 - CGRectGetMinY(v118);
        v119.origin.CGFloat x = v36;
        v119.origin.CGFloat y = v14;
        v119.size.CGFloat width = v15;
        v119.size.CGFloat height = v72;
        double v60 = CGRectGetMaxY(v119);
        v120.origin.CGFloat x = v22;
        v120.origin.CGFloat y = v74;
        v120.size.CGFloat width = v26;
        v120.size.CGFloat height = v28;
        if (v70 >= v60 - CGRectGetMaxY(v120))
        {
          v125.origin.CGFloat x = v36;
          v125.origin.CGFloat y = v14;
          v125.size.CGFloat width = v15;
          v125.size.CGFloat height = v72;
          double v55 = CGRectGetMaxY(v125);
          v126.origin.CGFloat x = v45;
          v126.origin.CGFloat y = v74;
          v126.size.CGFloat width = v26;
          v126.size.CGFloat height = v28;
          double v56 = CGRectGetMaxY(v126);
        }
        else
        {
          v121.origin.CGFloat x = v36;
          v121.origin.CGFloat y = v14;
          v121.size.CGFloat width = v15;
          v121.size.CGFloat height = v72;
          double v55 = CGRectGetMinY(v121);
          v122.origin.CGFloat x = v45;
          v122.origin.CGFloat y = v74;
          v122.size.CGFloat width = v26;
          v122.size.CGFloat height = v28;
          double v56 = CGRectGetMinY(v122);
        }
        double v54 = v71 + v55 - v56;
      }
    }
  }
  else
  {
    v107.origin.CGFloat x = v22;
    v107.origin.CGFloat y = v74;
    v107.size.CGFloat width = v26;
    v107.size.CGFloat height = v28;
    double v67 = CGRectGetMaxY(v107);
    v108.origin.CGFloat x = v36;
    v108.origin.CGFloat y = v14;
    v108.size.CGFloat width = v15;
    v108.size.CGFloat height = v72;
    double v68 = v67 - CGRectGetMaxY(v108);
    v109.origin.CGFloat x = v22;
    v109.origin.CGFloat y = v74;
    v109.size.CGFloat width = v26;
    v109.size.CGFloat height = v28;
    double v48 = CGRectGetMinY(v109);
    v110.origin.CGFloat x = v36;
    v110.origin.CGFloat y = v14;
    v110.size.CGFloat width = v15;
    v110.size.CGFloat height = v72;
    if (v68 >= v48 - CGRectGetMinY(v110))
    {
      v123.origin.CGFloat x = v22;
      v123.origin.CGFloat y = v74;
      v123.size.CGFloat width = v26;
      v123.size.CGFloat height = v28;
      double v49 = CGRectGetMinY(v123);
      v124.origin.CGFloat x = v36;
      v124.origin.CGFloat y = v14;
      v124.size.CGFloat width = v15;
      v124.size.CGFloat height = v72;
      double v50 = CGRectGetMinY(v124);
    }
    else
    {
      v111.origin.CGFloat x = v22;
      v111.origin.CGFloat y = v74;
      v111.size.CGFloat width = v26;
      v111.size.CGFloat height = v28;
      double v49 = CGRectGetMaxY(v111);
      v112.origin.CGFloat x = v36;
      v112.origin.CGFloat y = v14;
      v112.size.CGFloat width = v15;
      v112.size.CGFloat height = v72;
      double v50 = CGRectGetMaxY(v112);
    }
    double v54 = v71 - (v49 - v50);
  }
  -[TSKScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v4, v73, v54);
}

- (BOOL)isScrolling
{
  if ([(TSKScrollView *)self isDragging]) {
    return 1;
  }
  return [(TSKScrollView *)self isDecelerating];
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    [(TSKScrollView *)self contentOffset];
    BOOL v11 = y != v10 || x != v9;
  }
  else
  {
    BOOL v11 = 0;
  }
  [(TSKScrollView *)self delegate];
  CGFloat v12 = (void *)TSUProtocolCast();
  if (v11)
  {
    if (!self->mAnimatingContentOffsetCount && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v12, "scrollView:willAnimateToContentOffset:", self, x, y);
    }
    ++self->mAnimatingContentOffsetCount;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke;
  v20[3] = &unk_2646B0700;
  v20[4] = self;
  *(double *)&v20[5] = x;
  *(double *)&v20[6] = y;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  CGFloat v14 = __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke_2;
  CGFloat v15 = &unk_2646B0A80;
  BOOL v19 = v11;
  CGFloat v16 = self;
  double v17 = v12;
  id v18 = a5;
  if (v11)
  {
    [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v20 options:v13 animations:0.200000003 completion:0.0];
  }
  else
  {
    -[TSKScrollView setContentOffset:](self, "setContentOffset:", x, y);
    ((void (*)(void *, uint64_t))v14)(v13, 1);
  }
}

uint64_t __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __59__TSKScrollView_setContentOffset_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_9;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 2064))
  {
    v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSKScrollView setContentOffset:animated:completionBlock:]_block_invoke_2"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKScrollView.mm"), 131, @"imbalanced content offset animation count");
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_9;
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 2064);
  if (!v5 || (*(void *)(v4 + 2064) = v5 - 1, !*(void *)(*(void *)(a1 + 32) + 2064)))
  {
    if (objc_opt_respondsToSelector())
    {
      [*(id *)(a1 + 40) scrollViewDidEndScrollingAnimation:*(void *)(a1 + 32)];
      goto LABEL_11;
    }
    if (!*(unsigned char *)(a1 + 56))
    {
LABEL_9:
      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 40) scrollViewDidScroll:*(void *)(a1 + 32)];
      }
    }
  }
LABEL_11:
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSKScrollView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend((id)-[TSKScrollView delegate](self, "delegate"), "scrollView:restrictContentOffset:", self, x, y);
    double x = v6;
    double y = v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSKScrollView;
  -[TSKScrollView setContentOffset:](&v8, sel_setContentOffset_, x, y);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TSKScrollView;
  [(TSKScrollView *)&v3 layoutSubviews];
  [(TSKScrollView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)-[TSKScrollView delegate](self, "delegate"), "scrollViewDidLayoutSubviews:", self);
  }
}

- (void)hideScrollIndicators
{
  [(TSKScrollView *)self setShowsHorizontalScrollIndicator:0];
  [(TSKScrollView *)self setShowsVerticalScrollIndicator:0];
}

- (BOOL)mayPassScrollEventsToNextResponder
{
  return self->_mayPassScrollEventsToNextResponder;
}

- (void)setMayPassScrollEventsToNextResponder:(BOOL)a3
{
  self->_mayPassScrollEventsToNextResponder = a3;
}

- (BOOL)shouldDisableScrollingWhenCursorIsHidden
{
  return self->_shouldDisableScrollingWhenCursorIsHidden;
}

- (void)setShouldDisableScrollingWhenCursorIsHidden:(BOOL)a3
{
  self->_shouldDisableScrollingWhenCursorIsHidden = a3;
}

- (CGRect)scrollableAreaBounds
{
  double x = self->_scrollableAreaBounds.origin.x;
  double y = self->_scrollableAreaBounds.origin.y;
  double width = self->_scrollableAreaBounds.size.width;
  double height = self->_scrollableAreaBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end