@interface _UIDocumentUnavailableTitlePageView
- (_UIDocumentUnavailableTitlePageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setPrimaryAction:(id *)a1;
- (void)setSecondaryAction:(id *)a1;
- (void)setSecondaryMenu:(id *)a1;
- (void)setTitle:(id *)a1;
@end

@implementation _UIDocumentUnavailableTitlePageView

- (_UIDocumentUnavailableTitlePageView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UIDocumentUnavailableTitlePageView;
  v3 = -[_UIDocumentUnavailablePageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    LODWORD(v6) = 1036831949;
    [v5 setShadowOpacity:v6];

    v7 = [(UIView *)v4 layer];
    [v7 setShadowRadius:40.0];

    v8 = [(UIView *)v4 layer];
    objc_msgSend(v8, "setShadowOffset:", 0.0, 8.0);

    v9 = +[UIColor tertiarySystemBackgroundColor];
    [(UIView *)v4 setBackgroundColor:v9];

    v10 = [UIContentUnavailableView alloc];
    v11 = +[UIContentUnavailableConfiguration emptyConfiguration];
    v12 = [(UIContentUnavailableView *)v10 initWithConfiguration:v11];

    [(UIView *)v4 bounds];
    -[UIView setFrame:](v12, "setFrame:");
    [(UIView *)v12 setAutoresizingMask:18];
    [(UIContentUnavailableView *)v12 setScrollEnabled:1];
    [(UIView *)v4 addSubview:v12];
    contentUnavailableView = v4->_contentUnavailableView;
    v4->_contentUnavailableView = v12;
  }
  return v4;
}

- (void)setTitle:(id *)a1
{
  if (a1)
  {
    id v4 = a1[53];
    id v5 = a2;
    if (v4 == v5)
    {
      id v8 = v5;
    }
    else
    {
      if (v5 && v4)
      {
        id v7 = v5;
        char v6 = [v4 isEqual:v5];

        if (v6) {
          return;
        }
      }
      else
      {
      }
      objc_storeStrong(a1 + 53, a2);
      [a1 setNeedsLayout];
    }
  }
}

- (void)setPrimaryAction:(id *)a1
{
  if (a1)
  {
    id v4 = a1[54];
    id v5 = a2;
    if (v4 == v5)
    {
      id v8 = v5;
    }
    else
    {
      if (v5 && v4)
      {
        id v7 = v5;
        char v6 = [v4 isEqual:v5];

        if (v6) {
          return;
        }
      }
      else
      {
      }
      objc_storeStrong(a1 + 54, a2);
      [a1 setNeedsLayout];
    }
  }
}

- (void)setSecondaryAction:(id *)a1
{
  if (a1)
  {
    id v4 = a1[55];
    id v5 = a2;
    if (v4 == v5)
    {
      id v8 = v5;
    }
    else
    {
      if (v5 && v4)
      {
        id v7 = v5;
        char v6 = [v4 isEqual:v5];

        if (v6) {
          return;
        }
      }
      else
      {
      }
      objc_storeStrong(a1 + 55, a2);
      [a1 setNeedsLayout];
    }
  }
}

- (void)setSecondaryMenu:(id *)a1
{
  if (a1)
  {
    id v4 = a1[56];
    id v5 = a2;
    if (v4 == v5)
    {
      id v8 = v5;
    }
    else
    {
      if (v5 && v4)
      {
        id v7 = v5;
        char v6 = [v4 isEqual:v5];

        if (v6) {
          return;
        }
      }
      else
      {
      }
      objc_storeStrong(a1 + 56, a2);
      [a1 setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)_UIDocumentUnavailableTitlePageView;
  [(UIView *)&v33 layoutSubviews];
  if (self)
  {
    v3 = +[UIContentUnavailableConfiguration emptyConfiguration];
    id v4 = [(UIView *)self traitCollection];
    uint64_t v5 = [v4 horizontalSizeClass];

    char v6 = [(UIView *)self traitCollection];
    uint64_t v7 = [v6 verticalSizeClass];

    BOOL actionsEnabled = self->_actionsEnabled;
    if (v7 != 1)
    {
      [v3 setText:self->_title];
      v9 = [v3 textProperties];
      [v9 setNumberOfLines:1];

      v10 = [v3 textProperties];
      [v10 setAdjustsFontSizeToFitWidth:1];

      [v3 setTextToButtonPadding:36.0];
      double v11 = 96.0;
      if (v5 == 1) {
        double v11 = 64.0;
      }
      v12 = [off_1E52D39B8 systemFontOfSize:v11 weight:*(double *)off_1E52D6BF0];
      v13 = [v3 textProperties];
      [v13 setFont:v12];
    }
    primaryAction = self->_primaryAction;
    if (primaryAction)
    {
      objc_super v15 = __77___UIDocumentUnavailableTitlePageView__updateContentUnavailableConfiguration__block_invoke(primaryAction, 0, 1, self->_hasPrimaryProgress);
      [v3 setButton:v15];

      v16 = self->_primaryAction;
      v17 = [v3 buttonProperties];
      [v17 setPrimaryAction:v16];

      v18 = [v3 buttonProperties];
      objc_msgSend(v18, "setMinimumSize:", 240.0, 0.0);

      v19 = [v3 buttonProperties];
      [v19 setRole:1];

      v20 = [v3 buttonProperties];
      [v20 setEnabled:actionsEnabled];
    }
    v21 = self->_secondaryAction;
    if (v21)
    {

      secondaryMenu = self->_secondaryMenu;
    }
    else
    {
      secondaryMenu = self->_secondaryMenu;
      if (!secondaryMenu)
      {
LABEL_12:
        [v3 setButtonToSecondaryButtonPadding:20.0];
        objc_msgSend(v3, "setDirectionalLayoutMargins:", 20.0, 20.0, self->_bottomInset + 20.0, 20.0);
        [(UIContentUnavailableView *)self->_contentUnavailableView setConfiguration:v3];

        return;
      }
    }
    BOOL v23 = actionsEnabled;
    BOOL hasSecondaryProgress = self->_hasSecondaryProgress;
    v25 = self->_secondaryAction;
    v26 = __77___UIDocumentUnavailableTitlePageView__updateContentUnavailableConfiguration__block_invoke(v25, (uint64_t)secondaryMenu, 0, hasSecondaryProgress);
    [v3 setSecondaryButton:v26];

    v27 = self->_secondaryAction;
    v28 = [v3 secondaryButtonProperties];
    [v28 setPrimaryAction:v27];

    v29 = self->_secondaryMenu;
    v30 = [v3 secondaryButtonProperties];
    [v30 setMenu:v29];

    v31 = [v3 secondaryButtonProperties];
    objc_msgSend(v31, "setMinimumSize:", 240.0, 0.0);

    v32 = [v3 secondaryButtonProperties];
    [v32 setEnabled:v23];

    goto LABEL_12;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryMenu, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end