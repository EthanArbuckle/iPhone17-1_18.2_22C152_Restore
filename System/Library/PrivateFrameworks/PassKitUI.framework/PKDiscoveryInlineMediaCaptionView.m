@interface PKDiscoveryInlineMediaCaptionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiscoveryInlineMediaCaptionView)initWithCaptionText:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKDiscoveryInlineMediaCaptionView

- (PKDiscoveryInlineMediaCaptionView)initWithCaptionText:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKDiscoveryInlineMediaCaptionView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[PKDiscoveryShelfView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  if (v10)
  {
    v11 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(PKDiscoveryInlineMediaCaptionView *)v10 setBackgroundColor:v11];

    v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    objc_storeStrong((id *)&v10->_captionText, a3);
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    captionLabel = v10->_captionLabel;
    v10->_captionLabel = (UILabel *)v13;

    v15 = v10->_captionLabel;
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v15 setBackgroundColor:v16];

    [(UILabel *)v10->_captionLabel setFont:v12];
    v17 = v10->_captionLabel;
    v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v17 setTextColor:v18];

    [(UILabel *)v10->_captionLabel setNumberOfLines:0];
    [(UILabel *)v10->_captionLabel setText:v5];
    [(PKDiscoveryInlineMediaCaptionView *)v10 addSubview:v10->_captionLabel];
  }
  return v10;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryInlineMediaCaptionView;
  [(PKDiscoveryInlineMediaCaptionView *)&v15 layoutSubviews];
  [(PKDiscoveryInlineMediaCaptionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKDiscoveryShelfView *)self contentInsets];
  -[UILabel setFrame:](self->_captionLabel, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v21[1] = *MEMORY[0x1E4F143B8];
  [(PKDiscoveryShelfView *)self contentInsets];
  double v8 = width - (v6 + v7);
  double v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
  [v9 lineHeight];
  double v11 = v10;
  uint64_t v20 = *MEMORY[0x1E4FB06F8];
  v21[0] = v9;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_captionText attributes:v12];
  objc_msgSend(v13, "pkui_sizeThatFits:withNumberOfLines:", 0, v8, height);
  double v15 = v14;
  double v17 = v16;

  double v18 = v17 + v11 * 0.75 * 2.0;
  double v19 = v15;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionText, 0);

  objc_storeStrong((id *)&self->_captionLabel, 0);
}

@end