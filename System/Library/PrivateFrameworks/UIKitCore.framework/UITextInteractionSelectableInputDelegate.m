@interface UITextInteractionSelectableInputDelegate
+ (UITextInteractionSelectableInputDelegate)selectableInputDelegateWithTextInput:(id)a3;
- (BOOL)hasText;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSDictionary)markedTextStyle;
- (UITextInput)textInput;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (id)_moveDown:(BOOL)a3 withHistory:(id)a4;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveUp:(BOOL)a3 withHistory:(id)a4;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)nextResponder;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_deleteForwardAndNotify:(BOOL)a3;
- (void)_moveCurrentSelection:(int)a3;
- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)_unmarkText;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)unmarkText;
- (void)updateSelectionRects;
@end

@implementation UITextInteractionSelectableInputDelegate

+ (UITextInteractionSelectableInputDelegate)selectableInputDelegateWithTextInput:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[3];
  v5[3] = v4;

  return (UITextInteractionSelectableInputDelegate *)v5;
}

- (UITextInput)textInput
{
  return self->_textInput;
}

- (void)updateSelectionRects
{
  v2 = [(UITextInput *)self->_textInput interactionAssistant];
  if (v2)
  {
    id v3 = v2;
    [v2 selectionChanged];
    [v3 setNeedsSelectionDisplayUpdate];
    v2 = v3;
  }
}

- (id)nextResponder
{
  return self->_textInput;
}

- (BOOL)hasText
{
  return [(UITextInput *)self->_textInput hasText];
}

- (void)insertText:(id)a3
{
  [(UITextInput *)self->_textInput insertText:a3];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (void)deleteBackward
{
  [(UITextInput *)self->_textInput deleteBackward];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (id)textInRange:(id)a3
{
  return (id)[(UITextInput *)self->_textInput textInRange:a3];
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  [(UITextInput *)self->_textInput replaceRange:a3 withText:a4];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)[(UITextInput *)self->_textInput selectedTextRange];
}

- (void)setSelectedTextRange:(id)a3
{
  [(UITextInput *)self->_textInput setSelectedTextRange:a3];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (UITextRange)markedTextRange
{
  return (UITextRange *)[(UITextInput *)self->_textInput markedTextRange];
}

- (NSDictionary)markedTextStyle
{
  return (NSDictionary *)[(UITextInput *)self->_textInput markedTextStyle];
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[UITextInput setMarkedText:selectedRange:](self->_textInput, "setMarkedText:selectedRange:", a3, a4.location, a4.length);
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (void)unmarkText
{
  [(UITextInput *)self->_textInput unmarkText];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (UITextPosition)beginningOfDocument
{
  return (UITextPosition *)[(UITextInput *)self->_textInput beginningOfDocument];
}

- (UITextPosition)endOfDocument
{
  return (UITextPosition *)[(UITextInput *)self->_textInput endOfDocument];
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return (id)[(UITextInput *)self->_textInput textRangeFromPosition:a3 toPosition:a4];
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return (id)[(UITextInput *)self->_textInput positionFromPosition:a3 offset:a4];
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return (id)[(UITextInput *)self->_textInput positionFromPosition:a3 inDirection:a4 offset:a5];
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return [(UITextInput *)self->_textInput comparePosition:a3 toPosition:a4];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return [(UITextInput *)self->_textInput offsetFromPosition:a3 toPosition:a4];
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)[(UITextInput *)self->_textInput inputDelegate];
}

- (void)setInputDelegate:(id)a3
{
}

- (UITextInputTokenizer)tokenizer
{
  return (UITextInputTokenizer *)[(UITextInput *)self->_textInput tokenizer];
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return (id)[(UITextInput *)self->_textInput positionWithinRange:a3 farthestInDirection:a4];
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return (id)[(UITextInput *)self->_textInput characterRangeByExtendingPosition:a3 inDirection:a4];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(UITextInput *)self->_textInput baseWritingDirectionForPosition:a3 inDirection:a4];
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  [(UITextInput *)self->_textInput setBaseWritingDirection:a3 forRange:a4];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (CGRect)firstRectForRange:(id)a3
{
  [(UITextInput *)self->_textInput firstRectForRange:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  [(UITextInput *)self->_textInput caretRectForPosition:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)[(UITextInput *)self->_textInput selectionRectsForRange:a3];
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return (id)-[UITextInput closestPositionToPoint:](self->_textInput, "closestPositionToPoint:", a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return (id)-[UITextInput closestPositionToPoint:withinRange:](self->_textInput, "closestPositionToPoint:withinRange:", a4, a3.x, a3.y);
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return (id)-[UITextInput characterRangeAtPoint:](self->_textInput, "characterRangeAtPoint:", a3.x, a3.y);
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  [(UITextInput *)self->_textInput _deleteBackwardAndNotify:a3];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  [(UITextInput *)self->_textInput _deleteForwardAndNotify:a3];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (void)_moveCurrentSelection:(int)a3
{
  [(UITextInput *)self->_textInput _moveCurrentSelection:*(void *)&a3];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[UITextInput _setMarkedText:selectedRange:](self->_textInput, "_setMarkedText:selectedRange:", a3, a4.location, a4.length);
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (void)_unmarkText
{
  [(UITextInput *)self->_textInput _unmarkText];
  [(UITextInteractionSelectableInputDelegate *)self updateSelectionRects];
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveUp:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveDown:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveLeft:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveRight:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToStartOfWord:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToStartOfParagraph:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToStartOfLine:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToStartOfDocument:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToEndOfWord:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToEndOfParagraph:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToEndOfLine:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  textInput = self->_textInput;
  id v7 = a4;
  v8 = [(UITextInput *)textInput inputDelegate];
  [v8 selectionWillChange:self->_textInput];

  v9 = [(UITextInput *)self->_textInput _moveToEndOfDocument:v4 withHistory:v7];

  v10 = [(UITextInput *)self->_textInput inputDelegate];
  [v10 selectionDidChange:self->_textInput];

  return v9;
}

- (void).cxx_destruct
{
}

@end