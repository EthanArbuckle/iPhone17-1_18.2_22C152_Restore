@interface UIContextMenuHeaderView
@end

@implementation UIContextMenuHeaderView

void __42___UIContextMenuHeaderView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 _titleFont];
  v3 = [v4 titleLabel];
  [v3 setFont:v2];

  [v4 _updateCompositingFilterForCurrentState];
}

void __42___UIContextMenuHeaderView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v2 = [v4 _titleLabelNumberOfLines];
  v3 = [v4 titleLabel];
  [v3 setNumberOfLines:v2];

  [v4 _updateLayoutMargins];
}

@end