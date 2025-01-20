@interface WFAlert(UIKitAdditions)
- (double)contentViewPadding;
- (id)contentView;
- (id)keyCommands;
- (id)presentationSource;
- (void)addKeyCommand:()UIKitAdditions;
- (void)setContentView:()UIKitAdditions;
- (void)setContentViewPadding:()UIKitAdditions;
- (void)setPresentationSource:()UIKitAdditions;
@end

@implementation WFAlert(UIKitAdditions)

- (void)addKeyCommand:()UIKitAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 keyCommands];
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x263EFFA68];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  id value = [v8 arrayByAddingObject:v4];

  objc_setAssociatedObject(a1, sel_keyCommands, value, (void *)1);
}

- (id)keyCommands
{
  return objc_getAssociatedObject(a1, sel_keyCommands);
}

- (double)contentViewPadding
{
  v1 = objc_getAssociatedObject(a1, sel_contentViewPadding);
  [v1 UIEdgeInsetsValue];
  double v3 = v2;

  return v3;
}

- (void)setContentViewPadding:()UIKitAdditions
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_contentViewPadding, v2, (void *)1);
}

- (id)contentView
{
  return objc_getAssociatedObject(a1, sel_contentView);
}

- (void)setContentView:()UIKitAdditions
{
}

- (id)presentationSource
{
  return objc_getAssociatedObject(a1, sel_presentationSource);
}

- (void)setPresentationSource:()UIKitAdditions
{
}

@end