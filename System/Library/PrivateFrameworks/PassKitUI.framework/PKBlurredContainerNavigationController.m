@interface PKBlurredContainerNavigationController
- (PKBlurredContainerNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_observers;
- (void)addContentContainerObserver:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)removeContentContainerObserver:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKBlurredContainerNavigationController

- (PKBlurredContainerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKBlurredContainerNavigationController;
  v4 = [(PKBlurredContainerNavigationController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKBlurredContainerNavigationController;
  [(PKBlurredContainerNavigationController *)&v8 viewDidLoad];
  [(PKBlurredContainerNavigationController *)self _setBuiltinTransitionStyle:1];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:1200];
  v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  v7 = [(PKBlurredContainerNavigationController *)self view];
  [v7 insertSubview:self->_backdropView atIndex:0];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKBlurredContainerNavigationController;
  [(PKBlurredContainerNavigationController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKBlurredContainerNavigationController *)self view];
  backdropView = self->_backdropView;
  [v3 bounds];
  -[UIVisualEffectView setFrame:](backdropView, "setFrame:");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKBlurredContainerNavigationController;
  [(PKBlurredContainerNavigationController *)&v14 preferredContentSizeDidChangeForChildContentContainer:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v5 = [(PKBlurredContainerNavigationController *)self _observers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) contentContainer:self preferredContentSizeDidChangeForChildContentContainer:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)addContentContainerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)removeContentContainerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (id)_observers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v4 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  objc_super v5 = (void *)[v4 copy];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end