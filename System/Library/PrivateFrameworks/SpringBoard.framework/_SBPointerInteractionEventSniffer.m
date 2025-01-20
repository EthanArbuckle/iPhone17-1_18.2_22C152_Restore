@interface _SBPointerInteractionEventSniffer
- (SBWindowScene)windowScene;
- (_SBPointerInteractionEventSnifferDelegate)delegate;
- (void)handleEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _SBPointerInteractionEventSniffer

- (void)handleEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  WeakRetained = objc_msgSend(a3, "allTouches", 0);
  uint64_t v5 = [WeakRetained countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(WeakRetained);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v9 _isPointerTouch])
        {
          v10 = [v9 view];
          [v9 previousLocationInView:v10];
          double v12 = v11;
          double v14 = v13;
          v15 = [v9 view];
          [v9 locationInView:v15];
          BOOL v18 = v14 == v17 && v12 == v16;

          BOOL v19 = [v9 phase] != 4 && objc_msgSend(v9, "phase") != 2;
          uint64_t v20 = [v9 type];
          if (!v18 && v19 && !v20)
          {

            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained eventSnifferHandledPointerInteractionQualifyingEvent:self];
            goto LABEL_19;
          }
        }
      }
      uint64_t v6 = [WeakRetained countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

- (_SBPointerInteractionEventSnifferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBPointerInteractionEventSnifferDelegate *)WeakRetained;
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