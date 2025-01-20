@interface _UITextDraggableGeometrySameViewDropOperation
- (NSArray)sourceRanges;
- (NSAttributedString)text;
- (UITextRange)targetRange;
- (unint64_t)operation;
- (void)setOperation:(unint64_t)a3;
- (void)setSourceRanges:(id)a3;
- (void)setTargetRange:(id)a3;
- (void)setText:(id)a3;
@end

@implementation _UITextDraggableGeometrySameViewDropOperation

- (NSArray)sourceRanges
{
  return self->_sourceRanges;
}

- (void)setSourceRanges:(id)a3
{
}

- (UITextRange)targetRange
{
  return self->_targetRange;
}

- (void)setTargetRange:(id)a3
{
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_targetRange, 0);
  objc_storeStrong((id *)&self->_sourceRanges, 0);
}

@end