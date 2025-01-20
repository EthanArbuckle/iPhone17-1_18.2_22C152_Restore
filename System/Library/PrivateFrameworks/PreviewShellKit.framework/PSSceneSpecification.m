@interface PSSceneSpecification
+ (PSSceneSpecification)mainSceneSpecification;
+ (PSSceneSpecification)previewSceneSpecification;
- (PSSceneSpecification)initWithSpecification:(id)a3;
- (UVAgentSceneSpecification)specification;
@end

@implementation PSSceneSpecification

- (PSSceneSpecification)initWithSpecification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSSceneSpecification;
  v6 = [(PSSceneSpecification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specification, a3);
  }

  return v7;
}

+ (PSSceneSpecification)previewSceneSpecification
{
  id v3 = objc_alloc_init(MEMORY[0x263F60F48]);
  v4 = (void *)[objc_alloc((Class)a1) initWithSpecification:v3];

  return (PSSceneSpecification *)v4;
}

+ (PSSceneSpecification)mainSceneSpecification
{
  id v3 = objc_alloc_init(MEMORY[0x263F60F40]);
  v4 = (void *)[objc_alloc((Class)a1) initWithSpecification:v3];

  return (PSSceneSpecification *)v4;
}

- (UVAgentSceneSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
}

@end