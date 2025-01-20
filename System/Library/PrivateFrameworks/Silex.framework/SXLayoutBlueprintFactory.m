@interface SXLayoutBlueprintFactory
- (SXComponentBlueprintFactory)componentBlueprintFactory;
- (SXLayoutBlueprintFactory)initWithComponentBlueprintFactory:(id)a3 unitConverterFactory:(id)a4;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)createLayoutBlueprintWithLayoutOptions:(id)a3;
@end

@implementation SXLayoutBlueprintFactory

- (SXLayoutBlueprintFactory)initWithComponentBlueprintFactory:(id)a3 unitConverterFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLayoutBlueprintFactory;
  v9 = [(SXLayoutBlueprintFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentBlueprintFactory, a3);
    objc_storeStrong((id *)&v10->_unitConverterFactory, a4);
  }

  return v10;
}

- (id)createLayoutBlueprintWithLayoutOptions:(id)a3
{
  id v4 = a3;
  v5 = [[SXLayoutBlueprint alloc] initWithLayoutOptions:v4 componentBlueprintFactory:self->_componentBlueprintFactory unitConverterFactory:self->_unitConverterFactory];

  return v5;
}

- (SXComponentBlueprintFactory)componentBlueprintFactory
{
  return self->_componentBlueprintFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_componentBlueprintFactory, 0);
}

@end