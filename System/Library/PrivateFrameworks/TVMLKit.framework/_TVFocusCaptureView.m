@interface _TVFocusCaptureView
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
@end

@implementation _TVFocusCaptureView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 0;
}

@end