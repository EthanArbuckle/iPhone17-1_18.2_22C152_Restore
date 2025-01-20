@interface SNAAssertion
- (NSArray)sessionIdentifiers;
- (NSString)explanation;
- (SNAAssertion)init;
- (SNAAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidateOnSessionRequest:(BOOL)a5 invalidationHandler:(id)a6;
- (SNAAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidationHandler:(id)a5;
- (SNAAssertionTarget)target;
- (unint64_t)invalidationReason;
- (unint64_t)state;
- (void)invalidate;
@end

@implementation SNAAssertion

- (SNAAssertion)init
{
  return 0;
}

- (SNAAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidationHandler:(id)a5
{
  return [(SNAAssertion *)self initWithExplanation:a3 target:a4 invalidateOnSessionRequest:0 invalidationHandler:a5];
}

- (SNAAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidateOnSessionRequest:(BOOL)a5 invalidationHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SNAAssertion;
  v13 = [(SNAAssertion *)&v22 init];
  if (v13)
  {
    v14 = [_TtC16SessionAssertion23SessionRequestAssertion alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__SNAAssertion_initWithExplanation_target_invalidateOnSessionRequest_invalidationHandler___block_invoke;
    v19[3] = &unk_1E61CEA68;
    id v21 = v12;
    v15 = v13;
    v20 = v15;
    uint64_t v16 = [(SessionRequestAssertion *)v14 initWithExplanation:v10 target:v11 invalidateOnSessionRequest:v7 invalidationHandler:v19];
    sessionAssertion = v15->_sessionAssertion;
    v15->_sessionAssertion = (_TtC16SessionAssertion23SessionRequestAssertion *)v16;
  }
  return v13;
}

uint64_t __90__SNAAssertion_initWithExplanation_target_invalidateOnSessionRequest_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (unint64_t)invalidationReason
{
  return [(SessionRequestAssertion *)self->_sessionAssertion snaInvalidationReason];
}

- (unint64_t)state
{
  return [(SessionRequestAssertion *)self->_sessionAssertion snaState];
}

- (SNAAssertionTarget)target
{
  return [(SessionRequestAssertion *)self->_sessionAssertion snaTarget];
}

- (NSString)explanation
{
  return [(SessionRequestAssertion *)self->_sessionAssertion explanation];
}

- (NSArray)sessionIdentifiers
{
  return [(SessionRequestAssertion *)self->_sessionAssertion sessionIdentifiers];
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_sessionAssertion, 0);
}

@end