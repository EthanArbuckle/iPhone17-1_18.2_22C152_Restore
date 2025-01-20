@interface NCTextMenuInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)_editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (NCTextMenuInteraction)init;
- (NCTextSupporting)view;
- (id)_editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)_editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4;
- (void)_editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4;
- (void)_handleLongPress:(id)a3;
- (void)_performHaptic;
- (void)_prepareHaptic;
- (void)_tearDownHaptic;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation NCTextMenuInteraction

- (NCTextMenuInteraction)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCTextMenuInteraction;
  v2 = [(NCTextMenuInteraction *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v2 action:sel__handleLongPress_];
    longPressGestureRecognizer = v2->_longPressGestureRecognizer;
    v2->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v3;

    [(UILongPressGestureRecognizer *)v2->_longPressGestureRecognizer setDelegate:v2];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:v2];
    editMenuInteraction = v2->_editMenuInteraction;
    v2->_editMenuInteraction = (UIEditMenuInteraction *)v5;

    [(UIEditMenuInteraction *)v2->_editMenuInteraction setPresentsContextMenuAsSecondaryAction:0];
  }
  return v2;
}

- (void)dealloc
{
  [(UIEditMenuInteraction *)self->_editMenuInteraction dismissMenu];
  [(NCTextMenuInteraction *)self _tearDownHaptic];
  v3.receiver = self;
  v3.super_class = (Class)NCTextMenuInteraction;
  [(NCTextMenuInteraction *)&v3 dealloc];
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);

  v6 = WeakRetained;
  if (WeakRetained && WeakRetained != v5)
  {
    [WeakRetained removeGestureRecognizer:self->_longPressGestureRecognizer];
    [WeakRetained removeInteraction:self->_editMenuInteraction];
    v6 = WeakRetained;
  }
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  if (v4)
  {
    [v4 addGestureRecognizer:self->_longPressGestureRecognizer];
    [v4 addInteraction:self->_editMenuInteraction];
  }
}

- (id)_editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__7;
  v21[4] = __Block_byref_object_dispose__7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v22 = [WeakRetained text];

  v12 = (void *)MEMORY[0x1E4FB13F0];
  v13 = NCUserNotificationsUIKitFrameworkBundle();
  v14 = [v13 localizedStringForKey:@"NOTIFICATION_TEXT_COPY" value:&stru_1F2F516F8 table:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__NCTextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
  v20[3] = &unk_1E6A93B90;
  v20[4] = v21;
  v15 = [v12 actionWithTitle:v14 image:0 identifier:0 handler:v20];

  v16 = (void *)MEMORY[0x1E4FB1970];
  v23[0] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v18 = [v16 menuWithTitle:&stru_1F2F516F8 image:0 identifier:0 options:1 children:v17];

  _Block_object_dispose(v21, 8);

  return v18;
}

void __84__NCTextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mutableCopy];
  v1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v1 setString:v2];
}

- (CGRect)_editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained frame];
  double v6 = v5;
  double v8 = v7;
  int v9 = [WeakRetained _shouldReverseLayoutDirection];
  objc_msgSend(WeakRetained, "sizeThatFits:", v6, v8);
  double v11 = v10;
  double v13 = v12;
  [WeakRetained bounds];
  double v16 = v15;
  double v17 = v6 - v11;
  if (!v9) {
    double v17 = -0.0;
  }
  double v18 = v14 + v17;

  double v19 = v18;
  double v20 = v16;
  double v21 = v11;
  double v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v5 = [WeakRetained textColor];
  defaultTextColor = self->_defaultTextColor;
  self->_defaultTextColor = v5;

  double v7 = [MEMORY[0x1E4FB1618] tintColor];
  [WeakRetained setTextColor:v7];
}

- (void)_editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained setTextColor:self->_defaultTextColor];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  if (self->_longPressGestureRecognizer == a3)
  {
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_handleLongPress:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    id v4 = [WeakRetained text];
    if ([v4 length])
    {
      uint64_t v5 = [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer state];

      if (v5 == 1)
      {
        if ([WeakRetained becomeFirstResponder])
        {
          [(NCTextMenuInteraction *)self _performHaptic];
          double v6 = [WeakRetained superview];
          [WeakRetained center];
          objc_msgSend(v6, "convertPoint:toView:", WeakRetained);
          double v8 = v7;
          double v10 = v9;

          double v11 = objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", @"id", v8, v10);
          [(UIEditMenuInteraction *)self->_editMenuInteraction presentEditMenuWithConfiguration:v11];
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if ([(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer state] == 3
    || [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer state] == 4)
  {
    [(NCTextMenuInteraction *)self _tearDownHaptic];
  }
LABEL_10:
}

- (void)_prepareHaptic
{
  if (!self->_hapticPrepared)
  {
    haptic = self->_haptic;
    if (!haptic)
    {
      id v4 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
      uint64_t v5 = self->_haptic;
      self->_haptic = v4;

      haptic = self->_haptic;
    }
    [(UIImpactFeedbackGenerator *)haptic prepare];
    self->_hapticPrepared = 1;
  }
}

- (void)_tearDownHaptic
{
  haptic = self->_haptic;
  self->_haptic = 0;

  self->_hapticPrepared = 0;
}

- (void)_performHaptic
{
}

- (NCTextSupporting)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (NCTextSupporting *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);

  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
}

@end