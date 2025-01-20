@interface PMLTrainingMock
- (NSArray)collectedSessions;
- (PMLTrainingMock)init;
- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4;
- (id)planReceivedWithPayload:(id)a3 error:(id *)a4;
- (id)planReceivedWithRecipe:(id)a3 attachments:(id)a4 error:(id *)a5;
- (void)addSessionWithCovariates:(id)a3 label:(int64_t)a4 sessionDescriptor:(id)a5 spotlightReference:(id)a6 isInternal:(BOOL)a7;
- (void)clearCollectedSessions;
- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4;
@end

@implementation PMLTrainingMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedSessions, 0);
  objc_storeStrong((id *)&self->_lastTrainingFeaturizations, 0);
  objc_storeStrong((id *)&self->_internalCollectedSessions, 0);
}

- (NSArray)collectedSessions
{
  return self->_collectedSessions;
}

- (void)clearCollectedSessions
{
}

- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4
{
  lastTrainingFeaturizations = self->_lastTrainingFeaturizations;
  v6 = (void *)MEMORY[0x263F61EA8];
  id v7 = a3;
  id v12 = [v6 tupleWithFirst:v7 second:a4];
  v8 = (void *)MEMORY[0x263F61EA8];
  v9 = [v7 name];
  v10 = [v7 locale];

  v11 = [v8 tupleWithFirst:v9 second:v10];
  [(NSMutableDictionary *)lastTrainingFeaturizations setObject:v12 forKey:v11];
}

- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4
{
  lastTrainingFeaturizations = self->_lastTrainingFeaturizations;
  v5 = [MEMORY[0x263F61EA8] tupleWithFirst:a3 second:a4];
  v6 = [(NSMutableDictionary *)lastTrainingFeaturizations objectForKeyedSubscript:v5];

  return v6;
}

- (id)planReceivedWithRecipe:(id)a3 attachments:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)planReceivedWithPayload:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)addSessionWithCovariates:(id)a3 label:(int64_t)a4 sessionDescriptor:(id)a5 spotlightReference:(id)a6 isInternal:(BOOL)a7
{
  BOOL v7 = a7;
  v20[5] = *MEMORY[0x263EF8340];
  internalCollectedSessions = self->_internalCollectedSessions;
  v20[0] = a3;
  v19[0] = @"covariates";
  v19[1] = @"label";
  id v12 = NSNumber;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = [v12 numberWithInteger:a4];
  v20[1] = v16;
  v20[2] = v14;
  v19[2] = @"model";
  v19[3] = @"spotlightReference";
  v20[3] = v13;
  v19[4] = @"isInternal";
  v17 = [NSNumber numberWithBool:v7];
  v20[4] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  [(NSMutableArray *)internalCollectedSessions addObject:v18];
}

- (PMLTrainingMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)PMLTrainingMock;
  v2 = [(PMLTrainingMock *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    internalCollectedSessions = v2->_internalCollectedSessions;
    v2->_internalCollectedSessions = (NSMutableArray *)v3;

    objc_storeStrong((id *)&v2->_collectedSessions, v2->_internalCollectedSessions);
    uint64_t v5 = objc_opt_new();
    lastTrainingFeaturizations = v2->_lastTrainingFeaturizations;
    v2->_lastTrainingFeaturizations = (NSMutableDictionary *)v5;
  }
  return v2;
}

@end