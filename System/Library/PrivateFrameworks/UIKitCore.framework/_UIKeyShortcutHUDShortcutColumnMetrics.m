@interface _UIKeyShortcutHUDShortcutColumnMetrics
+ (_UIKeyShortcutHUDShortcutColumnMetrics)metricsWithColumnWidth:(double)a3 modifiersWidth:(double)a4 inputWidth:(double)a5;
- (double)columnWidth;
- (double)inputWidth;
- (double)modifiersWidth;
@end

@implementation _UIKeyShortcutHUDShortcutColumnMetrics

+ (_UIKeyShortcutHUDShortcutColumnMetrics)metricsWithColumnWidth:(double)a3 modifiersWidth:(double)a4 inputWidth:(double)a5
{
  v8 = (double *)objc_opt_new();
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return (_UIKeyShortcutHUDShortcutColumnMetrics *)v8;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (double)modifiersWidth
{
  return self->_modifiersWidth;
}

- (double)inputWidth
{
  return self->_inputWidth;
}

@end