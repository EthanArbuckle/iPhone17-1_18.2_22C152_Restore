@interface _SFUIViewPopoverSourceInfo
- (BOOL)shouldHideArrow;
- (BOOL)shouldPassthroughSuperview;
- (CGRect)popoverSourceRect;
- (NSString)description;
- (UIView)popoverSourceView;
- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3;
- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3 insets:(UIEdgeInsets)a4;
- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3 rect:(CGRect)a4;
- (int64_t)provenance;
- (unint64_t)permittedArrowDirections;
- (void)setPermittedArrowDirections:(unint64_t)a3;
- (void)setProvenance:(int64_t)a3;
- (void)setShouldHideArrow:(BOOL)a3;
- (void)setShouldPassthroughSuperview:(BOOL)a3;
@end

@implementation _SFUIViewPopoverSourceInfo

- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3
{
  return -[_SFUIViewPopoverSourceInfo initWithView:insets:](self, "initWithView:insets:", a3, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFUIViewPopoverSourceInfo;
  v11 = [(_SFUIViewPopoverSourceInfo *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_view, a3);
    v12->_insets.CGFloat top = top;
    v12->_insets.CGFloat left = left;
    v12->_insets.CGFloat bottom = bottom;
    v12->_insets.CGFloat right = right;
    v12->_permittedArrowDirections = 15;
    v13 = v12;
  }

  return v12;
}

- (_SFUIViewPopoverSourceInfo)initWithView:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [v9 bounds];
  v14 = [(_SFUIViewPopoverSourceInfo *)self initWithView:v9 insets:SFEdgeInsetsForInsetingRectToRect(v10, v11, v12, v13, x, y, width, height)];

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  view = self->_view;
  if (view)
  {
    v7 = NSString;
    v8 = view;
    id v9 = (objc_class *)objc_opt_class();
    CGFloat v10 = NSStringFromClass(v9);
    [(UIView *)v8 center];
    CGFloat v11 = NSStringFromCGPoint(v17);
    [(UIView *)v8 bounds];
    CGFloat v12 = NSStringFromCGRect(v18);
    CGFloat v13 = [v7 stringWithFormat:@"<%@: %p center = %@, bounds = %@>", v10, v8, v11, v12];;
  }
  else
  {
    CGFloat v13 = 0;
  }
  v14 = [v3 stringWithFormat:@"<%@: %p view = %@>", v5, self, v13];;

  return (NSString *)v14;
}

- (CGRect)popoverSourceRect
{
  [(UIView *)self->_view bounds];
  double top = self->_insets.top;
  double left = self->_insets.left;
  double v6 = v5 + left;
  double v8 = top + v7;
  double v10 = v9 - (left + self->_insets.right);
  double v12 = v11 - (top + self->_insets.bottom);
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v6;
  return result;
}

- (UIView)popoverSourceView
{
  return self->_view;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (BOOL)shouldPassthroughSuperview
{
  return self->_shouldPassthroughSuperview;
}

- (void)setShouldPassthroughSuperview:(BOOL)a3
{
  self->_shouldPassthroughSuperview = a3;
}

- (BOOL)shouldHideArrow
{
  return self->_shouldHideArrow;
}

- (void)setShouldHideArrow:(BOOL)a3
{
  self->_shouldHideArrow = a3;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (void).cxx_destruct
{
}

@end