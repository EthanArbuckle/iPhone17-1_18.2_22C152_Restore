@interface _UITextDocumentInterface
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (BOOL)needsInputModeSwitchKey;
- (NSString)documentContextAfterInput;
- (NSString)documentContextBeforeInput;
- (NSString)markedText;
- (NSString)selectedText;
- (NSString)textContentType;
- (NSUUID)documentIdentifier;
- (TIDocumentState)_documentState;
- (TIKeyboardOutput)_keyboardOutput;
- (TITextInputTraits)_textInputTraits;
- (UITextInputMode)documentInputMode;
- (_UIInputViewControllerOutput)_controllerOutput;
- (_UIInputViewControllerState)_controllerState;
- (_UITextDocumentInterfaceDelegate)_delegate;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)smartDashesType;
- (int64_t)smartInsertDeleteType;
- (int64_t)smartQuotesType;
- (int64_t)spellCheckingType;
- (void)_createControllerOutputIfNecessary;
- (void)_didPerformOutputOperation;
- (void)_handleInputViewControllerState:(id)a3;
- (void)_setHasDictation:(BOOL)a3;
- (void)_setInputModeList:(int64_t)a3 touchBegan:(double)a4 fromLocation:(CGPoint)a5 updatePoint:(CGPoint)a6;
- (void)_setPrimaryLanguage:(id)a3;
- (void)_setProceedShouldReturnIfPossibleForASP;
- (void)_setShouldAdvanceInputMode;
- (void)_setShouldDismiss;
- (void)adjustTextPositionByCharacterOffset:(int64_t)a3;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setControllerOutput:(id)a3;
- (void)setControllerState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardingInterface:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)unmarkText;
@end

@implementation _UITextDocumentInterface

- (void)setForwardingInterface:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UITextDocumentInterface;
  [(UIInputViewControllerInterface *)&v6 setForwardingInterface:a3];
  v4 = [(UIInputViewControllerInterface *)self forwardingInterface];
  v5 = [(_UITextDocumentInterface *)self _controllerState];
  [v4 _handleInputViewControllerState:v5];
}

- (_UIInputViewControllerState)_controllerState
{
  controllerState = self->_controllerState;
  if (!controllerState)
  {
    v4 = objc_alloc_init(_UIInputViewControllerState);
    v5 = self->_controllerState;
    self->_controllerState = v4;

    controllerState = self->_controllerState;
  }
  [(_UIInputViewControllerState *)controllerState createDocumentStateIfNecessary];
  objc_super v6 = self->_controllerState;
  return v6;
}

- (void)_createControllerOutputIfNecessary
{
  if (!self->_controllerOutput)
  {
    v3 = objc_alloc_init(_UIInputViewControllerOutput);
    controllerOutput = self->_controllerOutput;
    self->_controllerOutput = v3;

    v5 = self->_controllerOutput;
    [(_UIInputViewControllerOutput *)v5 setSource:5];
  }
}

- (_UIInputViewControllerOutput)_controllerOutput
{
  [(_UITextDocumentInterface *)self _createControllerOutputIfNecessary];
  controllerOutput = self->_controllerOutput;
  return controllerOutput;
}

- (TIDocumentState)_documentState
{
  v2 = [(_UITextDocumentInterface *)self _controllerState];
  v3 = [v2 documentState];

  return (TIDocumentState *)v3;
}

- (TITextInputTraits)_textInputTraits
{
  v2 = [(_UITextDocumentInterface *)self _controllerState];
  v3 = [v2 textInputTraits];

  return (TITextInputTraits *)v3;
}

- (int64_t)autocapitalizationType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  int64_t v3 = [v2 autocapitalizationType];

  return v3;
}

- (int64_t)autocorrectionType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  int64_t v3 = [v2 autocorrectionType];

  return v3;
}

- (int64_t)spellCheckingType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  int64_t v3 = [v2 spellCheckingType];

  return v3;
}

- (int64_t)keyboardType
{
  v2 = (void *)MEMORY[0x1E4FAE450];
  int64_t v3 = [(_UITextDocumentInterface *)self _textInputTraits];
  int64_t v4 = objc_msgSend(v2, "translateToPublicKeyboardType:", objc_msgSend(v3, "keyboardType"));

  return v4;
}

- (int64_t)keyboardAppearance
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  int64_t v3 = +[UITextInputTraits translateToPublicUIKeyboardAppearance:](UITextInputTraits, "translateToPublicUIKeyboardAppearance:", [v2 keyboardAppearance]);

  return v3;
}

- (int64_t)returnKeyType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  int64_t v3 = [v2 returnKeyType];

  return v3;
}

- (BOOL)enablesReturnKeyAutomatically
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  char v3 = [v2 enablesReturnKeyAutomatically];

  return v3;
}

- (BOOL)isSecureTextEntry
{
  return 0;
}

- (NSString)textContentType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  char v3 = [v2 textContentType];

  return (NSString *)v3;
}

- (int64_t)smartQuotesType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  if ([v2 smartQuotesEnabled]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int64_t)smartDashesType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  if ([v2 smartDashesEnabled]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int64_t)smartInsertDeleteType
{
  v2 = [(_UITextDocumentInterface *)self _textInputTraits];
  if ([v2 smartInsertDeleteEnabled]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (BOOL)hasText
{
  v2 = [(_UITextDocumentInterface *)self _documentState];
  char v3 = [v2 documentIsEmpty] ^ 1;

  return v3;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  v5 = [(_UITextDocumentInterface *)self _documentState];
  objc_super v6 = [v5 documentStateAfterInsertingText:v4];
  v7 = [(_UITextDocumentInterface *)self _controllerState];
  [v7 setDocumentState:v6];

  v8 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v8 insertText:v4];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)deleteBackward
{
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  char v3 = [(_UITextDocumentInterface *)self _documentState];
  id v4 = [v3 documentStateAfterDeletingBackward];
  v5 = [(_UITextDocumentInterface *)self _controllerState];
  [v5 setDocumentState:v4];

  objc_super v6 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v6 deleteBackward];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  v8 = [(_UITextDocumentInterface *)self _documentState];
  v9 = objc_msgSend(v8, "documentStateAfterSettingMarkedText:selectedRange:", v7, location, length);
  v10 = [(_UITextDocumentInterface *)self _controllerState];
  [v10 setDocumentState:v9];

  v11 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v11 setSetMarkedText:1];

  v12 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v12 setMarkedText:v7];

  v13 = [(_UITextDocumentInterface *)self _controllerOutput];
  objc_msgSend(v13, "setSelectedRange:", location, length);

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)unmarkText
{
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  char v3 = [(_UITextDocumentInterface *)self _controllerState];
  id v4 = [v3 documentState];
  v5 = [v4 documentStateAfterUnmarkingText];
  objc_super v6 = [(_UITextDocumentInterface *)self _controllerState];
  [v6 setDocumentState:v5];

  id v7 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v7 setUnmarkText:1];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (NSString)documentContextBeforeInput
{
  char v3 = [(_UITextDocumentInterface *)self _documentState];
  id v4 = [v3 contextBeforeInput];
  if ([v4 length])
  {
    v5 = [(_UITextDocumentInterface *)self _documentState];
    objc_super v6 = [v5 contextBeforeInput];
  }
  else
  {
    objc_super v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)documentContextAfterInput
{
  char v3 = [(_UITextDocumentInterface *)self _documentState];
  id v4 = [v3 contextAfterInput];
  if ([v4 length])
  {
    v5 = [(_UITextDocumentInterface *)self _documentState];
    objc_super v6 = [v5 contextAfterInput];
  }
  else
  {
    objc_super v6 = 0;
  }

  return (NSString *)v6;
}

- (UITextInputMode)documentInputMode
{
  v2 = [(_UITextDocumentInterface *)self _controllerState];
  char v3 = [v2 documentInputMode];

  return (UITextInputMode *)v3;
}

- (NSString)selectedText
{
  v2 = [(_UITextDocumentInterface *)self _documentState];
  char v3 = [v2 selectedText];

  return (NSString *)v3;
}

- (NSString)markedText
{
  v2 = [(_UITextDocumentInterface *)self _documentState];
  char v3 = [v2 markedText];

  return (NSString *)v3;
}

- (NSUUID)documentIdentifier
{
  v2 = [(_UITextDocumentInterface *)self _controllerState];
  char v3 = [v2 documentIdentifier];

  return (NSUUID *)v3;
}

- (BOOL)needsInputModeSwitchKey
{
  v2 = [(_UITextDocumentInterface *)self _controllerState];
  char v3 = [v2 needsInputModeSwitchKey];

  return v3;
}

- (void)adjustTextPositionByCharacterOffset:(int64_t)a3
{
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  if (a3)
  {
    v5 = [(_UITextDocumentInterface *)self _documentState];
    objc_super v6 = [v5 documentStateAfterCursorAdjustment:a3];
    id v7 = [(_UITextDocumentInterface *)self _controllerState];
    [v7 setDocumentState:v6];

    v8 = [(_UITextDocumentInterface *)self _controllerOutput];
    [v8 adjustTextPositionByCharacterOffset:a3];
  }
  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)_handleInputViewControllerState:(id)a3
{
  id v4 = a3;
  v5 = [(_UITextDocumentInterface *)self _delegate];
  [v5 _willResetDocumentState];

  [(_UITextDocumentInterface *)self setControllerState:v4];
  id v6 = [(_UITextDocumentInterface *)self _delegate];
  [v6 _didResetDocumentState];
}

- (void)_didPerformOutputOperation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___UITextDocumentInterface__didPerformOutputOperation__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_setPrimaryLanguage:(id)a3
{
  id v4 = a3;
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  v5 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v5 setPrimaryLanguage:v4];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)_setShouldDismiss
{
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  char v3 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v3 setShouldDismiss:1];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)_setProceedShouldReturnIfPossibleForASP
{
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  char v3 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v3 setProceedShouldReturn:1];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)_setShouldAdvanceInputMode
{
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  char v3 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v3 setShouldAdvanceInputMode:1];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)_setHasDictation:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  v5 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v5 setHasDictation:v3];

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (void)_setInputModeList:(int64_t)a3 touchBegan:(double)a4 fromLocation:(CGPoint)a5 updatePoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  [(_UITextDocumentInterface *)self _willPerformOutputOperation];
  v13 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v13 setInputModeListTouchPhase:a3];

  v14 = [(_UITextDocumentInterface *)self _controllerOutput];
  [v14 setInputModeListTouchBegan:a4];

  v15 = [(_UITextDocumentInterface *)self _controllerOutput];
  objc_msgSend(v15, "setInputModeListFromLocation:", v9, v8);

  v16 = [(_UITextDocumentInterface *)self _controllerOutput];
  objc_msgSend(v16, "setInputModeListUpdatePoint:", x, y);

  [(_UITextDocumentInterface *)self _didPerformOutputOperation];
}

- (_UITextDocumentInterfaceDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextDocumentInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setControllerState:(id)a3
{
}

- (void)setControllerOutput:(id)a3
{
}

- (TIKeyboardOutput)_keyboardOutput
{
  return self->_keyboardOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardOutput, 0);
  objc_storeStrong((id *)&self->_controllerOutput, 0);
  objc_storeStrong((id *)&self->_controllerState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end