@interface _UITextInteractionAssistantGestureState
- (BOOL)hasExternalInteractions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstResponder;
- (BOOL)viewCanBecomeEditable;
- (BOOL)viewIsEditable;
- (int64_t)mode;
- (void)setHasExternalInteractions:(BOOL)a3;
- (void)setIsFirstResponder:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setViewCanBecomeEditable:(BOOL)a3;
- (void)setViewIsEditable:(BOOL)a3;
@end

@implementation _UITextInteractionAssistantGestureState

- (void)setViewIsEditable:(BOOL)a3
{
  self->_viewIsEditable = a3;
}

- (void)setViewCanBecomeEditable:(BOOL)a3
{
  self->_viewCanBecomeEditable = a3;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)setIsFirstResponder:(BOOL)a3
{
  self->_isFirstResponder = a3;
}

- (void)setHasExternalInteractions:(BOOL)a3
{
  self->_hasExternalInteractions = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int hasExternalInteractions = self->_hasExternalInteractions;
    if (hasExternalInteractions == [v5 hasExternalInteractions]
      && (int viewIsEditable = self->_viewIsEditable, viewIsEditable == [v5 viewIsEditable])
      && (int viewCanBecomeEditable = self->_viewCanBecomeEditable,
          viewCanBecomeEditable == [v5 viewCanBecomeEditable])
      && (int64_t mode = self->_mode, mode == [v5 mode]))
    {
      int isFirstResponder = self->_isFirstResponder;
      BOOL v11 = isFirstResponder == [v5 isFirstResponder];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)hasExternalInteractions
{
  return self->_hasExternalInteractions;
}

- (BOOL)viewIsEditable
{
  return self->_viewIsEditable;
}

- (BOOL)viewCanBecomeEditable
{
  return self->_viewCanBecomeEditable;
}

- (BOOL)isFirstResponder
{
  return self->_isFirstResponder;
}

- (int64_t)mode
{
  return self->_mode;
}

@end