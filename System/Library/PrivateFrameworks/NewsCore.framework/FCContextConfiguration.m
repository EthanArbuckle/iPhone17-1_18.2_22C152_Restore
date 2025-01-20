@interface FCContextConfiguration
+ (id)defaultConfiguration;
- (BOOL)isProductionContentEnvironment;
- (BOOL)isProductionPrivateDataEnvironment;
- (FCContextConfiguration)init;
- (FCContextConfiguration)initWithEnvironment:(int64_t)a3;
- (FCContextConfiguration)initWithProductionContentEnvironment:(BOOL)a3 productionPrivateDataEnvironment:(BOOL)a4 contentContainerIdentifier:(id)a5 privateDataContainerIdentifier:(id)a6 privateDataSecureContainerIdentifier:(id)a7 storeFrontID:(id)a8 environment:(int64_t)a9;
- (NSString)contentContainerCombinationIdentifier;
- (NSString)contentContainerIdentifier;
- (NSString)contentEnvironmentDescription;
- (NSString)privateDataContainerCombinationIdentifier;
- (NSString)privateDataContainerIdentifier;
- (NSString)privateDataSecureContainerIdentifier;
- (int64_t)environment;
@end

@implementation FCContextConfiguration

+ (id)defaultConfiguration
{
  if (qword_1EB5D17E0 != -1) {
    dispatch_once(&qword_1EB5D17E0, &__block_literal_global_113);
  }
  v2 = (void *)_MergedGlobals_190;
  return v2;
}

- (NSString)privateDataContainerCombinationIdentifier
{
  return self->_privateDataContainerCombinationIdentifier;
}

uint64_t __46__FCContextConfiguration_defaultConfiguration__block_invoke()
{
  v0 = [[FCContextConfiguration alloc] initWithEnvironment:FCCurrentContextEnvironment()];
  uint64_t v1 = _MergedGlobals_190;
  _MergedGlobals_190 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCContextConfiguration)initWithEnvironment:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = +[FCAppleAccount sharedAccount];
  uint64_t v6 = [v5 contentStoreFrontID];

  uint64_t v7 = 1;
  v28 = self;
  v29 = (void *)v6;
  v8 = FCCKProductionPrivateSecureContainerIdentifier;
  v9 = FCCKProductionPrivateContainerIdentifier;
  v10 = FCCKProductionContentContainerIdentifier;
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
    case 4:
      uint64_t v7 = 0;
      v8 = FCCKStagingPrivateSecureContainerIdentifier;
      v9 = FCCKStagingPrivateContainerIdentifier;
      v10 = FCCKStagingContentContainerIdentifier;
      goto LABEL_9;
    case 2:
      uint64_t v7 = 0;
      v8 = FCCKQAPrivateSecureContainerIdentifier;
      v9 = FCCKQAPrivateContainerIdentifier;
      v10 = FCCKQAContentContainerIdentifier;
      goto LABEL_9;
    case 3:
    case 5:
      uint64_t v7 = 0;
      goto LABEL_9;
    case 6:
      uint64_t v7 = 0;
      v8 = FCCKSandboxPrivateSecureContainerIdentifier;
      v9 = FCCKSandboxPrivateContainerIdentifier;
      v10 = FCCKSandboxContentContainerIdentifier;
      goto LABEL_9;
    case 7:
      uint64_t v7 = 0;
      v8 = FCCKDemo1PrivateSecureContainerIdentifier;
      v9 = FCCKDemo1PrivateContainerIdentifier;
      v10 = FCCKDemo1ContentContainerIdentifier;
      goto LABEL_9;
    case 8:
      uint64_t v7 = 0;
      v8 = FCCKDemo2PrivateSecureContainerIdentifier;
      v9 = FCCKDemo2PrivateContainerIdentifier;
      v10 = FCCKDemo2ContentContainerIdentifier;
LABEL_9:
      v13 = *v10;
      v12 = *v9;
      v11 = *v8;
      break;
    default:
      v11 = 0;
      v12 = 0;
      v13 = 0;
      break;
  }
  v14 = NewsCoreUserDefaults();
  v15 = [v14 stringForKey:@"private_container_name"];
  v16 = v15;
  if (v15)
  {
    v17 = v15;

    v12 = v17;
  }
  v18 = [v14 stringForKey:@"private_secure_container_name"];
  v19 = v18;
  if (v18)
  {
    v20 = v18;

    v11 = v20;
  }
  v21 = [v14 stringForKey:@"private_container_environment"];
  v22 = v21;
  uint64_t v23 = v7;
  if (v21) {
    uint64_t v23 = [v21 isEqualToString:@"production"];
  }
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)[[NSString alloc] initWithFormat:@"must have a content container identifier"];
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCContextConfiguration initWithEnvironment:]";
    __int16 v32 = 2080;
    v33 = "FCContextConfiguration.m";
    __int16 v34 = 1024;
    int v35 = 179;
    __int16 v36 = 2114;
    v37 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12) {
      goto LABEL_21;
    }
  }
  else if (v12)
  {
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)[[NSString alloc] initWithFormat:@"must have a private container identifier"];
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCContextConfiguration initWithEnvironment:]";
    __int16 v32 = 2080;
    v33 = "FCContextConfiguration.m";
    __int16 v34 = 1024;
    int v35 = 180;
    __int16 v36 = 2114;
    v37 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_21:
  v24 = [(FCContextConfiguration *)v28 initWithProductionContentEnvironment:v7 productionPrivateDataEnvironment:v23 contentContainerIdentifier:v13 privateDataContainerIdentifier:v12 privateDataSecureContainerIdentifier:v11 storeFrontID:v29 environment:a3];

  return v24;
}

- (FCContextConfiguration)initWithProductionContentEnvironment:(BOOL)a3 productionPrivateDataEnvironment:(BOOL)a4 contentContainerIdentifier:(id)a5 privateDataContainerIdentifier:(id)a6 privateDataSecureContainerIdentifier:(id)a7 storeFrontID:(id)a8 environment:(int64_t)a9
{
  BOOL v12 = a4;
  BOOL v13 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v39 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContainerIdentifier");
    *(_DWORD *)buf = 136315906;
    v42 = "-[FCContextConfiguration initWithProductionContentEnvironment:productionPrivateDataEnvironment:contentContaine"
          "rIdentifier:privateDataContainerIdentifier:privateDataSecureContainerIdentifier:storeFrontID:environment:]";
    __int16 v43 = 2080;
    v44 = "FCContextConfiguration.m";
    __int16 v45 = 1024;
    int v46 = 43;
    __int16 v47 = 2114;
    v48 = v36;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataContainerIdentifier");
    *(_DWORD *)buf = 136315906;
    v42 = "-[FCContextConfiguration initWithProductionContentEnvironment:productionPrivateDataEnvironment:contentContaine"
          "rIdentifier:privateDataContainerIdentifier:privateDataSecureContainerIdentifier:storeFrontID:environment:]";
    __int16 v43 = 2080;
    v44 = "FCContextConfiguration.m";
    __int16 v45 = 1024;
    int v46 = 44;
    __int16 v47 = 2114;
    v48 = v37;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v40.receiver = self;
  v40.super_class = (Class)FCContextConfiguration;
  v18 = [(FCContextConfiguration *)&v40 init];
  v19 = v18;
  if (v18)
  {
    v18->_environment = a9;
    v18->_isProductionContentEnvironment = v13;
    v18->_isProductionPrivateDataEnvironment = v12;
    uint64_t v20 = [v15 copy];
    contentContainerIdentifier = v19->_contentContainerIdentifier;
    v19->_contentContainerIdentifier = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    privateDataContainerIdentifier = v19->_privateDataContainerIdentifier;
    v19->_privateDataContainerIdentifier = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    privateDataSecureContainerIdentifier = v19->_privateDataSecureContainerIdentifier;
    v19->_privateDataSecureContainerIdentifier = (NSString *)v24;

    if (v13) {
      v26 = @"production";
    }
    else {
      v26 = @"sandbox";
    }
    v27 = NSString;
    v28 = v26;
    v29 = v28;
    if (v39) {
      [v27 stringWithFormat:@"%@-%@-%@", v15, v28, v39];
    }
    else {
    uint64_t v30 = [v27 stringWithFormat:@"%@-%@", v15, v28, v38];
    }
    contentContainerCombinationIdentifier = v19->_contentContainerCombinationIdentifier;
    v19->_contentContainerCombinationIdentifier = (NSString *)v30;

    if (v12) {
      __int16 v32 = @"production";
    }
    else {
      __int16 v32 = @"sandbox";
    }
    uint64_t v33 = [NSString stringWithFormat:@"%@-%@-%@", v15, v16, v32];
    privateDataContainerCombinationIdentifier = v19->_privateDataContainerCombinationIdentifier;
    v19->_privateDataContainerCombinationIdentifier = (NSString *)v33;
  }
  return v19;
}

- (NSString)contentContainerCombinationIdentifier
{
  return self->_contentContainerCombinationIdentifier;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSString)privateDataSecureContainerIdentifier
{
  return self->_privateDataSecureContainerIdentifier;
}

- (NSString)privateDataContainerIdentifier
{
  return self->_privateDataContainerIdentifier;
}

- (BOOL)isProductionPrivateDataEnvironment
{
  return self->_isProductionPrivateDataEnvironment;
}

- (NSString)contentContainerIdentifier
{
  return self->_contentContainerIdentifier;
}

- (BOOL)isProductionContentEnvironment
{
  return self->_isProductionContentEnvironment;
}

- (FCContextConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCContextConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCContextConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCContextConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSString)contentEnvironmentDescription
{
  int64_t v2 = [(FCContextConfiguration *)self environment];
  if ((unint64_t)(v2 - 1) > 7) {
    return (NSString *)@"production";
  }
  else {
    return &off_1E5B57000[v2 - 1]->isa;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataContainerCombinationIdentifier, 0);
  objc_storeStrong((id *)&self->_privateDataSecureContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_privateDataContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_contentContainerCombinationIdentifier, 0);
  objc_storeStrong((id *)&self->_contentContainerIdentifier, 0);
}

@end