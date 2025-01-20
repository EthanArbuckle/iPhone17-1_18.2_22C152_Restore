@interface HDSPEnvironmentContext
+ (id)contextWithSource:(id)a3;
- (HDSPEnvironmentContext)initWithSource:(id)a3 changeEvaluation:(id)a4;
- (HDSPSleepScheduleModelChangeEvaluation)changeEvaluation;
- (HDSPSource)source;
- (NSString)description;
- (id)contextByApplyingChangeEvaluation:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescriptionBuilder;
@end

@implementation HDSPEnvironmentContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeEvaluation, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

+ (id)contextWithSource:(id)a3
{
  id v3 = a3;
  v4 = [[HDSPEnvironmentContext alloc] initWithSource:v3 changeEvaluation:0];

  return v4;
}

- (HDSPEnvironmentContext)initWithSource:(id)a3 changeEvaluation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSPEnvironmentContext;
  v9 = [(HDSPEnvironmentContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_changeEvaluation, a4);
    v11 = v10;
  }

  return v10;
}

- (id)contextByApplyingChangeEvaluation:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [HDSPEnvironmentContext alloc];
  v6 = v5;
  source = self->_source;
  if (self->_changeEvaluation)
  {
    v12[0] = self->_changeEvaluation;
    v12[1] = v4;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    v9 = +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:v8];
    v10 = [(HDSPEnvironmentContext *)v6 initWithSource:source changeEvaluation:v9];
  }
  else
  {
    v10 = [(HDSPEnvironmentContext *)v5 initWithSource:self->_source changeEvaluation:v4];
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)[(HDSPEnvironmentContext *)self descriptionWithMultilinePrefix:&stru_26D3FAEE0];
}

- (id)succinctDescriptionBuilder
{
  return [(HDSPEnvironmentContext *)self descriptionBuilderWithMultilinePrefix:&stru_26D3FAEE0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HDSPEnvironmentContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  v5 = [(HDSPEnvironmentContext *)self source];
  id v6 = (id)[v4 appendObject:v5 withName:@"source"];

  id v7 = [(HDSPEnvironmentContext *)self changeEvaluation];
  id v8 = (id)[v4 appendObject:v7 withName:@"changeEvaluation" skipIfNil:1];

  return v4;
}

- (HDSPSource)source
{
  return self->_source;
}

- (HDSPSleepScheduleModelChangeEvaluation)changeEvaluation
{
  return self->_changeEvaluation;
}

@end