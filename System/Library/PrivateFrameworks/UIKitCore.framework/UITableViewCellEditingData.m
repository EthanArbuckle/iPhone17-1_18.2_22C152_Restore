@interface UITableViewCellEditingData
- (BOOL)wantsMaskingWhileAnimatingDisabled;
- (UITableViewCellEditingData)initWithTableViewCell:(id)a3 editingStyle:(int64_t)a4;
- (id)editControl:(BOOL)a3;
- (id)reorderControl:(BOOL)a3;
- (id)reorderSeparatorView:(BOOL)a3;
- (void)dealloc;
@end

@implementation UITableViewCellEditingData

- (UITableViewCellEditingData)initWithTableViewCell:(id)a3 editingStyle:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellEditingData;
  v7 = [(UITableViewCellEditingData *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_cell, v6);
    v8->_editingStyle = a4;
  }

  return v8;
}

- (void)dealloc
{
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [(UIView *)self->_reorderControl removeFromSuperview];
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [(UIView *)self->_editControl removeFromSuperview];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0) {
LABEL_4:
  }
    [(UIView *)self->_reorderSeparatorView removeFromSuperview];
LABEL_5:
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditingData;
  [(UITableViewCellEditingData *)&v4 dealloc];
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  if ([(UITableViewCellEditControl *)self->_editControl wantsMaskingWhileAnimatingDisabled])
  {
    return 1;
  }
  reorderControl = self->_reorderControl;
  return [(UITableViewCellReorderControl *)reorderControl wantsMaskingWhileAnimatingDisabled];
}

- (id)editControl:(BOOL)a3
{
  editControl = self->_editControl;
  if (editControl) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = (LODWORD(self->_editingStyle) - 1);
    if (v6 < 3) {
      uint64_t v7 = v6 + 1;
    }
    else {
      uint64_t v7 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    v9 = (UITableViewCellEditControl *)[objc_alloc((Class)objc_opt_class()) initWithTableViewCell:WeakRetained editingStyle:v7];
    objc_super v10 = self->_editControl;
    self->_editControl = v9;

    -[UITableViewCellEditControl setSelected:](self->_editControl, "setSelected:", [WeakRetained isSelected]);
    -[UIView setHidden:](self->_editControl, "setHidden:", [WeakRetained _accessoryViewsHidden]);
    [(UIControl *)self->_editControl addTarget:WeakRetained action:sel_editControlWasClicked_ forControlEvents:0x2000];
    if (([WeakRetained _usesModernAccessoriesLayout] & 1) == 0)
    {
      [WeakRetained addSubview:self->_editControl];
      *(unsigned char *)&self->_flags |= 1u;
    }

    editControl = self->_editControl;
  }
  return editControl;
}

- (id)reorderControl:(BOOL)a3
{
  reorderControl = self->_reorderControl;
  if (reorderControl) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    uint64_t v7 = (UITableViewCellReorderControl *)[objc_alloc((Class)objc_opt_class()) initWithTableViewCell:WeakRetained];
    v8 = self->_reorderControl;
    self->_reorderControl = v7;

    if (([WeakRetained _usesModernAccessoriesLayout] & 1) == 0)
    {
      [WeakRetained addSubview:self->_reorderControl];
      *(unsigned char *)&self->_flags |= 2u;
    }

    reorderControl = self->_reorderControl;
  }
  return reorderControl;
}

- (id)reorderSeparatorView:(BOOL)a3
{
  reorderSeparatorView = self->_reorderSeparatorView;
  if (reorderSeparatorView) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(_UITableViewCellVerticalSeparator);
    uint64_t v7 = self->_reorderSeparatorView;
    self->_reorderSeparatorView = &v6->super;

    [(UIView *)self->_reorderSeparatorView setAutoresizingMask:17];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    if ([WeakRetained tableViewStyle]) {
      +[UIColor tableSeparatorDarkColor];
    }
    else {
    v9 = +[UIColor tableSeparatorLightColor];
    }
    [(UIView *)self->_reorderSeparatorView setBackgroundColor:v9];

    if (([WeakRetained _usesModernAccessoriesLayout] & 1) == 0)
    {
      [WeakRetained addSubview:self->_reorderSeparatorView];
      *(unsigned char *)&self->_flags |= 4u;
    }

    reorderSeparatorView = self->_reorderSeparatorView;
  }
  return reorderSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderSeparatorView, 0);
  objc_storeStrong((id *)&self->_reorderControl, 0);
  objc_storeStrong((id *)&self->_editControl, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end