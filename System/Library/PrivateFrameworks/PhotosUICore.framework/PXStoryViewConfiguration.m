@interface PXStoryViewConfiguration
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXStoryConfiguration)configuration;
- (PXStoryViewConfiguration)init;
- (PXStoryViewConfiguration)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4;
- (UIViewController)containerViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContainerViewController:(id)a3;
@end

@implementation PXStoryViewConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setContainerViewController:(id)a3
{
}

- (UIViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (UIViewController *)WeakRetained;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PXStoryViewConfiguration *)self configuration];
  v6 = (void *)[v5 copy];
  v7 = [(PXStoryViewConfiguration *)self extendedTraitCollection];
  v8 = (void *)[v4 initWithConfiguration:v6 extendedTraitCollection:v7];

  v9 = [(PXStoryViewConfiguration *)self containerViewController];
  [v8 setContainerViewController:v9];

  return v8;
}

- (PXStoryViewConfiguration)initWithConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryViewConfiguration;
  v9 = [(PXStoryViewConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_extendedTraitCollection, a4);
  }

  return v10;
}

- (PXStoryViewConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewConfiguration.m", 16, @"%s is not available as initializer", "-[PXStoryViewConfiguration init]");

  abort();
}

@end