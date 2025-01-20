@interface SiriUICardSnippetHeaderView
+ (double)defaultHeight;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIEdgeInsets)_edgeInsets;
- (void)configureWithTitle:(id)a3;
- (void)layoutSubviews;
@end

@implementation SiriUICardSnippetHeaderView

+ (double)defaultHeight
{
  return 24.0;
}

- (UIEdgeInsets)_edgeInsets
{
  if (SiriUIIsCompactWidth()) {
    double v2 = 16.0;
  }
  else {
    double v2 = 0.0;
  }
  if (SiriUIIsCompactWidth()) {
    double v3 = 16.0;
  }
  else {
    double v3 = 0.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v2;
  result.right = v3;
  result.bottom = v5;
  result.left = v6;
  result.top = v4;
  return result;
}

- (void)configureWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    titleLabel = self->_titleLabel;
    id v13 = v5;
    if (!titleLabel)
    {
      v7 = [MEMORY[0x263F74480] label];
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      v9 = self->_titleLabel;
      v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
      [(SiriSharedUIContentLabel *)v9 setFont:v10];

      v11 = self->_titleLabel;
      v12 = objc_msgSend(MEMORY[0x263F1C550], "siriui_blendEffectColor");
      [(SiriSharedUIContentLabel *)v11 setTextColor:v12];

      [(SiriUICardSnippetHeaderView *)self addSubview:self->_titleLabel];
      [(UIView *)self siriui_setBlendEffectEnabled:1];
      titleLabel = self->_titleLabel;
    }
    id v4 = (id)[(SiriSharedUIContentLabel *)titleLabel setText:v13];
    id v5 = v13;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 24.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SiriUICardSnippetHeaderView;
  [(SiriUIReusableHeaderView *)&v29 layoutSubviews];
  [(SiriUICardSnippetHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SiriUICardSnippetHeaderView *)self _edgeInsets];
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    double v16 = v8 - (v12 + v14);
    double v17 = v10 - (v11 + v13);
    double v18 = v4 + v12;
    double v19 = v6 + v11;
    double v20 = SiriUIRectForLabelWithDistanceFromBottomToBaseline(titleLabel, v4 + v12, v6 + v11, v16, v17);
    double v22 = v21;
    double v24 = v23;
    if (SiriUIIsCompactWidth())
    {
      double v25 = v16;
    }
    else
    {
      CGFloat v27 = v22;
      double v28 = v24;
      double v25 = v16 - (16.0 + 16.0);
      if (SiriLanguageIsRTL())
      {
        v30.origin.x = v18;
        v30.origin.y = v19;
        v30.size.width = v16;
        v30.size.height = v17;
        CGFloat v26 = CGRectGetWidth(v30) - 16.0;
        v31.origin.x = v20;
        v31.origin.y = v27;
        v31.size.width = v16 - (16.0 + 16.0);
        v31.size.height = v24;
        double v20 = v26 - CGRectGetWidth(v31);
        double v22 = v27;
      }
      else
      {
        double v20 = 16.0;
      }
    }
    -[SiriSharedUIContentLabel setFrame:](self->_titleLabel, "setFrame:", v20, v22, v25, v24, *(void *)&v27, *(void *)&v28);
  }
}

- (void).cxx_destruct
{
}

@end