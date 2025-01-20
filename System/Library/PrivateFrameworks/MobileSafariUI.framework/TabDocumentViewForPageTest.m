@interface TabDocumentViewForPageTest
- ($FBE3A1C208404EC7AA4040899845A87A)currentGeometry;
- (void)setFixedWebViewSize:(CGSize)a3 completionHandler:(id)a4;
@end

@implementation TabDocumentViewForPageTest

- ($FBE3A1C208404EC7AA4040899845A87A)currentGeometry
{
  p_fixedWebViewSize = &self->_fixedWebViewSize;
  if (self->_fixedWebViewSize.width == *MEMORY[0x1E4F1DB30]
    && self->_fixedWebViewSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v16.receiver = self;
    v16.super_class = (Class)TabDocumentViewForPageTest;
    return ($FBE3A1C208404EC7AA4040899845A87A *)[($FBE3A1C208404EC7AA4040899845A87A *)&v16 currentGeometry];
  }
  else
  {
    *(_OWORD *)&retstr->var7.bottom = 0u;
    *(_OWORD *)&retstr->var8 = 0u;
    retstr->var6 = 0u;
    *(_OWORD *)&retstr->var7.top = 0u;
    retstr->var4 = 0u;
    retstr->var5 = 0u;
    *(_OWORD *)&retstr->var3.var1.top = 0u;
    *(_OWORD *)&retstr->var3.var1.bottom = 0u;
    *(_OWORD *)&retstr->var3.var0.top = 0u;
    *(_OWORD *)&retstr->var3.var0.bottom = 0u;
    *(_OWORD *)&retstr->var2.top = 0u;
    *(_OWORD *)&retstr->var2.bottom = 0u;
    *(_OWORD *)&retstr->var1.top = 0u;
    *(_OWORD *)&retstr->var1.bottom = 0u;
    retstr->var0.origin = 0u;
    retstr->var0.CGSize size = 0u;
    [(TabDocumentViewForPageTest *)self bounds];
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
    double v10 = p_fixedWebViewSize->width;
    double v11 = p_fixedWebViewSize->height;
    CGFloat v12 = CGRectGetMidX(v17) - v10 * 0.5;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v18);
    retstr->var0.origin.CGFloat x = v12;
    retstr->var0.origin.CGFloat y = MidY - v11 * 0.5;
    retstr->var0.size.CGFloat width = v10;
    retstr->var0.size.CGFloat height = v11;
    CGSize size = retstr->var0.size;
    retstr->var4 = size;
    retstr->var5 = size;
    retstr->var6 = size;
    retstr->var9 = v10;
  }
  return result;
}

- (void)setFixedWebViewSize:(CGSize)a3 completionHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void))a4;
  v8 = [(TabDocumentView *)self webView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_fixedWebViewSize.double width = width;
    self->_fixedWebViewSize.double height = height;
    v14 = [(TabDocumentView *)self webView];
    [(TabDocumentView *)self applyGeometryToWebView:v14];

    v15 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_super v16 = v15;
      CGRect v17 = [(TabDocumentView *)self webView];
      [v17 frame];
      uint64_t v19 = v18;
      v20 = [(TabDocumentView *)self webView];
      [v20 frame];
      uint64_t v22 = v21;
      v23 = [(TabDocumentView *)self webView];
      [v23 frame];
      uint64_t v25 = v24;
      v26 = [(TabDocumentView *)self webView];
      [v26 frame];
      int v28 = 134218752;
      uint64_t v29 = v19;
      __int16 v30 = 2048;
      uint64_t v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = v27;
      _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_INFO, "WebView frame for Page Test is (%.0f-%.0f, %.0fx%.0f)", (uint8_t *)&v28, 0x2Au);
    }
  }
  v7[2](v7, 0);
}

@end