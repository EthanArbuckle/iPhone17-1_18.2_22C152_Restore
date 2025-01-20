@interface PMLPlanWrapper
- (PMLPlanProtocol)plan;
- (PMLPlanWrapper)initWithPlan:(id)a3;
- (PMLPlanWrapper)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
@end

@implementation PMLPlanWrapper

- (void).cxx_destruct
{
}

- (PMLPlanProtocol)plan
{
  return self->_plan;
}

- (PMLPlanWrapper)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v11 objectForKeyedSubscript:@"PLAN_CLASSNAME"];
  v13 = NSClassFromString(v12);
  if (!v13)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PMLPlanSerialization.m", 55, @"Invalid plan. Unknown class: %@", v12 object file lineNumber description];
  }
  id v14 = [v13 alloc];
  v15 = [v11 objectForKeyedSubscript:@"PLAN"];

  v16 = (void *)[v14 initWithPlist:v15 chunks:v10 context:v9];
  if (v16)
  {
    self = [(PMLPlanWrapper *)self initWithPlan:v16];
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)toPlistWithChunks:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"PLAN_CLASSNAME";
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v10[1] = @"PLAN";
  v11[0] = v6;
  v7 = [(PMLPlanProtocol *)self->_plan toPlistWithChunks:v4];

  v11[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (PMLPlanWrapper)initWithPlan:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLPlanWrapper;
  v6 = [(PMLPlanWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plan, a3);
  }

  return v7;
}

@end