@interface PXFeedViewConfiguration
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXFeedConfiguration)feedConfiguration;
- (PXFeedViewConfiguration)init;
- (PXFeedViewConfiguration)initWithFeedConfiguration:(id)a3 extendedTraitCollection:(id)a4;
- (UIViewController)containerViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContainerViewController:(id)a3;
@end

@implementation PXFeedViewConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
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

- (PXFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PXFeedViewConfiguration *)self feedConfiguration];
  v6 = [(PXFeedViewConfiguration *)self extendedTraitCollection];
  v7 = (void *)[v4 initWithFeedConfiguration:v5 extendedTraitCollection:v6];

  v8 = [(PXFeedViewConfiguration *)self containerViewController];
  [v7 setContainerViewController:v8];

  return v7;
}

- (PXFeedViewConfiguration)initWithFeedConfiguration:(id)a3 extendedTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedViewConfiguration;
  v8 = [(PXFeedViewConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    feedConfiguration = v8->_feedConfiguration;
    v8->_feedConfiguration = (PXFeedConfiguration *)v9;

    objc_storeStrong((id *)&v8->_extendedTraitCollection, a4);
  }

  return v8;
}

- (PXFeedViewConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedViewConfiguration.m", 18, @"%s is not available as initializer", "-[PXFeedViewConfiguration init]");

  abort();
}

@end