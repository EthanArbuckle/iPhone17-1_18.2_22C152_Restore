@interface UIDefaultKeyboardInput
- (BOOL)acceptsEmoji;
- (BOOL)becomesEditableWithGestures;
- (BOOL)forceDisableDictation;
- (BOOL)forceEnableDictation;
- (BOOL)hasContent;
- (BOOL)hasSelection;
- (BOOL)hasText;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isSecure;
- (BOOL)isShowingPlaceholder;
- (BOOL)selectionAtDocumentStart;
- (BOOL)selectionAtWordStart;
- (CGRect)caretRect;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSDictionary)markedTextStyle;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (_NSRange)selectionRange;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)delegate;
- (id)fontForCaretSelection;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeByExtendingCurrentSelection:(int)a3;
- (id)rangeByMovingCurrentSelection:(int)a3;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (id)rectsForNSRange:(_NSRange)a3;
- (id)selectionRectsForRange:(id)a3;
- (id)selectionView;
- (id)text;
- (id)textColorForCaretSelection;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int)selectionState;
- (int)wordOffsetInRange:(id)a3;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (unsigned)characterAfterCaretSelection;
- (unsigned)characterBeforeCaretSelection;
- (unsigned)characterInRelationToCaretSelection:(int)a3;
- (void)forwardInvocation:(id)a3;
- (void)takeTraitsFrom:(id)a3;
@end

@implementation UIDefaultKeyboardInput

- (id)textInputTraits
{
  m_traits = self->m_traits;
  if (!m_traits)
  {
    v4 = objc_alloc_init(UITextInputTraits);
    v5 = self->m_traits;
    self->m_traits = v4;

    m_traits = self->m_traits;
  }
  return m_traits;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = [(UIDefaultKeyboardInput *)self textInputTraits];
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIDefaultKeyboardInput;
    [(UIDefaultKeyboardInput *)&v6 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  v7 = v6;

  return v7;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDefaultKeyboardInput *)self textInputTraits];
  [v5 takeTraitsFrom:v4];
}

- (id)delegate
{
  return 0;
}

- (unsigned)characterInRelationToCaretSelection:(int)a3
{
  return 0;
}

- (unsigned)characterBeforeCaretSelection
{
  return 0;
}

- (unsigned)characterAfterCaretSelection
{
  return 0;
}

- (id)fontForCaretSelection
{
  return 0;
}

- (id)textColorForCaretSelection
{
  return +[UIColor blackColor];
}

- (id)rectsForNSRange:(_NSRange)a3
{
  return 0;
}

- (int)wordOffsetInRange:(id)a3
{
  return -1;
}

- (BOOL)hasContent
{
  return 0;
}

- (BOOL)hasSelection
{
  return 0;
}

- (int)selectionState
{
  return 0;
}

- (BOOL)selectionAtDocumentStart
{
  return 0;
}

- (BOOL)selectionAtWordStart
{
  return 0;
}

- (_NSRange)selectionRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)rangeByMovingCurrentSelection:(int)a3
{
  return 0;
}

- (id)rangeByExtendingCurrentSelection:(int)a3
{
  return 0;
}

- (id)text
{
  return 0;
}

- (CGRect)caretRect
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isShowingPlaceholder
{
  return 0;
}

- (BOOL)isSecure
{
  return 0;
}

- (BOOL)acceptsEmoji
{
  return 0;
}

- (BOOL)forceEnableDictation
{
  return 0;
}

- (BOOL)forceDisableDictation
{
  return 0;
}

- (id)selectionView
{
  return 0;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return 0;
}

- (BOOL)isEditable
{
  return 0;
}

- (BOOL)isEditing
{
  return 0;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (BOOL)hasText
{
  return 0;
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (UITextPosition)beginningOfDocument
{
  return 0;
}

- (UITextPosition)endOfDocument
{
  return 0;
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UITextRange)markedTextRange
{
  return 0;
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (UITextInputTokenizer)tokenizer
{
  return 0;
}

- (UITextInputDelegate)inputDelegate
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end