@interface PSTableCell(CustomizationExtensions)
- (BOOL)isCopyable;
- (UILongPressGestureRecognizer)longTapRecognizer;
- (void)setIsCopyable:()CustomizationExtensions;
- (void)setLongTapRecognizer:()CustomizationExtensions;
@end

@implementation PSTableCell(CustomizationExtensions)

- (BOOL)isCopyable
{
  return self->_isCopyable;
}

- (void)setIsCopyable:()CustomizationExtensions
{
  self->_isCopyable = a3;
}

- (UILongPressGestureRecognizer)longTapRecognizer
{
  return self->_longTapRecognizer;
}

- (void)setLongTapRecognizer:()CustomizationExtensions
{
}

@end