@interface WFHarnessTestCase
- (NSMutableSet)handledConditions;
- (NSMutableSet)handledInteractions;
- (NSMutableSet)handledSiriInteractions;
- (NSSet)conditions;
- (NSSet)interactions;
- (NSSet)siriInteractions;
- (NSString)automationType;
- (NSString)identifier;
- (NSString)name;
- (WFContentCollection)input;
- (WFHarnessTestCase)initWithIdentifier:(id)a3 name:(id)a4 workflowRunDescriptor:(id)a5 input:(id)a6 automationType:(id)a7 interactions:(id)a8 siriInteractions:(id)a9 conditions:(id)a10 resultExpectation:(id)a11;
- (WFHarnessTestResultExpectation)resultExpectation;
- (WFWorkflowRunDescriptor)runDescriptor;
- (id)description;
@end

@implementation WFHarnessTestCase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handledConditions, 0);
  objc_storeStrong((id *)&self->_handledSiriInteractions, 0);
  objc_storeStrong((id *)&self->_handledInteractions, 0);
  objc_storeStrong((id *)&self->_resultExpectation, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_siriInteractions, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_runDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSMutableSet)handledConditions
{
  return self->_handledConditions;
}

- (NSMutableSet)handledSiriInteractions
{
  return self->_handledSiriInteractions;
}

- (NSMutableSet)handledInteractions
{
  return self->_handledInteractions;
}

- (WFHarnessTestResultExpectation)resultExpectation
{
  return self->_resultExpectation;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (NSSet)siriInteractions
{
  return self->_siriInteractions;
}

- (NSSet)interactions
{
  return self->_interactions;
}

- (NSString)automationType
{
  return self->_automationType;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (WFWorkflowRunDescriptor)runDescriptor
{
  return self->_runDescriptor;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: name: %@, identifier: %@, runDescriptor: %@"], v5, self, self->_name, self->_identifier, self->_runDescriptor);

  return v6;
}

- (WFHarnessTestCase)initWithIdentifier:(id)a3 name:(id)a4 workflowRunDescriptor:(id)a5 input:(id)a6 automationType:(id)a7 interactions:(id)a8 siriInteractions:(id)a9 conditions:(id)a10 resultExpectation:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v50 = a5;
  id obj = a6;
  id v49 = a6;
  id v19 = a7;
  id v47 = a8;
  id v20 = a8;
  v21 = self;
  id v22 = v20;
  id v48 = a9;
  id v23 = a10;
  id v24 = a11;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, v21, @"WFHarnessTestCase.m", 25, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, v21, @"WFHarnessTestCase.m", 26, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

LABEL_3:
  if (v50)
  {
    if (v22) {
      goto LABEL_5;
    }
LABEL_12:
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, v21, @"WFHarnessTestCase.m", 28, @"Invalid parameter not satisfying: %@", @"interactions" object file lineNumber description];

    if (v23) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, v21, @"WFHarnessTestCase.m", 27, @"Invalid parameter not satisfying: %@", @"runDescriptor" object file lineNumber description];

  if (!v22) {
    goto LABEL_12;
  }
LABEL_5:
  if (v23) {
    goto LABEL_6;
  }
LABEL_13:
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, v21, @"WFHarnessTestCase.m", 29, @"Invalid parameter not satisfying: %@", @"conditions" object file lineNumber description];

LABEL_6:
  v51.receiver = v21;
  v51.super_class = (Class)WFHarnessTestCase;
  v25 = [(WFHarnessTestCase *)&v51 init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    name = v25->_name;
    v25->_name = (NSString *)v28;

    objc_storeStrong((id *)&v25->_runDescriptor, a5);
    objc_storeStrong((id *)&v25->_input, obj);
    uint64_t v30 = [v19 copy];
    automationType = v25->_automationType;
    v25->_automationType = (NSString *)v30;

    objc_storeStrong((id *)&v25->_interactions, v47);
    objc_storeStrong((id *)&v25->_siriInteractions, a9);
    objc_storeStrong((id *)&v25->_conditions, a10);
    objc_storeStrong((id *)&v25->_resultExpectation, a11);
    uint64_t v32 = objc_opt_new();
    handledInteractions = v25->_handledInteractions;
    v25->_handledInteractions = (NSMutableSet *)v32;

    uint64_t v34 = objc_opt_new();
    handledSiriInteractions = v25->_handledSiriInteractions;
    v25->_handledSiriInteractions = (NSMutableSet *)v34;

    uint64_t v36 = objc_opt_new();
    handledConditions = v25->_handledConditions;
    v25->_handledConditions = (NSMutableSet *)v36;

    v38 = v25;
  }

  return v25;
}

@end