@interface NPFamilySharingSetupPresenter
- (void)presentFamilySharingSetupWith:(id)a3;
@end

@implementation NPFamilySharingSetupPresenter

- (void)presentFamilySharingSetupWith:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F61878];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v7 = (id)[v5 initWithEventType:*MEMORY[0x1E4F61870]];
  [v7 setClientName:@"AppleNewsPlus"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F61880]) initWithPresenter:v4];

  [v6 performWithContext:v7 completion:&__block_literal_global];
}

void __63__NPFamilySharingSetupPresenter_presentFamilySharingSetupWith___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    id v4 = (void *)*MEMORY[0x1E4F7E0A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7E0A0], OS_LOG_TYPE_ERROR)) {
      __63__NPFamilySharingSetupPresenter_presentFamilySharingSetupWith___block_invoke_cold_1(v4, v2);
    }
  }
}

void __63__NPFamilySharingSetupPresenter_presentFamilySharingSetupWith___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 error];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1BFA45000, v3, OS_LOG_TYPE_ERROR, "Failed to launch family setup UI with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end