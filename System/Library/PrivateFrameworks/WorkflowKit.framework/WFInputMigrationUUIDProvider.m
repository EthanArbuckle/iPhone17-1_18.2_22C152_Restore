@interface WFInputMigrationUUIDProvider
- (WFAction)action;
- (WFInputMigrationUUIDProvider)initWithAction:(id)a3 atPosition:(unint64_t)a4;
- (id)generateOutputUUIDForAction:(id)a3;
- (unint64_t)position;
@end

@implementation WFInputMigrationUUIDProvider

- (void).cxx_destruct
{
}

- (unint64_t)position
{
  return self->_position;
}

- (WFAction)action
{
  return self->_action;
}

- (id)generateOutputUUIDForAction:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(WFInputMigrationUUIDProvider *)self action];

  if (v6 != v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFInputMigrationUUIDProvider.m", 59, @"[%@] should be initialized with the UUID requested action %@", objc_opt_class(), v5 object file lineNumber description];
  }
  unint64_t v7 = [(WFInputMigrationUUIDProvider *)self position];
  id v8 = v5;
  if (!v8) {
    __assert_rtn("WFActionBootDeterministicID", "WFInputMigrationUUIDProvider.m", 24, "action != nil");
  }
  v9 = v8;
  id v10 = objc_alloc_init(MEMORY[0x1E4F70C20]);
  v11 = [v9 identifier];
  id v12 = (id)[v10 combineContentsOfPropertyListObject:v11];

  id v13 = (id)[v10 combineInteger:v7];
  id v22 = 0;
  uint64_t v14 = WFKernelBootTime(&v22);
  id v15 = v22;
  id v16 = (id)[v10 combineInteger:v14];
  [v10 finalize];
  if (v15)
  {
    v17 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "WFActionBootDeterministicID";
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_FAULT, "%s Failed to get kernel boot time for deterministic output ID generation: %@", buf, 0x16u);
    }
  }
  v18 = WFUUIDv4FromInteger();
  v19 = [v18 UUIDString];

  return v19;
}

- (WFInputMigrationUUIDProvider)initWithAction:(id)a3 atPosition:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFInputMigrationUUIDProvider.m", 47, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFInputMigrationUUIDProvider;
  v9 = [(WFInputMigrationUUIDProvider *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    v10->_position = a4;
    v11 = v10;
  }

  return v10;
}

@end