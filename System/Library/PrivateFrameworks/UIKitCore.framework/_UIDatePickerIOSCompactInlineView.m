@interface _UIDatePickerIOSCompactInlineView
- (BOOL)alignConstraintsToLayoutGuide;
- (int64_t)datePickerStyle;
@end

@implementation _UIDatePickerIOSCompactInlineView

- (int64_t)datePickerStyle
{
  return 3;
}

- (BOOL)alignConstraintsToLayoutGuide
{
  return 1;
}

@end