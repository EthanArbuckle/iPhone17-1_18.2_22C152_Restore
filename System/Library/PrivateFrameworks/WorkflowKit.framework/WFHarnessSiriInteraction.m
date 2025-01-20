@interface WFHarnessSiriInteraction
- (Class)siriActionRequestClass;
- (WFHarnessActionSelector)selector;
- (WFHarnessSiriInteraction)initWithSelector:(id)a3 siriActionRequestClass:(Class)a4 interaction:(id)a5;
- (id)interaction;
@end

@implementation WFHarnessSiriInteraction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interaction, 0);
  objc_storeStrong((id *)&self->_siriActionRequestClass, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

- (id)interaction
{
  return self->_interaction;
}

- (Class)siriActionRequestClass
{
  return self->_siriActionRequestClass;
}

- (WFHarnessActionSelector)selector
{
  return self->_selector;
}

- (WFHarnessSiriInteraction)initWithSelector:(id)a3 siriActionRequestClass:(Class)a4 interaction:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFHarnessSiriInteraction.m", 14, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)WFHarnessSiriInteraction;
  v12 = [(WFHarnessSiriInteraction *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selector, a3);
    objc_storeStrong((id *)&v13->_siriActionRequestClass, a4);
    uint64_t v14 = [v11 copy];
    id interaction = v13->_interaction;
    v13->_id interaction = (id)v14;

    v16 = v13;
  }

  return v13;
}

@end