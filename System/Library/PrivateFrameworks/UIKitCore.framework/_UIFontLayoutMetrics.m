@interface _UIFontLayoutMetrics
- (double)readableWidthForFont:(id)a3;
@end

@implementation _UIFontLayoutMetrics

- (double)readableWidthForFont:(id)a3
{
  if (a3) {
    [a3 readableWidth];
  }
  else {
    [off_1E52D39B8 _readableWidth];
  }
  return result;
}

@end