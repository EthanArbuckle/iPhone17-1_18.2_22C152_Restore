@interface PFPosterPathsAssertion
+ (BOOL)supportsSecureCoding;
- (NSArray)paths;
- (PFPosterPathsAssertion)init;
- (PFPosterPathsAssertion)initWithCoder:(id)a3;
- (PFPosterPathsAssertion)initWithPaths:(id)a3;
- (PFPosterPathsAssertion)initWithPaths:(id)a3 queue:(id)a4 invalidationHandler:(id)a5;
- (id)_initWithPaths:(id)a3 invalidationAction:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateWithResponder:(id)a3;
@end

@implementation PFPosterPathsAssertion

- (PFPosterPathsAssertion)init
{
  return (PFPosterPathsAssertion *)[(PFPosterPathsAssertion *)self _initWithPaths:MEMORY[0x263EFFA68] invalidationAction:0];
}

- (PFPosterPathsAssertion)initWithPaths:(id)a3
{
  return (PFPosterPathsAssertion *)[(PFPosterPathsAssertion *)self _initWithPaths:a3 invalidationAction:0];
}

- (PFPosterPathsAssertion)initWithPaths:(id)a3 queue:(id)a4 invalidationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPathsAssertion initWithPaths:queue:invalidationHandler:]();
    }
LABEL_9:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08DE28);
  }
  if (!v10)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"invalidationHandler"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPathsAssertion initWithPaths:queue:invalidationHandler:]();
    }
    goto LABEL_9;
  }
  v11 = (void *)MEMORY[0x263F29BB8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__PFPosterPathsAssertion_initWithPaths_queue_invalidationHandler___block_invoke;
  v18[3] = &unk_26546EC70;
  id v19 = v10;
  id v12 = v10;
  v13 = [v11 responderWithHandler:v18];
  [v13 setQueue:v9];
  v14 = (void *)[objc_alloc(MEMORY[0x263F29BB0]) initWithInfo:0 responder:v13];
  v15 = [(PFPosterPathsAssertion *)self _initWithPaths:v8 invalidationAction:v14];

  return v15;
}

void __66__PFPosterPathsAssertion_initWithPaths_queue_invalidationHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 info];
  v4 = [v3 objectForSetting:1];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v8 invalidate];
}

- (id)_initWithPaths:(id)a3 invalidationAction:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v8)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPathsAssertion _initWithPaths:invalidationAction:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08E238);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterPathsAssertion _initWithPaths:invalidationAction:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08E29CLL);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v24 + 1) + 8 * v13);
        NSClassFromString(&cfstr_Pfposterpath.isa);
        if (!v14)
        {
          id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[PFPosterPathsAssertion _initWithPaths:invalidationAction:]();
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x25A08E170);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterPathClass]"];
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[PFPosterPathsAssertion _initWithPaths:invalidationAction:]();
          }
          [v20 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x25A08E1D4);
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  v23.receiver = self;
  v23.super_class = (Class)PFPosterPathsAssertion;
  v15 = [(PFPosterPathsAssertion *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v9 copy];
    paths = v15->_paths;
    v15->_paths = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_invalidationAction, a4);
  }

  return v15;
}

- (void)invalidateWithResponder:(id)a3
{
  id v9 = a3;
  if (v9 && (v4 = self->_invalidationAction) != 0 && [(BSAction *)v4 canSendResponse])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F29BB0]) initWithInfo:0 responder:v9];
    id v6 = objc_alloc_init(MEMORY[0x263F29C78]);
    [v6 setObject:v5 forSetting:1];
    invalidationAction = self->_invalidationAction;
    id v8 = [MEMORY[0x263F29BC0] responseWithInfo:v6];
    [(BSAction *)invalidationAction sendResponse:v8];
  }
  else
  {
    [(BSAction *)self->_invalidationAction invalidate];
    [v9 annul];
  }
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = MEMORY[0x25A2F4550]([(BSAction *)self->_invalidationAction canSendResponse]);
  id v7 = [v3 stringWithFormat:@"<%@:%p expectsResponse=%@> {", v5, self, v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_paths;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"\n\t%@", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [v7 appendString:@"\n}"];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PFPosterPathsAssertion)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"p"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v9);
      }
      if (!--v11)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
  long long v14 = [(PFPosterPathsAssertion *)self _initWithPaths:v9 invalidationAction:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_paths forKey:@"p"];
  invalidationAction = self->_invalidationAction;
  if (invalidationAction) {
    [v5 encodeObject:invalidationAction forKey:@"i"];
  }
}

- (NSArray)paths
{
  return self->_paths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationAction, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)initWithPaths:queue:invalidationHandler:.cold.1()
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

- (void)initWithPaths:queue:invalidationHandler:.cold.2()
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

- (void)_initWithPaths:invalidationAction:.cold.1()
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

- (void)_initWithPaths:invalidationAction:.cold.2()
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