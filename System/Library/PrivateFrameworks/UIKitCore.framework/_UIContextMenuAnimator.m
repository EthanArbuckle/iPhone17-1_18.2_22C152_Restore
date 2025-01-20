@interface _UIContextMenuAnimator
+ (_UIContextMenuAnimator)animatorWithViewController:(id)a3;
- (BOOL)hasAnyActions;
- (NSMutableArray)animations;
- (NSMutableArray)completions;
- (UIViewController)previewViewController;
- (int64_t)preferredCommitStyle;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)performAllAnimations;
- (void)performAllCompletions;
- (void)setPreferredCommitStyle:(int64_t)a3;
@end

@implementation _UIContextMenuAnimator

+ (_UIContextMenuAnimator)animatorWithViewController:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)v4[2];
  v4[2] = v3;
  id v6 = v3;

  v7 = [v6 view];

  v8 = [v7 window];
  v9 = [v8 traitCollection];
  BOOL v10 = [v9 horizontalSizeClass] == 1;

  v4[1] = v10;
  return (_UIContextMenuAnimator *)v4;
}

- (BOOL)hasAnyActions
{
  id v3 = [(_UIContextMenuAnimator *)self animations];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(_UIContextMenuAnimator *)self completions];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  animations = self->_animations;
  aBlock = v4;
  if (!animations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_animations;
    self->_animations = v6;

    id v4 = aBlock;
    animations = self->_animations;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)animations addObject:v8];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_completions;
    self->_completions = v6;

    id v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completions addObject:v8];
}

- (void)performAllAnimations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICMILifecycle", &performAllAnimations___s_category_0) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "performAllAnimations for animator: %@", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(_UIContextMenuAnimator *)self animations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  animations = self->_animations;
  self->_animations = 0;
}

- (void)performAllCompletions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICMILifecycle", &performAllCompletions___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "performAllCompletions for animator: %@", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(_UIContextMenuAnimator *)self completions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  completions = self->_completions;
  self->_completions = 0;
}

- (int64_t)preferredCommitStyle
{
  return self->_preferredCommitStyle;
}

- (void)setPreferredCommitStyle:(int64_t)a3
{
  self->_preferredCommitStyle = a3;
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
}

@end