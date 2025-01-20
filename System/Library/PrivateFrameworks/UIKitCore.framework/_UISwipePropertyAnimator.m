@interface _UISwipePropertyAnimator
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addViewsToAnimateAdditively:(id)a3;
@end

@implementation _UISwipePropertyAnimator

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return -[NSHashTable containsObject:](self->_viewsToAnimateAdditively, "containsObject:", a3, a4);
}

- (void)addViewsToAnimateAdditively:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if (!self->_viewsToAnimateAdditively)
    {
      v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      viewsToAnimateAdditively = self->_viewsToAnimateAdditively;
      self->_viewsToAnimateAdditively = v5;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[NSHashTable addObject:](self->_viewsToAnimateAdditively, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UISwipePropertyAnimator;
  id v4 = [(UIViewPropertyAnimator *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSHashTable *)self->_viewsToAnimateAdditively copy];
    v6 = (void *)v4[32];
    v4[32] = v5;
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end