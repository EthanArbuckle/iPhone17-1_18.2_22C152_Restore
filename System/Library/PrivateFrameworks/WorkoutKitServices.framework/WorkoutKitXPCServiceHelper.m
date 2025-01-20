@interface WorkoutKitXPCServiceHelper
+ (id)sharedInstance;
- (id)_init;
- (void)addScheduledWorkouts:(id)a3 sourceBundleId:(id)a4 completion:(id)a5;
- (void)deleteScheduledWorkoutCompositionsForSourceBundleId:(id)a3 completion:(id)a4;
- (void)endActiveWorkoutPlanWithIdentifier:(id)a3 completion:(id)a4;
- (void)handleUninstalledAppIds:(id)a3 completion:(id)a4;
- (void)iconForBundleId:(id)a3 completion:(id)a4;
- (void)openWorkoutAppWithActivityType:(int64_t)a3 autostart:(BOOL)a4 completion:(id)a5;
- (void)openWorkoutAppWithWorkoutPlanData:(id)a3 autostartWorkoutPlan:(BOOL)a4 completion:(id)a5;
- (void)openWorkoutAppWithWorkoutPlanData:(id)a3 completion:(id)a4;
- (void)presentWorkoutCompositionData:(id)a3 completion:(id)a4;
- (void)removeScheduledWorkouts:(id)a3 sourceBundleId:(id)a4 completion:(id)a5;
- (void)requestAuthorizationForBundleId:(id)a3 completion:(id)a4;
- (void)retrieveAuthorizationStateForBundleId:(id)a3 completion:(id)a4;
- (void)retrieveScheduledWorkoutCompositionsForSourceBundleId:(id)a3 completion:(id)a4;
- (void)retrieveWorkoutCompositionFromWorkout:(id)a3 completion:(id)a4;
- (void)retrieveWorkoutCompositionFromWorkoutUUID:(id)a3 completion:(id)a4;
- (void)saveWorkoutCompositionData:(id)a3 completion:(id)a4;
- (void)setAuthorizationState:(id)a3 forBundleId:(id)a4 completion:(id)a5;
- (void)storeScheduledWorkoutCompositions:(id)a3 sourceBundleId:(id)a4 completion:(id)a5;
@end

@implementation WorkoutKitXPCServiceHelper

+ (id)sharedInstance
{
  id v2 = [[WorkoutKitXPCServiceHelper alloc] _init];
  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WorkoutKitXPCServiceHelper;
  return [(WorkoutKitXPCServiceHelper *)&v3 init];
}

- (void)presentWorkoutCompositionData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_2;
  v8[3] = &unk_26558A628;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 presentWorkoutCompositionData:v6 completion:v8];
}

void __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__WorkoutKitXPCServiceHelper_presentWorkoutCompositionData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openWorkoutAppWithWorkoutPlanData:(id)a3 completion:(id)a4
{
}

- (void)openWorkoutAppWithWorkoutPlanData:(id)a3 autostartWorkoutPlan:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke;
  v16[3] = &unk_26558A6A0;
  id v17 = v7;
  BOOL v19 = a4;
  id v9 = v8;
  id v18 = v9;
  id v10 = v7;
  v11 = (void *)MEMORY[0x263E48030](v16);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_3;
  v14[3] = &unk_26558A678;
  id v15 = v9;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x263E48030](v14);
  _WorkoutKitConnectWithBlock(v11, v13);
}

void __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_2;
  v9[3] = &unk_26558A628;
  id v10 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  [a2 openWorkoutAppWithWorkoutPlanData:v7 autostartWorkoutPlan:v6 completion:v9];
}

void __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __96__WorkoutKitXPCServiceHelper_openWorkoutAppWithWorkoutPlanData_autostartWorkoutPlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openWorkoutAppWithActivityType:(int64_t)a3 autostart:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke;
  v14[3] = &unk_26558A6F0;
  int64_t v16 = a3;
  BOOL v17 = a4;
  id v8 = v7;
  id v15 = v8;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v8;
  id v10 = v8;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_2;
  v9[3] = &unk_26558A6C8;
  id v10 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v8 = v5;
  [a2 openWorkoutAppWithActivityType:v7 autostart:v6 completion:v9];
}

void __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __82__WorkoutKitXPCServiceHelper_openWorkoutAppWithActivityType_autostart_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endActiveWorkoutPlanWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_2;
  v8[3] = &unk_26558A628;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 endActiveWorkoutPlanWithIdentifier:v6 completion:v8];
}

void __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__WorkoutKitXPCServiceHelper_endActiveWorkoutPlanWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveWorkoutCompositionData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_2;
  v8[3] = &unk_26558A628;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 saveWorkoutCompositionData:v6 completion:v8];
}

void __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __68__WorkoutKitXPCServiceHelper_saveWorkoutCompositionData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addScheduledWorkouts:(id)a3 sourceBundleId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke;
  v18[3] = &unk_26558A718;
  id v19 = v7;
  id v20 = v8;
  id v10 = v9;
  id v21 = v10;
  id v11 = v8;
  id v12 = v7;
  id v13 = (void *)MEMORY[0x263E48030](v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_3;
  v16[3] = &unk_26558A678;
  id v17 = v10;
  id v14 = v10;
  id v15 = (void *)MEMORY[0x263E48030](v16);
  _WorkoutKitConnectWithBlock(v13, v15);
}

void __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_2;
  v9[3] = &unk_26558A628;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v8 = v5;
  [a2 addScheduledWorkouts:v6 sourceBundleId:v7 completion:v9];
}

void __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __77__WorkoutKitXPCServiceHelper_addScheduledWorkouts_sourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeScheduledWorkouts:(id)a3 sourceBundleId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke;
  v18[3] = &unk_26558A718;
  id v19 = v7;
  id v20 = v8;
  id v10 = v9;
  id v21 = v10;
  id v11 = v8;
  id v12 = v7;
  id v13 = (void *)MEMORY[0x263E48030](v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_3;
  v16[3] = &unk_26558A678;
  id v17 = v10;
  id v14 = v10;
  id v15 = (void *)MEMORY[0x263E48030](v16);
  _WorkoutKitConnectWithBlock(v13, v15);
}

void __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_2;
  v9[3] = &unk_26558A628;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v8 = v5;
  [a2 removeScheduledWorkouts:v6 sourceBundleId:v7 completion:v9];
}

void __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80__WorkoutKitXPCServiceHelper_removeScheduledWorkouts_sourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeScheduledWorkoutCompositions:(id)a3 sourceBundleId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke;
  v18[3] = &unk_26558A718;
  id v19 = v7;
  id v20 = v8;
  id v10 = v9;
  id v21 = v10;
  id v11 = v8;
  id v12 = v7;
  id v13 = (void *)MEMORY[0x263E48030](v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_3;
  v16[3] = &unk_26558A678;
  id v17 = v10;
  id v14 = v10;
  id v15 = (void *)MEMORY[0x263E48030](v16);
  _WorkoutKitConnectWithBlock(v13, v15);
}

void __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_2;
  v9[3] = &unk_26558A628;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v8 = v5;
  [a2 storeScheduledWorkoutCompositions:v6 sourceBundleId:v7 completion:v9];
}

void __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __90__WorkoutKitXPCServiceHelper_storeScheduledWorkoutCompositions_sourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveScheduledWorkoutCompositionsForSourceBundleId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2;
  v8[3] = &unk_26558A740;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 retrieveScheduledWorkoutCompositionsForSourceBundleId:v6 completion:v8];
}

void __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __95__WorkoutKitXPCServiceHelper_retrieveScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteScheduledWorkoutCompositionsForSourceBundleId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2;
  v8[3] = &unk_26558A628;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 deleteScheduledWorkoutCompositionsForSourceBundleId:v6 completion:v8];
}

void __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __93__WorkoutKitXPCServiceHelper_deleteScheduledWorkoutCompositionsForSourceBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)iconForBundleId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_2;
  v8[3] = &unk_26558A768;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 iconForBundleId:v6 completion:v8];
}

void __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__WorkoutKitXPCServiceHelper_iconForBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveWorkoutCompositionFromWorkout:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_2;
  v8[3] = &unk_26558A768;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 retrieveWorkoutCompositionFromWorkout:v6 completion:v8];
}

void __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkout_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveWorkoutCompositionFromWorkoutUUID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_2;
  v8[3] = &unk_26558A768;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 retrieveWorkoutCompositionFromWorkoutUUID:v6 completion:v8];
}

void __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __83__WorkoutKitXPCServiceHelper_retrieveWorkoutCompositionFromWorkoutUUID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveAuthorizationStateForBundleId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_2;
  v8[3] = &unk_26558A790;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 retrieveAuthorizationStateForBundleId:v6 completion:v8];
}

void __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79__WorkoutKitXPCServiceHelper_retrieveAuthorizationStateForBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAuthorizationForBundleId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_2;
  v8[3] = &unk_26558A790;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 requestAuthorizationForBundleId:v6 completion:v8];
}

void __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__WorkoutKitXPCServiceHelper_requestAuthorizationForBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAuthorizationState:(id)a3 forBundleId:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke;
  v18[3] = &unk_26558A718;
  id v19 = v7;
  id v20 = v8;
  id v10 = v9;
  id v21 = v10;
  id v11 = v8;
  id v12 = v7;
  id v13 = (void *)MEMORY[0x263E48030](v18);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_3;
  v16[3] = &unk_26558A678;
  id v17 = v10;
  id v14 = v10;
  id v15 = (void *)MEMORY[0x263E48030](v16);
  _WorkoutKitConnectWithBlock(v13, v15);
}

void __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_2;
  v9[3] = &unk_26558A628;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v8 = v5;
  [a2 setAuthorizationState:v6 forBundleId:v7 completion:v9];
}

void __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __75__WorkoutKitXPCServiceHelper_setAuthorizationState_forBundleId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleUninstalledAppIds:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke;
  v14[3] = &unk_26558A650;
  id v15 = v5;
  id v7 = v6;
  id v16 = v7;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x263E48030](v14);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_3;
  v12[3] = &unk_26558A678;
  id v13 = v7;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x263E48030](v12);
  _WorkoutKitConnectWithBlock(v9, v11);
}

void __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_2;
  v8[3] = &unk_26558A628;
  id v9 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  [a2 handleUninstalledAppIds:v6 completion:v8];
}

void __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 setInvalidationHandler:0];
  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__WorkoutKitXPCServiceHelper_handleUninstalledAppIds_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end