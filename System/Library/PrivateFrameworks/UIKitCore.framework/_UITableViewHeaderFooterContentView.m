@interface _UITableViewHeaderFooterContentView
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (_UITableViewHeaderFooterContentView)initWithFrame:(CGRect)a3;
- (id)_headerFooterView;
- (void)_updateConstraintsIfNeededWithViewForVariableChangeNotifications:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
@end

@implementation _UITableViewHeaderFooterContentView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  v17.receiver = self;
  v17.super_class = (Class)_UITableViewHeaderFooterContentView;
  [(UIView *)&v17 _concreteDefaultLayoutMargins];
  double v4 = v3;
  v5 = [(_UITableViewHeaderFooterContentView *)self _headerFooterView];
  double v6 = _UITableViewHeaderFooterViewConcreteDefaultLayoutMargins(v5, 1, v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)_headerFooterView
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v4 = [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"UITableViewHeaderFooterView.m", 271, @"UITableViewHeaderFooterView's contentView must remain a direct subview of it. Unexpected superview of the contentView: %@", v4 object file lineNumber description];
    }
    else
    {
      double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_headerFooterView___s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v10 = v4;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "UITableViewHeaderFooterView's contentView must remain a direct subview of it. Unexpected superview of the contentView: %@", buf, 0xCu);
      }
    }
    id v5 = 0;
  }

  return v5;
}

- (_UITableViewHeaderFooterContentView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITableViewHeaderFooterContentView;
  double v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3 && dyld_program_sdk_at_least()) {
    [(UIView *)v3 _setHostsLayoutEngine:1];
  }
  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIView *)self backgroundColor];
  v8.receiver = self;
  v8.super_class = (Class)_UITableViewHeaderFooterContentView;
  [(UIView *)&v8 setBackgroundColor:v4];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    double v7 = [(_UITableViewHeaderFooterContentView *)self _headerFooterView];
    [v7 _invalidateDetailLabelBackgroundColor];
  }
}

- (void)_updateConstraintsIfNeededWithViewForVariableChangeNotifications:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [(UIView *)self superview];
  }
  else
  {
    char v6 = 0;
  }

  if ((*(void *)&self->super._viewFlags & 0x400000000000000) != 0
    && [(UIView *)self _hostsLayoutEngine]
    && [v6 needsUpdateConstraints])
  {
    [v6 _updateConstraintsIfNeededWithViewForVariableChangeNotifications:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UITableViewHeaderFooterContentView;
    [(UIView *)&v7 _updateConstraintsIfNeededWithViewForVariableChangeNotifications:v4];
  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ([(UIView *)self translatesAutoresizingMaskIntoConstraints])
    {
      if (dyld_program_sdk_at_least())
      {
        objc_super v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &setTranslatesAutoresizingMaskIntoConstraints____s_category_2)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          char v6 = v5;
          objc_super v7 = [(UIView *)self superview];
          *(_DWORD *)buf = 138412290;
          double v10 = v7;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of the contentView of a UITableViewHeaderFooterView is not supported and will result in undefined behavior, as this property is managed by the owning UITableViewHeaderFooterView. View: %@", buf, 0xCu);
        }
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UITableViewHeaderFooterContentView;
  [(UIView *)&v8 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

@end