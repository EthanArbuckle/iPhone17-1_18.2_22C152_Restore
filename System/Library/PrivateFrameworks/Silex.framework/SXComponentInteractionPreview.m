@interface SXComponentInteractionPreview
- (id)initWithInteraction:(void *)a3 viewController:;
- (id)viewController;
@end

@implementation SXComponentInteractionPreview

- (id)initWithInteraction:(void *)a3 viewController:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SXComponentInteractionPreview;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeWeak(a1 + 2, v7);
    }
  }

  return a1;
}

- (id)viewController
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end