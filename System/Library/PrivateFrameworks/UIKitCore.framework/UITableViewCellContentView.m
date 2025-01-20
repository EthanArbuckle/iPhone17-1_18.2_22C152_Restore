@interface UITableViewCellContentView
+ (id)classFallbacksForKeyedArchiver;
- (NSDirectionalEdgeInsets)_overriddenDefaultLayoutMargins;
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (UITableViewCellContentView)initWithCoder:(id)a3;
- (UITableViewCellContentView)initWithFrame:(CGRect)a3;
- (void)_setOverriddenDefaultLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)_tableViewCellContentViewCommonSetup;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
@end

@implementation UITableViewCellContentView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  BOOL v3 = [(UIView *)self _shouldReverseLayoutDirection];
  v9.receiver = self;
  v9.super_class = (Class)UITableViewCellContentView;
  [(UIView *)&v9 _concreteDefaultLayoutMargins];
  if ((*(unsigned char *)&self->_contentViewFlags & 2) != 0)
  {
    CGFloat leading = self->_overriddenDefaultLayoutMargins.leading;
    if (!v3)
    {
      double trailing = self->_overriddenDefaultLayoutMargins.leading;
      if ((*(unsigned char *)&self->_contentViewFlags & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    double v7 = self->_overriddenDefaultLayoutMargins.leading;
    if ((*(unsigned char *)&self->_contentViewFlags & 8) == 0) {
      goto LABEL_10;
    }
LABEL_7:
    double trailing = self->_overriddenDefaultLayoutMargins.trailing;
    double v7 = leading;
    goto LABEL_10;
  }
  if ((*(unsigned char *)&self->_contentViewFlags & 8) == 0) {
    goto LABEL_10;
  }
  CGFloat leading = v7;
  if (v3) {
    goto LABEL_7;
  }
LABEL_9:
  double v7 = self->_overriddenDefaultLayoutMargins.trailing;
LABEL_10:
  if (*(unsigned char *)&self->_contentViewFlags) {
    double top = self->_overriddenDefaultLayoutMargins.top;
  }
  if ((*(unsigned char *)&self->_contentViewFlags & 4) != 0) {
    double bottom = self->_overriddenDefaultLayoutMargins.bottom;
  }
  result.right = v7;
  result.double bottom = bottom;
  result.left = trailing;
  result.double top = top;
  return result;
}

- (void)_tableViewCellContentViewCommonSetup
{
  if (dyld_program_sdk_at_least()) {
    [(UIView *)self _setHostsLayoutEngine:1];
  }
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self setEdgesPreservingSuperviewLayoutMargins:15];
  }
  else if (dyld_program_sdk_at_least())
  {
    [(UIView *)self setEdgesPreservingSuperviewLayoutMargins:10];
    unint64_t v3 = [(UIView *)self edgesInsettingLayoutMarginsFromSafeArea] & 0xA;
    [(UIView *)self setEdgesInsettingLayoutMarginsFromSafeArea:v3];
  }
}

- (void)_setOverriddenDefaultLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double v3 = fabs(a3.leading);
  self->_overriddenDefaultLayoutMargins = a3;
  char v4 = 2 * (v3 >= 2.22044605e-16);
  BOOL v5 = fabs(a3.top) >= 2.22044605e-16;
  if (fabs(a3.trailing) >= 2.22044605e-16) {
    char v4 = (2 * (v3 >= 2.22044605e-16)) | 8;
  }
  char v6 = v4 | v5;
  if (fabs(a3.bottom) >= 2.22044605e-16) {
    v6 |= 4u;
  }
  *(unsigned char *)&self->_contentViewFlags = *(unsigned char *)&self->_contentViewFlags & 0xF0 | v6;
  [(UIView *)self _updateInferredLayoutMargins];
}

- (UITableViewCellContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellContentView;
  double v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3)
  {
    [(UITableViewCellContentView *)v3 _tableViewCellContentViewCommonSetup];
    if (dyld_program_sdk_at_least())
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        [(UIView *)v4 setEdgesPreservingSuperviewLayoutMargins:10];
        [(UIView *)v4 setEdgesInsettingLayoutMarginsFromSafeArea:[(UIView *)v4 edgesInsettingLayoutMarginsFromSafeArea] & 0xA];
      }
    }
  }
  return v4;
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"UIView"];
}

- (UITableViewCellContentView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellContentView;
  double v3 = [(UIView *)&v6 initWithCoder:a3];
  char v4 = v3;
  if (v3) {
    [(UITableViewCellContentView *)v3 _tableViewCellContentViewCommonSetup];
  }
  return v4;
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
        BOOL v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &setTranslatesAutoresizingMaskIntoConstraints____s_category_1)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          objc_super v6 = v5;
          double v7 = [(UIView *)self superview];
          *(_DWORD *)buf = 138412290;
          v10 = v7;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of the contentView of a UITableViewCell is not supported and will result in undefined behavior, as this property is managed by the owning UITableViewCell. Cell: %@", buf, 0xCu);
        }
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)UITableViewCellContentView;
  [(UIView *)&v8 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (NSDirectionalEdgeInsets)_overriddenDefaultLayoutMargins
{
  double top = self->_overriddenDefaultLayoutMargins.top;
  double leading = self->_overriddenDefaultLayoutMargins.leading;
  double bottom = self->_overriddenDefaultLayoutMargins.bottom;
  double trailing = self->_overriddenDefaultLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

@end