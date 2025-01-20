@interface UIWKAutocorrectionContext
- (NSString)contextAfterSelection;
- (NSString)contextBeforeSelection;
- (NSString)markedText;
- (NSString)selectedText;
- (_NSRange)rangeInMarkedText;
- (void)setContextAfterSelection:(id)a3;
- (void)setContextBeforeSelection:(id)a3;
- (void)setMarkedText:(id)a3;
- (void)setRangeInMarkedText:(_NSRange)a3;
- (void)setSelectedText:(id)a3;
@end

@implementation UIWKAutocorrectionContext

- (NSString)contextBeforeSelection
{
  return self->_contextBeforeSelection;
}

- (void)setContextBeforeSelection:(id)a3
{
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
}

- (NSString)contextAfterSelection
{
  return self->_contextAfterSelection;
}

- (void)setContextAfterSelection:(id)a3
{
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
}

- (_NSRange)rangeInMarkedText
{
  NSUInteger length = self->_rangeInMarkedText.length;
  NSUInteger location = self->_rangeInMarkedText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeInMarkedText:(_NSRange)a3
{
  self->_rangeInMarkedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_contextAfterSelection, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_contextBeforeSelection, 0);
}

@end