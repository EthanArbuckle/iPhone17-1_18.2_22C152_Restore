@interface TRAArbitrationInputsValidationStage
- (NSNumber)validatorOrder;
- (NSString)debugDescription;
- (TRAArbiter)arbiter;
- (TRAArbitrationInputsValidationStage)initWithValidators:(id)a3 arbiter:(id)a4;
- (id)_setupStateDump;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)validateInputs:(id)a3 withContext:(id)a4;
- (void)addInputsValidator:(id)a3;
- (void)addInputsValidator:(id)a3 update:(BOOL)a4;
- (void)dealloc;
- (void)removeInputsValidator:(id)a3;
- (void)removeInputsValidator:(id)a3 update:(BOOL)a4;
- (void)setArbiter:(id)a3;
@end

@implementation TRAArbitrationInputsValidationStage

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = self->_inputsValidators;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      v13 = v6;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "validateInputs:withContext:", v13, v7, (void)v15);
        id v6 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v6;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (TRAArbitrationInputsValidationStage)initWithValidators:(id)a3 arbiter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TRAArbitrationInputsValidationStage;
  v8 = [(TRAArbitrationInputsValidationStage *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_arbiter, v7);
    if (v6) {
      [MEMORY[0x263EFF980] arrayWithArray:v6];
    }
    else {
    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    }
    inputsValidators = v9->_inputsValidators;
    v9->_inputsValidators = (NSMutableArray *)v10;

    uint64_t v12 = [(TRAArbitrationInputsValidationStage *)v9 _setupStateDump];
    stateDumpHandle = v9->_stateDumpHandle;
    v9->_stateDumpHandle = (BSInvalidatable *)v12;
  }
  return v9;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateDumpHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TRAArbitrationInputsValidationStage;
  [(TRAArbitrationInputsValidationStage *)&v3 dealloc];
}

- (void)addInputsValidator:(id)a3
{
}

- (void)addInputsValidator:(id)a3 update:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v13 = v7;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRAArbitration.m", 89, @"Invalid parameter not satisfying: %@", @"inputsValidator" object file lineNumber description];

    id v7 = 0;
  }
  if ([(NSMutableArray *)self->_inputsValidators containsObject:v7])
  {
    WeakRetained = [MEMORY[0x263F08690] currentHandler];
    [WeakRetained handleFailureInMethod:a2, self, @"TRAArbitration.m", 99, @"inputsValidator[%@] already added to the stage[%@]", v13, self object file lineNumber description];
  }
  else
  {
    [(NSMutableArray *)self->_inputsValidators addObject:v13];
    uint64_t v9 = [(NSMutableArray *)self->_inputsValidators sortedArrayUsingComparator:&__block_literal_global];
    uint64_t v10 = (NSMutableArray *)[v9 mutableCopy];
    inputsValidators = self->_inputsValidators;
    self->_inputsValidators = v10;

    if (!v4) {
      goto LABEL_8;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _inputsValidationStageDidUpdateValidators:self];
  }

LABEL_8:
}

uint64_t __65__TRAArbitrationInputsValidationStage_addInputsValidator_update___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 validatorOrder];
  id v6 = [v4 validatorOrder];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)removeInputsValidator:(id)a3
{
}

- (void)removeInputsValidator:(id)a3 update:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v10 = v7;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRAArbitration.m", 108, @"Invalid parameter not satisfying: %@", @"inputsValidator" object file lineNumber description];

    id v7 = 0;
  }
  if ([(NSMutableArray *)self->_inputsValidators containsObject:v7])
  {
    [(NSMutableArray *)self->_inputsValidators removeObject:v10];
    if (!v4) {
      goto LABEL_8;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _inputsValidationStageDidUpdateValidators:self];
  }
  else
  {
    WeakRetained = [MEMORY[0x263F08690] currentHandler];
    [WeakRetained handleFailureInMethod:a2, self, @"TRAArbitration.m", 115, @"inputsValidator[%@] can't be removed since not found in stage[%@]", v10, self object file lineNumber description];
  }

LABEL_8:
}

- (NSString)debugDescription
{
  return (NSString *)[(TRAArbitrationInputsValidationStage *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationInputsValidationStage *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[NSMutableArray count](self->_inputsValidators, "count"));
  [v3 appendString:v4 withName:@"inputsValidators count"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(TRAArbitrationInputsValidationStage *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(TRAArbitrationInputsValidationStage *)self succinctDescriptionBuilder];
  [v4 appendArraySection:self->_inputsValidators withName:@"inputs validators" skipIfEmpty:0];
  return v4;
}

- (id)_setupStateDump
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  BOOL v4 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"TraitsArbiter - %p - Arbitration Pipeline - Inputs Validation Stage", WeakRetained);
  objc_copyWeak(&v9, &location);
  id v7 = BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v7;
}

__CFString *__54__TRAArbitrationInputsValidationStage__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained debugDescription];
  }
  else
  {
    id v3 = &stru_270BF7BE8;
  }

  return v3;
}

- (NSNumber)validatorOrder
{
  return self->validatorOrder;
}

- (TRAArbiter)arbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  return (TRAArbiter *)WeakRetained;
}

- (void)setArbiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->validatorOrder, 0);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_inputsValidators, 0);
}

@end