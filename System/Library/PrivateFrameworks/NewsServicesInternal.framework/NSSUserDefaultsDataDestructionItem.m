@interface NSSUserDefaultsDataDestructionItem
- (NSSUserDefaultsDataDestructionItem)init;
- (NSSUserDefaultsDataDestructionItem)initWithUserDefaults:(id)a3 domainName:(id)a4 stickyKeys:(id)a5;
- (NSSet)stickyKeys;
- (NSString)domainName;
- (NSUserDefaults)userDefaults;
- (void)setDomainName:(id)a3;
- (void)setStickyKeys:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation NSSUserDefaultsDataDestructionItem

- (NSSUserDefaultsDataDestructionItem)initWithUserDefaults:(id)a3 domainName:(id)a4 stickyKeys:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NSSUserDefaultsDataDestructionItem initWithUserDefaults:domainName:stickyKeys:]();
    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSUserDefaultsDataDestructionItem initWithUserDefaults:domainName:stickyKeys:]();
  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSUserDefaultsDataDestructionItem initWithUserDefaults:domainName:stickyKeys:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)NSSUserDefaultsDataDestructionItem;
  v12 = [(NSSUserDefaultsDataDestructionItem *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    uint64_t v14 = [v10 copy];
    domainName = v13->_domainName;
    v13->_domainName = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    stickyKeys = v13->_stickyKeys;
    v13->_stickyKeys = (NSSet *)v16;
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickyKeys, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (NSSUserDefaultsDataDestructionItem)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSUserDefaultsDataDestructionItem init]";
    __int16 v9 = 2080;
    id v10 = "NSSNewsDataDestruction.m";
    __int16 v11 = 1024;
    int v12 = 30;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NSSUserDefaultsDataDestructionItem init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSSet)stickyKeys
{
  return self->_stickyKeys;
}

- (void)setStickyKeys:(id)a3
{
}

- (void)initWithUserDefaults:domainName:stickyKeys:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"stickyKeys", v6, 2u);
}

- (void)initWithUserDefaults:domainName:stickyKeys:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"domainName", v6, 2u);
}

- (void)initWithUserDefaults:domainName:stickyKeys:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userDefaults", v6, 2u);
}

@end