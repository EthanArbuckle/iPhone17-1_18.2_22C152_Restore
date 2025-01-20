@interface TPSMedicalIDEnabledValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSMedicalIDEnabledValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = +[TPSHealthKitDefines sharedHealthStore];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v6 = (void *)getHKMedicalIDStoreClass_softClass;
  uint64_t v16 = getHKMedicalIDStoreClass_softClass;
  if (!getHKMedicalIDStoreClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getHKMedicalIDStoreClass_block_invoke;
    v12[3] = &unk_1E6E6AE20;
    v12[4] = &v13;
    __getHKMedicalIDStoreClass_block_invoke((uint64_t)v12);
    v6 = (void *)v14[3];
  }
  v7 = v6;
  _Block_object_dispose(&v13, 8);
  v8 = (void *)[[v7 alloc] initWithHealthStore:v5];
  BOOL v9 = [v8 medicalIDSetUpStatus] != 2;
  uint64_t v10 = v9 ^ [(TPSTargetingValidation *)self BOOLValue];
  v11 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(TPSMedicalIDEnabledValidation *)self validateWithCompletion:v11];
  }

  v4[2](v4, v10, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 name];
  v7 = [a1 targetContext];
  int v8 = 138412802;
  BOOL v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end