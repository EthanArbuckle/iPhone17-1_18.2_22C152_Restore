@interface TabDocumentView
- ($FBE3A1C208404EC7AA4040899845A87A)currentGeometry;
- (BOOL)isAnimatingInteractiveGeometryChanges;
- (BOOL)isShowingReader;
- (BOOL)showsInteractionHint;
- (TabDocumentViewGeometryProviding)geometryProvider;
- (WKWebView)readerWebView;
- (WKWebView)webView;
- (double)scrollDistance;
- (void)_performReaderTransitionWithCompletion:(id)a3;
- (void)applyGeometry:(id *)a3 toWebView:(id)a4;
- (void)applyGeometryToWebView:(id)a3;
- (void)beginInteractiveGeometryChanges;
- (void)endInteractiveGeometryChanges;
- (void)ensureContentOffsetWithinContentInsets;
- (void)layoutSubviews;
- (void)setGeometryProvider:(id)a3;
- (void)setInteractionHintPresented:(BOOL)a3 animated:(BOOL)a4;
- (void)setReaderWebView:(id)a3;
- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setShowsInteractionHint:(BOOL)a3;
- (void)setWebView:(id)a3;
@end

@implementation TabDocumentView

- (void)ensureContentOffsetWithinContentInsets
{
  [(TabDocumentView *)self layoutIfNeeded];
  id v13 = [(WKWebView *)self->_webView scrollView];
  if (([v13 isDragging] & 1) == 0)
  {
    [v13 contentOffset];
    double v4 = v3;
    double v6 = v5;
    [v13 adjustedContentInset];
    if (v6 < -v7) {
      [v13 setContentOffset:v4];
    }
  }

  id v14 = [(WKWebView *)self->_readerWebView scrollView];
  if (([v14 isDragging] & 1) == 0)
  {
    [v14 contentOffset];
    double v9 = v8;
    double v11 = v10;
    [v14 adjustedContentInset];
    if (v11 < -v12) {
      [v14 setContentOffset:v9];
    }
  }
}

- (void)layoutSubviews
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)TabDocumentView;
  [(TabDocumentView *)&v33 layoutSubviews];
  id v3 = (id)[(WKWebView *)self->_webView _sf_effectiveViewToLayOut];
  readerWebView = self->_readerWebView;
  v34[0] = v3;
  v34[1] = readerWebView;
  interactionHint = self->_interactionHint;
  v34[2] = self->_readerTransitionContainerView;
  v34[3] = interactionHint;
  [(TabDocumentView *)self _sf_setOrderedSubviews:v34 count:4];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  [(TabDocumentView *)self currentGeometry];
  webView = self->_webView;
  if (webView)
  {
    int v7 = [(WKWebView *)webView isHidden];
    int showingReader = self->_showingReader;
    double v9 = self->_webView;
    if (showingReader != v7)
    {
      [(WKWebView *)self->_webView setHidden:showingReader != 0];
      double v9 = self->_webView;
    }
  }
  else
  {
    double v9 = 0;
  }
  v16[12] = v29;
  v16[13] = v30;
  v16[14] = v31;
  v16[15] = v32;
  v16[8] = v25;
  v16[9] = v26;
  v16[10] = v27;
  v16[11] = v28;
  v16[4] = v21;
  v16[5] = v22;
  v16[6] = v23;
  v16[7] = v24;
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  v16[3] = v20;
  [(TabDocumentView *)self applyGeometry:v16 toWebView:v9];
  v15[12] = v29;
  v15[13] = v30;
  v15[14] = v31;
  v15[15] = v32;
  v15[8] = v25;
  v15[9] = v26;
  v15[10] = v27;
  v15[11] = v28;
  v15[4] = v21;
  v15[5] = v22;
  v15[6] = v23;
  v15[7] = v24;
  v15[0] = v17;
  v15[1] = v18;
  v15[2] = v19;
  v15[3] = v20;
  [(TabDocumentView *)self applyGeometry:v15 toWebView:self->_readerWebView];
  [(NSLayoutConstraint *)self->_interactionHintTopAnchor setConstant:*(double *)&v21 + 20.0];
  [(UIView *)self->_interactionHint frame];
  CGFloat v10 = CGRectGetHeight(v35) * 0.5;
  [(UIView *)self->_interactionHint _setContinuousCornerRadius:v10];
  [(UIVisualEffectView *)self->_interactionHintBackground _setContinuousCornerRadius:v10];
  double v11 = self->_readerWebView;
  if (v11)
  {
    int v12 = [(WKWebView *)v11 isHidden];
    int v13 = self->_showingReader;
    if (v13 == v12) {
      [(WKWebView *)self->_readerWebView setHidden:v13 == 0];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
  [WeakRetained tabDocumentViewDidUpdateDistanceScrolled:self];
}

- (void)applyGeometry:(id *)a3 toWebView:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
    if ([WeakRetained shouldFreezeWebViewUpdatesForTabDocumentView:self]) {
      goto LABEL_27;
    }
    double x = a3->var0.origin.x;
    double y = a3->var0.origin.y;
    double width = a3->var0.size.width;
    double height = a3->var0.size.height;
    int v12 = objc_msgSend(v6, "_sf_effectiveViewToLayOut");
    objc_msgSend(v12, "setFrame:", x, y, width, height);

    if (a3->var8
      || (objc_opt_respondsToSelector() & 1) != 0
      && ([WeakRetained shouldModifyWebViewGeometryForTabDocumentView:self] & 1) == 0)
    {
      goto LABEL_27;
    }
    int v13 = WBS_LOG_CHANNEL_PREFIXLayout();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = objc_getAssociatedObject(v6, &-[TabDocumentView applyGeometry:toWebView:]::lastAppliedGeometryKey);
      long long v15 = *(_OWORD *)&a3->var7.top;
      v82[12] = a3->var6;
      v82[13] = v15;
      long long v16 = *(_OWORD *)&a3->var8;
      v82[14] = *(_OWORD *)&a3->var7.bottom;
      v82[15] = v16;
      long long v17 = *(_OWORD *)&a3->var3.var1.bottom;
      v82[8] = *(_OWORD *)&a3->var3.var1.top;
      v82[9] = v17;
      CGSize var5 = a3->var5;
      v82[10] = a3->var4;
      v82[11] = var5;
      long long v19 = *(_OWORD *)&a3->var2.bottom;
      v82[4] = *(_OWORD *)&a3->var2.top;
      v82[5] = v19;
      long long v20 = *(_OWORD *)&a3->var3.var0.bottom;
      v82[6] = *(_OWORD *)&a3->var3.var0.top;
      v82[7] = v20;
      CGSize size = a3->var0.size;
      v82[0] = a3->var0.origin;
      v82[1] = size;
      long long v22 = *(_OWORD *)&a3->var1.bottom;
      v82[2] = *(_OWORD *)&a3->var1.top;
      v82[3] = v22;
      long long v23 = [MEMORY[0x1E4F29238] valueWithBytes:v82 objCType:"{?={CGRect={CGPoint=dd}{CGSize=dd}}{UIEdgeInsets=dddd}{UIEdgeInsets=dddd}{SFScrollIndicatorInsets={UIEdgeInsets=dddd}{UIEdgeInsets=dddd}}{CGSize=dd}{CGSize=dd}{CGSize=dd}{UIEdgeInsets=dddd}Bd}"];
      objc_setAssociatedObject(v6, &-[TabDocumentView applyGeometry:toWebView:]::lastAppliedGeometryKey, v23, (void *)0x301);

      if (v14)
      {
        [v14 getValue:buf size:256];
        BOOL v81 = 0;
        v80[13] = v101;
        v80[14] = v102;
        v80[15] = v103;
        v80[8] = v96;
        v80[9] = v97;
        v80[10] = v98;
        v80[11] = v99;
        v80[12] = v100;
        v80[4] = v92;
        v80[5] = v93;
        v80[6] = v94;
        v80[7] = v95;
        v80[0] = *(_OWORD *)buf;
        v80[1] = *(_OWORD *)&buf[16];
        v80[2] = v90;
        v80[3] = v91;
        long long v24 = *(_OWORD *)&a3->var7.top;
        v79[12] = a3->var6;
        v79[13] = v24;
        long long v25 = *(_OWORD *)&a3->var8;
        v79[14] = *(_OWORD *)&a3->var7.bottom;
        v79[15] = v25;
        long long v26 = *(_OWORD *)&a3->var3.var1.bottom;
        v79[8] = *(_OWORD *)&a3->var3.var1.top;
        v79[9] = v26;
        CGSize v27 = a3->var5;
        v79[10] = a3->var4;
        v79[11] = v27;
        long long v28 = *(_OWORD *)&a3->var2.bottom;
        v79[4] = *(_OWORD *)&a3->var2.top;
        v79[5] = v28;
        long long v29 = *(_OWORD *)&a3->var3.var0.bottom;
        v79[6] = *(_OWORD *)&a3->var3.var0.top;
        v79[7] = v29;
        CGSize v30 = a3->var0.size;
        v79[0] = a3->var0.origin;
        v79[1] = v30;
        long long v31 = *(_OWORD *)&a3->var1.bottom;
        v79[2] = *(_OWORD *)&a3->var1.top;
        v79[3] = v31;
        long long v32 = WebViewGeometryDescriptionOfDifferenceFromGeometry((uint64_t)v80, (uint64_t)v79, &v81);
        if (!v81)
        {
          objc_super v33 = (id)WBS_LOG_CHANNEL_PREFIXLayout();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v75 = objc_opt_class();
            *(_DWORD *)v83 = 138543874;
            uint64_t v84 = v75;
            __int16 v85 = 2048;
            id v86 = v6;
            __int16 v87 = 2114;
            v88 = v32;
            _os_log_debug_impl(&dword_1E102C000, v33, OS_LOG_TYPE_DEBUG, "Updating <%{public}@: %p> geometry with %{public}@", v83, 0x20u);
          }
        }
      }
      else
      {
        v34 = (id)WBS_LOG_CHANNEL_PREFIXLayout();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v65 = objc_opt_class();
          long long v66 = *(_OWORD *)&a3->var7.top;
          v78[12] = a3->var6;
          v78[13] = v66;
          long long v67 = *(_OWORD *)&a3->var8;
          v78[14] = *(_OWORD *)&a3->var7.bottom;
          v78[15] = v67;
          long long v68 = *(_OWORD *)&a3->var3.var1.bottom;
          v78[8] = *(_OWORD *)&a3->var3.var1.top;
          v78[9] = v68;
          CGSize v69 = a3->var5;
          v78[10] = a3->var4;
          v78[11] = v69;
          long long v70 = *(_OWORD *)&a3->var2.bottom;
          v78[4] = *(_OWORD *)&a3->var2.top;
          v78[5] = v70;
          long long v71 = *(_OWORD *)&a3->var3.var0.bottom;
          v78[6] = *(_OWORD *)&a3->var3.var0.top;
          v78[7] = v71;
          CGSize v72 = a3->var0.size;
          v78[0] = a3->var0.origin;
          v78[1] = v72;
          long long v73 = *(_OWORD *)&a3->var1.bottom;
          v78[2] = *(_OWORD *)&a3->var1.top;
          v78[3] = v73;
          v74 = WebViewGeometryDescription((uint64_t)v78);
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v6;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v74;
          _os_log_debug_impl(&dword_1E102C000, v34, OS_LOG_TYPE_DEBUG, "Setting initial geometry of <%{public}@: %p> with %{public}@", buf, 0x20u);
        }
      }
    }
    long long v35 = *(_OWORD *)&a3->var7.top;
    v77[12] = a3->var6;
    v77[13] = v35;
    long long v36 = *(_OWORD *)&a3->var8;
    v77[14] = *(_OWORD *)&a3->var7.bottom;
    v77[15] = v36;
    long long v37 = *(_OWORD *)&a3->var3.var1.bottom;
    v77[8] = *(_OWORD *)&a3->var3.var1.top;
    v77[9] = v37;
    CGSize v38 = a3->var5;
    v77[10] = a3->var4;
    v77[11] = v38;
    long long v39 = *(_OWORD *)&a3->var2.bottom;
    v77[4] = *(_OWORD *)&a3->var2.top;
    v77[5] = v39;
    long long v40 = *(_OWORD *)&a3->var3.var0.bottom;
    v77[6] = *(_OWORD *)&a3->var3.var0.top;
    v77[7] = v40;
    CGSize v41 = a3->var0.size;
    v77[0] = a3->var0.origin;
    v77[1] = v41;
    long long v42 = *(_OWORD *)&a3->var1.bottom;
    v77[2] = *(_OWORD *)&a3->var1.top;
    v77[3] = v42;
    objc_msgSend(v6, "sf_setDisplayedWebViewGeometry:", v77);
    char v43 = objc_opt_respondsToSelector();
    double v44 = a3->var4.width;
    double v45 = a3->var4.height;
    if (v43) {
      objc_msgSend(v6, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v44, v45, a3->var5.width, a3->var5.height, a3->var6.width, a3->var6.height);
    }
    else {
      objc_msgSend(v6, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v44, v45, a3->var6.width, a3->var6.height);
    }
    objc_msgSend(v6, "_setObscuredInsets:", a3->var2.top, a3->var2.left, a3->var2.bottom, a3->var2.right);
    objc_msgSend(v6, "_setUnobscuredSafeAreaInsets:", a3->var1.top, a3->var1.left, a3->var1.bottom, a3->var1.right);
    [v6 _setMinimumEffectiveDeviceWidth:a3->var9];
    v46 = [v6 scrollView];
    long long v47 = *(_OWORD *)&a3->var3.var0.bottom;
    v76[0] = *(_OWORD *)&a3->var3.var0.top;
    v76[1] = v47;
    long long v48 = *(_OWORD *)&a3->var3.var1.bottom;
    v76[2] = *(_OWORD *)&a3->var3.var1.top;
    v76[3] = v48;
    objc_msgSend(v46, "_sf_setScrollIndicatorInsets:", v76);
    [v46 contentInset];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    objc_msgSend(v46, "_sf_setContentInsetAdjustments:", a3->var7.top, a3->var7.left, a3->var7.bottom, a3->var7.right);
    if (objc_opt_respondsToSelector())
    {
      char v57 = objc_msgSend(WeakRetained, "tabDocumentView:contentOffsetAdjustmentEdgeWithPreviousContentInset:", self, v50, v52, v54, v56);
      [v46 contentOffset];
      double v59 = v58;
      double v61 = v60;
      if (v57)
      {
        [v46 contentInset];
        double v63 = v61 - (v64 - v50);
        goto LABEL_25;
      }
      if ((v57 & 4) != 0)
      {
        [v46 contentInset];
        double v63 = v61 + v62 - v54;
LABEL_25:
        objc_msgSend(v46, "_setContentOffsetPinned:", v59, v63);
      }
    }

LABEL_27:
  }
}

- ($FBE3A1C208404EC7AA4040899845A87A)currentGeometry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
  retstr->var0.origin = 0u;
  retstr->var0.CGSize size = 0u;
  *(_OWORD *)&retstr->var1.top = 0u;
  *(_OWORD *)&retstr->var1.bottom = 0u;
  *(_OWORD *)&retstr->var2.top = 0u;
  *(_OWORD *)&retstr->var2.bottom = 0u;
  *(_OWORD *)&retstr->var3.var0.top = 0u;
  *(_OWORD *)&retstr->var3.var0.bottom = 0u;
  *(_OWORD *)&retstr->var3.var1.top = 0u;
  *(_OWORD *)&retstr->var3.var1.bottom = 0u;
  retstr->var4 = 0u;
  retstr->CGSize var5 = 0u;
  retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7.top = 0u;
  *(_OWORD *)&retstr->var7.bottom = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  if (WeakRetained)
  {
    [(TabDocumentView *)self bounds];
    retstr->var0.origin.double x = v6;
    retstr->var0.origin.double y = v7;
    retstr->var0.size.double width = v8;
    retstr->var0.size.double height = v9;
    [WeakRetained obscuredScrollViewInsetsForTabDocumentView:self unobscuredSafeAreaInsets:&retstr->var1];
    retstr->var2.top = v10;
    retstr->var2.left = v11;
    retstr->var2.bottom = v12;
    retstr->var2.right = v13;
    [WeakRetained scrollIndicatorInsetsForTabDocumentView:self];
    *(_OWORD *)&retstr->var3.var0.top = v26;
    *(_OWORD *)&retstr->var3.var0.bottom = v27;
    *(_OWORD *)&retstr->var3.var1.top = v28;
    *(_OWORD *)&retstr->var3.var1.bottom = v29;
    [WeakRetained minimumWebViewLayoutSizeForTabDocumentView:self];
    retstr->var4.double width = v14;
    retstr->var4.double height = v15;
    [WeakRetained minimumUnobscuredWebViewLayoutSizeForTabDocumentView:self];
    retstr->var5.double width = v16;
    retstr->var5.double height = v17;
    [WeakRetained maximumUnobscuredWebViewLayoutSizeForTabDocumentView:self];
    retstr->var6.double width = v18;
    retstr->var6.double height = v19;
    [WeakRetained scrollViewContentInsetAdjustmentsForTabDocumentView:self];
    retstr->var7.top = v20;
    retstr->var7.left = v21;
    retstr->var7.bottom = v22;
    retstr->var7.right = v23;
    retstr->var8 = [WeakRetained inElementFullscreenForTabDocumentView:self];
    [WeakRetained minimumEffectiveDeviceWidthForTabDocumentView:self];
    retstr->var9 = v24;
  }

  return result;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  double v5 = (WKWebView *)a3;
  webView = self->_webView;
  CGFloat v7 = v5;
  if (webView != v5)
  {
    [(WKWebView *)webView removeFromSuperview];
    objc_storeStrong((id *)&self->_webView, a3);
    if (v7) {
      [(TabDocumentView *)self addSubview:v7];
    }
    [(TabDocumentView *)self setNeedsLayout];
  }
}

- (void)setReaderWebView:(id)a3
{
  double v5 = (WKWebView *)a3;
  readerWebView = self->_readerWebView;
  CGFloat v7 = v5;
  if (readerWebView != v5)
  {
    [(WKWebView *)readerWebView removeFromSuperview];
    objc_storeStrong((id *)&self->_readerWebView, a3);
    if (v7) {
      [(TabDocumentView *)self addSubview:v7];
    }
    [(TabDocumentView *)self setNeedsLayout];
  }
}

- (void)setGeometryProvider:(id)a3
{
}

- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  CGFloat v11 = (void (**)(void))a5;
  if (self->_showingReader != v6)
  {
    if (self->_interactiveGeometryUpdateCount)
    {
      if (self->_showingReader) {
        CGFloat v8 = &OBJC_IVAR___TabDocumentView__readerWebView;
      }
      else {
        CGFloat v8 = &OBJC_IVAR___TabDocumentView__webView;
      }
      [*(id *)((char *)&self->super.super.super.isa + *v8) _endInteractiveObscuredInsetsChange];
      int64_t interactiveGeometryUpdateCount = self->_interactiveGeometryUpdateCount;
      self->_int showingReader = v6;
      if (interactiveGeometryUpdateCount)
      {
        if (v6) {
          CGFloat v10 = &OBJC_IVAR___TabDocumentView__readerWebView;
        }
        else {
          CGFloat v10 = &OBJC_IVAR___TabDocumentView__webView;
        }
        [*(id *)((char *)&self->super.super.super.isa + *v10) _beginInteractiveObscuredInsetsChange];
      }
      if (v5) {
        goto LABEL_12;
      }
    }
    else
    {
      self->_int showingReader = v6;
      if (v5)
      {
LABEL_12:
        [(TabDocumentView *)self _performReaderTransitionWithCompletion:v11];
        goto LABEL_16;
      }
    }
    [(TabDocumentView *)self setNeedsLayout];
    if (v11) {
      v11[2]();
    }
  }
LABEL_16:
}

- (void)_performReaderTransitionWithCompletion:(id)a3
{
  id v35 = a3;
  p_readerTransitionContainerView = &self->_readerTransitionContainerView;
  [(UIView *)self->_readerTransitionContainerView removeFromSuperview];
  id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(TabDocumentView *)self bounds];
  objc_super v33 = objc_msgSend(v5, "initWithFrame:");
  objc_storeStrong((id *)&self->_readerTransitionContainerView, v33);
  [(TabDocumentView *)self setNeedsLayout];
  [(TabDocumentView *)self layoutSubviews];
  if (self->_showingReader) {
    BOOL v6 = &OBJC_IVAR___TabDocumentView__webView;
  }
  else {
    BOOL v6 = &OBJC_IVAR___TabDocumentView__readerWebView;
  }
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);
  CGFloat v8 = [v7 snapshotViewAfterScreenUpdates:0];
  uint64_t v48 = 0;
  double v49 = (double *)&v48;
  uint64_t v50 = 0x5012000000;
  double v51 = __Block_byref_object_copy__12;
  double v52 = __Block_byref_object_dispose__12;
  double v53 = "";
  long long v54 = 0u;
  long long v55 = 0u;
  [v8 bounds];
  *(void *)&long long v54 = v9;
  *((void *)&v54 + 1) = v10;
  *(void *)&long long v55 = v11;
  *((void *)&v55 + 1) = v12;
  id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  CGFloat v14 = objc_msgSend(v13, "initWithFrame:", v49[6], v49[7], v49[8], v49[9]);
  [v14 setClipsToBounds:1];
  [v14 addSubview:v8];
  [(UIView *)*p_readerTransitionContainerView addSubview:v14];
  id v15 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v14 bounds];
  CGFloat v16 = objc_msgSend(v15, "initWithFrame:");
  CGFloat v17 = [MEMORY[0x1E4FB1618] blackColor];
  [v16 setBackgroundColor:v17];

  double v18 = 0.0;
  if (!self->_showingReader) {
    double v18 = 0.3;
  }
  objc_msgSend(v16, "setAlpha:", v18, v33);
  if (self->_showingReader) {
    [v14 addSubview:v16];
  }
  else {
    [(UIView *)*p_readerTransitionContainerView insertSubview:v16 belowSubview:v14];
  }
  CGFloat v19 = (void *)MEMORY[0x1E4FB1EB0];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke;
  v45[3] = &unk_1E6D791E8;
  id v20 = v16;
  id v46 = v20;
  long long v47 = self;
  [v19 animateWithDuration:0 delay:v45 options:0 animations:0.3 completion:0.0];
  CGFloat v21 = (void *)MEMORY[0x1E4FB1EB0];
  LODWORD(v19) = self->_showingReader;
  CAFrameRateRange v56 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v56.minimum;
  float maximum = v56.maximum;
  float preferred = v56.preferred;
  if (v19) {
    double v25 = 0.15;
  }
  else {
    double v25 = 0.0;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_2;
  v40[3] = &unk_1E6D7DE40;
  id v26 = v8;
  double v44 = &v48;
  id v41 = v26;
  long long v42 = self;
  id v27 = v14;
  id v43 = v27;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_3;
  v36[3] = &unk_1E6D7DE68;
  id v28 = v34;
  id v37 = v28;
  CGSize v38 = self;
  id v29 = v35;
  id v39 = v29;
  *(float *)&double v30 = minimum;
  *(float *)&double v31 = maximum;
  *(float *)&double v32 = preferred;
  objc_msgSend(v21, "sf_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 0, v40, v36, v25, 0.0, v30, v31, v32);

  _Block_object_dispose(&v48, 8);
}

uint64_t __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  double v3 = 0.3;
  if (!*(unsigned char *)(*(void *)(v2 + 8) + 448)) {
    double v3 = 0.0;
  }
  return [v1 setAlpha:v3];
}

uint64_t __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double Height = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 48));
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  double v12 = *(double *)(v11 + 56);
  if (*(unsigned char *)(*(void *)(a1 + 40) + 448))
  {
    *(double *)(v11 + 56) = Height + v12;
    double v13 = v5 - Height;
  }
  else
  {
    *(double *)(v11 + 56) = v12 - Height;
    double v13 = v5 + Height;
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 64), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 72));
  CGFloat v14 = *(void **)(a1 + 32);
  return objc_msgSend(v14, "setFrame:", v3, v13, v7, v9);
}

uint64_t __58__TabDocumentView__performReaderTransitionWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(void **)(v2 + 416);
  if (v3 == *(void **)(a1 + 32))
  {
    *(void *)(v2 + 416) = 0;
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (double)scrollDistance
{
  if (self->_showingReader) {
    uint64_t v2 = &OBJC_IVAR___TabDocumentView__readerWebView;
  }
  else {
    uint64_t v2 = &OBJC_IVAR___TabDocumentView__webView;
  }
  double v3 = [*(id *)((char *)&self->super.super.super.isa + *v2) scrollView];
  [v3 contentOffset];
  double v5 = v4;
  [v3 adjustedContentInset];
  double v7 = v5 + v6;

  return v7;
}

- (BOOL)showsInteractionHint
{
  return self->_interactionHint != 0;
}

- (void)setShowsInteractionHint:(BOOL)a3
{
  BOOL v3 = a3;
  v56[8] = *MEMORY[0x1E4F143B8];
  if ([(TabDocumentView *)self showsInteractionHint] != a3)
  {
    unint64_t v5 = 0x1E4FB1000uLL;
    if (v3)
    {
      double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      interactionHint = self->_interactionHint;
      self->_interactionHint = v6;

      [(UIView *)self->_interactionHint _setContinuousCornerRadius:25.0];
      id v8 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v9 = [v8 CGColor];
      uint64_t v10 = [(UIView *)self->_interactionHint layer];
      [v10 setShadowColor:v9];

      uint64_t v11 = [(UIView *)self->_interactionHint layer];
      objc_msgSend(v11, "setShadowOffset:", 0.0, 5.0);

      double v12 = [(UIView *)self->_interactionHint layer];
      LODWORD(v13) = 1042536202;
      [v12 setShadowOpacity:v13];

      CGFloat v14 = [(UIView *)self->_interactionHint layer];
      [v14 setShadowPathIsBounds:1];

      id v15 = [(UIView *)self->_interactionHint layer];
      [v15 setShadowRadius:20.0];

      -[UIView setLayoutMargins:](self->_interactionHint, "setLayoutMargins:", 15.0, 20.0, 15.0, 20.0);
      [(UIView *)self->_interactionHint setOverrideUserInterfaceStyle:2];
      [(UIView *)self->_interactionHint setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TabDocumentView *)self addSubview:self->_interactionHint];
      double v53 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
      CGFloat v16 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v53];
      interactionHintBackground = self->_interactionHintBackground;
      self->_interactionHintBackground = v16;

      [(UIVisualEffectView *)self->_interactionHintBackground _setContinuousCornerRadius:25.0];
      [(UIVisualEffectView *)self->_interactionHintBackground setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_interactionHint _sf_addEdgeMatchedSubview:self->_interactionHintBackground];
      id v18 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      [v18 setNumberOfLines:0];
      CGFloat v19 = _WBSLocalizedString();
      [v18 setText:v19];

      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v20) = 1148846080;
      [v18 setContentHuggingPriority:1 forAxis:v20];
      [(UIView *)self->_interactionHint addSubview:v18];
      CGFloat v21 = [(UIView *)self->_interactionHint topAnchor];
      CGFloat v22 = [(TabDocumentView *)self topAnchor];
      CGFloat v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
      interactionHintTopAnchor = self->_interactionHintTopAnchor;
      self->_interactionHintTopAnchor = v23;

      long long v54 = [(UIView *)self->_interactionHint layoutMarginsGuide];
      double v25 = (void *)MEMORY[0x1E4F28DC8];
      double v52 = [v18 leadingAnchor];
      long long v47 = [v54 leadingAnchor];
      id v46 = objc_msgSend(v52, "constraintEqualToAnchor:");
      v56[0] = v46;
      double v51 = [v18 trailingAnchor];
      double v45 = [v54 trailingAnchor];
      double v44 = objc_msgSend(v51, "constraintEqualToAnchor:");
      v56[1] = v44;
      uint64_t v50 = [v18 topAnchor];
      id v43 = [v54 topAnchor];
      long long v42 = objc_msgSend(v50, "constraintEqualToAnchor:");
      v56[2] = v42;
      double v49 = [v18 bottomAnchor];
      id v41 = [v54 bottomAnchor];
      uint64_t v26 = objc_msgSend(v49, "constraintEqualToAnchor:");
      id v27 = self->_interactionHintTopAnchor;
      long long v40 = (void *)v26;
      v56[3] = v26;
      v56[4] = v27;
      uint64_t v48 = [(UIView *)self->_interactionHint centerXAnchor];
      id v39 = [(TabDocumentView *)self centerXAnchor];
      CGSize v38 = objc_msgSend(v48, "constraintEqualToAnchor:");
      v56[5] = v38;
      id v28 = [(UIView *)self->_interactionHint leadingAnchor];
      id v29 = [(TabDocumentView *)self leadingAnchor];
      double v30 = [v28 constraintGreaterThanOrEqualToAnchor:v29 constant:20.0];
      v56[6] = v30;
      double v31 = [(UIView *)self->_interactionHint trailingAnchor];
      double v32 = [(TabDocumentView *)self trailingAnchor];
      objc_super v33 = v25;
      v34 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:-20.0];
      v56[7] = v34;
      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:8];
      [v33 activateConstraints:v35];

      unint64_t v5 = 0x1E4FB1000;
    }
    else
    {
      [(UIView *)self->_interactionHint removeFromSuperview];
      long long v36 = self->_interactionHint;
      self->_interactionHint = 0;
    }
    id v37 = *(void **)(v5 + 3760);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __43__TabDocumentView_setShowsInteractionHint___block_invoke;
    v55[3] = &unk_1E6D79060;
    v55[4] = self;
    [v37 performWithoutAnimation:v55];
  }
}

uint64_t __43__TabDocumentView_setShowsInteractionHint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setInteractionHintPresented:(BOOL)a3 animated:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__TabDocumentView_setInteractionHintPresented_animated___block_invoke;
  v4[3] = &unk_1E6D795D8;
  v4[4] = self;
  BOOL v5 = a3;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:withDuration:delay:options:animations:completion:", a4, 0, v4, 0, 0.2, 0.0);
}

uint64_t __56__TabDocumentView_setInteractionHintPresented_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:(double)*(unint64_t *)&a2];
}

- (void)applyGeometryToWebView:(id)a3
{
  id v4 = a3;
  [(TabDocumentView *)self currentGeometry];
  [(TabDocumentView *)self applyGeometry:&v5 toWebView:v4];
}

- (void)beginInteractiveGeometryChanges
{
  int64_t interactiveGeometryUpdateCount = self->_interactiveGeometryUpdateCount;
  if (!interactiveGeometryUpdateCount)
  {
    if (self->_showingReader) {
      id v4 = &OBJC_IVAR___TabDocumentView__readerWebView;
    }
    else {
      id v4 = &OBJC_IVAR___TabDocumentView__webView;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v4) _beginInteractiveObscuredInsetsChange];
    int64_t interactiveGeometryUpdateCount = self->_interactiveGeometryUpdateCount;
  }
  self->_int64_t interactiveGeometryUpdateCount = interactiveGeometryUpdateCount + 1;
}

- (void)endInteractiveGeometryChanges
{
  int64_t v2 = self->_interactiveGeometryUpdateCount - 1;
  self->_int64_t interactiveGeometryUpdateCount = v2;
  if (!v2)
  {
    if (self->_showingReader) {
      BOOL v3 = &OBJC_IVAR___TabDocumentView__readerWebView;
    }
    else {
      BOOL v3 = &OBJC_IVAR___TabDocumentView__webView;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v3) _endInteractiveObscuredInsetsChange];
  }
}

- (BOOL)isAnimatingInteractiveGeometryChanges
{
  return self->_interactiveGeometryUpdateCount != 0;
}

- (WKWebView)readerWebView
{
  return self->_readerWebView;
}

- (TabDocumentViewGeometryProviding)geometryProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryProvider);
  return (TabDocumentViewGeometryProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometryProvider);
  objc_storeStrong((id *)&self->_readerWebView, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_interactionHintTopAnchor, 0);
  objc_storeStrong((id *)&self->_interactionHintBackground, 0);
  objc_storeStrong((id *)&self->_interactionHint, 0);
  objc_storeStrong((id *)&self->_readerTransitionContainerView, 0);
}

@end