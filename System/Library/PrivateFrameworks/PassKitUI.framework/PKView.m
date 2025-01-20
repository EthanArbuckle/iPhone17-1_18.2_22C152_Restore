@interface PKView
- (PKView)init;
- (PKView)initWithFrame:(CGRect)a3;
- (void)addWindowObserver:(id)a3;
- (void)didMoveToWindow;
- (void)removeWindowObserver:(id)a3;
@end

@implementation PKView

- (PKView)init
{
  return -[PKView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKView;
  return -[PKView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKView;
  [(PKView *)&v15 didMoveToWindow];
  observers = self->_observers;
  if (observers)
  {
    objc_super v4 = [(NSHashTable *)observers allObjects];
    if ([v4 count])
    {
      v5 = [(PKView *)self window];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "observedView:didMoveToWindow:", self, v5, (void)v11);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)addWindowObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      uint64_t v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = self->_observers;
      self->_observers = v7;

      id v5 = v9;
      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)removeWindowObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    [(NSHashTable *)self->_observers removeObject:v4];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
}

@end