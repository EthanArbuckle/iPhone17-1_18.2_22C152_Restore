@interface _UIContentViewEditingController
- (BOOL)isDisplayingEditedText;
- (BOOL)makeTextInputFirstResponderWithInitialLayoutBlock:(id)a3;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)description;
- (UILabel)editableLabel;
- (UITextField)textInputView;
- (UIView)contentView;
- (_UIContentViewEditingConfiguration)editingConfiguration;
- (_UIContentViewEditingController)initWithContentView:(id)a3 editableLabel:(id)a4;
- (_UIContentViewLabelConfiguration)labelConfiguration;
- (uint64_t)removeGestureRecognizer;
- (uint64_t)tearDownTextInputView;
- (void)dealloc;
- (void)longPressRecognizerChanged:(id)a3;
- (void)setTextInputView:(id)a3;
- (void)setupTextInputView;
- (void)tearDownPassthroughInteraction;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateLabelConfiguration:(id)a3 editingConfiguration:(id)a4;
@end

@implementation _UIContentViewEditingController

- (_UIContentViewEditingController)initWithContentView:(id)a3 editableLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIContentViewEditingController.m", 42, @"Invalid parameter not satisfying: %@", @"contentView != nil" object file lineNumber description];

    if (v9)
    {
LABEL_3:
      if (![v9 isHidden]) {
        goto LABEL_4;
      }
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"_UIContentViewEditingController.m", 43, @"Invalid parameter not satisfying: %@", @"editableLabel != nil && !editableLabel.hidden" object file lineNumber description];

LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)_UIContentViewEditingController;
  v10 = [(_UIContentViewEditingController *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_contentView, v7);
    objc_storeStrong((id *)&v11->_editableLabel, a4);
    v11->_hasEdits = 0;
  }

  return v11;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  v6 = [v3 stringWithFormat:@"<%@ %p contentView: %@>", v4, self, WeakRetained];

  return (NSString *)v6;
}

- (void)updateLabelConfiguration:(id)a3 editingConfiguration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  p_editingConfiguration = &self->_editingConfiguration;
  objc_storeStrong((id *)&self->_editingConfiguration, a4);
  objc_storeStrong((id *)&self->_labelConfiguration, a3);
  textInputView = self->_textInputView;
  if (textInputView
    && ![(UIView *)textInputView isFirstResponder]
    && ![(_UIContentViewEditingConfiguration *)*p_editingConfiguration useTextInputAsLabel])
  {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  }
  editingConfiguration = *p_editingConfiguration;
  if (!*p_editingConfiguration)
  {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
LABEL_13:
    -[_UIContentViewEditingController removeGestureRecognizer]((uint64_t)self);
    goto LABEL_22;
  }
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UIContentViewEditingController.m", 66, @"Invalid parameter not satisfying: %@", @"labelConfiguration != nil" object file lineNumber description];

    editingConfiguration = self->_editingConfiguration;
  }
  BOOL v13 = [(_UIContentViewEditingConfiguration *)editingConfiguration useTextInputAsLabel];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___UIContentViewEditingController_updateLabelConfiguration_editingConfiguration___block_invoke;
  block[3] = &unk_1E52D9FC0;
  BOOL v21 = v13;
  v14 = v8;
  id v20 = v14;
  if (updateLabelConfiguration_editingConfiguration__once != -1) {
    dispatch_once(&updateLabelConfiguration_editingConfiguration__once, block);
  }

  objc_super v15 = self->_textInputView;
  if (v15)
  {
    -[_UIContentViewLabelConfiguration _applyToTextField:]((uint64_t)self->_labelConfiguration, v15);
  }
  else if (v13)
  {
    -[_UIContentViewEditingController setupTextInputView]((uint64_t)self);
  }
  if (!v8 || !v14[2] && !v14[7]) {
    goto LABEL_13;
  }
  if (![(_UIContentViewEditingConfiguration *)*p_editingConfiguration useTextInputAsLabel]
    && !self->_longPressRecognizer)
  {
    v16 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel_longPressRecognizerChanged_];
    longPressRecognizer = self->_longPressRecognizer;
    self->_longPressRecognizer = v16;

    [(UIView *)self->_editableLabel addGestureRecognizer:self->_longPressRecognizer];
    [(UIGestureRecognizer *)self->_longPressRecognizer setCancelsTouchesInView:1];
    [(UILabel *)self->_editableLabel setUserInteractionEnabled:1];
  }
LABEL_22:
}

- (uint64_t)tearDownTextInputView
{
  if (result)
  {
    uint64_t v1 = result;
    -[_UIContentViewEditingController tearDownPassthroughInteraction](result);
    [*(id *)(v1 + 48) setDelegate:0];
    [*(id *)(v1 + 48) removeFromSuperview];
    v2 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = 0;

    v3 = *(void **)(v1 + 40);
    return [v3 setAlpha:1.0];
  }
  return result;
}

- (void)setupTextInputView
{
  if (a1)
  {
    if (*(void *)(a1 + 48))
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_setupTextInputView object:a1 file:@"_UIContentViewEditingController.m" lineNumber:126 description:@"Attempting to set up a text input view while one already exists."];
    }
    [*(id *)(a1 + 40) frame];
    v6 = -[UITextField initWithFrame:]([_UIContentViewEditingTextField alloc], "initWithFrame:", v2, v3, v4, v5);
    id v7 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v6;

    [*(id *)(a1 + 48) setDelegate:a1];
    -[_UIContentViewLabelConfiguration _applyToTextField:](*(void *)(a1 + 64), *(void **)(a1 + 48));
    [*(id *)(a1 + 40) setAlpha:0.0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained addSubview:*(void *)(a1 + 48)];
  }
}

- (uint64_t)removeGestureRecognizer
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = [*(id *)(result + 8) view];
    [v2 removeGestureRecognizer:*(void *)(v1 + 8)];

    double v3 = *(void **)(v1 + 40);
    return [v3 setUserInteractionEnabled:0];
  }
  return result;
}

- (void)dealloc
{
  -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UIContentViewEditingController;
  [(_UIContentViewEditingController *)&v3 dealloc];
}

- (void)longPressRecognizerChanged:(id)a3
{
  if ([a3 state] == 1
    && ![(UIView *)self->_textInputView isFirstResponder]
    && ![(_UIContentViewEditingController *)self makeTextInputFirstResponderWithInitialLayoutBlock:&__block_literal_global_292])
  {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  }
}

- (void)tearDownPassthroughInteraction
{
  if (a1 && *(void *)(a1 + 16))
  {
    objc_msgSend(*(id *)(a1 + 48), "removeInteraction:");
    double v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;
  }
}

- (BOOL)makeTextInputFirstResponderWithInitialLayoutBlock:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!self->_editingConfiguration)
  {
    LOBYTE(v6) = 0;
    goto LABEL_9;
  }
  if (!self->_textInputView)
  {
    -[_UIContentViewEditingController setupTextInputView]((uint64_t)self);
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v4) {
LABEL_4:
  }
    +[UIView performWithoutAnimation:v5];
LABEL_5:
  LODWORD(v6) = [(UITextField *)self->_textInputView becomeFirstResponder];
  if ([(_UIContentViewEditingConfiguration *)self->_editingConfiguration selectAllTextWhenEditingBegins]&& v6)
  {
    textInputView = self->_textInputView;
    id v8 = [(UITextField *)textInputView beginningOfDocument];
    id v9 = [(UITextField *)self->_textInputView endOfDocument];
    v6 = [(UITextField *)textInputView textRangeFromPosition:v8 toPosition:v9];
    [(UITextField *)self->_textInputView setSelectedTextRange:v6];

    LOBYTE(v6) = 1;
  }
LABEL_9:

  return (char)v6;
}

- (BOOL)isDisplayingEditedText
{
  if (self->_textInputView) {
    return ![(_UIContentViewEditingConfiguration *)self->_editingConfiguration useTextInputAsLabel];
  }
  else {
    return 0;
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([v10 isEqualToString:@"\t"])
  {
    [v9 resignFirstResponder];
    char v11 = 0;
  }
  else
  {
    v12 = [(_UIContentViewEditingConfiguration *)self->_editingConfiguration shouldChangeHandler];
    if (v12)
    {
      BOOL v13 = [_UIContentViewEditingState alloc];
      v14 = [v9 text];
      objc_super v15 = -[_UIContentViewEditingState initWithText:proposedReplacementText:proposedReplacementRange:](v13, "initWithText:proposedReplacementText:proposedReplacementRange:", v14, v10, location, length);

      v16 = ((void (**)(void, _UIContentViewEditingState *))v12)[2](v12, v15);
      char v11 = [(_UIContentViewEditingState *)v15 isEqual:v16];
      if ((v11 & 1) == 0)
      {
        v17 = [v16 text];
        [v9 setText:v17];
      }
    }
    else
    {
      char v11 = 1;
    }
  }
  return v11;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  uint64_t v3 = [(_UIContentViewEditingConfiguration *)self->_editingConfiguration shouldBeginHandler];
  id v4 = (void *)v3;
  if (v3) {
    char v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (self)
  {
    if (self->_passthroughInteraction)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
      [v8 handleFailureInMethod:sel_setupPassthroughInteraction object:self file:@"_UIContentViewEditingController.m" lineNumber:179 description:@"Attempting to set up a passthrough interaction while one already exists"];
    }
    id v4 = objc_alloc_init(_UIPassthroughScrollInteraction);
    passthroughInteraction = self->_passthroughInteraction;
    self->_passthroughInteraction = v4;

    [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction setDelegate:self];
    textInputView = self->_textInputView;
    id v7 = self->_passthroughInteraction;
    [(UIView *)textInputView addInteraction:v7];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIContentViewEditingConfiguration *)self->_editingConfiguration shouldEndHandler];
  if (v5
    && (v6 = [_UIContentViewEditingState alloc],
        [v4 text],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [(_UIContentViewEditingState *)v6 initWithText:v7],
        v7,
        LODWORD(v7) = ((uint64_t (**)(void, _UIContentViewEditingState *))v5)[2](v5, v8),
        v8,
        !v7))
  {
    BOOL v12 = 0;
  }
  else
  {
    id v9 = [v4 text];
    id v10 = [(_UIContentViewLabelConfiguration *)self->_labelConfiguration text];
    char v11 = [v9 isEqualToString:v10];

    BOOL v12 = 1;
    if ((v11 & 1) == 0) {
      self->_hasEdits = 1;
    }
  }

  return v12;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v11 = a3;
  -[_UIContentViewEditingController tearDownPassthroughInteraction]((uint64_t)self);
  char v5 = self->_editingConfiguration;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIContentViewEditingController.m", 264, @"Text field ended editing, but we no longer have an editing configuration." object file lineNumber description];
  }
  v6 = [(_UIContentViewEditingConfiguration *)v5 didEndHandler];
  if (v6)
  {
    id v7 = [_UIContentViewEditingState alloc];
    id v8 = [v11 text];
    id v9 = [(_UIContentViewEditingState *)v7 initWithText:v8];

    ((void (**)(void, _UIContentViewEditingState *))v6)[2](v6, v9);
  }
  if (!self->_hasEdits && ![(_UIContentViewEditingConfiguration *)v5 useTextInputAsLabel]) {
    -[_UIContentViewEditingController tearDownTextInputView]((uint64_t)self);
  }
  self->_hasEdits = 0;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  return !-[UIView pointInside:withEvent:](self->_textInputView, "pointInside:withEvent:", a5, a4.x, a4.y);
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  return [(UITextField *)self->_textInputView resignFirstResponder];
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (UILabel)editableLabel
{
  return self->_editableLabel;
}

- (UITextField)textInputView
{
  return self->_textInputView;
}

- (void)setTextInputView:(id)a3
{
}

- (_UIContentViewEditingConfiguration)editingConfiguration
{
  return self->_editingConfiguration;
}

- (_UIContentViewLabelConfiguration)labelConfiguration
{
  return self->_labelConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConfiguration, 0);
  objc_storeStrong((id *)&self->_editingConfiguration, 0);
  objc_storeStrong((id *)&self->_textInputView, 0);
  objc_storeStrong((id *)&self->_editableLabel, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
}

@end