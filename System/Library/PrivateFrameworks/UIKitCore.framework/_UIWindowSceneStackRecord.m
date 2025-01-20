@interface _UIWindowSceneStackRecord
- (NSString)debugDescription;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation _UIWindowSceneStackRecord

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIWindowSceneStackRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIWindowSceneStackRecord *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIWindowSceneStackRecord *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = (objc_class *)objc_opt_class();
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", class_getName(v4), self->_windowScene);
  id v6 = (id)[v3 appendObject:v5 withName:@"windowScene"];
  id v7 = _NSStringFromUIKeyWindowEvaluationStrategy(self->_evaluationStrategy);
  id v8 = (id)[v3 appendObject:v7 withName:@"evaluationStrategy"];

  id v9 = (id)[v3 appendUInt64:self->_lastPushedTime withName:@"lastPushedTime"];
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIWindowSceneStackRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
}

@end