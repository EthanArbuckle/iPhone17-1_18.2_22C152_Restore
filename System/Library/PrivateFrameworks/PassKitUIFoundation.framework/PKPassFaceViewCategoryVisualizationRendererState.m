@interface PKPassFaceViewCategoryVisualizationRendererState
- (char)initWithCurrentRendererState:(void *)a1;
- (void)dealloc;
@end

@implementation PKPassFaceViewCategoryVisualizationRendererState

- (char)initWithCurrentRendererState:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)PKPassFaceViewCategoryVisualizationRendererState;
  v3 = (char *)objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    memcpy(v5, a2, sizeof(v5));
    PKCategoryVisualizationRendererStateCopy((uint64_t)v5, (uint64_t)v6);
    memcpy(v3 + 16, v6, 0x27D0uLL);
  }
  return v3;
}

- (void)dealloc
{
  PKCategoryVisualizationRendererStateDestroy((uint64_t)&self->_state);
  v3.receiver = self;
  v3.super_class = (Class)PKPassFaceViewCategoryVisualizationRendererState;
  [(PKPassFaceViewCategoryVisualizationRendererState *)&v3 dealloc];
}

@end