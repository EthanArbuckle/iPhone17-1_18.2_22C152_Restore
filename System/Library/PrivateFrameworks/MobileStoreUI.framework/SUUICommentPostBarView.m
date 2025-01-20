@interface SUUICommentPostBarView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)commenter;
- (SUUICommentDelegate)delegate;
- (SUUICommentPostBarView)initWithFrame:(CGRect)a3;
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

@implementation SUUICommentPostBarView

- (SUUICommentPostBarView)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)SUUICommentPostBarView;
  v3 = -[SUUICommentPostBarView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
    [(SUUICommentPostBarView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F825C8] colorWithRed:0.835294118 green:0.839215686 blue:0.850980392 alpha:1.0];
    v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 scale];
    double v8 = 1.0 / v7;

    [(SUUICommentPostBarView *)v3 bounds];
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v9, v8);
    [v10 setAutoresizingMask:2];
    [v10 setBackgroundColor:v5];
    [(SUUICommentPostBarView *)v3 addSubview:v10];
    v11 = [SUUICommentPostBarTextField alloc];
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v16 = -[SUUICommentPostBarTextField initWithFrame:](v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
    postTextField = v3->_postTextField;
    v3->_postTextField = (SUUICommentPostBarTextField *)v16;

    [(SUUICommentPostBarTextField *)v3->_postTextField setDelegate:v3];
    v18 = [(SUUICommentPostBarTextField *)v3->_postTextField layer];
    [v18 setBorderWidth:1.0];

    v19 = [(SUUICommentPostBarTextField *)v3->_postTextField layer];
    [v19 setCornerRadius:5.0];

    v20 = [(SUUICommentPostBarTextField *)v3->_postTextField layer];
    id v21 = v5;
    objc_msgSend(v20, "setBorderColor:", objc_msgSend(v21, "CGColor"));

    [(SUUICommentPostBarView *)v3 addSubview:v3->_postTextField];
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F824E8]), "initWithFrame:", v12, v13, v14, v15);
    postButton = v3->_postButton;
    v3->_postButton = (UIButton *)v22;

    v24 = [(UIButton *)v3->_postButton titleLabel];
    v25 = [MEMORY[0x263F81708] boldSystemFontOfSize:16.0];
    [v24 setFont:v25];

    v26 = v3->_postButton;
    v27 = [(SUUICommentPostBarView *)v3 tintColor];
    [(UIButton *)v26 setTitleColor:v27 forState:0];

    v28 = v3->_postButton;
    v29 = [MEMORY[0x263F825C8] grayColor];
    [(UIButton *)v28 setTitleColor:v29 forState:2];

    [(UIButton *)v3->_postButton addTarget:v3 action:sel__post_ forControlEvents:64];
    [(UIButton *)v3->_postButton setEnabled:0];
    [(SUUICommentPostBarView *)v3 addSubview:v3->_postButton];
  }
  return v3;
}

- (void)_post:(id)a3
{
  [(SUUICommentPostBarView *)self _postComment];
  [(SUUICommentPostBarView *)self resignFirstResponder];
}

- (void)_changeCommenter:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SUUICommentPostBarView *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(SUUICommentPostBarView *)self delegate];
    int v7 = [v6 conformsToProtocol:&unk_2705F8B68];

    if (v7)
    {
      double v8 = [(SUUICommentPostBarView *)self delegate];
      [v8 commentPostBarView:self changeCommenter:v9];
    }
  }
}

- (void)setAsText:(id)a3
{
  v5 = (NSString *)a3;
  p_asText = &self->_asText;
  asText = self->_asText;
  double v8 = v5;
  v10 = v5;
  if (asText != v5)
  {
    asText = (NSString *)[(NSString *)asText isEqual:v5];
    if ((asText & 1) == 0) {
      objc_storeStrong((id *)&self->_asText, a3);
    }
    double v8 = *p_asText;
    v5 = v10;
  }
  if (v8)
  {
    id v9 = [(SUUICommentPostBarView *)self _asLabel];
    [v9 setText:*p_asText];

    v5 = v10;
  }
  MEMORY[0x270F9A758](asText, v5);
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
      int v7 = [(SUUICommentPostBarView *)self _asNameButton];
      [v7 setTitle:self->_commenter forState:0];

      uint64_t commenter = [(SUUICommentPostBarView *)self setNeedsLayout];
      id v5 = v8;
    }
  }
  MEMORY[0x270F9A758](commenter, v5);
}

- (void)setPostButtonVisible:(BOOL)a3
{
  [(UIButton *)self->_postButton setHidden:!a3];
  [(SUUICommentPostBarView *)self setNeedsLayout];
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
    [(SUUICommentPostBarView *)self _postComment];
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
  return [(SUUICommentPostBarTextField *)self->_postTextField becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(SUUICommentPostBarTextField *)self->_postTextField canBecomeFirstResponder];
}

- (void)layoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)SUUICommentPostBarView;
  [(SUUICommentPostBarView *)&v62 layoutSubviews];
  if (self->_commenter)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUUICommentPostBarView semanticContentAttribute](self, "semanticContentAttribute"));
    uint64_t v4 = [(SUUICommentPostBarView *)self _asLabel];
    [v4 setHidden:0];

    id v5 = [(SUUICommentPostBarView *)self _asNameButton];
    [v5 setHidden:0];

    v6 = [(SUUICommentPostBarView *)self _asLabel];
    [v6 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;

    int v11 = [(SUUICommentPostBarView *)self _asLabel];
    [(SUUICommentPostBarView *)self bounds];
    objc_msgSend(v11, "sizeThatFits:", v12, v13);
    double v15 = v14;
    double v17 = v16;

    if (v3)
    {
      [(SUUICommentPostBarView *)self bounds];
      double Width = CGRectGetWidth(v63);
      v64.origin.x = v8;
      v64.origin.y = v10;
      v64.size.width = v15;
      v64.size.height = v17;
      double v19 = Width - CGRectGetWidth(v64) + -16.0;
    }
    else
    {
      double v19 = 16.0;
    }
    float v24 = (30.0 - v17) * 0.5;
    double v25 = ceilf(v24) + 2.0;
    v26 = [(SUUICommentPostBarView *)self _asLabel];
    objc_msgSend(v26, "setFrame:", v19, v25, v15, v17);

    v27 = [(SUUICommentPostBarView *)self _asNameButton];
    [v27 frame];
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    if (v3)
    {
      v65.origin.x = v19;
      v65.origin.y = v25;
      v65.size.width = v15;
      v65.size.height = v17;
      double v32 = CGRectGetMinX(v65) + -5.0;
    }
    else
    {
      [(SUUICommentPostBarView *)self bounds];
      double v33 = CGRectGetWidth(v66);
      v67.origin.x = v19;
      v67.origin.y = v25;
      v67.size.width = v15;
      v67.size.height = v17;
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
      v68.origin.x = v29;
      v68.origin.y = v31;
      v68.size.width = v35;
      v68.size.height = v37;
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
    id v21 = [(SUUICommentPostBarView *)self _asNameButton];
    objc_msgSend(v21, "setFrame:", v45, v47, v35, v37);
    double v23 = 40.0;
  }
  else
  {
    v20 = [(SUUICommentPostBarView *)self _asLabel];
    [v20 setHidden:1];

    id v21 = [(SUUICommentPostBarView *)self _asNameButton];
    [v21 setHidden:1];
    double v22 = 1.0;
    double v23 = 45.0;
  }

  double v48 = 30.0;
  if (([(UIButton *)self->_postButton isHidden] & 1) == 0)
  {
    CGFloat v49 = *MEMORY[0x263F001A8];
    postButton = self->_postButton;
    [(SUUICommentPostBarView *)self bounds];
    -[UIButton sizeThatFits:](postButton, "sizeThatFits:", v51, v52);
    double v54 = v53;
    double v56 = v55;
    *(float *)&double v53 = (v23 - v55) * 0.5;
    CGFloat v57 = v22 + floorf(*(float *)&v53);
    [(SUUICommentPostBarView *)self bounds];
    double v58 = CGRectGetWidth(v69);
    v70.origin.x = v49;
    v70.origin.y = v57;
    v70.size.width = v54;
    v70.size.height = v56;
    CGFloat v59 = v58 - (CGRectGetWidth(v70) + 15.0);
    -[UIButton setFrame:](self->_postButton, "setFrame:", v59, v57, v54, v56);
    v71.origin.x = v59;
    v71.origin.y = v57;
    v71.size.width = v54;
    v71.size.height = v56;
    double v48 = CGRectGetWidth(v71) + 15.0 + 30.0;
  }
  float v60 = (v23 + -28.0) * 0.5;
  double v61 = v22 + floorf(v60);
  [(SUUICommentPostBarView *)self bounds];
  -[SUUICommentPostBarTextField setFrame:](self->_postTextField, "setFrame:", 15.0, v61, CGRectGetWidth(v72) - v48, 28.0);
}

- (BOOL)resignFirstResponder
{
  postTextField = self->_postTextField;
  if (postTextField) {
    [(SUUICommentPostBarTextField *)postTextField resignFirstResponder];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUICommentPostBarView;
  return [(SUUICommentPostBarView *)&v5 resignFirstResponder];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = dbl_2568A0C90[self->_commenter == 0];
  result.height = v3;
  return result;
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)SUUICommentPostBarView;
  [(SUUICommentPostBarView *)&v7 tintColorDidChange];
  asNameButton = self->_asNameButton;
  if (asNameButton)
  {
    uint64_t v4 = [(SUUICommentPostBarView *)self tintColor];
    [(UIButton *)asNameButton setTintColor:v4];
  }
  postButton = self->_postButton;
  if (postButton)
  {
    v6 = [(SUUICommentPostBarView *)self tintColor];
    [(UIButton *)postButton setTitleColor:v6 forState:0];
  }
}

- (id)_asNameButton
{
  asNameButton = self->_asNameButton;
  if (!asNameButton)
  {
    id v4 = objc_alloc(MEMORY[0x263F824E8]);
    objc_super v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_asNameButton;
    self->_asNameButton = v5;

    objc_super v7 = [(UIButton *)self->_asNameButton titleLabel];
    CGFloat v8 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
    [v7 setFont:v8];

    double v9 = self->_asNameButton;
    CGFloat v10 = [(SUUICommentPostBarView *)self tintColor];
    [(UIButton *)v9 setTitleColor:v10 forState:0];

    [(UIButton *)self->_asNameButton addTarget:self action:sel__changeCommenter_ forControlEvents:64];
    [(SUUICommentPostBarView *)self addSubview:self->_asNameButton];
    [(SUUICommentPostBarView *)self setNeedsLayout];
    asNameButton = self->_asNameButton;
  }
  return asNameButton;
}

- (id)_asLabel
{
  asLabel = self->_asLabel;
  if (!asLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    objc_super v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_asLabel;
    self->_asLabel = v5;

    objc_super v7 = self->_asLabel;
    CGFloat v8 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
    [(UILabel *)v7 setFont:v8];

    double v9 = self->_asLabel;
    CGFloat v10 = [MEMORY[0x263F825C8] colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
    [(UILabel *)v9 setTextColor:v10];

    [(SUUICommentPostBarView *)self addSubview:self->_asLabel];
    asLabel = self->_asLabel;
  }
  return asLabel;
}

- (void)_postComment
{
  id v8 = [(SUUICommentPostBarTextField *)self->_postTextField text];
  if ([v8 length])
  {
    uint64_t v3 = [(SUUICommentPostBarView *)self delegate];
    if (v3)
    {
      id v4 = (void *)v3;
      objc_super v5 = [(SUUICommentPostBarView *)self delegate];
      int v6 = [v5 conformsToProtocol:&unk_2705F8B68];

      if (v6)
      {
        objc_super v7 = [(SUUICommentPostBarView *)self delegate];
        [v7 commentPostBarView:self text:v8 as:self->_commenter];
      }
    }
  }
}

- (NSString)commenter
{
  return self->_commenter;
}

- (SUUICommentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUICommentDelegate *)WeakRetained;
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

@end