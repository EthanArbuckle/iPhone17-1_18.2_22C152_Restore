@interface SXLayoutTask
- (NSString)identifier;
- (SXDOM)DOM;
- (SXLayoutBlueprint)blueprint;
- (SXLayoutInstructions)instructions;
- (SXLayoutOptions)options;
- (SXLayoutTask)initWithOptions:(id)a3 instructions:(id)a4;
- (SXLayoutTask)initWithOptions:(id)a3 instructions:(id)a4 blueprint:(id)a5 DOM:(id)a6;
- (double)startTime;
- (id)description;
- (unint64_t)type;
@end

@implementation SXLayoutTask

- (SXLayoutTask)initWithOptions:(id)a3 instructions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SXLayoutTask;
  v9 = [(SXLayoutTask *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v11 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v10->_options, a3);
    objc_storeStrong((id *)&v10->_instructions, a4);
    v10->_startTime = CACurrentMediaTime();
  }

  return v10;
}

- (SXLayoutTask)initWithOptions:(id)a3 instructions:(id)a4 blueprint:(id)a5 DOM:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SXLayoutTask;
  objc_super v15 = [(SXLayoutTask *)&v23 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = 1;
    v17 = [MEMORY[0x263F08C38] UUID];
    uint64_t v18 = [v17 UUIDString];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v18;

    objc_storeStrong((id *)&v16->_options, a3);
    objc_storeStrong((id *)&v16->_instructions, a4);
    uint64_t v20 = [v13 copy];
    blueprint = v16->_blueprint;
    v16->_blueprint = (SXLayoutBlueprint *)v20;

    objc_storeStrong((id *)&v16->_DOM, a6);
    v16->_startTime = CACurrentMediaTime();
  }

  return v16;
}

- (id)description
{
  unint64_t v3 = [(SXLayoutTask *)self type];
  v4 = @"update";
  if (v3 != 1) {
    v4 = 0;
  }
  if (v3) {
    v5 = v4;
  }
  else {
    v5 = @"new";
  }
  v6 = (void *)MEMORY[0x263F089D8];
  uint64_t v7 = objc_opt_class();
  id v8 = [(SXLayoutTask *)self identifier];
  v9 = [v6 stringWithFormat:@"<%@: %p; type: %@; identifier: %@", v7, self, v5, v8];

  v10 = [(SXLayoutTask *)self options];
  [v9 appendFormat:@"\noptions: \n%@", v10];

  id v11 = [(SXLayoutTask *)self instructions];
  [v9 appendFormat:@"\ninstructions: \n%@", v11];

  [v9 appendFormat:@"\n>"];
  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SXLayoutOptions)options
{
  return self->_options;
}

- (SXLayoutInstructions)instructions
{
  return self->_instructions;
}

- (SXLayoutBlueprint)blueprint
{
  return self->_blueprint;
}

- (SXDOM)DOM
{
  return self->_DOM;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOM, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end