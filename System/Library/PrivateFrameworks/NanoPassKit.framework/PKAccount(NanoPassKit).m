@interface PKAccount(NanoPassKit)
- (uint64_t)npkShouldShowSavingsAccountInfo;
@end

@implementation PKAccount(NanoPassKit)

- (uint64_t)npkShouldShowSavingsAccountInfo
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v2 = [a1 state];
  if (v2 > 5) {
    return 0;
  }
  if (((1 << v2) & 0x31) != 0)
  {
    v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    uint64_t result = 0;
    if (v4)
    {
      v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_opt_class();
        id v8 = v7;
        [a1 state];
        v9 = PKAccountStateToString();
        v10 = NSStringFromBOOL();
        int v18 = 138412802;
        v19 = v7;
        __int16 v20 = 2112;
        v21 = v9;
        __int16 v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %@ account in %@ state. Should show savings: %@", (uint8_t *)&v18, 0x20u);
      }
LABEL_6:

      return 0;
    }
  }
  else if (((1 << v2) & 6) != 0 {
         || ([a1 supportsOneTimeDeposit] & 1) != 0
  }
         || ([a1 supportsOneTimeWithdrawal] & 1) != 0)
  {
    return 1;
  }
  else
  {
    v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    uint64_t result = 0;
    if (v12)
    {
      v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_opt_class();
        id v14 = v13;
        [a1 state];
        v15 = PKAccountStateToString();
        [a1 supportsOneTimeDeposit];
        v16 = NSStringFromBOOL();
        [a1 supportsOneTimeWithdrawal];
        v17 = NSStringFromBOOL();
        int v18 = 138413058;
        v19 = v13;
        __int16 v20 = 2112;
        v21 = v15;
        __int16 v22 = 2112;
        v23 = v16;
        __int16 v24 = 2112;
        v25 = v17;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %@ account in %@ state, supports one time deposit %@, supports one time withdrawal %@.", (uint8_t *)&v18, 0x2Au);
      }
      goto LABEL_6;
    }
  }
  return result;
}

@end