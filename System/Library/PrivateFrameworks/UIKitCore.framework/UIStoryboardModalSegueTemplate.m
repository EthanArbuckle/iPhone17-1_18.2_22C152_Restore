@interface UIStoryboardModalSegueTemplate
- (BOOL)useDefaultModalPresentationStyle;
- (BOOL)useDefaultModalTransitionStyle;
- (UIStoryboardModalSegueTemplate)initWithCoder:(id)a3;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setModalTransitionStyle:(int64_t)a3;
- (void)setUseDefaultModalPresentationStyle:(BOOL)a3;
- (void)setUseDefaultModalTransitionStyle:(BOOL)a3;
@end

@implementation UIStoryboardModalSegueTemplate

- (UIStoryboardModalSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardModalSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v7 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"UIModalPresentationStyle"]) {
      v5->_modalPresentationStyle = [v4 decodeIntegerForKey:@"UIModalPresentationStyle"];
    }
    else {
      v5->_useDefaultModalPresentationStyle = 1;
    }
    if ([v4 containsValueForKey:@"UIModalTransitionStyle"]) {
      v5->_modalTransitionStyle = [v4 decodeIntegerForKey:@"UIModalTransitionStyle"];
    }
    else {
      v5->_useDefaultModalTransitionStyle = 1;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardModalSegueTemplate;
  [(UIStoryboardSegueTemplate *)&v5 encodeWithCoder:v4];
  if (!self->_useDefaultModalPresentationStyle) {
    [v4 encodeInteger:self->_modalPresentationStyle forKey:@"UIModalPresentationStyle"];
  }
  if (!self->_useDefaultModalTransitionStyle) {
    [v4 encodeInteger:self->_modalTransitionStyle forKey:@"UIModalTransitionStyle"];
  }
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  BOOL useDefaultModalPresentationStyle = self->_useDefaultModalPresentationStyle;
  modalPresentationStyle = (void *)self->_modalPresentationStyle;
  BOOL useDefaultModalTransitionStyle = self->_useDefaultModalTransitionStyle;
  modalTransitionStyle = (void *)self->_modalTransitionStyle;
  objc_initWeak(&location, a3);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIStoryboardModalSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E5308138;
  objc_copyWeak(v10, &location);
  BOOL v11 = useDefaultModalPresentationStyle;
  BOOL v12 = useDefaultModalTransitionStyle;
  v10[1] = modalPresentationStyle;
  v10[2] = modalTransitionStyle;
  objc_super v7 = _Block_copy(aBlock);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v7;
}

void __67__UIStoryboardModalSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (!*(unsigned char *)(a1 + 56))
  {
    v3 = [WeakRetained destinationViewController];
    [v3 setModalPresentationStyle:*(void *)(a1 + 40)];

    id WeakRetained = v7;
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    id v4 = [v7 destinationViewController];
    [v4 setModalTransitionStyle:*(void *)(a1 + 48)];

    id WeakRetained = v7;
  }
  objc_super v5 = [WeakRetained sourceViewController];
  v6 = [v7 destinationViewController];
  objc_msgSend(v5, "presentModalViewController:animated:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (BOOL)useDefaultModalPresentationStyle
{
  return self->_useDefaultModalPresentationStyle;
}

- (void)setUseDefaultModalPresentationStyle:(BOOL)a3
{
  self->_BOOL useDefaultModalPresentationStyle = a3;
}

- (BOOL)useDefaultModalTransitionStyle
{
  return self->_useDefaultModalTransitionStyle;
}

- (void)setUseDefaultModalTransitionStyle:(BOOL)a3
{
  self->_BOOL useDefaultModalTransitionStyle = a3;
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (int64_t)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
  self->_modalTransitionStyle = a3;
}

@end