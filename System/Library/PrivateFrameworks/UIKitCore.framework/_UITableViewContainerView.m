@interface _UITableViewContainerView
- (_UITableViewContainerView)init;
@end

@implementation _UITableViewContainerView

- (_UITableViewContainerView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UITableViewContainerView;
  v2 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    [(UIView *)v2 setAutoresizesSubviews:0];
    [(UIView *)v3 setEdgesPreservingSuperviewLayoutMargins:15];
    -[UIView setLayoutMargins:](v3, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  }
  return v3;
}

@end