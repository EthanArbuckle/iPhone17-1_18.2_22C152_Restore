@interface PMLMockPlan
+ (id)lastDeserializedPlanWithId:(id)a3;
+ (id)lastDeserializedPlansMap;
+ (void)clearLastDeserializedPlans;
+ (void)setLastDeserializedPlanWithId:(id)a3 toPlan:(id)a4;
- (BOOL)didRun;
- (NSString)planId;
- (PMLMockPlan)initWithPlanId:(id)a3;
- (PMLMockPlan)initWithPlanId:(id)a3 store:(id)a4;
- (PMLMockPlan)initWithPlanId:(id)a3 store:(id)a4 version:(unint64_t)a5 returningAfterRunning:(BOOL)a6;
- (PMLMockPlan)initWithPlanId:(id)a3 version:(unint64_t)a4;
- (PMLMockPlan)initWithPlanId:(id)a3 version:(unint64_t)a4 returningAfterRunning:(BOOL)a5;
- (PMLMockPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLMockPlan)initWithVersion:(unint64_t)a3;
- (id)runWithError:(id *)a3;
- (id)toPlistWithChunks:(id)a3;
- (unint64_t)version;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PMLMockPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (BOOL)didRun
{
  return self->_didRun;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLMockPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [v8 objectForKeyedSubscript:@"id"];
  v10 = [v7 objectForKeyedSubscript:@"TRAINING_STORE"];

  v11 = [v8 objectForKeyedSubscript:@"version"];
  uint64_t v12 = [v11 unsignedIntegerValue];
  v13 = [v8 objectForKeyedSubscript:@"returnValue"];
  v14 = -[PMLMockPlan initWithPlanId:store:version:returningAfterRunning:](self, "initWithPlanId:store:version:returningAfterRunning:", v9, v10, v12, [v13 BOOLValue]);

  v15 = [v8 objectForKeyedSubscript:@"id"];

  +[PMLMockPlan setLastDeserializedPlanWithId:v15 toPlan:v14];
  return v14;
}

- (id)toPlistWithChunks:(id)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  v9[0] = self->_planId;
  v8[0] = @"id";
  v8[1] = @"version";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PMLMockPlan version](self, "version", a3));
  v9[1] = v4;
  v8[2] = @"returnValue";
  v5 = [NSNumber numberWithBool:self->_returnValue];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)runWithError:(id *)a3
{
  self->_didRun = 1;
  return 0;
}

- (PMLMockPlan)initWithPlanId:(id)a3 store:(id)a4
{
  return [(PMLMockPlan *)self initWithPlanId:a3 store:a4 version:0 returningAfterRunning:1];
}

- (PMLMockPlan)initWithPlanId:(id)a3
{
  return [(PMLMockPlan *)self initWithPlanId:a3 version:0];
}

- (PMLMockPlan)initWithVersion:(unint64_t)a3
{
  return [(PMLMockPlan *)self initWithPlanId:@"dummy" version:a3];
}

- (PMLMockPlan)initWithPlanId:(id)a3 version:(unint64_t)a4
{
  return [(PMLMockPlan *)self initWithPlanId:a3 version:a4 returningAfterRunning:1];
}

- (PMLMockPlan)initWithPlanId:(id)a3 version:(unint64_t)a4 returningAfterRunning:(BOOL)a5
{
  return [(PMLMockPlan *)self initWithPlanId:a3 store:0 version:a4 returningAfterRunning:a5];
}

- (PMLMockPlan)initWithPlanId:(id)a3 store:(id)a4 version:(unint64_t)a5 returningAfterRunning:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PMLMockPlan;
  v13 = [(PMLMockPlan *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_planId, a3);
    objc_storeStrong((id *)&v14->_store, a4);
    v14->_version = a5;
    v14->_returnValue = a6;
    v14->_didRun = 0;
  }

  return v14;
}

+ (id)lastDeserializedPlansMap
{
  if (lastDeserializedPlansMap__pasOnceToken2 != -1) {
    dispatch_once(&lastDeserializedPlansMap__pasOnceToken2, &__block_literal_global_4858);
  }
  v2 = (void *)lastDeserializedPlansMap__pasExprOnceResult;
  return v2;
}

void __39__PMLMockPlan_lastDeserializedPlansMap__block_invoke()
{
  v0 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)lastDeserializedPlansMap__pasExprOnceResult;
  lastDeserializedPlansMap__pasExprOnceResult = v1;
}

+ (void)clearLastDeserializedPlans
{
  id v2 = [a1 lastDeserializedPlansMap];
  [v2 removeAllObjects];
}

+ (void)setLastDeserializedPlanWithId:(id)a3 toPlan:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 lastDeserializedPlansMap];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

+ (id)lastDeserializedPlanWithId:(id)a3
{
  id v4 = a3;
  v5 = [a1 lastDeserializedPlansMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

@end