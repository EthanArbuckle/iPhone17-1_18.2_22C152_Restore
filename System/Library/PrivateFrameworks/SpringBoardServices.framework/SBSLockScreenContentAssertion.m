@interface SBSLockScreenContentAssertion
+ (BOOL)_isRestrictedDevice;
+ (id)acquireContentProviderAssertionForType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 errorHandler:(id)a7;
+ (id)acquireContentProviderAssertionForType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 errorHandler:(id)a6;
- (BOOL)_supportsReacquisition;
- (NSString)identifier;
- (NSString)slot;
- (SBSLockScreenContentAction)action;
- (SBSLockScreenContentAssertion)initWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 errorHandler:(id)a7;
- (id)_errorHandler;
- (id)configurationObject;
- (unint64_t)type;
- (void)_acquireAssertionWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6;
- (void)_setErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAction:(id)a3;
- (void)setConfigurationObject:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation SBSLockScreenContentAssertion

+ (id)acquireContentProviderAssertionForType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 errorHandler:(id)a6
{
  return (id)[a1 acquireContentProviderAssertionForType:a3 slot:a4 identifier:a5 configurationObject:0 errorHandler:a6];
}

+ (id)acquireContentProviderAssertionForType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 errorHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, void *))a7;
  if ([a1 _isRestrictedDevice])
  {
    if (v15)
    {
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBSLockScreenContentAssertionErrorDomain" code:3 userInfo:0];
      v15[2](v15, v16);
    }
    v17 = 0;
  }
  else
  {
    v17 = (void *)[objc_alloc((Class)a1) initWithType:a3 slot:v12 identifier:v13 configurationObject:v14 errorHandler:v15];
  }

  return v17;
}

- (SBSLockScreenContentAssertion)initWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 errorHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SBSLockScreenContentAssertion;
  v16 = [(SBSLockScreenContentAssertion *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(SBSLockScreenContentAssertion *)v16 _setErrorHandler:v15];
    [(SBSLockScreenContentAssertion *)v17 setSlot:v12];
    [(SBSLockScreenContentAssertion *)v17 setIdentifier:v13];
    [(SBSLockScreenContentAssertion *)v17 setConfigurationObject:v14];
    [(SBSLockScreenContentAssertion *)v17 _acquireAssertionWithType:a3 slot:v12 identifier:v13 configurationObject:v14];
  }

  return v17;
}

- (void)dealloc
{
  [(SBSLockScreenContentAction *)self->_action invalidate];
  action = self->_action;
  self->_action = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBSLockScreenContentAssertion;
  [(SBSLockScreenContentAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  [(SBSLockScreenContentAction *)self->_action invalidate];
  action = self->_action;
  self->_action = 0;
}

- (unint64_t)type
{
  return [(SBSLockScreenContentAction *)self->_action type];
}

- (NSString)slot
{
  return [(SBSLockScreenContentAction *)self->_action slot];
}

- (NSString)identifier
{
  return [(SBSLockScreenContentAction *)self->_action identifier];
}

- (void)_acquireAssertionWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [SBSLockScreenContentAction alloc];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke;
  v24 = &unk_1E566B288;
  objc_copyWeak(v28, &location);
  v28[1] = (id)a3;
  id v14 = v10;
  id v25 = v14;
  id v15 = v11;
  id v26 = v15;
  id v16 = v12;
  id v27 = v16;
  v17 = [(SBSLockScreenContentAction *)v13 initWithType:a3 slot:v14 identifier:v15 configurationObject:v16 handler:&v21];
  action = self->_action;
  self->_action = v17;

  if (self->_action)
  {
    objc_super v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v21, v22, v23, v24, v25, v26];
    v20 = [MEMORY[0x1E4F62AF8] sharedService];
    [v20 sendActions:v19 withResult:0];
  }
  else
  {
    objc_super v19 = SBLogDashBoard();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SBSLockScreenContentAssertion _acquireAssertionWithType:slot:identifier:configurationObject:]((uint64_t)v14, (uint64_t)v15, v19);
    }
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

void __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke(void *a1, void *a2)
{
  v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [v4 error];

  v7 = [v6 domain];
  uint64_t v8 = *MEMORY[0x1E4F4F600];
  if ([v7 isEqualToString:*MEMORY[0x1E4F4F600]] && [v6 code] == 1)
  {
    int v9 = [WeakRetained _supportsReacquisition];

    if (v9)
    {
      [WeakRetained _acquireAssertionWithType:a1[8] slot:a1[4] identifier:a1[5] configurationObject:a1[6]];
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v10 = [v6 domain];
  if ([v10 isEqualToString:@"SBSLockScreenContentAssertionErrorDomain"])goto LABEL_10; {
  id v11 = [v6 domain];
  }
  char v12 = [v11 isEqualToString:v8];

  if ((v12 & 1) == 0)
  {
    id v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke_cold_1(v6, v10);
    }
LABEL_10:
  }
  uint64_t v13 = [WeakRetained _errorHandler];
  id v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v6);
  }

LABEL_14:
}

- (BOOL)_supportsReacquisition
{
  v2 = [(SBSLockScreenContentAssertion *)self slot];
  char v3 = [v2 isEqualToString:@"App"];

  return v3;
}

+ (BOOL)_isRestrictedDevice
{
  return MGGetSInt32Answer() - 4 < 0xFFFFFFFD;
}

- (void)setSlot:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (id)configurationObject
{
  return self->_configurationObject;
}

- (void)setConfigurationObject:(id)a3
{
}

- (SBSLockScreenContentAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (id)_errorHandler
{
  return self->_errorHandler;
}

- (void)_setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong(&self->_configurationObject, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)_acquireAssertionWithType:(os_log_t)log slot:identifier:configurationObject:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "[ContentAssertion] Action is nil after initialization, dropping content entirely. slot: %{public}@ identifier: %{public}@", (uint8_t *)&v3, 0x16u);
}

void __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 localizedDescription];
  int v4 = 138543362;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
}

@end