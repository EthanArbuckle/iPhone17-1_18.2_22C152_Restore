@interface UIStoryboardPresentationSegueTemplate
- (BOOL)useDefaultModalPresentationStyle;
- (BOOL)useDefaultModalTransitionStyle;
- (UIStoryboardPresentationSegueTemplate)initWithCoder:(id)a3;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (id)newDefaultPrepareHandlerForSegue:(id)a3;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setModalTransitionStyle:(int64_t)a3;
- (void)setUseDefaultModalPresentationStyle:(BOOL)a3;
- (void)setUseDefaultModalTransitionStyle:(BOOL)a3;
@end

@implementation UIStoryboardPresentationSegueTemplate

- (UIStoryboardPresentationSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardPresentationSegueTemplate;
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
  v5.super_class = (Class)UIStoryboardPresentationSegueTemplate;
  [(UIStoryboardSegueTemplate *)&v5 encodeWithCoder:v4];
  if (!self->_useDefaultModalPresentationStyle) {
    [v4 encodeInteger:self->_modalPresentationStyle forKey:@"UIModalPresentationStyle"];
  }
  if (!self->_useDefaultModalTransitionStyle) {
    [v4 encodeInteger:self->_modalTransitionStyle forKey:@"UIModalTransitionStyle"];
  }
}

- (id)newDefaultPrepareHandlerForSegue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIStoryboardPresentationSegueTemplate *)self useDefaultModalPresentationStyle];
  v6 = [(UIStoryboardPresentationSegueTemplate *)self modalPresentationStyle];
  BOOL v7 = [(UIStoryboardPresentationSegueTemplate *)self useDefaultModalTransitionStyle];
  v8 = [(UIStoryboardPresentationSegueTemplate *)self modalTransitionStyle];
  objc_initWeak(&location, v4);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__UIStoryboardPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E5308138;
  objc_copyWeak(v12, &location);
  BOOL v13 = v5;
  BOOL v14 = v7;
  v12[1] = v6;
  v12[2] = v8;
  v9 = _Block_copy(aBlock);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v9;
}

void __74__UIStoryboardPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v7 = WeakRetained;
    id v4 = [WeakRetained destinationViewController];
    [v4 setModalPresentationStyle:v3];

    id WeakRetained = v7;
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = WeakRetained;
    v6 = [WeakRetained destinationViewController];
    [v6 setModalTransitionStyle:v5];

    id WeakRetained = v8;
  }
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  objc_initWeak(&location, a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__UIStoryboardPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  v5[3] = &unk_1E52DC308;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = _Block_copy(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __74__UIStoryboardPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained destinationViewController];
  [v1 _setSegueResponsibleForModalPresentation:WeakRetained];
  v2 = [WeakRetained sourceViewController];
  objc_msgSend(v2, "presentViewController:animated:completion:", v1, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
}

- (BOOL)useDefaultModalPresentationStyle
{
  return self->_useDefaultModalPresentationStyle;
}

- (void)setUseDefaultModalPresentationStyle:(BOOL)a3
{
  self->_useDefaultModalPresentationStyle = a3;
}

- (BOOL)useDefaultModalTransitionStyle
{
  return self->_useDefaultModalTransitionStyle;
}

- (void)setUseDefaultModalTransitionStyle:(BOOL)a3
{
  self->_useDefaultModalTransitionStyle = a3;
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