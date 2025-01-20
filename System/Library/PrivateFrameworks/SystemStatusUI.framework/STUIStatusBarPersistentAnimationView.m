@interface STUIStatusBarPersistentAnimationView
- (NSArray)persistentAnimations;
- (NSHashTable)animations;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)setAnimations:(id)a3;
- (void)setPersistentAnimations:(id)a3;
@end

@implementation STUIStatusBarPersistentAnimationView

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F3A4B0]])
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke;
    v20 = &unk_1E6AA37A0;
    v21 = self;
LABEL_5:
    uint64_t v8 = _StatusBar_UIBlockBasedCAAction();
    goto LABEL_7;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F3A4A8]])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke_2;
    v15 = &unk_1E6AA37A0;
    v16 = self;
    goto LABEL_5;
  }
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarPersistentAnimationView;
  uint64_t v8 = [(STUIStatusBarPersistentAnimationView *)&v11 actionForLayer:v6 forKey:v7];
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

- (void)setPersistentAnimations:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  animations = self->_animations;
  if (animations)
  {
    [(NSHashTable *)animations removeAllObjects];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_animations;
    self->_animations = v6;
  }
  uint64_t v8 = [(STUIStatusBarPersistentAnimationView *)self layer];
  v9 = [v8 context];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        -[NSHashTable addObject:](self->_animations, "addObject:", v15, (void)v16);
        if (!v9 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v15 pausePersistentAnimation];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
}

void __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 408);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "resumePersistentAnimation", (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 408);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "pausePersistentAnimation", (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (NSArray)persistentAnimations
{
  return [(NSHashTable *)self->_animations allObjects];
}

- (NSHashTable)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

@end