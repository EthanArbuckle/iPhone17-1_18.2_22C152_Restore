@interface UIStoryboardEmbedSegueTemplate
- (UIStoryboardEmbedSegueTemplate)initWithCoder:(id)a3;
- (UIView)containerView;
- (id)newDefaultPerformHandlerForSegue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerView:(id)a3;
@end

@implementation UIStoryboardEmbedSegueTemplate

- (UIStoryboardEmbedSegueTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIStoryboardEmbedSegueTemplate;
  v5 = [(UIStoryboardSegueTemplate *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIContainerView"];
    containerView = v5->_containerView;
    v5->_containerView = (UIView *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStoryboardEmbedSegueTemplate;
  id v4 = a3;
  [(UIStoryboardSegueTemplate *)&v6 encodeWithCoder:v4];
  v5 = [(UIStoryboardEmbedSegueTemplate *)self containerView];
  [v4 encodeObject:v5 forKey:@"UIContainerView"];
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(UIStoryboardEmbedSegueTemplate *)self containerView];
  objc_initWeak(&location, v5);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIStoryboardEmbedSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E53080E8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  id v11 = v6;
  v12 = self;
  id v7 = v6;
  v8 = _Block_copy(aBlock);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v8;
}

void __67__UIStoryboardEmbedSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"UIStoryboardEmbedSegueTemplate.m" lineNumber:38 description:@"containerView is required."];

    v2 = *(void **)(a1 + 32);
  }
  v3 = [v2 subviews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 40) file:@"UIStoryboardEmbedSegueTemplate.m" lineNumber:39 description:@"There are unexpected subviews in the container view. Perhaps the embed segue has already fired once or a subview was added programmatically?"];
  }
  id v5 = [WeakRetained sourceViewController];
  objc_super v6 = [WeakRetained destinationViewController];
  id v7 = [v6 view];
  [v5 addChildViewController:v6];
  [*(id *)(a1 + 32) addSubview:v7];
  [v7 setAutoresizingMask:18];
  if (([v7 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
  {
    v8 = _NSDictionaryOfVariableBindings(&cfstr_Childview.isa, v7, 0);
    objc_super v9 = *(void **)(a1 + 32);
    v10 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v8];
    [v9 addConstraints:v10];

    id v11 = *(void **)(a1 + 32);
    v12 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v8];
    [v11 addConstraints:v12];
  }
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v7, "setFrame:");
  [v6 didMoveToParentViewController:v5];
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end