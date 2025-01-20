@interface PKDiscoveryInlineCaptionedMediaShelfView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiscoveryInlineCaptionedMediaShelfView)initWithShelf:(id)a3 mediaView:(id)a4;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
@end

@implementation PKDiscoveryInlineCaptionedMediaShelfView

- (PKDiscoveryInlineCaptionedMediaShelfView)initWithShelf:(id)a3 mediaView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PKDiscoveryInlineCaptionedMediaShelfView;
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v13 = -[PKDiscoveryShelfView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_shelf, a3);
    v14->_isInline = [(PKDiscoveryInlineMediaShelf *)v14->_shelf displayType] == 1;
    uint64_t v15 = [v7 media];
    media = v14->_media;
    v14->_media = (PKDiscoveryMedia *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v10, v11, v12);
    mediaContainerView = v14->_mediaContainerView;
    v14->_mediaContainerView = (UIView *)v17;

    [(UIView *)v14->_mediaContainerView setClipsToBounds:1];
    [(PKDiscoveryInlineCaptionedMediaShelfView *)v14 addSubview:v14->_mediaContainerView];
    if (v14->_isInline) {
      [(UIView *)v14->_mediaContainerView _setContinuousCornerRadius:8.0];
    }
    p_mediaView = (id *)&v14->_mediaView;
    objc_storeStrong((id *)&v14->_mediaView, a4);
    v20 = (void *)MEMORY[0x1E4FB1618];
    v21 = [(PKDiscoveryMedia *)v14->_media backgroundColor];
    v22 = objc_msgSend(v20, "pkui_colorWithPKColor:", v21);
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    }
    v25 = v24;

    [*p_mediaView setBackgroundColor:v25];
    [(UIView *)v14->_mediaContainerView addSubview:*p_mediaView];
    [*p_mediaView setAccessibilityIgnoresInvertColors:1];
    v26 = [v7 localizedCaption];
    if (v26)
    {
      v27 = [[PKDiscoveryInlineMediaCaptionView alloc] initWithCaptionText:v26];
      captionView = v14->_captionView;
      v14->_captionView = v27;
    }
    [(UIView *)v14->_mediaContainerView addSubview:v14->_captionView];
    v29 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    [v29 lineHeight];
    v14->_leadingSpace = v30;
  }
  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (self->_isInline)
  {
    [(PKDiscoveryShelfView *)self contentInsets];
    double v7 = v5 + v6;
    double width = width - (v5 + v6);
  }
  else
  {
    double v7 = 0.0;
  }
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v10 = [(PKDiscoveryInlineMediaShelf *)self->_shelf media];
  [v10 width];
  double v12 = v11;
  [v10 height];
  if (v13 > 0.0 && v12 > 0.0)
  {
    double v9 = v13 * (width / v12);
    double v8 = width;
  }
  captionView = self->_captionView;
  if (captionView)
  {
    -[PKDiscoveryInlineMediaCaptionView sizeThatFits:](captionView, "sizeThatFits:", v8, 1.79769313e308);
    double v9 = v9 + v15;
  }
  v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
  [v16 lineHeight];
  double v18 = v17;

  v19.n128_f64[0] = v7 + width;
  v20.n128_f64[0] = v9 + v18;
  PKSizeRoundToPixel(v19, v20, v21);
  double v23 = v22;
  double v25 = v24;

  double v26 = v23;
  double v27 = v25;
  result.height = v27;
  result.double width = v26;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryInlineCaptionedMediaShelfView;
  -[PKDiscoveryShelfView setContentInsets:](&v9, sel_setContentInsets_);
  captionView = self->_captionView;
  if (captionView) {
    -[PKDiscoveryShelfView setContentInsets:](captionView, "setContentInsets:", top, left, bottom, right);
  }
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKDiscoveryInlineCaptionedMediaShelfView;
  [(PKDiscoveryInlineCaptionedMediaShelfView *)&v24 layoutSubviews];
  [(PKDiscoveryInlineCaptionedMediaShelfView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(PKDiscoveryShelfView *)self contentInsets];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PKDiscoveryInlineMediaShelf *)self->_shelf media];
  double v12 = v11;
  double v13 = v8 + v10;
  double v14 = 0.0;
  if (!self->_isInline) {
    double v13 = 0.0;
  }
  double v15 = v6 - v13;
  if (self->_isInline) {
    double v16 = v8;
  }
  else {
    double v16 = -0.0;
  }
  [v11 width];
  double v18 = v17;
  [v12 height];
  double v20 = 0.0;
  if (v19 > 0.0 && v18 > 0.0) {
    double v20 = v19 * (v15 / v18);
  }
  double v21 = v4 + v16;
  captionView = self->_captionView;
  if (captionView)
  {
    -[PKDiscoveryInlineMediaCaptionView sizeThatFits:](captionView, "sizeThatFits:", v15, 1.79769313e308);
    double v14 = v23;
  }
  -[UIView setFrame:](self->_mediaContainerView, "setFrame:", v21, self->_leadingSpace, v15, v20 + v14);
  -[UIView setFrame:](self->_mediaView, "setFrame:", 0.0, 0.0, v15, v20);
  if (self->_captionView)
  {
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.double width = v15;
    v25.size.height = v20;
    -[PKDiscoveryInlineMediaCaptionView setFrame:](self->_captionView, "setFrame:", 0.0, CGRectGetMaxY(v25), v15, v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
  objc_storeStrong((id *)&self->_mediaContainerView, 0);

  objc_storeStrong((id *)&self->_shelf, 0);
}

@end