@interface _UIStatusBarPersistentAnimationView
- (NSArray)persistentAnimations;
- (NSHashTable)animations;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)setAnimations:(id)a3;
- (void)setPersistentAnimations:(id)a3;
@end

@implementation _UIStatusBarPersistentAnimationView

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F3A4B0]])
  {
    v8 = [UIViewBlockBasedCAAction alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61___UIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    v9 = v15;
LABEL_5:
    uint64_t v10 = [(UIViewBlockBasedCAAction *)v8 initWithEmptyBlock:v9];
    goto LABEL_7;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F3A4A8]])
  {
    v8 = [UIViewBlockBasedCAAction alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61___UIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke_2;
    v14[3] = &unk_1E52D9F70;
    v14[4] = self;
    v9 = v14;
    goto LABEL_5;
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarPersistentAnimationView;
  uint64_t v10 = [(UIView *)&v13 actionForLayer:v6 forKey:v7];
LABEL_7:
  v11 = (void *)v10;

  return v11;
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
  v8 = [(UIView *)self layer];
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

- (void).cxx_destruct
{
}

@end