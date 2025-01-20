@interface PKAlignedContentContainerView
- ($85CD2974BE96D4886BB301820D1C36C2)alignment;
- (PKAlignedContentContainerView)initWithContentView:(id)a3 alignment:(id)a4 size:(CGSize)a5;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setAlignment:(id)a3;
@end

@implementation PKAlignedContentContainerView

- (PKAlignedContentContainerView)initWithContentView:(id)a3 alignment:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAlignedContentContainerView;
  v11 = -[PKAlignedContentContainerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentView, a3);
    v12->_alignment = ($D338B265850D33B29D0E4C40C8D279D7)a4;
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
    [(PKAlignedContentContainerView *)v12 addSubview:v10];
  }

  return v12;
}

- (void)setAlignment:(id)a3
{
  self->_alignment = ($D338B265850D33B29D0E4C40C8D279D7)a3;
  [(PKAlignedContentContainerView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKAlignedContentContainerView;
  [(PKAlignedContentContainerView *)&v4 layoutSubviews];
  contentView = self->_contentView;
  [(PKAlignedContentContainerView *)self bounds];
  PKSizeAlignedInRectWithScale();
  -[UIView setFrame:](contentView, "setFrame:");
}

- (UIView)contentView
{
  return self->_contentView;
}

- ($85CD2974BE96D4886BB301820D1C36C2)alignment
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_alignment;
}

- (void).cxx_destruct
{
}

@end