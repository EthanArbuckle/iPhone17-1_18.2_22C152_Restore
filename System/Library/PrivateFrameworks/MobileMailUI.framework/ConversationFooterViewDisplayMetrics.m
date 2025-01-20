@interface ConversationFooterViewDisplayMetrics
+ (id)displayMetricsWithSafeAreaInsets:(UIEdgeInsets)a3 interfaceOrientation:(int64_t)a4 traitCollection:(id)a5;
- (BOOL)usePhoneLandscapeSymbolConfiguration;
- (double)toolbarHeight;
- (double)topToBaseline;
- (void)setToolbarHeight:(double)a3;
- (void)setTopToBaseline:(double)a3;
- (void)setUsePhoneLandscapeSymbolConfiguration:(BOOL)a3;
@end

@implementation ConversationFooterViewDisplayMetrics

+ (id)displayMetricsWithSafeAreaInsets:(UIEdgeInsets)a3 interfaceOrientation:(int64_t)a4 traitCollection:(id)a5
{
  double bottom = a3.bottom;
  if (objc_msgSend(a5, "mf_hasCompactDimension", a3.top, a3.left, a3.bottom, a3.right)) {
    double v7 = 0.0;
  }
  else {
    double v7 = bottom;
  }
  v8 = objc_alloc_init(ConversationFooterViewDisplayMetrics);
  [(ConversationFooterViewDisplayMetrics *)v8 setUsePhoneLandscapeSymbolConfiguration:0];
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
  {
    [(ConversationFooterViewDisplayMetrics *)v8 setTopToBaseline:31.0];
    double v9 = v7 + 45.0;
    if (v7 <= 0.0) {
      double v9 = 50.0;
    }
    [(ConversationFooterViewDisplayMetrics *)v8 setToolbarHeight:v9];
  }
  else if ((unint64_t)(a4 - 3) > 1)
  {
    if (v7 <= 0.0)
    {
      double v16 = 28.0;
      [(ConversationFooterViewDisplayMetrics *)v8 setToolbarHeight:44.0];
    }
    else
    {
      [(ConversationFooterViewDisplayMetrics *)v8 setToolbarHeight:v7 + 49.0];
      double v16 = 36.0;
    }
    [(ConversationFooterViewDisplayMetrics *)v8 setTopToBaseline:v16];
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 _referenceBounds];
    double v12 = v11;
    double v14 = v13;

    double v15 = 44.0;
    if (fmin(v12, v14) <= 375.0) {
      double v15 = 32.0;
    }
    [(ConversationFooterViewDisplayMetrics *)v8 setToolbarHeight:v7 + v15];
    [(ConversationFooterViewDisplayMetrics *)v8 setTopToBaseline:21.0];
    [(ConversationFooterViewDisplayMetrics *)v8 setUsePhoneLandscapeSymbolConfiguration:1];
  }
  return v8;
}

- (double)toolbarHeight
{
  return self->_toolbarHeight;
}

- (void)setToolbarHeight:(double)a3
{
  self->_toolbarHeight = a3;
}

- (double)topToBaseline
{
  return self->_topToBaseline;
}

- (void)setTopToBaseline:(double)a3
{
  self->_topToBaseline = a3;
}

- (BOOL)usePhoneLandscapeSymbolConfiguration
{
  return self->_usePhoneLandscapeSymbolConfiguration;
}

- (void)setUsePhoneLandscapeSymbolConfiguration:(BOOL)a3
{
  self->_usePhoneLandscapeSymbolConfiguration = a3;
}

@end