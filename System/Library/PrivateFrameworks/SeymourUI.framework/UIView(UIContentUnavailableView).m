@interface UIView(UIContentUnavailableView)
+ (_SMUContentUnavailableView)smu_contentUnavailableView;
@end

@implementation UIView(UIContentUnavailableView)

+ (_SMUContentUnavailableView)smu_contentUnavailableView
{
  v0 = [MEMORY[0x263F82600] emptyConfiguration];
  v1 = [(UIContentUnavailableView *)[_SMUContentUnavailableView alloc] initWithConfiguration:v0];

  return v1;
}

@end