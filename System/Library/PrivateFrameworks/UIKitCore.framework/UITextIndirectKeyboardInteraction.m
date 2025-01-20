@interface UITextIndirectKeyboardInteraction
- (BOOL)disableTouchesForGestures;
- (UITextIndirectKeyboardInteraction)initWithView:(id)a3;
- (void)setDisableTouchesForGestures:(BOOL)a3;
@end

@implementation UITextIndirectKeyboardInteraction

- (UITextIndirectKeyboardInteraction)initWithView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextIndirectKeyboardInteraction;
  v5 = [(UITextInteraction *)&v11 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = +[_UIKeyboardBasedTextSelectionGestureController sharedInstance];
    v8 = [v7 addTwoFingerTextSelectionInteractionsToView:v4];

    if (v8) {
      [(UITextInteraction *)v6 addChild:v8];
    }
    v9 = [[UITextIndirectEditableInteraction alloc] initWithView:v4];
    [(UITextInteraction *)v6 addChild:v9];
  }
  return v6;
}

- (void)setDisableTouchesForGestures:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_disableTouchesForGestures = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(UITextInteraction *)self gesturesForFailureRequirements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    BOOL v8 = !v3;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setEnabled:v8];
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)disableTouchesForGestures
{
  return self->_disableTouchesForGestures;
}

@end