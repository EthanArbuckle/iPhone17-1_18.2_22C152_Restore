@interface TUIFocusStyle
+ (id)defaultFocusStyle;
- (BOOL)continuousCurve;
- (CGRect)erasableBoundsWithBounds:(CGRect)a3;
- (NSString)groupIdentifier;
- (TUIFocusStyle)focusStyleWithColor:(id)a3;
- (TUIFocusStyle)focusStyleWithContinuousCurve:(BOOL)a3;
- (TUIFocusStyle)focusStyleWithCornerRadius:(double)a3;
- (TUIFocusStyle)focusStyleWithEffect:(int64_t)a3;
- (TUIFocusStyle)focusStyleWithGroupIdentifier:(id)a3;
- (TUIFocusStyle)focusStyleWithInsets:(UIEdgeInsets)a3;
- (TUIFocusStyle)init;
- (TUIFocusStyle)initWithOther:(id)a3;
- (UIColor)color;
- (UIEdgeInsets)insets;
- (double)cornerRadius;
- (int64_t)effect;
@end

@implementation TUIFocusStyle

+ (id)defaultFocusStyle
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (TUIFocusStyle)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIFocusStyle;
  id v2 = [(TUIFocusStyle *)&v8 init];
  v3 = v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v2->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v2->_insets.bottom = v4;
    v2->_effect = 1;
    v2->_cornerRadius = 0.0;
    color = v2->_color;
    v2->_color = 0;
    v2->_continuousCurve = 1;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = (NSString *)@"default";
  }
  return v3;
}

- (TUIFocusStyle)initWithOther:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIFocusStyle;
  v5 = [(TUIFocusStyle *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_effect = *((void *)v4 + 2);
    long long v7 = *((_OWORD *)v4 + 4);
    *(_OWORD *)&v5->_insets.top = *((_OWORD *)v4 + 3);
    *(_OWORD *)&v5->_insets.bottom = v7;
    v5->_cornerRadius = *((double *)v4 + 3);
    v5->_continuousCurve = *((unsigned char *)v4 + 8);
    objc_storeStrong((id *)&v5->_color, *((id *)v4 + 4));
    objc_storeStrong((id *)&v6->_groupIdentifier, *((id *)v4 + 5));
  }

  return v6;
}

- (TUIFocusStyle)focusStyleWithEffect:(int64_t)a3
{
  id v4 = self;
  if (v4->_effect != a3)
  {
    v5 = [[TUIFocusStyle alloc] initWithOther:v4];

    v5->_effect = a3;
    id v4 = v5;
  }

  return v4;
}

- (TUIFocusStyle)focusStyleWithInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  long long v7 = self;
  if (v7->_insets.left != left || v7->_insets.top != top || v7->_insets.right != right || v7->_insets.bottom != bottom)
  {
    v11 = [[TUIFocusStyle alloc] initWithOther:v7];

    v11->_insets.double top = top;
    v11->_insets.double left = left;
    long long v7 = v11;
    v11->_insets.double bottom = bottom;
    v11->_insets.double right = right;
  }

  return v7;
}

- (TUIFocusStyle)focusStyleWithCornerRadius:(double)a3
{
  id v4 = self;
  if (v4->_cornerRadius != a3)
  {
    v5 = [[TUIFocusStyle alloc] initWithOther:v4];

    v5->_cornerRadius = a3;
    id v4 = v5;
  }

  return v4;
}

- (TUIFocusStyle)focusStyleWithContinuousCurve:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  if (v4->_continuousCurve != v3)
  {
    v5 = [[TUIFocusStyle alloc] initWithOther:v4];

    v5->_continuousCurve = v3;
    id v4 = v5;
  }

  return v4;
}

- (TUIFocusStyle)focusStyleWithColor:(id)a3
{
  v5 = (UIColor *)a3;
  v6 = self;
  color = v6->_color;
  if (color != v5 && ([(UIColor *)color isEqual:v5] & 1) == 0)
  {
    objc_super v8 = [[TUIFocusStyle alloc] initWithOther:v6];

    objc_storeStrong((id *)&v8->_color, a3);
    v6 = v8;
  }

  return v6;
}

- (TUIFocusStyle)focusStyleWithGroupIdentifier:(id)a3
{
  v5 = (NSString *)a3;
  v6 = self;
  groupIdentifier = v6->_groupIdentifier;
  if (groupIdentifier != v5 && ![(NSString *)groupIdentifier isEqualToString:v5])
  {
    objc_super v8 = [[TUIFocusStyle alloc] initWithOther:v6];

    objc_storeStrong((id *)&v8->_groupIdentifier, a3);
    v6 = v8;
  }

  return v6;
}

- (CGRect)erasableBoundsWithBounds:(CGRect)a3
{
  CGFloat v3 = 0.0;
  switch(self->_effect)
  {
    case 1:
    case 3:
      p_insets = &self->_insets;
      p_double left = &self->_insets.left;
      p_double bottom = &self->_insets.bottom;
      p_double right = &self->_insets.right;
      CGFloat v3 = -3.0;
      break;
    case 2:
    case 4:
      p_insets = &self->_insets;
      p_double left = &self->_insets.left;
      p_double bottom = &self->_insets.bottom;
      p_double right = &self->_insets.right;
      break;
    default:
      p_insets = (UIEdgeInsets *)&UIEdgeInsetsZero;
      p_double right = &UIEdgeInsetsZero.right;
      p_double bottom = &UIEdgeInsetsZero.bottom;
      p_double left = &UIEdgeInsetsZero.left;
      break;
  }
  v8.origin.x = a3.origin.x + *p_left;
  v8.origin.y = a3.origin.y + p_insets->top;
  v8.size.width = a3.size.width - (*p_right + *p_left);
  v8.size.height = a3.size.height - (*p_bottom + p_insets->top);
  return CGRectInset(v8, v3, v3);
}

- (int64_t)effect
{
  return self->_effect;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)continuousCurve
{
  return self->_continuousCurve;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end