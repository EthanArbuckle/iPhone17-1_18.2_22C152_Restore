@interface _UIDocumentPickerRemoteViewControllerTintColorView
- (void)tintColorDidChange;
@end

@implementation _UIDocumentPickerRemoteViewControllerTintColorView

- (void)tintColorDidChange
{
  v3 = [(UIView *)self superview];
  -[UIView __viewDelegate](v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector())
  {
    v4 = [(UIView *)self tintColor];
    [v5 _tintColorDidChangeToColor:v4];
  }
}

@end