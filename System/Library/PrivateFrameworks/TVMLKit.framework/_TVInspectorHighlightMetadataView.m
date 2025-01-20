@interface _TVInspectorHighlightMetadataView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)descriptionLabel;
- (UILabel)frameLabel;
- (_TVInspectorHighlightMetadataView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _TVInspectorHighlightMetadataView

- (_TVInspectorHighlightMetadataView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_TVInspectorHighlightMetadataView;
  v3 = -[_TVInspectorHighlightMetadataView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v9;

    [(UILabel *)v3->_descriptionLabel setLineBreakMode:4];
    [(UILabel *)v3->_descriptionLabel setNumberOfLines:1];
    [(_TVInspectorHighlightMetadataView *)v3 addSubview:v3->_descriptionLabel];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
    frameLabel = v3->_frameLabel;
    v3->_frameLabel = (UILabel *)v11;

    [(UILabel *)v3->_frameLabel setNumberOfLines:1];
    [(_TVInspectorHighlightMetadataView *)v3 addSubview:v3->_frameLabel];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(_TVInspectorHighlightMetadataView *)self frameLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [(_TVInspectorHighlightMetadataView *)self descriptionLabel];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;
  double v15 = v14;

  double v16 = v8 + 5.0 + 5.0;
  double v17 = v16 + 100.0 + 5.0;
  if (v16 + v13 + 5.0 <= width) {
    double v17 = v16 + v13 + 5.0;
  }
  if (v10 >= v15) {
    double v18 = v10;
  }
  else {
    double v18 = v15;
  }
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)_TVInspectorHighlightMetadataView;
  [(_TVInspectorHighlightMetadataView *)&v24 layoutSubviews];
  [(_TVInspectorHighlightMetadataView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(_TVInspectorHighlightMetadataView *)self frameLabel];
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  double v13 = v12;
  double v15 = v14;

  double v16 = [(_TVInspectorHighlightMetadataView *)self descriptionLabel];
  objc_msgSend(v16, "sizeThatFits:", v8, v10);
  double v23 = v17;

  double v18 = [(_TVInspectorHighlightMetadataView *)self frameLabel];
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  CGFloat v19 = CGRectGetMaxX(v25) + -5.0 - v13;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.double width = v8;
  v26.size.double height = v10;
  objc_msgSend(v18, "setFrame:", v19, CGRectGetMidY(v26) - v15 * 0.5, v13, v15);

  v20 = [(_TVInspectorHighlightMetadataView *)self descriptionLabel];
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.double width = v8;
  v27.size.double height = v10;
  CGFloat v21 = CGRectGetMidY(v27) - v23 * 0.5;
  v22 = [(_TVInspectorHighlightMetadataView *)self frameLabel];
  [v22 frame];
  objc_msgSend(v20, "setFrame:", 5.0, v21, CGRectGetMinX(v28) + -5.0 + -5.0, v23);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UILabel)frameLabel
{
  return self->_frameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end