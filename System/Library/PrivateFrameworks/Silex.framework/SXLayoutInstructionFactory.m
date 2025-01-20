@interface SXLayoutInstructionFactory
- (SXLayoutInstructionFactory)initWithPresentationAttributesProvider:(id)a3;
- (SXPresentationAttributesProvider)presentationAttributesProvider;
- (id)createInstructions;
@end

@implementation SXLayoutInstructionFactory

- (SXLayoutInstructionFactory)initWithPresentationAttributesProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLayoutInstructionFactory;
  v6 = [(SXLayoutInstructionFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presentationAttributesProvider, a3);
  }

  return v7;
}

- (id)createInstructions
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [(SXLayoutInstructionFactory *)self presentationAttributesProvider];
  v3 = [v2 presentationAttributes];
  uint64_t v4 = [v3 presentationMode];

  if (v4 == 1)
  {
    id v5 = objc_opt_new();
    v8[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  return v6;
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (void).cxx_destruct
{
}

@end