@interface TPSESimValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSESimValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getCTCellularPlanManagerClass_softClass;
  uint64_t v15 = getCTCellularPlanManagerClass_softClass;
  if (!getCTCellularPlanManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getCTCellularPlanManagerClass_block_invoke;
    v11[3] = &unk_1E6E6AE20;
    v11[4] = &v12;
    __getCTCellularPlanManagerClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = [v6 sharedManager];
  v8 = v7;
  if (v7)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, ([v7 getSupportedFlowTypes] == 0) ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue"), 0);
  }
  else
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
    v10 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TPSESimValidation validateWithCompletion:](self, v10);
    }

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

- (void)validateWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 name];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - error initializing cellular plan manager", (uint8_t *)&v4, 0xCu);
}

@end