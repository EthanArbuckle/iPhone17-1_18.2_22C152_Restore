@interface _UIAbstractDynamicButtonGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_shouldReceiveDynamicButton:(id)a3;
- (BOOL)_shouldReceiveEvent:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_UIAbstractDynamicButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (unint64_t)_allowedPhysicalButtons;
- (void)_setAllowedPhysicalButtons:(unint64_t)a3;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setDelaysTouchesBegan:(BOOL)a3;
- (void)setDelaysTouchesEnded:(BOOL)a3;
@end

@implementation _UIAbstractDynamicButtonGestureRecognizer

- (_UIAbstractDynamicButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(_UIAbstractDynamicButtonGestureRecognizer *)v4 setDelaysTouchesBegan:0];
    [(_UIAbstractDynamicButtonGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(_UIAbstractDynamicButtonGestureRecognizer *)v5 setCancelsTouchesInView:0];
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(UIGestureRecognizer *)v5 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v5 setAllowedPressTypes:v6];
  }
  return v5;
}

- (void)setDelaysTouchesEnded:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(id *)(__UILogGetCategoryCachedImpl("DynamicButton", &setDelaysTouchesEnded____s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v5 = NSString;
        uint64_t v6 = self;
        v7 = (objc_class *)objc_opt_class();
        objc_super v8 = NSStringFromClass(v7);
        v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
      }
      else
      {
        v9 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "delaysTouchesEnded was called on %@ with an unsupported value of true. This gesture currently does not support delaying touches. This value will be ignored.", buf, 0xCu);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
    -[UIGestureRecognizer setDelaysTouchesEnded:](&v10, sel_setDelaysTouchesEnded_);
  }
}

- (void)setDelaysTouchesBegan:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(id *)(__UILogGetCategoryCachedImpl("DynamicButton", &setDelaysTouchesBegan____s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v5 = NSString;
        uint64_t v6 = self;
        v7 = (objc_class *)objc_opt_class();
        objc_super v8 = NSStringFromClass(v7);
        v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
      }
      else
      {
        v9 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "delaysTouchesBegan was called on %@ with an unsupported value of true. This gesture currently does not support delaying touches. This value will be ignored.", buf, 0xCu);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
    -[UIGestureRecognizer setDelaysTouchesBegan:](&v10, sel_setDelaysTouchesBegan_);
  }
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(id *)(__UILogGetCategoryCachedImpl("DynamicButton", &setCancelsTouchesInView____s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v5 = NSString;
        uint64_t v6 = self;
        v7 = (objc_class *)objc_opt_class();
        objc_super v8 = NSStringFromClass(v7);
        v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
      }
      else
      {
        v9 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "cancelsTouchesInView was called on %@ with an unsupported value of true. This gesture currently does not support cancelling touches. This value will be ignored.", buf, 0xCu);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
    -[UIGestureRecognizer setCancelsTouchesInView:](&v10, sel_setCancelsTouchesInView_);
  }
}

- (void)_setAllowedPhysicalButtons:(unint64_t)a3
{
  self->_allowedPhysicalButtons = a3;
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  if ([a3 type] != 16) {
    return 0;
  }
  return [(UIGestureRecognizer *)self shouldReceiveEvent:a3];
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIAbstractDynamicButtonGestureRecognizer.m" lineNumber:97 description:@"Must be overridden by subclasses"];

  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAbstractDynamicButtonGestureRecognizer;
  unsigned int v4 = -[UIGestureRecognizer _affectedByGesture:](&v7, sel__affectedByGesture_);
  char isKindOfClass = 0;
  if (a3 && v4)
  {
    if ((*((void *)a3 + 1) & 0x4000000000000000) != 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (unint64_t)_allowedPhysicalButtons
{
  return self->_allowedPhysicalButtons;
}

@end