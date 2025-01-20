@interface _SBPointerTouchDownEventSniffer
- (SBWindowScene)windowScene;
- (_SBPointerTouchDownEventSnifferDelegate)delegate;
- (void)handleEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _SBPointerTouchDownEventSniffer

- (void)handleEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 type])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = objc_msgSend(v4, "allTouches", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 _isPointerTouch])
          {
            uint64_t v12 = [v10 phase];
            uint64_t v13 = [v10 phase];

            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            id v11 = WeakRetained;
            if (v12)
            {
              if (v13 == 3) {
                [WeakRetained eventSnifferHandledPointerTouchUp:self];
              }
            }
            else
            {
              [WeakRetained eventSnifferHandledPointerTouchDown:self];
            }
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_15:
  }
}

- (_SBPointerTouchDownEventSnifferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBPointerTouchDownEventSnifferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
}

@end