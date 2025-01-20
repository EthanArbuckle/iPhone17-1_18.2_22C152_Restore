@interface _UIPreviewInteractionGestureRecognizer
- (void)cancel;
- (void)recognize;
- (void)setDelegate:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIPreviewInteractionGestureRecognizer

- (void)recognize
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)cancel
{
  UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self state];
  if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
  {
    uint64_t v4 = qword_186B9B478[v3];
    [(UIGestureRecognizer *)self setState:v4];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(UIGestureRecognizer *)self _allActiveTouches];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v9) phase] < 3)
        {

          return;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(_UIPreviewInteractionGestureRecognizer *)self cancel];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPreviewInteractionGestureRecognizer;
    [(UIGestureRecognizer *)&v5 setDelegate:v4];
  }
  else if (dyld_program_sdk_at_least())
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You cannot change the delegate of the UIViewControllerPreviewing failure relationship gesture recognizer"];
  }
}

@end