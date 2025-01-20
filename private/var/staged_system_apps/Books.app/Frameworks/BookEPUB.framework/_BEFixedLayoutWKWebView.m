@interface _BEFixedLayoutWKWebView
- (CGRect)_visibleContentRect;
- (CGSize)be_fixedLayoutSize;
- (NSString)currentInitialScaleString;
- (double)be_initialScale;
- (double)be_maxScale;
- (double)be_minScale;
- (id)be_viewportArguments;
- (id)be_viewportArgumentsAtScale:(double)a3;
- (void)be_applyMetaViewportOverridesForFixedLayoutSize:(CGSize)a3;
- (void)be_applyViewportArgumentsIfNeeded;
- (void)setBe_fixedLayoutSize:(CGSize)a3;
- (void)setBe_maxScale:(double)a3;
- (void)setBe_minScale:(double)a3;
- (void)setCurrentInitialScaleString:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _BEFixedLayoutWKWebView

- (void)setFrame:(CGRect)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_F43C;
  v5[3] = &unk_3C05B0;
  CGRect v6 = a3;
  v5[4] = self;
  v4 = objc_retainBlock(v5);
  if ([(BEWKWebView *)self be_finishedInit])
  {
    [(_BEFixedLayoutWKWebView *)self _beginAnimatedResizeWithUpdates:v4];
    [(_BEFixedLayoutWKWebView *)self _endAnimatedResize];
  }
  else
  {
    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)be_applyMetaViewportOverridesForFixedLayoutSize:(CGSize)a3
{
  if (a3.height > 0.0 && a3.width > 0.0)
  {
    [(_BEFixedLayoutWKWebView *)self setBe_fixedLayoutSize:"setBe_fixedLayoutSize:"];
    [(_BEFixedLayoutWKWebView *)self setBe_minScale:0.01];
    [(_BEFixedLayoutWKWebView *)self setBe_maxScale:10.0];
  }
  id v4 = [(_BEFixedLayoutWKWebView *)self be_viewportArguments];
  [(_BEFixedLayoutWKWebView *)self _overrideViewportWithArguments:v4];
}

- (void)be_applyViewportArgumentsIfNeeded
{
  [(_BEFixedLayoutWKWebView *)self be_initialScale];
  double v4 = v3;
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  CGRect v6 = [v5 stringValue];

  v7 = [(_BEFixedLayoutWKWebView *)self currentInitialScaleString];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v9 = [(_BEFixedLayoutWKWebView *)self be_viewportArgumentsAtScale:v4];
    v10.receiver = self;
    v10.super_class = (Class)_BEFixedLayoutWKWebView;
    [(_BEFixedLayoutWKWebView *)&v10 _overrideViewportWithArguments:v9];
  }
}

- (double)be_initialScale
{
  [(_BEFixedLayoutWKWebView *)self frame];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  double width = self->_be_fixedLayoutSize.width;
  CGFloat v12 = 0.0;
  if (width > 0.0) {
    CGFloat v12 = CGRectGetWidth(*(CGRect *)&v3) / width;
  }
  double height = self->_be_fixedLayoutSize.height;
  if (height > 0.0)
  {
    v15.origin.x = v7;
    v15.origin.y = v8;
    v15.size.double width = v9;
    v15.size.double height = v10;
    if (v12 * height < CGRectGetHeight(v15))
    {
      v16.origin.x = v7;
      v16.origin.y = v8;
      v16.size.double width = v9;
      v16.size.double height = v10;
      CGFloat v12 = CGRectGetHeight(v16) / height;
    }
  }
  double result = self->_be_minScale;
  if (v12 >= result) {
    double result = v12;
  }
  if (result >= self->_be_maxScale) {
    return self->_be_maxScale;
  }
  return result;
}

- (id)be_viewportArguments
{
  [(_BEFixedLayoutWKWebView *)self be_initialScale];

  return -[_BEFixedLayoutWKWebView be_viewportArgumentsAtScale:](self, "be_viewportArgumentsAtScale:");
}

- (id)be_viewportArgumentsAtScale:(double)a3
{
  double v4 = +[NSNumber numberWithDouble:a3];
  double v5 = [v4 stringValue];

  [(_BEFixedLayoutWKWebView *)self setCurrentInitialScaleString:v5];
  v17[0] = v5;
  v16[0] = @"initial-scale";
  v16[1] = @"width";
  double v6 = +[NSNumber numberWithDouble:self->_be_fixedLayoutSize.width];
  CGFloat v7 = [v6 stringValue];
  v17[1] = v7;
  v16[2] = @"height";
  CGFloat v8 = +[NSNumber numberWithDouble:self->_be_fixedLayoutSize.height];
  CGFloat v9 = [v8 stringValue];
  v17[2] = v9;
  v17[3] = @"no";
  v16[3] = @"user-scalable";
  v16[4] = @"minimum-scale";
  CGFloat v10 = +[NSNumber numberWithDouble:self->_be_minScale];
  v11 = [v10 stringValue];
  v17[4] = v11;
  v16[5] = @"maximum-scale";
  CGFloat v12 = +[NSNumber numberWithDouble:self->_be_maxScale];
  v13 = [v12 stringValue];
  v16[6] = @"shrink-to-fit";
  v17[5] = v13;
  v17[6] = @"yes";
  v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:7];

  return v14;
}

- (CGRect)_visibleContentRect
{
  CGFloat v3 = [(_BEFixedLayoutWKWebView *)self scrollView];
  [v3 zoomScale];
  uint64_t v5 = v4;

  double v6 = [(_BEFixedLayoutWKWebView *)self _scroller];
  if (v6)
  {
    CGFloat v7 = [(_BEFixedLayoutWKWebView *)self be_contentView];
    [v6 zoomScale];
    if (v8 == 1.0)
    {
      [v7 bounds];
      CGFloat x = v9;
      CGFloat y = v11;
      CGFloat width = v13;
      CGFloat height = v15;
    }
    else
    {
      [v6 visibleBounds];
      [v7 convertRect:v6 fromView:];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      [v7 bounds];
      v44.origin.CGFloat x = v22;
      v44.origin.CGFloat y = v24;
      v44.size.CGFloat width = v26;
      v44.size.CGFloat height = v28;
      CGRect v41 = CGRectIntersection(v40, v44);
      CGFloat x = v41.origin.x;
      CGFloat y = v41.origin.y;
      CGFloat width = v41.size.width;
      CGFloat height = v41.size.height;
      v29 = _BookEPUBLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.CGFloat width = width;
        v42.size.CGFloat height = height;
        v30 = NSStringFromCGRect(v42);
        *(_DWORD *)buf = 138412546;
        v37 = v30;
        __int16 v38 = 2048;
        uint64_t v39 = v5;
        _os_log_impl(&def_7BFC0, v29, OS_LOG_TYPE_DEBUG, "{WebViewLifeCycle} webView new visibleFrame %@ at scale %f", buf, 0x16u);
      }
    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)_BEFixedLayoutWKWebView;
    [(BEWKWebView *)&v35 _visibleContentRect];
    CGFloat x = v17;
    CGFloat y = v18;
    CGFloat width = v19;
    CGFloat height = v20;
  }

  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (CGSize)be_fixedLayoutSize
{
  double width = self->_be_fixedLayoutSize.width;
  double height = self->_be_fixedLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBe_fixedLayoutSize:(CGSize)a3
{
  self->_be_fixedLayoutSize = a3;
}

- (double)be_minScale
{
  return self->_be_minScale;
}

- (void)setBe_minScale:(double)a3
{
  self->_be_minScale = a3;
}

- (double)be_maxScale
{
  return self->_be_maxScale;
}

- (void)setBe_maxScale:(double)a3
{
  self->_be_maxScale = a3;
}

- (NSString)currentInitialScaleString
{
  return self->_currentInitialScaleString;
}

- (void)setCurrentInitialScaleString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end