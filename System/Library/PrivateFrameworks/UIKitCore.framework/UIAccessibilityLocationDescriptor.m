@interface UIAccessibilityLocationDescriptor
- (BOOL)isEqual:(id)a3;
- (CGPoint)point;
- (NSAttributedString)attributedName;
- (NSString)name;
- (UIAccessibilityLocationDescriptor)initWithAttributedName:(NSAttributedString *)attributedName point:(CGPoint)point inView:(UIView *)view;
- (UIAccessibilityLocationDescriptor)initWithName:(NSString *)name point:(CGPoint)point inView:(UIView *)view;
- (UIAccessibilityLocationDescriptor)initWithName:(NSString *)name view:(UIView *)view;
- (UIView)view;
- (unint64_t)hash;
@end

@implementation UIAccessibilityLocationDescriptor

- (UIAccessibilityLocationDescriptor)initWithName:(NSString *)name view:(UIView *)view
{
  return -[UIAccessibilityLocationDescriptor initWithName:point:inView:](self, "initWithName:point:inView:", name, view, NAN, NAN);
}

- (UIAccessibilityLocationDescriptor)initWithName:(NSString *)name point:(CGPoint)point inView:(UIView *)view
{
  double y = point.y;
  double x = point.x;
  v9 = (objc_class *)MEMORY[0x1E4F28B18];
  v10 = view;
  v11 = name;
  v12 = (void *)[[v9 alloc] initWithString:v11];

  v13 = -[UIAccessibilityLocationDescriptor initWithAttributedName:point:inView:](self, "initWithAttributedName:point:inView:", v12, v10, x, y);
  return v13;
}

- (UIAccessibilityLocationDescriptor)initWithAttributedName:(NSAttributedString *)attributedName point:(CGPoint)point inView:(UIView *)view
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  v9 = attributedName;
  v10 = view;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityLocationDescriptor;
  v11 = [(UIAccessibilityLocationDescriptor *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_point.CGFloat x = x;
    v11->_point.CGFloat y = y;
    objc_storeWeak((id *)&v11->_view, v10);
    uint64_t v13 = [(NSAttributedString *)v9 copy];
    v14 = v12->_attributedName;
    v12->_attributedName = (NSAttributedString *)v13;
  }
  return v12;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)name
{
  v2 = [(UIAccessibilityLocationDescriptor *)self attributedName];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(UIAccessibilityLocationDescriptor *)self attributedName];
    v7 = [v5 attributedName];
    int v8 = [v6 isEqual:v7];

    if (v8
      && ([(UIAccessibilityLocationDescriptor *)self view],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v5 view],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v9 == v10))
    {
      [(UIAccessibilityLocationDescriptor *)self point];
      double v13 = v12;
      double v15 = v14;
      [v5 point];
      BOOL v11 = v15 == v17 && v13 == v16;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(UIAccessibilityLocationDescriptor *)self view];
  uint64_t v4 = [v3 hash];
  id v5 = (void *)MEMORY[0x1E4F29238];
  [(UIAccessibilityLocationDescriptor *)self point];
  v6 = objc_msgSend(v5, "valueWithCGPoint:");
  uint64_t v7 = [v6 hash];
  int v8 = [(UIAccessibilityLocationDescriptor *)self attributedName];
  unint64_t v9 = v7 ^ v4 ^ [v8 hash];

  return v9;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedName, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end