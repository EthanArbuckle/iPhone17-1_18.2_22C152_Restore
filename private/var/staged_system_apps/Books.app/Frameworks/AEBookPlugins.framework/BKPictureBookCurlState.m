@interface BKPictureBookCurlState
- (BKPageCurl)pageCurl;
- (BKPictureBookCurlContainerView)curlContainer;
- (BKPictureBookCurlState)init;
- (BKPictureBookNavigationDelegate)navDelegate;
- (BOOL)_isNightMode;
- (BOOL)applyMaskAndGutter;
- (BOOL)finishManualCurlAtPostion:(CGPoint)a3;
- (BOOL)generateWithOldLeftPageNumber:(int64_t)a3 oldRightPageNumber:(int64_t)a4 newLeftPageNumber:(int64_t)a5 newRightPageNumber:(int64_t)a6;
- (BOOL)generateWithOldLeftPageNumber:(int64_t)a3 oldRightPageNumber:(int64_t)a4 newLeftPageNumber:(int64_t)a5 newRightPageNumber:(int64_t)a6 useMirrorForBackImage:(BOOL)a7;
- (BOOL)isAutoCurl;
- (BOOL)isForwardCurl;
- (CGPoint)manualCurlStartPosition;
- (UIView)leftSourceView;
- (UIView)rightSourceView;
- (double)curlThreshold;
- (double)scale;
- (id)_getDummyImageForSize:(CGSize)a3;
- (id)backPage;
- (id)backPageArray;
- (id)backPagesImageArray;
- (id)curlPage;
- (id)leftPage;
- (id)pageArray;
- (id)pagesImageArray;
- (id)rightPage;
- (int64_t)newLeftPageNumber;
- (int64_t)newRightPageNumber;
- (int64_t)oldLeftPageNumber;
- (int64_t)oldRightPageNumber;
- (void)cancelManualCurl;
- (void)dealloc;
- (void)setApplyMaskAndGutter:(BOOL)a3;
- (void)setAutoCurl:(BOOL)a3;
- (void)setCurlContainer:(id)a3;
- (void)setCurlThreshold:(double)a3;
- (void)setForwardCurl:(BOOL)a3;
- (void)setLeftSourceView:(id)a3;
- (void)setNavDelegate:(id)a3;
- (void)setPageCurl:(id)a3;
- (void)setRightSourceView:(id)a3;
- (void)setScale:(double)a3;
- (void)startManualCurlAtPostion:(CGPoint)a3;
- (void)updateManualCurlToPosition:(CGPoint)a3;
@end

@implementation BKPictureBookCurlState

- (BKPictureBookCurlState)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKPictureBookCurlState;
  v2 = [(BKPictureBookCurlState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_scale = 1.0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(BKPictureBookCurlState *)self setCurlContainer:0];
  v3.receiver = self;
  v3.super_class = (Class)BKPictureBookCurlState;
  [(BKPictureBookCurlState *)&v3 dealloc];
}

- (BOOL)generateWithOldLeftPageNumber:(int64_t)a3 oldRightPageNumber:(int64_t)a4 newLeftPageNumber:(int64_t)a5 newRightPageNumber:(int64_t)a6
{
  return [(BKPictureBookCurlState *)self generateWithOldLeftPageNumber:a3 oldRightPageNumber:a4 newLeftPageNumber:a5 newRightPageNumber:a6 useMirrorForBackImage:1];
}

- (BOOL)generateWithOldLeftPageNumber:(int64_t)a3 oldRightPageNumber:(int64_t)a4 newLeftPageNumber:(int64_t)a5 newRightPageNumber:(int64_t)a6 useMirrorForBackImage:(BOOL)a7
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);
  v13 = WeakRetained;
  if (WeakRetained && self->_navDelegate)
  {
    int64_t v55 = a4;
    int64_t v60 = a5;
    [WeakRetained bounds];
    double x = v73.origin.x;
    double y = v73.origin.y;
    double height = v73.size.height;
    double v17 = v73.size.width * 0.5;
    double MidX = CGRectGetMidX(v73);
    double v19 = MidX + x;
    BOOL forwardCurl = self->_forwardCurl;
    if (self->_forwardCurl) {
      double v20 = x;
    }
    else {
      double v20 = MidX + x;
    }
    if (self->_forwardCurl) {
      double v21 = MidX + x;
    }
    else {
      double v21 = x + -1.0;
    }
    v22 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", x, y, v17, height);
    v23 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", v19, y, v17, height);
    v24 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", v21, y, v17 + 1.0, height);
    v25 = -[BKPictureBookCurlPageView initWithFrame:]([BKPictureBookCurlPageView alloc], "initWithFrame:", v20, y, v17, height);
    objc_storeStrong((id *)&self->_leftPage, v22);
    objc_storeStrong((id *)&self->_rightPage, v23);
    v58 = v24;
    objc_storeStrong((id *)&self->_backPage, v24);
    v57 = v25;
    objc_storeStrong((id *)&self->_otherBackPage, v25);
    [(BKPictureBookCurlPageView *)self->_backPage setClipsToBounds:0];
    [(BKPictureBookCurlPageView *)v22 setScale:self->_scale];
    [(BKPictureBookCurlPageView *)v22 setDrawsSpine:self->_applyMaskAndGutter];
    [(BKPictureBookCurlPageView *)v23 setScale:self->_scale];
    [(BKPictureBookCurlPageView *)v23 setDrawsSpine:self->_applyMaskAndGutter];
    [(BKPictureBookCurlPageView *)v23 setRight:1];
    v26 = [(BKPictureBookCurlState *)self leftSourceView];
    v27 = [v26 window];

    if (v27)
    {
      v28 = [(BKPictureBookCurlState *)self leftSourceView];
      v29 = [(BKPictureBookCurlState *)self leftSourceView];
      [v29 bounds];
      [v28 resizableSnapshotViewFromRect:0];
      v31 = v30 = v22;
      [(BKPictureBookCurlPageView *)v30 addSubview:v31];

      v22 = v30;
    }
    else
    {
      navDelegate = self->_navDelegate;
      double scale = self->_scale;
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_1AF74;
      v71[3] = &unk_1DAC00;
      v72 = v22;
      -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](navDelegate, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", a3, 0, 0, v71, v17, height, scale);
    }
    int64_t v35 = v55;
    LODWORD(v55) = !forwardCurl;
    -[BKPictureBookCurlPageView setPageOffset:](v22, "setPageOffset:", a3, v55);
    v36 = [(BKPictureBookCurlState *)self rightSourceView];
    v37 = [v36 window];

    if (v37)
    {
      v38 = [(BKPictureBookCurlState *)self rightSourceView];
      v39 = [(BKPictureBookCurlState *)self rightSourceView];
      [v39 bounds];
      v40 = [v38 resizableSnapshotViewFromRect:0];
      [(BKPictureBookCurlPageView *)v23 addSubview:v40];
    }
    else
    {
      v41 = self->_navDelegate;
      double v42 = self->_scale;
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_1AF80;
      v69[3] = &unk_1DAC00;
      v70 = v23;
      -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v41, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", v35, 1, 0, v69, v17, height, v42);
      v38 = v70;
    }

    [(BKPictureBookCurlPageView *)v23 setPageOffset:v35];
    if (self->_forwardCurl) {
      int64_t v43 = v60;
    }
    else {
      int64_t v43 = a6;
    }
    [(BKPictureBookCurlPageView *)self->_backPage setPageOffset:v43];
    [(BKPictureBookCurlPageView *)self->_backPage setScale:self->_scale];
    [(BKPictureBookCurlPageView *)self->_backPage setDrawsSpine:self->_applyMaskAndGutter];
    v59 = v22;
    if ([(BKPictureBookCurlState *)self _isNightMode]) {
      +[UIColor blackColor];
    }
    else {
    v44 = +[UIColor whiteColor];
    }
    [(BKPictureBookCurlPageView *)self->_backPage setBackgroundColor:v44];
    v45 = self->_navDelegate;
    if (self->_forwardCurl) {
      int64_t v46 = v60;
    }
    else {
      int64_t v46 = a6;
    }
    double v47 = self->_scale;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1AF8C;
    v66[3] = &unk_1DAE30;
    v66[4] = self;
    char v68 = v56;
    id v48 = v13;
    id v67 = v48;
    -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v45, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", v46, !forwardCurl, 0, v66, v17, height, v47);
    v49 = self->_navDelegate;
    double v50 = self->_scale;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1B020;
    v64[3] = &unk_1DAC00;
    id v51 = v48;
    id v65 = v51;
    BOOL v32 = 1;
    -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v49, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", a6, 1, 0, v64, v17, height, v50);
    v52 = self->_navDelegate;
    double v53 = self->_scale;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1B02C;
    v62[3] = &unk_1DAC00;
    id v63 = v51;
    -[BKPictureBookNavigationDelegate pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:](v52, "pageNavigationSnapshotForPageNumber:size:isRight:zoomScale:applyMaskAndGutter:completion:", v60, 0, 0, v62, v17, height, v53);
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)_isNightMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);
  objc_super v3 = [WeakRetained traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == (char *)&dword_0 + 2 || UIAccessibilityIsInvertColorsEnabled();

  return v4;
}

- (id)_getDummyImageForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  v5 = +[UIColor whiteColor];
  [v5 setFill];

  v9.origin.double x = 0.0;
  v9.origin.double y = 0.0;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  UIRectFill(v9);
  objc_super v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v6;
}

- (void)startManualCurlAtPostion:(CGPoint)a3
{
  self->_manualCurlStartPosition = a3;
  self->_manualCurlCurrentTime = CFAbsoluteTimeGetCurrent();
}

- (void)updateManualCurlToPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_manualCurlCurrentTime = CFAbsoluteTimeGetCurrent();
  pageCurl = self->_pageCurl;

  -[BKPageCurl updateManualCurlToLocation:](pageCurl, "updateManualCurlToLocation:", x, y);
}

- (BOOL)finishManualCurlAtPostion:(CGPoint)a3
{
  double v4 = vabdd_f64(a3.x, self->_manualCurlStartPosition.x);
  p_curlContainer = &self->_curlContainer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);
  [WeakRetained frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  double curlThreshold = self->_curlThreshold;
  v23.origin.double x = v8;
  v23.origin.double y = v10;
  v23.size.CGFloat width = v12;
  v23.size.CGFloat height = v14;
  double v16 = curlThreshold * CGRectGetWidth(v23);
  if (v4 <= v16)
  {
    if (!self->_applyMaskAndGutter)
    {
      double v21 = [(BKPictureBookCurlState *)self curlPage];
      [v21 pageCurlWillCancel];
    }
    [(BKPictureBookCurlState *)self cancelManualCurl];
  }
  else
  {
    [(BKPageCurl *)self->_pageCurl finishManualCurl];
    double v17 = [(BKPictureBookCurlPageView *)self->_backPage image];
    BOOL forwardCurl = self->_forwardCurl;
    id v19 = objc_loadWeakRetained((id *)p_curlContainer);
    double v20 = v19;
    if (forwardCurl) {
      [v19 setLeftImage:v17];
    }
    else {
      [v19 setRightImage:v17];
    }
  }
  return v4 > v16;
}

- (void)cancelManualCurl
{
}

- (id)pagesImageArray
{
  objc_super v3 = [(BKPictureBookCurlPageView *)self->_leftPage image];
  double v4 = [(BKPictureBookCurlPageView *)self->_rightPage image];
  v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0);

  return v5;
}

- (id)backPagesImageArray
{
  objc_super v3 = [(BKPictureBookCurlPageView *)self->_backPage image];
  double v4 = [(BKPictureBookCurlPageView *)self->_otherBackPage image];
  v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0);

  return v5;
}

- (id)pageArray
{
  if (self->_autoCurl)
  {
    [(BKPictureBookCurlPageView *)self->_rightPage setTopView:self->_rightSourceView isRightPage:1];
    [(BKPictureBookCurlPageView *)self->_leftPage setTopView:self->_leftSourceView isRightPage:0];
  }
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_leftPage, self->_rightPage, 0);
}

- (id)backPageArray
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_backPage, self->_otherBackPage, 0);
}

- (id)leftPage
{
  return self->_leftPage;
}

- (id)rightPage
{
  return self->_rightPage;
}

- (id)backPage
{
  return self->_backPage;
}

- (int64_t)oldLeftPageNumber
{
  return self->_oldLeftPageNumber;
}

- (int64_t)oldRightPageNumber
{
  return self->_oldRightPageNumber;
}

- (int64_t)newLeftPageNumber
{
  return self->_newLeftPageNumber;
}

- (int64_t)newRightPageNumber
{
  return self->_newRightPageNumber;
}

- (id)curlPage
{
  if (self->_forwardCurl) {
    uint64_t v3 = 176;
  }
  else {
    uint64_t v3 = 168;
  }
  id v4 = *(id *)((char *)&self->super.isa + v3);
  if (self->_forwardCurl) {
    uint64_t v5 = 168;
  }
  else {
    uint64_t v5 = 176;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  if (self->_forwardCurl) {
    uint64_t v7 = 24;
  }
  else {
    uint64_t v7 = 16;
  }
  id v8 = *(id *)((char *)&self->super.isa + v7);
  if (self->_forwardCurl) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = 24;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  if (v4)
  {
    [v8 setScale:self->_scale];
    [v8 setTopView:v4 isRightPage:self->_forwardCurl];
  }
  if (v6)
  {
    [v10 setScale:self->_scale];
    [v10 setTopView:v6 isRightPage:!self->_forwardCurl];
  }
  if (!self->_applyMaskAndGutter)
  {
    [v8 setDuration:0.3];
    [v8 setShouldAnimate:self->_autoCurl];
    [v8 setShouldHaveGradient:1];
  }

  return v8;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (BKPictureBookNavigationDelegate)navDelegate
{
  return self->_navDelegate;
}

- (void)setNavDelegate:(id)a3
{
}

- (BKPictureBookCurlContainerView)curlContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_curlContainer);

  return (BKPictureBookCurlContainerView *)WeakRetained;
}

- (void)setCurlContainer:(id)a3
{
}

- (BOOL)isForwardCurl
{
  return self->_forwardCurl;
}

- (void)setForwardCurl:(BOOL)a3
{
  self->_BOOL forwardCurl = a3;
}

- (BKPageCurl)pageCurl
{
  return self->_pageCurl;
}

- (void)setPageCurl:(id)a3
{
}

- (double)curlThreshold
{
  return self->_curlThreshold;
}

- (void)setCurlThreshold:(double)a3
{
  self->_double curlThreshold = a3;
}

- (CGPoint)manualCurlStartPosition
{
  objc_copyStruct(v4, &self->_manualCurlStartPosition, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (UIView)leftSourceView
{
  return self->_leftSourceView;
}

- (void)setLeftSourceView:(id)a3
{
}

- (UIView)rightSourceView
{
  return self->_rightSourceView;
}

- (void)setRightSourceView:(id)a3
{
}

- (BOOL)isAutoCurl
{
  return self->_autoCurl;
}

- (void)setAutoCurl:(BOOL)a3
{
  self->_autoCurl = a3;
}

- (BOOL)applyMaskAndGutter
{
  return self->_applyMaskAndGutter;
}

- (void)setApplyMaskAndGutter:(BOOL)a3
{
  self->_applyMaskAndGutter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSourceView, 0);
  objc_storeStrong((id *)&self->_leftSourceView, 0);
  objc_storeStrong((id *)&self->_pageCurl, 0);
  objc_destroyWeak((id *)&self->_curlContainer);
  objc_storeStrong((id *)&self->_navDelegate, 0);
  objc_storeStrong((id *)&self->_otherBackPage, 0);
  objc_storeStrong((id *)&self->_rightPage, 0);
  objc_storeStrong((id *)&self->_leftPage, 0);

  objc_storeStrong((id *)&self->_backPage, 0);
}

@end