@interface STUIStatusBarFallbackItem
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (STUIStatusBarStringView)label;
- (void)_create_label;
- (void)setLabel:(id)a3;
@end

@implementation STUIStatusBarFallbackItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

- (STUIStatusBarStringView)label
{
  label = self->_label;
  if (!label)
  {
    [(STUIStatusBarFallbackItem *)self _create_label];
    label = self->_label;
  }
  return label;
}

- (void)_create_label
{
  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = self->_label;
  self->_label = v4;

  v6 = self->_label;
  [(STUIStatusBarStringView *)v6 setText:@"😳 rdar:45025538"];
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end