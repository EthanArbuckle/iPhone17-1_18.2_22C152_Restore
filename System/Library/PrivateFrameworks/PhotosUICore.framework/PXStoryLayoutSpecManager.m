@interface PXStoryLayoutSpecManager
- (Class)specClass;
- (PXStoryLayoutSpec)layoutSpec;
- (PXStoryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXStoryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5;
- (id)createSpec;
- (unint64_t)storyConfigurationOptions;
@end

@implementation PXStoryLayoutSpecManager

- (unint64_t)storyConfigurationOptions
{
  return self->_storyConfigurationOptions;
}

- (id)createSpec
{
  v3 = [PXStoryConcreteLayoutSpec alloc];
  v4 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v5 = [(PXStoryConcreteLayoutSpec *)v3 initWithExtendedTraitCollection:v4 options:[(PXFeatureSpecManager *)self options] storyConfigurationOptions:[(PXStoryLayoutSpecManager *)self storyConfigurationOptions]];

  return v5;
}

- (PXStoryLayoutSpec)layoutSpec
{
  v4 = [(PXFeatureSpecManager *)self spec];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXStoryLayoutSpecManager.m", 39, @"Invalid parameter not satisfying: %@", @"layoutSpec != nil" object file lineNumber description];
  }
  return (PXStoryLayoutSpec *)v4;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXStoryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXStoryLayoutSpecManager *)self initWithExtendedTraitCollection:a3 options:a4 storyConfigurationOptions:0];
}

- (PXStoryLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryLayoutSpecManager;
  result = [(PXFeatureSpecManager *)&v7 initWithExtendedTraitCollection:a3 options:a4];
  if (result) {
    result->_storyConfigurationOptions = a5;
  }
  return result;
}

@end