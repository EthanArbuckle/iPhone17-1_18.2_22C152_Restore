@interface _UIInputViewSetPlacementDragToDismiss
+ (BOOL)supportsSecureCoding;
+ (id)placementWithOffset:(double)a3 dismissKeyboardOnly:(BOOL)a4;
- (BOOL)dismissKeyboardOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractive;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
- (_UIInputViewSetPlacementDragToDismiss)initWithCoder:(id)a3;
- (double)offset;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setDismissKeyboardOnly:(BOOL)a3;
- (void)setOffset:(double)a3;
@end

@implementation _UIInputViewSetPlacementDragToDismiss

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placementWithOffset:(double)a3 dismissKeyboardOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [a1 placement];
  [v6 setOffset:a3];
  [v6 setDismissKeyboardOnly:v4];
  return v6;
}

- (_UIInputViewSetPlacementDragToDismiss)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  v5 = [(UIInputViewSetPlacement *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"Offset"];
    v5->_offset = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  id v4 = a3;
  [(UIInputViewSetPlacement *)&v6 encodeWithCoder:v4];
  double offset = self->_offset;
  *(float *)&double offset = offset;
  objc_msgSend(v4, "encodeFloat:forKey:", @"Offset", offset, v6.receiver, v6.super_class);
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  v9 = [(UIInputViewSetPlacement *)&v29 verticalConstraintForInputViewSet:v8 hostView:a4 containerView:a5];
  v10 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  [v10 intersectionHeightForWindowScene:0];
  double v12 = v11;
  double v13 = 0.0;
  double v14 = 0.0;
  if (![(_UIInputViewSetPlacementDragToDismiss *)self dismissKeyboardOnly])
  {
    [v10 heightForRemoteIAVPlaceholderIfNecessary];
    double v14 = v15;
  }
  v16 = [v8 inputView];
  if (v16)
  {
    v17 = [v8 inputView];
    [v17 bounds];
    double v13 = v18;
  }
  v19 = [v8 inputAssistantView];
  double v20 = 0.0;
  double v21 = 0.0;
  if (v19)
  {
    v22 = [v8 inputAssistantView];
    [v22 bounds];
    double v21 = v23;
  }
  if (![(_UIInputViewSetPlacementDragToDismiss *)self dismissKeyboardOnly])
  {
    v24 = [v8 inputAccessoryView];
    if (v24)
    {
      v25 = [v8 inputAccessoryView];
      [v25 bounds];
      double v20 = v26;
    }
  }
  [(_UIInputViewSetPlacementDragToDismiss *)self offset];
  [v9 setConstant:v27 - (v13 + v21 + v20 - (v12 + v14))];

  return v9;
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  if ([(UIInputViewSetPlacement *)&v7 isEqual:v4]) {
    BOOL v5 = self->_offset == v4[6];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_double offset = a3;
}

- (BOOL)dismissKeyboardOnly
{
  return self->_dismissKeyboardOnly;
}

- (void)setDismissKeyboardOnly:(BOOL)a3
{
  self->_dismissKeyboardOnly = a3;
}

@end