@interface SBElasticValueViewControllerFactory
+ (id)factoryWithBrightnessDataSource:(id)a3;
+ (id)factoryWithVolumeDataSource:(id)a3;
- (id)_initWithViewControllerGenerator:(id)a3;
- (id)elasticValueViewController;
@end

@implementation SBElasticValueViewControllerFactory

+ (id)factoryWithBrightnessDataSource:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SBElasticValueViewControllerFactory_factoryWithBrightnessDataSource___block_invoke;
  v8[3] = &unk_1E6B0BD88;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1D948C7A0](v8);
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithViewControllerGenerator:v5];

  return v6;
}

SBElasticBrightnessViewController *__71__SBElasticValueViewControllerFactory_factoryWithBrightnessDataSource___block_invoke(uint64_t a1)
{
  v1 = [[SBElasticBrightnessViewController alloc] initWithDataSource:*(void *)(a1 + 32)];
  return v1;
}

+ (id)factoryWithVolumeDataSource:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SBElasticValueViewControllerFactory_factoryWithVolumeDataSource___block_invoke;
  v8[3] = &unk_1E6B0BD88;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1D948C7A0](v8);
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithViewControllerGenerator:v5];

  return v6;
}

SBElasticVolumeViewController *__67__SBElasticValueViewControllerFactory_factoryWithVolumeDataSource___block_invoke(uint64_t a1)
{
  v1 = [[SBElasticVolumeViewController alloc] initWithDataSource:*(void *)(a1 + 32)];
  return v1;
}

- (id)_initWithViewControllerGenerator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBElasticValueViewControllerFactory;
  v5 = [(SBElasticValueViewControllerFactory *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1D948C7A0](v4);
    id generator = v5->_generator;
    v5->_id generator = (id)v6;
  }
  return v5;
}

- (id)elasticValueViewController
{
  return (id)(*((uint64_t (**)(void))self->_generator + 2))();
}

- (void).cxx_destruct
{
}

@end