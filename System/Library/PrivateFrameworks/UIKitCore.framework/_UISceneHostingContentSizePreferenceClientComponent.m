@interface _UISceneHostingContentSizePreferenceClientComponent
- (CGSize)_preferredContentSize;
- (void)_setPreferredContentSize:(CGSize)a3;
@end

@implementation _UISceneHostingContentSizePreferenceClientComponent

- (void)_setPreferredContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_preferredContentSize = &self->_preferredContentSize;
  if (a3.width != self->_preferredContentSize.width || a3.height != self->_preferredContentSize.height)
  {
    v7 = [(FBSSceneComponent *)self clientScene];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80___UISceneHostingContentSizePreferenceClientComponent__setPreferredContentSize___block_invoke;
    v8[3] = &__block_descriptor_48_e118___FBSSceneTransitionContext_16__0__FBSMutableSceneClientSettings__UISceneHostingContentSizePreferenceClientSettings__8l;
    *(CGFloat *)&v8[4] = width;
    *(CGFloat *)&v8[5] = height;
    [v7 updateClientSettingsWithTransitionBlock:v8];

    p_preferredContentSize->CGFloat width = width;
    p_preferredContentSize->CGFloat height = height;
  }
}

- (CGSize)_preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end