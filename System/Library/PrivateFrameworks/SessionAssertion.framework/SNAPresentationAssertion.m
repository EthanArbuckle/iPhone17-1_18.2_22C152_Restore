@interface SNAPresentationAssertion
- (NSString)explanation;
- (NSString)sessionIdentifier;
- (SNAPresentationAssertion)init;
- (SNAPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 presentationState:(unint64_t)a5 invalidationHandler:(id)a6;
- (unint64_t)invalidationReason;
- (unint64_t)state;
- (void)invalidate;
@end

@implementation SNAPresentationAssertion

- (SNAPresentationAssertion)init
{
  return 0;
}

- (SNAPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 presentationState:(unint64_t)a5 invalidationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SNAPresentationAssertion;
  v13 = [(SNAPresentationAssertion *)&v22 init];
  if (v13)
  {
    v14 = [_TtC16SessionAssertion21PresentationAssertion alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __104__SNAPresentationAssertion_initWithExplanation_sessionIdentifier_presentationState_invalidationHandler___block_invoke;
    v19[3] = &unk_1E61CEA40;
    id v21 = v12;
    v15 = v13;
    v20 = v15;
    uint64_t v16 = [(PresentationAssertion *)v14 initWithExplanation:v10 activityIdentifier:v11 presentationState:a5 invalidationHandler:v19];
    assertion = v15->_assertion;
    v15->_assertion = (_TtC16SessionAssertion21PresentationAssertion *)v16;
  }
  return v13;
}

uint64_t __104__SNAPresentationAssertion_initWithExplanation_sessionIdentifier_presentationState_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (unint64_t)invalidationReason
{
  return [(PresentationAssertion *)self->_assertion snaInvalidationReason];
}

- (unint64_t)state
{
  return [(PresentationAssertion *)self->_assertion snaState];
}

- (NSString)sessionIdentifier
{
  return [(PresentationAssertion *)self->_assertion activityIdentifier];
}

- (NSString)explanation
{
  return [(PresentationAssertion *)self->_assertion explanation];
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

@end