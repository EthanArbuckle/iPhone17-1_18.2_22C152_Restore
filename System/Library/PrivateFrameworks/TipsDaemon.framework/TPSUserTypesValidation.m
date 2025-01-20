@interface TPSUserTypesValidation
+ (BOOL)isBetaBuild;
+ (BOOL)isInternalBuild;
+ (BOOL)isUserMatchingType:(id)a3;
- (TPSUserTypesValidation)initWithTargetUserTypes:(id)a3 excludeUserTypes:(id)a4;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSUserTypesValidation

+ (BOOL)isBetaBuild
{
  v2 = objc_opt_class();

  return [v2 isUserMatchingType:@"Beta"];
}

+ (BOOL)isInternalBuild
{
  v2 = objc_opt_class();

  return [v2 isUserMatchingType:@"Internal"];
}

+ (BOOL)isUserMatchingType:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAF450];
  id v4 = a3;
  v5 = [v3 releaseType];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)MGCopyAnswer();
  }
  v8 = v7;

  char v9 = [v8 isEqualToString:v4];
  return v9;
}

- (TPSUserTypesValidation)initWithTargetUserTypes:(id)a3 excludeUserTypes:(id)a4
{
  id v6 = a4;
  id v7 = [a3 valueForKeyPath:@"lowercaseString"];
  v8 = [v6 valueForKeyPath:@"lowercaseString"];

  v11.receiver = self;
  v11.super_class = (Class)TPSUserTypesValidation;
  char v9 = [(TPSInclusivityValidation *)&v11 initWithTargetValues:v7 excludeValues:v8];

  return v9;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(TPSUserTypesValidation *)self targetUserTypes];
  if ([v5 count])
  {

LABEL_4:
    v8 = [MEMORY[0x1E4FAF3F8] sharedInstance];
    unint64_t v9 = [v8 userType];

    if (v9 > 2) {
      v10 = 0;
    }
    else {
      v10 = off_1E6E6C978[v9];
    }
    objc_super v11 = [(__CFString *)v10 lowercaseString];
    v12 = [(TPSUserTypesValidation *)self targetUserTypes];
    if ([v12 count])
    {
      v13 = [(TPSUserTypesValidation *)self targetUserTypes];
      int v14 = [v13 containsObject:v11];
    }
    else
    {
      int v14 = 1;
    }

    v15 = [(TPSUserTypesValidation *)self excludeUserTypes];
    int v16 = [v15 containsObject:v11];

    uint64_t v17 = v14 & (v16 ^ 1u);
    v18 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [(TPSUserTypesValidation *)self targetUserTypes];
      v22 = [v21 componentsJoinedByString:@","];
      v23 = [(TPSUserTypesValidation *)self excludeUserTypes];
      v24 = [v23 componentsJoinedByString:@","];
      int v25 = 138413314;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v11;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      v32 = v24;
      __int16 v33 = 1024;
      int v34 = v17;
      _os_log_debug_impl(&dword_1E4492000, v18, OS_LOG_TYPE_DEBUG, "%@ - checking user type: %@, target user types: %@, exclude user types: %@. Valid: %d", (uint8_t *)&v25, 0x30u);
    }
    goto LABEL_13;
  }
  id v6 = [(TPSUserTypesValidation *)self excludeUserTypes];
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_4;
  }
  objc_super v11 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[TPSUserTypesValidation validateWithCompletion:]((uint64_t)self, v11);
  }
  uint64_t v17 = 1;
LABEL_13:

  v4[2](v4, v17, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude user type(s) is specified.", (uint8_t *)&v4, 0xCu);
}

@end