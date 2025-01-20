@interface _UIPreviewGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
@end

@implementation _UIPreviewGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 15 || a3 == 1;
}

@end