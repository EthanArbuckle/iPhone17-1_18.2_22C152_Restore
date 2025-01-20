@interface PXStoryViewLayoutSpecManager
- (Class)specClass;
- (PXStoryViewChromeTitleConfiguration)customGeneralChromeTitleConfiguration;
- (PXStoryViewLayoutSpec)viewLayoutSpec;
- (id)createSpec;
- (unint64_t)storyConfigurationOptions;
- (void)setCustomGeneralChromeTitleConfiguration:(id)a3;
- (void)setStoryConfigurationOptions:(unint64_t)a3;
@end

@implementation PXStoryViewLayoutSpecManager

- (void).cxx_destruct
{
}

- (PXStoryViewChromeTitleConfiguration)customGeneralChromeTitleConfiguration
{
  return self->_customGeneralChromeTitleConfiguration;
}

- (unint64_t)storyConfigurationOptions
{
  return self->_storyConfigurationOptions;
}

- (id)createSpec
{
  v3 = [PXStoryConcreteViewLayoutSpec alloc];
  v4 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  unint64_t v5 = [(PXFeatureSpecManager *)self options];
  unint64_t v6 = [(PXStoryViewLayoutSpecManager *)self storyConfigurationOptions];
  v7 = [(PXStoryViewLayoutSpecManager *)self customGeneralChromeTitleConfiguration];
  v8 = [(PXStoryConcreteViewLayoutSpec *)v3 initWithExtendedTraitCollection:v4 options:v5 storyConfigurationOptions:v6 customGeneralChromeTitleConfiguration:v7];

  return v8;
}

- (void)setCustomGeneralChromeTitleConfiguration:(id)a3
{
  v8 = (PXStoryViewChromeTitleConfiguration *)a3;
  v4 = self->_customGeneralChromeTitleConfiguration;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXStoryViewChromeTitleConfiguration *)v8 isEqual:v4];

    if (!v5)
    {
      unint64_t v6 = (PXStoryViewChromeTitleConfiguration *)[(PXStoryViewChromeTitleConfiguration *)v8 copy];
      customGeneralChromeTitleConfiguration = self->_customGeneralChromeTitleConfiguration;
      self->_customGeneralChromeTitleConfiguration = v6;

      [(PXFeatureSpecManager *)self invalidateSpec];
    }
  }
}

- (void)setStoryConfigurationOptions:(unint64_t)a3
{
  if (self->_storyConfigurationOptions != a3)
  {
    self->_storyConfigurationOptions = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  v4 = [(PXFeatureSpecManager *)self spec];
  if (!v4)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXStoryViewLayoutSpecManager.m", 25, @"Invalid parameter not satisfying: %@", @"viewLayoutSpec != nil" object file lineNumber description];
  }
  return (PXStoryViewLayoutSpec *)v4;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

@end