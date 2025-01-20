@interface _UIKeyShortcutHUDShortcutCellMetrics
+ (id)metricsWithCellWidth:(double)a3 modifiersWidth:(double)a4 inputWidth:(double)a5;
- (double)cellWidth;
- (double)inputWidth;
- (double)modifiersWidth;
@end

@implementation _UIKeyShortcutHUDShortcutCellMetrics

+ (id)metricsWithCellWidth:(double)a3 modifiersWidth:(double)a4 inputWidth:(double)a5
{
  v8 = (double *)objc_opt_new();
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return v8;
}

- (double)cellWidth
{
  return self->_cellWidth;
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