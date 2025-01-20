@interface RBSRunningReasonAttribute(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:;
@end

@implementation RBSRunningReasonAttribute(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if ([v7 runningReason]
    && (uint64_t v9 = [v7 runningReason], v9 != objc_msgSend(a1, "runningReason")))
  {
    v10 = rbs_assertion_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v7 runningReason];
      uint64_t v12 = [a1 runningReason];
      v13 = [v8 assertion];
      int v14 = 134218498;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_226AB3000, v10, OS_LOG_TYPE_ERROR, "Multiple RBSRunningReasonAttribute provided: %lu vs %lu. First one wins, but client should be fixed for assertion %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v7, "setRunningReason:", objc_msgSend(a1, "runningReason"));
  }
}

@end