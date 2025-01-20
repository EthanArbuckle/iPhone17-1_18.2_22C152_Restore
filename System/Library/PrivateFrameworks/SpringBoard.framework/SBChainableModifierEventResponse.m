@interface SBChainableModifierEventResponse
+ (id)newEventResponse;
+ (id)responseByAppendingResponse:(id)a3 toResponse:(id)a4;
- (BOOL)isConsumed;
- (BOOL)isValid;
- (NSString)description;
- (SBChainableModifierEventResponse)init;
- (double)delay;
- (id)_initWithChildResponses:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)responseByTransformingResponseWithTransformer:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)setConsumed:(uint64_t)result;
- (void)addChildResponse:(id)a3;
- (void)addChildResponses:(id)a3;
- (void)consumeWithReason:(id)a3;
- (void)enumerateChildResponsesUsingBlock:(id)a3;
- (void)enumerateResponseTreeUsingBlock:(id)a3;
- (void)enumerateResponseTreeUsingBlock:(id)a3 stop:(BOOL *)a4;
- (void)insertChildResponse:(id)a3 atIndex:(unint64_t)a4;
- (void)setDelay:(double)a3 withValidator:(id)a4;
@end

@implementation SBChainableModifierEventResponse

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validator, 0);
  objc_storeStrong((id *)&self->_childResponses, 0);
}

- (NSString)description
{
  return (NSString *)[(SBChainableModifierEventResponse *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBChainableModifierEventResponse *)self succinctDescriptionBuilder];
  id v6 = (id)[v5 appendBool:self->_consumed withName:@"consumed" ifEqualTo:1];
  if ((BSFloatIsZero() & 1) == 0) {
    id v7 = (id)[v5 appendFloat:@"delay" withName:self->_delay];
  }
  if ([(NSMutableArray *)self->_childResponses count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__SBChainableModifierEventResponse_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E6AF4E00;
    id v10 = v4;
    v11 = self;
    id v12 = v5;
    [v12 appendBodySectionWithName:0 multilinePrefix:v10 block:v9];
  }
  return v5;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

void __74__SBChainableModifierEventResponse_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = [v2 stringByAppendingString:@"\t"];
  }
  else
  {
    v3 = @"\t";
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1[5] + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)a1[6];
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "descriptionWithMultilinePrefix:", v3, (void)v12);
        id v11 = (id)[v9 appendObject:v10 withName:&stru_1F3084718];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBChainableModifierEventResponse *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)enumerateChildResponsesUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_childResponses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v14) {
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i), &v14);
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)isValid
{
  if (self->_consumed) {
    return 0;
  }
  validator = (uint64_t (**)(void))self->_validator;
  if (validator) {
    return validator[2]();
  }
  else {
    return 1;
  }
}

- (id)responseByTransformingResponseWithTransformer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, SBChainableModifierEventResponse *))a3;
  uint64_t v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_childResponses, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_childResponses;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "responseByTransformingResponseWithTransformer:", v4, (void)v15);
        if (v11) {
          [(NSMutableArray *)v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  childResponses = self->_childResponses;
  self->_childResponses = v5;

  long long v13 = v4[2](v4, self);

  return v13;
}

+ (id)responseByAppendingResponse:(id)a3 toResponse:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v8 = (void *)v7;
  if (!(v6 | v7))
  {
    long long v10 = 0;
    goto LABEL_11;
  }
  if (!v6 && v7)
  {
    id v9 = (id)v7;
LABEL_9:
    long long v10 = v9;
    goto LABEL_11;
  }
  if (v6 && !v7)
  {
    id v9 = (id)v6;
    goto LABEL_9;
  }
  long long v10 = (void *)[a1 newEventResponse];
  [v10 addChildResponse:v8];
  [v10 addChildResponse:v6];
LABEL_11:

  return v10;
}

- (void)addChildResponse:(id)a3
{
}

- (id)_initWithChildResponses:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBChainableModifierEventResponse;
  uint64_t v5 = [(SBChainableModifierEventResponse *)&v10 init];
  unint64_t v6 = v5;
  if (v5)
  {
    v5->_delay = 0.0;
    v5->_consumed = 0;
    if (v4) {
      unint64_t v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    }
    else {
      unint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    childResponses = v6->_childResponses;
    v6->_childResponses = v7;
  }
  return v6;
}

- (SBChainableModifierEventResponse)init
{
  return (SBChainableModifierEventResponse *)[(SBChainableModifierEventResponse *)self _initWithChildResponses:0];
}

- (void)setDelay:(double)a3 withValidator:(id)a4
{
  self->_delay = a3;
  uint64_t v5 = (void *)MEMORY[0x1D948C7A0](a4, a2);
  id validator = self->_validator;
  self->_id validator = v5;
}

- (void)insertChildResponse:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)addChildResponses:(id)a3
{
}

- (void)consumeWithReason:(id)a3
{
  id v5 = a3;
  if (self->_consumed)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBChainableModifierEventResponse.m" lineNumber:103 description:@"Can't consume an response that has already been consumed."];
  }
  self->_consumed = 1;
  id validator = self->_validator;
  self->_id validator = 0;

  unint64_t v7 = [(SBChainableModifierEventResponse *)self loggingCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(SBChainableModifierEventResponse *)self consumeWithReason:v7];
  }
}

- (void)enumerateResponseTreeUsingBlock:(id)a3
{
  char v3 = 0;
  [(SBChainableModifierEventResponse *)self enumerateResponseTreeUsingBlock:a3 stop:&v3];
}

- (void)enumerateResponseTreeUsingBlock:(id)a3 stop:(BOOL *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (void (**)(id, SBChainableModifierEventResponse *, BOOL *))a3;
  v6[2](v6, self, a4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v7 = self->_childResponses;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!*a4) {
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "enumerateResponseTreeUsingBlock:stop:", v6, a4, (void)v12);
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBChainableModifierEventResponse);
}

- (id)succinctDescription
{
  v2 = [(SBChainableModifierEventResponse *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (BOOL)isConsumed
{
  if (result) {
    return *(unsigned char *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)setConsumed:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 16) = a2;
  }
  return result;
}

- (void)consumeWithReason:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 description];
  int v6 = 138412546;
  unint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Consuming response: %@ for reason: %@", (uint8_t *)&v6, 0x16u);
}

@end