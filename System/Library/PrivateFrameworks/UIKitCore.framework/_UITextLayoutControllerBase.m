@interface _UITextLayoutControllerBase
+ (_UITextKit2LayoutController)layoutControllerWithTextView:(void *)a3 textContainer:;
- (BOOL)isDocumentObscured;
- (NSTextContainer)firstTextContainer;
- (UITextInputController)textInputController;
- (UITextRange)unobscuredRange;
- (_UITextLayoutBaselineCalculator)baselineCalculatorForView:(uint64_t)a1 typingAttributes:(void *)a2 usesLineFragmentOrigin:(void *)a3 fallbackTextContainerOrigin:(uint64_t)a4;
- (id)nearestTextRangeAtPoint:(double)a3 inContainer:(double)a4;
- (id)positionFromPosition:(uint64_t)a3 offset:;
- (void)adoptTextInputController:(id)a3;
- (void)detachFromTextInputController;
- (void)setDocumentObscured:(BOOL)a3;
- (void)setUnobscuredRange:(id)a3;
@end

@implementation _UITextLayoutControllerBase

- (id)positionFromPosition:(uint64_t)a3 offset:
{
  if (a1)
  {
    a1 = [a1 positionFromPosition:a2 offset:a3 affinity:0];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)adoptTextInputController:(id)a3
{
  textInputControllerConnection = self->_textInputControllerConnection;
  if (textInputControllerConnection)
  {
    v8 = (_UITextInputControllerLayoutManagerConnection *)a3;
    [(_UITextInputControllerLayoutManagerConnection *)textInputControllerConnection setTextInputController:v8];
    v4 = v8;
  }
  else
  {
    id v6 = a3;
    v7 = [[_UITextInputControllerLayoutManagerConnection alloc] initWithTextInputController:v6];

    v4 = self->_textInputControllerConnection;
    self->_textInputControllerConnection = v7;
  }
}

- (UITextRange)unobscuredRange
{
  unobscuredRange = self->_unobscuredRange;
  if (unobscuredRange)
  {
    uint64_t v3 = unobscuredRange;
  }
  else
  {
    v4 = self;
    v5 = [(_UITextLayoutControllerBase *)v4 beginningOfDocument];
    uint64_t v3 = [(_UITextLayoutControllerBase *)v4 emptyTextRangeAtPosition:v5];
  }
  return v3;
}

- (void)setUnobscuredRange:(id)a3
{
}

- (NSTextContainer)firstTextContainer
{
  v2 = [(_UITextLayoutControllerBase *)self textContainers];
  uint64_t v3 = [v2 firstObject];

  return (NSTextContainer *)v3;
}

- (UITextInputController)textInputController
{
  if (a1)
  {
    v2 = a1;
    inputDelegate = a1->_inputDelegate;
    if (inputDelegate)
    {
      a1 = [(UITextInputDelegate *)inputDelegate textInputController];
    }
    else
    {
      a1 = [[UITextInputController alloc] initWithTextLayoutController:v2];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unobscuredRange, 0);
  objc_storeStrong((id *)&self->_classicCanvasViewClass, 0);
  objc_storeStrong((id *)&self->_textInputControllerConnection, 0);
}

+ (_UITextKit2LayoutController)layoutControllerWithTextView:(void *)a3 textContainer:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = [v4 textLayoutManager];
  if (v6) {
    v7 = [[_UITextKit2LayoutController alloc] initWithTextView:v5 textContainer:v4];
  }
  else {
    v7 = (_UITextKit2LayoutController *)-[_UITextKit1LayoutController initWithTextView:textContainer:]((id *)[_UITextKit1LayoutController alloc], v5, v4);
  }
  v8 = v7;

  return v8;
}

- (id)nearestTextRangeAtPoint:(double)a3 inContainer:(double)a4
{
  if (a1)
  {
    id v7 = a1;
    v8 = objc_msgSend(v7, "nearestPositionAtPoint:inContainer:", a2, a3, a4);
    v9 = [v7 positionFromPosition:v8 offset:1 affinity:0];
    if (v9) {
      [v7 textRangeFromPosition:v8 toPosition:v9];
    }
    else {
    v10 = [v7 emptyTextRangeAtPosition:v8];
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (_UITextLayoutBaselineCalculator)baselineCalculatorForView:(uint64_t)a1 typingAttributes:(void *)a2 usesLineFragmentOrigin:(void *)a3 fallbackTextContainerOrigin:(uint64_t)a4
{
  if (a1)
  {
    id v7 = a3;
    id v8 = a2;
    v9 = [_UITextLayoutBaselineCalculator alloc];
    [v8 _currentScreenScale];
    v10 = -[_UITextLayoutBaselineCalculator initWithTextLayoutController:typingAttributes:usesLineFragmentOrigin:coordinateSpace:scale:fallbackTextContainerOrigin:](v9, "initWithTextLayoutController:typingAttributes:usesLineFragmentOrigin:coordinateSpace:scale:fallbackTextContainerOrigin:", a1, v7, a4, v8);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)detachFromTextInputController
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  textInputControllerConnection = self->_textInputControllerConnection;
  if (has_internal_diagnostics)
  {
    if (!textInputControllerConnection)
    {
      id v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Cannot detach if we were never attached", v14, 2u);
      }
    }
  }
  else if (!textInputControllerConnection)
  {
    v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1249) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Cannot detach if we were never attached", buf, 2u);
    }
  }
  int v5 = os_variant_has_internal_diagnostics();
  id v6 = [(_UITextInputControllerLayoutManagerConnection *)self->_textInputControllerConnection textInputController];

  if (v5)
  {
    if (!v6)
    {
      id v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Already detached", v12, 2u);
      }
    }
  }
  else if (!v6)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2635F0) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Already detached", v11, 2u);
    }
  }
  [(_UITextInputControllerLayoutManagerConnection *)self->_textInputControllerConnection setTextInputController:0];
}

- (BOOL)isDocumentObscured
{
  return self->_documentObscured;
}

- (void)setDocumentObscured:(BOOL)a3
{
  self->_documentObscured = a3;
}

@end