@interface UIIndirectScribbleInteraction
- (BOOL)_isDefaultSystemInteraction;
- (BOOL)isHandlingWriting;
- (UIIndirectScribbleInteraction)initWithDelegate:(id)delegate;
- (UIView)view;
- (id)delegate;
- (id)scribbleInteractionWrapper;
- (int64_t)_handlingWritingCount;
- (void)_setDefaultSystemInteraction:(BOOL)a3;
- (void)_setHandlingWriting:(BOOL)a3;
- (void)_setHandlingWritingCount:(int64_t)a3;
- (void)setView:(id)a3;
@end

@implementation UIIndirectScribbleInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UIIndirectScribbleInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v8.receiver = self;
  v8.super_class = (Class)UIIndirectScribbleInteraction;
  v5 = [(UIIndirectScribbleInteraction *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (int64_t)_handlingWritingCount
{
  return self->__handlingWritingCount;
}

- (void)_setHandlingWritingCount:(int64_t)a3
{
  int64_t handlingWritingCount = self->__handlingWritingCount;
  if (handlingWritingCount != a3)
  {
    self->__int64_t handlingWritingCount = a3;
    if (a3 > 0 == handlingWritingCount < 1) {
      [(UIIndirectScribbleInteraction *)self _setHandlingWriting:a3 > 0];
    }
  }
}

- (void)_setDefaultSystemInteraction:(BOOL)a3
{
  self->__defaultSystemInteraction = a3;
}

- (id)scribbleInteractionWrapper
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(UIIndirectScribbleInteraction *)self view];
  id v4 = [v3 interactions];

  id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_super v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v9 = [[UIScribbleInteractionWrapper alloc] initWithCustomScribbleInteraction:v5 indirectScribbleInteraction:self];
  return v9;
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

- (void)_setHandlingWriting:(BOOL)a3
{
  self->_handlingWriting = a3;
}

- (BOOL)_isDefaultSystemInteraction
{
  return self->__defaultSystemInteraction;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end