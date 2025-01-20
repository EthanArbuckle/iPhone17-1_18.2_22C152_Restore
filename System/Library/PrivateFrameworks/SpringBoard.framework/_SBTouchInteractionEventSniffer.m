@interface _SBTouchInteractionEventSniffer
- (SBWindowScene)windowScene;
- (_SBTouchInteractionEventSnifferDelegate)delegate;
- (void)handleEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _SBTouchInteractionEventSniffer

- (void)handleEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  WeakRetained = objc_msgSend(a3, "allTouches", 0);
  uint64_t v5 = [WeakRetained countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(WeakRetained);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 _isPointerTouch] & 1) == 0)
        {
          BOOL v10 = [v9 phase] != 4 && objc_msgSend(v9, "phase") != 2;
          if ([v9 type] != 1 && objc_msgSend(v9, "type") != 3 && v10)
          {

            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained eventSnifferHandledTouchInteractionQualifyingEvent:self];
            goto LABEL_19;
          }
        }
      }
      uint64_t v6 = [WeakRetained countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (_SBTouchInteractionEventSnifferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBTouchInteractionEventSnifferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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