@interface SXLayoutInstructions
+ (id)defaultInstructions;
- (BOOL)areFulfilledForBlueprint:(id)a3;
- (NSArray)instructions;
- (SXLayoutInstructions)initWithInstructions:(id)a3;
- (id)description;
- (void)didLayoutComponentBlueprint:(id)a3 blueprint:(id)a4;
@end

@implementation SXLayoutInstructions

+ (id)defaultInstructions
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [SXLayoutInstructions alloc];
  v3 = objc_alloc_init(SXDefaultLayoutInstruction);
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [(SXLayoutInstructions *)v2 initWithInstructions:v4];

  return v5;
}

- (SXLayoutInstructions)initWithInstructions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLayoutInstructions;
  v6 = [(SXLayoutInstructions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_instructions, a3);
  }

  return v7;
}

- (void)didLayoutComponentBlueprint:(id)a3 blueprint:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_instructions;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "didLayoutComponentBlueprint:blueprint:", v6, v7, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)areFulfilledForBlueprint:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_instructions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isFulfilledForBlueprint:", v4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)description
{
  v2 = [(SXLayoutInstructions *)self instructions];
  v3 = [v2 description];

  return v3;
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (void).cxx_destruct
{
}

@end