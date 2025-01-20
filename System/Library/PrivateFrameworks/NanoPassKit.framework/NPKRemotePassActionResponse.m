@interface NPKRemotePassActionResponse
- (NSString)identifier;
- (PKCurrencyAmount)currencyAmount;
- (id)description;
- (int)result;
@end

@implementation NPKRemotePassActionResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionResponse;
  v3 = [(NPKRemotePassAction *)&v7 description];
  v4 = [(NPKRemotePassActionResponse *)self identifier];
  v5 = [v3 stringByAppendingFormat:@" (ID:%@, result:%d)", v4, -[NPKRemotePassActionResponse result](self, "result")];

  return v5;
}

- (NSString)identifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "-[NPKRemotePassActionResponse identifier]";
      __int16 v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionResponse.m";
      __int16 v9 = 2048;
      uint64_t v10 = 63;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (int)result
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "-[NPKRemotePassActionResponse result]";
      __int16 v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionResponse.m";
      __int16 v9 = 2048;
      uint64_t v10 = 69;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (PKCurrencyAmount)currencyAmount
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "-[NPKRemotePassActionResponse currencyAmount]";
      __int16 v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionResponse.m";
      __int16 v9 = 2048;
      uint64_t v10 = 75;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

@end