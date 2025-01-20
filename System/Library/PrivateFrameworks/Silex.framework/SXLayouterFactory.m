@interface SXLayouterFactory
- (SXColumnCalculator)columnCalculator;
- (SXLayoutContextFactory)layoutContextFactory;
- (SXLayouterFactory)initWithColumnCalculator:(id)a3 layoutContextFactory:(id)a4 unitConverterFactory:(id)a5;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)createColumnLayouterWithDelegate:(id)a3;
- (id)layouterForContainerComponentBlueprint:(id)a3 delegate:(id)a4;
@end

@implementation SXLayouterFactory

- (SXLayouterFactory)initWithColumnCalculator:(id)a3 layoutContextFactory:(id)a4 unitConverterFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXLayouterFactory;
  v12 = [(SXLayouterFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_columnCalculator, a3);
    objc_storeStrong((id *)&v13->_layoutContextFactory, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
  }

  return v13;
}

- (id)createColumnLayouterWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [SXColumnLayouter alloc];
  v6 = [(SXLayouterFactory *)self layoutContextFactory];
  v7 = [(SXLayouterFactory *)self unitConverterFactory];
  v8 = [(SXColumnLayouter *)v5 initWithLayouterFactory:self layoutContextFactory:v6 unitConverterFactory:v7];

  [(SXColumnLayouter *)v8 setDelegate:v4];
  return v8;
}

- (id)layouterForContainerComponentBlueprint:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 component];
  id v9 = [v8 contentDisplay];
  int v10 = [v9 conformsToProtocol:&unk_26D5E0CA0];

  if (v10)
  {
    id v11 = [SXCollectionLayouter alloc];
    v12 = [(SXLayouterFactory *)self columnCalculator];
    v13 = [(SXLayouterFactory *)self unitConverterFactory];
    v14 = [(SXCollectionLayouter *)v11 initWithContainerComponent:v6 layouterFactory:self columnCalculator:v12 unitConverterFactory:v13];
LABEL_5:

    goto LABEL_7;
  }
  objc_super v15 = [v6 component];
  v16 = [v15 contentDisplay];
  int v17 = [v16 conformsToProtocol:&unk_26D618EF8];

  if (v17)
  {
    v18 = [SXHorizontalStackLayouter alloc];
    v12 = [(SXLayouterFactory *)self columnCalculator];
    v13 = [(SXLayouterFactory *)self layoutContextFactory];
    v19 = [(SXLayouterFactory *)self unitConverterFactory];
    v14 = (SXCollectionLayouter *)-[SXHorizontalStackLayouter initWithContainerComponent:layouterFactory:columnCalculator:layoutContextFactory:unitConverterFactory:]((id *)&v18->super.isa, v6, self, v12, v13, v19);

    goto LABEL_5;
  }
  v14 = [(SXLayouterFactory *)self createColumnLayouterWithDelegate:v7];
LABEL_7:
  [(SXCollectionLayouter *)v14 setDelegate:v7];

  return v14;
}

- (SXColumnCalculator)columnCalculator
{
  return self->_columnCalculator;
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
  objc_storeStrong((id *)&self->_columnCalculator, 0);
}

@end