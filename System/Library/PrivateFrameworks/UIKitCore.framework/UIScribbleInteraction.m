@interface UIScribbleInteraction
+ (BOOL)isPencilInputExpected;
+ (BOOL)isScribbleEnabled;
+ (double)_recommendedBlankSpaceHeight;
+ (void)_lastEventSourceChanged:(int64_t)a3;
- (BOOL)_isDefaultSystemInteraction;
- (BOOL)isHandlingWriting;
- (UIScribbleInteraction)initWithDelegate:(id)delegate;
- (UIView)view;
- (id)delegate;
- (id)scribbleInteractionWrapper;
- (void)_setDefaultSystemInteraction:(BOOL)a3;
- (void)_setHandlingWriting:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation UIScribbleInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UIScribbleInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v8.receiver = self;
  v8.super_class = (Class)UIScribbleInteraction;
  v5 = [(UIScribbleInteraction *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)_setDefaultSystemInteraction:(BOOL)a3
{
  self->__defaultSystemInteraction = a3;
}

+ (void)_lastEventSourceChanged:(int64_t)a3
{
  int v3 = a3 == 3;
  if (sIsPencilInputExpected != v3)
  {
    [a1 willChangeValueForKey:@"isPencilInputExpected"];
    sIsPencilInputExpected = v3;
    [a1 didChangeValueForKey:@"isPencilInputExpected"];
  }
}

+ (BOOL)isPencilInputExpected
{
  return sIsPencilInputExpected;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)isScribbleEnabled
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)_MergedGlobals_1207;
  uint64_t v12 = _MergedGlobals_1207;
  if (!_MergedGlobals_1207)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getPKTextInputSettingsClass_block_invoke_0;
    v8[3] = &unk_1E52D9900;
    v8[4] = &v9;
    __getPKTextInputSettingsClass_block_invoke_0((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = [v3 sharedSettings];
  v5 = [v4 recognitionLocaleIdentifier];
  BOOL v6 = v5 != 0;

  return v6;
}

+ (double)_recommendedBlankSpaceHeight
{
  return 60.0;
}

- (void)_setHandlingWriting:(BOOL)a3
{
  self->_handlingWriting = a3;
}

- (id)scribbleInteractionWrapper
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(UIScribbleInteraction *)self view];
  id v4 = [v3 interactions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          v10 = [v9 scribbleInteractionWrapper];

          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = [[UIScribbleInteractionWrapper alloc] initWithCustomScribbleInteraction:self indirectScribbleInteraction:0];
LABEL_12:
  return v10;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)isHandlingWriting
{
  return self->_handlingWriting;
}

- (BOOL)_isDefaultSystemInteraction
{
  return self->__defaultSystemInteraction;
}

@end