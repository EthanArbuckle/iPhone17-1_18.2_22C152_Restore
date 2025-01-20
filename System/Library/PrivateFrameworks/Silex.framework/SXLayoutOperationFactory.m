@interface SXLayoutOperationFactory
- (SXComponentSizerEngine)componentSizerEngine;
- (SXLayoutBlueprintFactory)layoutBlueprintFactory;
- (SXLayoutContextFactory)layoutContextFactory;
- (SXLayoutOperationFactory)initWithComponentSizerEngine:(id)a3 layoutBlueprintFactory:(id)a4 layouterFactory:(id)a5 layoutContextFactory:(id)a6 unitConverterFactory:(id)a7;
- (SXLayouterFactory)layouterFactory;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)layoutOperationWithTask:(id)a3 DOMObjectProvider:(id)a4;
@end

@implementation SXLayoutOperationFactory

- (SXLayoutOperationFactory)initWithComponentSizerEngine:(id)a3 layoutBlueprintFactory:(id)a4 layouterFactory:(id)a5 layoutContextFactory:(id)a6 unitConverterFactory:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXLayoutOperationFactory;
  v17 = [(SXLayoutOperationFactory *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_componentSizerEngine, a3);
    objc_storeStrong((id *)&v18->_layoutBlueprintFactory, a4);
    objc_storeStrong((id *)&v18->_layouterFactory, a5);
    objc_storeStrong((id *)&v18->_layoutContextFactory, a6);
    objc_storeStrong((id *)&v18->_unitConverterFactory, a7);
  }

  return v18;
}

- (id)layoutOperationWithTask:(id)a3 DOMObjectProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SXColumnLayouter alloc];
  v9 = [(SXLayoutOperationFactory *)self layouterFactory];
  v10 = [(SXLayoutOperationFactory *)self layoutContextFactory];
  v11 = [(SXLayoutOperationFactory *)self unitConverterFactory];
  v12 = [(SXColumnLayouter *)v8 initWithLayouterFactory:v9 layoutContextFactory:v10 unitConverterFactory:v11];

  id v13 = [SXLayoutOperation alloc];
  id v14 = [(SXLayoutOperationFactory *)self componentSizerEngine];
  id v15 = [(SXLayoutOperationFactory *)self layoutBlueprintFactory];
  id v16 = [(SXLayoutOperation *)v13 initWithTask:v7 layouter:v12 DOMObjectProvider:v6 componentSizerEngine:v14 layoutBlueprintFactory:v15];

  return v16;
}

- (SXComponentSizerEngine)componentSizerEngine
{
  return self->_componentSizerEngine;
}

- (SXLayoutBlueprintFactory)layoutBlueprintFactory
{
  return self->_layoutBlueprintFactory;
}

- (SXLayouterFactory)layouterFactory
{
  return self->_layouterFactory;
}

- (SXLayoutContextFactory)layoutContextFactory
{
  return self->_layoutContextFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_layoutContextFactory, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_storeStrong((id *)&self->_layoutBlueprintFactory, 0);
  objc_storeStrong((id *)&self->_componentSizerEngine, 0);
}

@end