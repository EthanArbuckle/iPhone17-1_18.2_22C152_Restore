@interface UIPreviewInteraction
- (BOOL)respondsToSelector:(SEL)a3;
- (UIPreviewInteraction)initWithView:(UIView *)view;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)initClickBasedImplementationWithView:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
@end

@implementation UIPreviewInteraction

- (UIPreviewInteraction)initWithView:(UIView *)view
{
  v4 = view;
  v12.receiver = self;
  v12.super_class = (Class)UIPreviewInteraction;
  v5 = [(UIPreviewInteraction *)&v12 init];
  if (v5)
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1) {
      goto LABEL_5;
    }
    int v11 = _UIInternalPreference_UseClickBasedPreviewInteraction;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UseClickBasedPreviewInteraction) {
      goto LABEL_5;
    }
    while (v6 >= v11)
    {
      _UIInternalPreferenceSync(v6, &_UIInternalPreference_UseClickBasedPreviewInteraction, @"UseClickBasedPreviewInteraction", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v11 = _UIInternalPreference_UseClickBasedPreviewInteraction;
      if (v6 == _UIInternalPreference_UseClickBasedPreviewInteraction) {
        goto LABEL_5;
      }
    }
    if (!byte_1E8FD4F14) {
LABEL_5:
    }
      v7 = _UIPreviewInteractionClassicImpl;
    else {
      v7 = _UIPreviewInteractionClickImpl;
    }
    uint64_t v8 = [[v7 alloc] initWithView:v4 previewInteraction:v5];
    interactionImpl = v5->_interactionImpl;
    v5->_interactionImpl = (_UIPreviewInteractionImpl *)v8;
  }
  return v5;
}

- (id)initClickBasedImplementationWithView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIPreviewInteraction;
  v5 = [(UIPreviewInteraction *)&v9 init];
  if (v5)
  {
    int v6 = [[_UIPreviewInteractionClickImpl alloc] initWithView:v4 previewInteraction:v5];
    interactionImpl = v5->_interactionImpl;
    v5->_interactionImpl = (_UIPreviewInteractionImpl *)v6;
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPreviewInteraction;
  if (-[UIPreviewInteraction respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIPreviewInteraction;
  objc_super v5 = -[UIPreviewInteraction methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(_UIPreviewInteractionImpl *)self->_interactionImpl methodSignatureForSelector:a3];
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_interactionImpl;
}

- (void).cxx_destruct
{
}

@end