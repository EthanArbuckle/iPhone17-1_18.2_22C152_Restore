@interface SKUICommentPostBarView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)commenter;
- (SKUICommentDelegate)delegate;
- (SKUICommentPostBarView)initWithFrame:(CGRect)a3;
- (id)_asLabel;
- (id)_asNameButton;
- (void)_changeCommenter:(id)a3;
- (void)_post:(id)a3;
- (void)_postComment;
- (void)layoutSubviews;
- (void)setAsText:(id)a3;
- (void)setCommenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setPostButtonText:(id)a3;
- (void)setPostButtonVisible:(BOOL)a3;
- (void)setText:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SKUICommentPostBarView

- (SKUICommentPostBarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICommentPostBarView initWithFrame:]();
  }
  v36.receiver = self;
  v36.super_class = (Class)SKUICommentPostBarView;
  v8 = -[SKUICommentPostBarView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.97254902 alpha:1.0];
    [(SKUICommentPostBarView *)v8 setBackgroundColor:v9];

    v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.835294118 green:0.839215686 blue:0.850980392 alpha:1.0];
    v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    double v13 = 1.0 / v12;

    [(SKUICommentPostBarView *)v8 bounds];
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v14, v13);
    [v15 setAutoresizingMask:2];
    [v15 setBackgroundColor:v10];
    [(SKUICommentPostBarView *)v8 addSubview:v15];
    v16 = [SKUICommentPostBarTextField alloc];
    double v17 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v21 = -[SKUICommentPostBarTextField initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], v18, v19, v20);
    postTextField = v8->_postTextField;
    v8->_postTextField = (SKUICommentPostBarTextField *)v21;

    [(SKUICommentPostBarTextField *)v8->_postTextField setDelegate:v8];
    v23 = [(SKUICommentPostBarTextField *)v8->_postTextField layer];
    [v23 setBorderWidth:1.0];

    v24 = [(SKUICommentPostBarTextField *)v8->_postTextField layer];
    [v24 setCornerRadius:5.0];

    v25 = [(SKUICommentPostBarTextField *)v8->_postTextField layer];
    id v26 = v10;
    objc_msgSend(v25, "setBorderColor:", objc_msgSend(v26, "CGColor"));

    [(SKUICommentPostBarView *)v8 addSubview:v8->_postTextField];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", v17, v18, v19, v20);
    postButton = v8->_postButton;
    v8->_postButton = (UIButton *)v27;

    v29 = [(UIButton *)v8->_postButton titleLabel];
    v30 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:16.0];
    [v29 setFont:v30];

    v31 = v8->_postButton;
    v32 = [(SKUICommentPostBarView *)v8 tintColor];
    [(UIButton *)v31 setTitleColor:v32 forState:0];

    v33 = v8->_postButton;
    v34 = [MEMORY[0x1E4FB1618] grayColor];
    [(UIButton *)v33 setTitleColor:v34 forState:2];

    [(UIButton *)v8->_postButton addTarget:v8 action:sel__post_ forControlEvents:64];
    [(UIButton *)v8->_postButton setEnabled:0];
    [(SKUICommentPostBarView *)v8 addSubview:v8->_postButton];
  }
  return v8;
}

- (void)_post:(id)a3
{
  [(SKUICommentPostBarView *)self _postComment];

  [(SKUICommentPostBarView *)self resignFirstResponder];
}

- (void)_changeCommenter:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SKUICommentPostBarView *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(SKUICommentPostBarView *)self delegate];
    int v7 = [v6 conformsToProtocol:&unk_1F1E17148];

    if (v7)
    {
      v8 = [(SKUICommentPostBarView *)self delegate];
      [v8 commentPostBarView:self changeCommenter:v9];
    }
  }
}

- (void)setAsText:(id)a3
{
  v5 = (NSString *)a3;
  p_asText = &self->_asText;
  asText = self->_asText;
  v8 = v5;
  v10 = v5;
  if (asText != v5)
  {
    asText = (NSString *)[(NSString *)asText isEqual:v5];
    if ((asText & 1) == 0) {
      objc_storeStrong((id *)&self->_asText, a3);
    }
    v8 = *p_asText;
    v5 = v10;
  }
  if (v8)
  {
    id v9 = [(SKUICommentPostBarView *)self _asLabel];
    [v9 setText:*p_asText];

    v5 = v10;
  }

  MEMORY[0x1F41817F8](asText, v5);
}

- (void)setPlaceholderText:(id)a3
{
}

- (void)setPostButtonText:(id)a3
{
}

- (void)setText:(id)a3
{
}

- (void)setCommenter:(id)a3
{
  id v5 = a3;
  uint64_t commenter = (uint64_t)self->_commenter;
  if ((id)commenter != v5)
  {
    id v8 = v5;
    uint64_t commenter = [(id)commenter isEqual:v5];
    id v5 = v8;
    if ((commenter & 1) == 0)
    {
      objc_storeStrong((id *)&self->_commenter, a3);
      int v7 = [(SKUICommentPostBarView *)self _asNameButton];
      [v7 setTitle:self->_commenter forState:0];

      uint64_t commenter = [(SKUICommentPostBarView *)self setNeedsLayout];
      id v5 = v8;
    }
  }

  MEMORY[0x1F41817F8](commenter, v5);
}

- (void)setPostButtonVisible:(BOOL)a3
{
  [(UIButton *)self->_postButton setHidden:!a3];

  [(SKUICommentPostBarView *)self setNeedsLayout];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  int v11 = [v10 isEqualToString:@"\n"];
  if (v11)
  {
    [(SKUICommentPostBarView *)self _postComment];
  }
  else
  {
    double v12 = [v9 text];
    double v13 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    -[UIButton setEnabled:](self->_postButton, "setEnabled:", [v13 length] != 0);
  }

  return v11 ^ 1;
}

- (BOOL)becomeFirstResponder
{
  return [(SKUICommentPostBarTextField *)self->_postTextField becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(SKUICommentPostBarTextField *)self->_postTextField canBecomeFirstResponder];
}

- (void)layoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)SKUICommentPostBarView;
  [(SKUICommentPostBarView *)&v62 layoutSubviews];
  if (self->_commenter)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SKUICommentPostBarView semanticContentAttribute](self, "semanticContentAttribute"));
    uint64_t v4 = [(SKUICommentPostBarView *)self _asLabel];
    [v4 setHidden:0];

    id v5 = [(SKUICommentPostBarView *)self _asNameButton];
    [v5 setHidden:0];

    v6 = [(SKUICommentPostBarView *)self _asLabel];
    [v6 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;

    int v11 = [(SKUICommentPostBarView *)self _asLabel];
    [(SKUICommentPostBarView *)self bounds];
    objc_msgSend(v11, "sizeThatFits:", v12, v13);
    double v15 = v14;
    double v17 = v16;

    if (v3)
    {
      [(SKUICommentPostBarView *)self bounds];
      double Width = CGRectGetWidth(v63);
      v64.origin.double x = v8;
      v64.origin.double y = v10;
      v64.size.double width = v15;
      v64.size.double height = v17;
      double v19 = Width - CGRectGetWidth(v64) + -16.0;
    }
    else
    {
      double v19 = 16.0;
    }
    float v24 = (30.0 - v17) * 0.5;
    double v25 = ceilf(v24) + 2.0;
    id v26 = [(SKUICommentPostBarView *)self _asLabel];
    objc_msgSend(v26, "setFrame:", v19, v25, v15, v17);

    uint64_t v27 = [(SKUICommentPostBarView *)self _asNameButton];
    [v27 frame];
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    if (v3)
    {
      v65.origin.double x = v19;
      v65.origin.double y = v25;
      v65.size.double width = v15;
      v65.size.double height = v17;
      double v32 = CGRectGetMinX(v65) + -5.0;
    }
    else
    {
      [(SKUICommentPostBarView *)self bounds];
      double v33 = CGRectGetWidth(v66);
      v67.origin.double x = v19;
      v67.origin.double y = v25;
      v67.size.double width = v15;
      v67.size.double height = v17;
      double v32 = v33 - (CGRectGetMaxX(v67) + 5.0);
    }
    -[UIButton sizeThatFits:](self->_asNameButton, "sizeThatFits:", v32, 30.0);
    double v35 = v34;
    double v37 = v36;
    double v38 = v19;
    double v39 = v25;
    double v40 = v15;
    double v41 = v17;
    if (v3)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v38);
      v68.origin.double x = v29;
      v68.origin.double y = v31;
      v68.size.double width = v35;
      v68.size.double height = v37;
      double v43 = MinX - CGRectGetWidth(v68);
      double v44 = -6.0;
    }
    else
    {
      double v43 = CGRectGetMaxX(*(CGRect *)&v38) + 5.0;
      double v44 = 1.0;
    }
    double v45 = v43 + v44;
    double v22 = 30.0;
    float v46 = (30.0 - v37) * 0.5;
    double v47 = ceilf(v46) + 2.0;
    uint64_t v21 = [(SKUICommentPostBarView *)self _asNameButton];
    objc_msgSend(v21, "setFrame:", v45, v47, v35, v37);
    double v23 = 40.0;
  }
  else
  {
    double v20 = [(SKUICommentPostBarView *)self _asLabel];
    [v20 setHidden:1];

    uint64_t v21 = [(SKUICommentPostBarView *)self _asNameButton];
    [v21 setHidden:1];
    double v22 = 1.0;
    double v23 = 45.0;
  }

  double v48 = 30.0;
  if (([(UIButton *)self->_postButton isHidden] & 1) == 0)
  {
    CGFloat v49 = *MEMORY[0x1E4F1DB28];
    postButton = self->_postButton;
    [(SKUICommentPostBarView *)self bounds];
    -[UIButton sizeThatFits:](postButton, "sizeThatFits:", v51, v52);
    double v54 = v53;
    double v56 = v55;
    *(float *)&double v53 = (v23 - v55) * 0.5;
    CGFloat v57 = v22 + floorf(*(float *)&v53);
    [(SKUICommentPostBarView *)self bounds];
    double v58 = CGRectGetWidth(v69);
    v70.origin.double x = v49;
    v70.origin.double y = v57;
    v70.size.double width = v54;
    v70.size.double height = v56;
    CGFloat v59 = v58 - (CGRectGetWidth(v70) + 15.0);
    -[UIButton setFrame:](self->_postButton, "setFrame:", v59, v57, v54, v56);
    v71.origin.double x = v59;
    v71.origin.double y = v57;
    v71.size.double width = v54;
    v71.size.double height = v56;
    double v48 = CGRectGetWidth(v71) + 15.0 + 30.0;
  }
  float v60 = (v23 + -28.0) * 0.5;
  double v61 = v22 + floorf(v60);
  [(SKUICommentPostBarView *)self bounds];
  -[SKUICommentPostBarTextField setFrame:](self->_postTextField, "setFrame:", 15.0, v61, CGRectGetWidth(v72) - v48, 28.0);
}

- (BOOL)resignFirstResponder
{
  postTextField = self->_postTextField;
  if (postTextField) {
    [(SKUICommentPostBarTextField *)postTextField resignFirstResponder];
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUICommentPostBarView;
  return [(SKUICommentPostBarView *)&v5 resignFirstResponder];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = dbl_1C1CCC040[self->_commenter == 0];
  result.double height = v3;
  return result;
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)SKUICommentPostBarView;
  [(SKUICommentPostBarView *)&v7 tintColorDidChange];
  asNameButton = self->_asNameButton;
  if (asNameButton)
  {
    uint64_t v4 = [(SKUICommentPostBarView *)self tintColor];
    [(UIButton *)asNameButton setTintColor:v4];
  }
  postButton = self->_postButton;
  if (postButton)
  {
    v6 = [(SKUICommentPostBarView *)self tintColor];
    [(UIButton *)postButton setTitleColor:v6 forState:0];
  }
}

- (id)_asNameButton
{
  asNameButton = self->_asNameButton;
  if (!asNameButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
    objc_super v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_asNameButton;
    self->_asNameButton = v5;

    objc_super v7 = [(UIButton *)self->_asNameButton titleLabel];
    CGFloat v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
    [v7 setFont:v8];

    double v9 = self->_asNameButton;
    CGFloat v10 = [(SKUICommentPostBarView *)self tintColor];
    [(UIButton *)v9 setTitleColor:v10 forState:0];

    [(UIButton *)self->_asNameButton addTarget:self action:sel__changeCommenter_ forControlEvents:64];
    [(SKUICommentPostBarView *)self addSubview:self->_asNameButton];
    [(SKUICommentPostBarView *)self setNeedsLayout];
    asNameButton = self->_asNameButton;
  }

  return asNameButton;
}

- (id)_asLabel
{
  asLabel = self->_asLabel;
  if (!asLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    objc_super v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_asLabel;
    self->_asLabel = v5;

    objc_super v7 = self->_asLabel;
    CGFloat v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
    [(UILabel *)v7 setFont:v8];

    double v9 = self->_asLabel;
    CGFloat v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
    [(UILabel *)v9 setTextColor:v10];

    [(SKUICommentPostBarView *)self addSubview:self->_asLabel];
    asLabel = self->_asLabel;
  }

  return asLabel;
}

- (void)_postComment
{
  id v8 = [(SKUICommentPostBarTextField *)self->_postTextField text];
  if ([v8 length])
  {
    uint64_t v3 = [(SKUICommentPostBarView *)self delegate];
    if (v3)
    {
      id v4 = (void *)v3;
      objc_super v5 = [(SKUICommentPostBarView *)self delegate];
      int v6 = [v5 conformsToProtocol:&unk_1F1E17148];

      if (v6)
      {
        objc_super v7 = [(SKUICommentPostBarView *)self delegate];
        [v7 commentPostBarView:self text:v8 as:self->_commenter];
      }
    }
  }
}

- (NSString)commenter
{
  return self->_commenter;
}

- (SKUICommentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUICommentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asText, 0);
  objc_storeStrong((id *)&self->_asNameButton, 0);
  objc_storeStrong((id *)&self->_asLabel, 0);
  objc_storeStrong((id *)&self->_commenter, 0);
  objc_storeStrong((id *)&self->_postTextField, 0);

  objc_storeStrong((id *)&self->_postButton, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICommentPostBarView initWithFrame:]";
}

@end