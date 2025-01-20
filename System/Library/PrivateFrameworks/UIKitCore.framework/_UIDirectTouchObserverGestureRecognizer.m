@interface _UIDirectTouchObserverGestureRecognizer
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _UIDirectTouchObserverGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) _isPointerTouch])
        {
          [(UIGestureRecognizer *)self setState:5];

          return;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v10 = _systemGestureLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "DIRECT TOUCH DOWN", v11, 2u);
  }

  [(UIGestureRecognizer *)self setState:3];
}

@end