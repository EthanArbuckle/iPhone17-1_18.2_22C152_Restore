@interface PXBasicGadgetDataSourceManager
- (NSArray)providers;
- (PXBasicGadgetDataSourceManager)initWithProviders:(id)a3;
- (void)setProviders:(id)a3;
@end

@implementation PXBasicGadgetDataSourceManager

- (void).cxx_destruct
{
}

- (void)setProviders:(id)a3
{
}

- (NSArray)providers
{
  return self->_providers;
}

- (PXBasicGadgetDataSourceManager)initWithProviders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBasicGadgetDataSourceManager;
  v6 = [(PXGadgetDataSourceManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_providers, a3);
  }

  return v7;
}

@end