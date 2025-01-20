@interface _UIStatusBarFallbackItem
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (_UIStatusBarStringView)label;
- (void)_create_label;
- (void)setLabel:(id)a3;
@end

@implementation _UIStatusBarFallbackItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

- (_UIStatusBarStringView)label
{
  label = self->_label;
  if (!label)
  {
    [(_UIStatusBarFallbackItem *)self _create_label];
    label = self->_label;
  }
  return label;
}

- (void)_create_label
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = self->_label;
  self->_label = v4;

  v6 = self->_label;
  [(_UIStatusBarStringView *)v6 setText:@"😳 rdar:45025538"];
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end