@interface SNAProminentPresentationAssertion
- (NSString)explanation;
- (NSString)sessionIdentifier;
- (SNAProminentPresentationAssertion)init;
- (SNAProminentPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 duration:(double)a5 invalidationHandler:(id)a6;
- (SNAProminentPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 invalidationHandler:(id)a5;
- (unint64_t)invalidationReason;
- (unint64_t)state;
- (void)invalidate;
@end

@implementation SNAProminentPresentationAssertion

- (SNAProminentPresentationAssertion)init
{
  return 0;
}

- (SNAProminentPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 invalidationHandler:(id)a5
{
  return [(SNAProminentPresentationAssertion *)self initWithExplanation:a3 sessionIdentifier:a4 duration:a5 invalidationHandler:0.0];
}

- (SNAProminentPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 duration:(double)a5 invalidationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SNAProminentPresentationAssertion;
  v13 = [(SNAProminentPresentationAssertion *)&v22 init];
  if (v13)
  {
    v14 = [_TtC16SessionAssertion30ProminentPresentationAssertion alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __104__SNAProminentPresentationAssertion_initWithExplanation_sessionIdentifier_duration_invalidationHandler___block_invoke;
    v19[3] = &unk_1E61CEA18;
    id v21 = v12;
    v15 = v13;
    v20 = v15;
    uint64_t v16 = [(ProminentPresentationAssertion *)v14 initWithExplanation:v10 activityIdentifier:v11 duration:v19 invalidationHandler:a5];
    assertion = v15->_assertion;
    v15->_assertion = (_TtC16SessionAssertion30ProminentPresentationAssertion *)v16;
  }
  return v13;
}

uint64_t __104__SNAProminentPresentationAssertion_initWithExplanation_sessionIdentifier_duration_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (unint64_t)invalidationReason
{
  return [(ProminentPresentationAssertion *)self->_assertion snaInvalidationReason];
}

- (unint64_t)state
{
  return [(ProminentPresentationAssertion *)self->_assertion snaState];
}

- (NSString)sessionIdentifier
{
  return [(ProminentPresentationAssertion *)self->_assertion activityIdentifier];
}

- (NSString)explanation
{
  return [(ProminentPresentationAssertion *)self->_assertion explanation];
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