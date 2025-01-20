@interface RBSAssertion(PosterFoundation)
+ (id)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:;
+ (id)pf_migrationRuntimeAssertionWithExplanation:()PosterFoundation;
+ (id)pf_photosPosterUpdateEntitledMemoryAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_posterEditingRuntimeAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_posterRenderingEntitledRuntimeAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_posterRenderingPhotosMemoryHogRuntimeAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_posterRenderingRuntimeAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_posterUpdateEntitledMemoryAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_posterUpdateMemoryAssertionForReason:()PosterFoundation target:auditToken:posterProviderBundleIdentifier:invalidationHandler:;
+ (id)pf_posterUpdateRuntimeAssertionForTarget:()PosterFoundation explanation:;
+ (id)pf_prewarmRuntimeAssertionForTarget:()PosterFoundation explanation:;
+ (uint64_t)pf_posterUpdateRuntimeAssertionForReason:()PosterFoundation target:invalidationHandler:;
+ (uint64_t)pf_prewarmRuntimeAssertionForReason:()PosterFoundation target:invalidationHandler:;
@end

@implementation RBSAssertion(PosterFoundation)

+ (id)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v9;
  NSClassFromString(&cfstr_Rbstarget.isa);
  if (!v13)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
LABEL_40:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08D064);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSTargetClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08D0C8);
  }

  id v14 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v14)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08D12CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08D190);
  }

  if ([v14 isEqualToString:@"PrewarmRuntimeAssertion"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_prewarmRuntimeAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if ([v14 isEqualToString:@"PosterUpdateRuntimeAssertion"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_posterUpdateRuntimeAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if ([v14 isEqualToString:@"PosterUpdateMemoryAssertion"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_posterUpdateEntitledMemoryAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if ([v14 isEqualToString:@"PhotosPosterUpdateMemoryAssertion"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_photosPosterUpdateEntitledMemoryAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if ([v14 isEqualToString:@"Rendering-Nominal"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_posterRenderingRuntimeAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if ([v14 isEqualToString:@"Rendering-Entitled"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_posterRenderingEntitledRuntimeAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if ([v14 isEqualToString:@"Rendering-Photos"])
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_posterRenderingPhotosMemoryHogRuntimeAssertionForTarget:explanation:", v13, v11);
    goto LABEL_21;
  }
  if (![v14 isEqualToString:@"Editing"])
  {
    v18 = [NSString stringWithFormat:@"Unknown assertion identifier: %@", v14];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[RBSAssertion(PosterFoundation) pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
    goto LABEL_40;
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x263F64408], "pf_posterEditingRuntimeAssertionForTarget:explanation:", v13, v11);
LABEL_21:
  v16 = (void *)v15;
  if (v12)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __108__RBSAssertion_PosterFoundation__pf_assertionForTarget_assertionIdentifier_explanation_invalidationHandler___block_invoke;
    v22[3] = &unk_26546EC48;
    id v23 = v12;
    [v16 setInvalidationHandler:v22];
  }
  return v16;
}

+ (uint64_t)pf_prewarmRuntimeAssertionForReason:()PosterFoundation target:invalidationHandler:
{
  return objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", a4, @"PrewarmRuntimeAssertion", a3, a5);
}

+ (uint64_t)pf_posterUpdateRuntimeAssertionForReason:()PosterFoundation target:invalidationHandler:
{
  return objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", a4, @"PosterUpdateRuntimeAssertion", a3, a5);
}

+ (id)pf_posterUpdateMemoryAssertionForReason:()PosterFoundation target:auditToken:posterProviderBundleIdentifier:invalidationHandler:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [a5 valueForEntitlement:@"com.apple.posterkit.enhanced-memory-limits"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 BOOLValue])
  {
    if (PFBundleIdentifierRequiresMemoryHogAssertion(v14)) {
      v17 = @"PhotosPosterUpdateMemoryAssertion";
    }
    else {
      v17 = @"PosterUpdateMemoryAssertion";
    }
    v18 = objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v13, v17, v12, v15);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)pf_prewarmRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"PosterPrewarm"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_migrationRuntimeAssertionWithExplanation:()PosterFoundation
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F64480];
  id v4 = a3;
  v5 = [v3 attributeWithDomain:@"com.apple.posterboard" name:@"Foreground"];
  id v6 = objc_alloc(MEMORY[0x263F64408]);
  id v7 = [MEMORY[0x263F64630] currentProcess];
  v11[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v9 = (void *)[v6 initWithExplanation:v4 target:v7 attributes:v8];

  return v9;
}

+ (id)pf_posterUpdateRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"PosterUpdate"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_posterUpdateEntitledMemoryAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"Updating-Entitled"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_photosPosterUpdateEntitledMemoryAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"Updating-Photos"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_posterEditingRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"Editing"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_posterRenderingRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"Rendering-Nominal"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_posterRenderingEntitledRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"Rendering-Entitled"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (id)pf_posterRenderingPhotosMemoryHogRuntimeAssertionForTarget:()PosterFoundation explanation:
{
  v13[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F64480];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 attributeWithDomain:@"com.apple.posterkit.provider" name:@"Rendering-Photos"];
  id v9 = objc_alloc(MEMORY[0x263F64408]);
  v13[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = (void *)[v9 initWithExplanation:v6 target:v7 attributes:v10];

  return v11;
}

+ (void)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pf_assertionForTarget:()PosterFoundation assertionIdentifier:explanation:invalidationHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end