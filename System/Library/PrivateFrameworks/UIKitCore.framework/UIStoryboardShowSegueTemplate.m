@interface UIStoryboardShowSegueTemplate
- (NSString)action;
- (UIStoryboardShowSegueTemplate)initWithCoder:(id)a3;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
@end

@implementation UIStoryboardShowSegueTemplate

- (UIStoryboardShowSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIStoryboardShowSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"UIActionName"];
    uint64_t v7 = [v6 copy];
    action = v5->_action;
    v5->_action = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStoryboardShowSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v6 encodeWithCoder:v4];
  v5 = [(UIStoryboardShowSegueTemplate *)self action];
  [v4 encodeObject:v5 forKey:@"UIActionName"];
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  if (self->_action)
  {
    v5 = [(UIStoryboardShowSegueTemplate *)self action];
    SEL v6 = NSSelectorFromString(v5);
  }
  else
  {
    SEL v6 = sel_showViewController_sender_;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIStoryboardShowSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E52DF528;
  objc_copyWeak(v10, &location);
  v10[1] = (id)v6;
  uint64_t v7 = _Block_copy(aBlock);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

void __66__UIStoryboardShowSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained sourceViewController];
  v3 = [WeakRetained destinationViewController];
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = [WeakRetained sender];
  [v2 _showViewController:v3 withAction:v4 sender:v5];
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end