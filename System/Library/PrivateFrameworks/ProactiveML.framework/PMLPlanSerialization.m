@interface PMLPlanSerialization
+ (id)planFromData:(id)a3 store:(id)a4 trainingNetworkPath:(id)a5;
+ (id)planFromData:(id)a3 withArgs:(id)a4;
+ (id)planFromData:(id)a3 withStore:(id)a4;
+ (id)serializePlan:(id)a3;
@end

@implementation PMLPlanSerialization

+ (id)serializePlan:(id)a3
{
  id v3 = a3;
  v4 = [[PMLPlanWrapper alloc] initWithPlan:v3];

  v5 = PMLBuildChunkFile(v4);

  return v5;
}

+ (id)planFromData:(id)a3 withArgs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = PMLReadChunkData((uint64_t)v6, v7, v5);

  v9 = [v8 plan];

  return v9;
}

+ (id)planFromData:(id)a3 store:(id)a4 trainingNetworkPath:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  v15[0] = @"TRAINING_STORE";
  v15[1] = @"PML_ESPRESSO_TRAINING_NETWORK_PATH";
  v16[0] = a4;
  v16[1] = a5;
  v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dictionaryWithObjects:v16 forKeys:v15 count:2];

  v13 = [a1 planFromData:v11 withArgs:v12];

  return v13;
}

+ (id)planFromData:(id)a3 withStore:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v12 = @"TRAINING_STORE";
  v13[0] = a4;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  id v10 = [a1 planFromData:v8 withArgs:v9];

  return v10;
}

@end