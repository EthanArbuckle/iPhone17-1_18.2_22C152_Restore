@interface NPKRemotePassActionRequest
- (NSString)actionText;
- (NSString)identifier;
- (PKPaymentPassAction)action;
- (id)description;
@end

@implementation NPKRemotePassActionRequest

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)NPKRemotePassActionRequest;
  v3 = [(NPKRemotePassAction *)&v8 description];
  v4 = [(NPKRemotePassActionRequest *)self identifier];
  v5 = [(NPKRemotePassActionRequest *)self action];
  v6 = [v3 stringByAppendingFormat:@" (ID:%@, action:%@)", v4, v5];

  return v6;
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
      v6 = "-[NPKRemotePassActionRequest identifier]";
      __int16 v7 = 2082;
      objc_super v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionRequest.m";
      __int16 v9 = 2048;
      uint64_t v10 = 29;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (PKPaymentPassAction)action
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
      v6 = "-[NPKRemotePassActionRequest action]";
      __int16 v7 = 2082;
      objc_super v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionRequest.m";
      __int16 v9 = 2048;
      uint64_t v10 = 35;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (NSString)actionText
{
  v2 = [(NPKRemotePassActionRequest *)self action];
  BOOL v3 = [v2 title];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 confirmationTitle];
  }
  v6 = v5;

  return (NSString *)v6;
}

@end