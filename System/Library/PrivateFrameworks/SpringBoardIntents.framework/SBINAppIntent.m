@interface SBINAppIntent
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (SBINAppIntent)initWithIdentifier:(id)a3 systemContext:(id)a4;
- (SBINAppIntentSystemContext)systemContext;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBINAppIntent

- (SBINAppIntent)initWithIdentifier:(id)a3 systemContext:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SBINAppIntent initWithIdentifier:systemContext:](a2, (uint64_t)self, (uint64_t)v14);
    }
LABEL_11:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25E3AEB78);
  }
  v10 = v9;
  if (!v9)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemContext != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SBINAppIntent initWithIdentifier:systemContext:](a2, (uint64_t)self, (uint64_t)v14);
    }
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)SBINAppIntent;
  v11 = [(SBINAppIntent *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_systemContext, a4);
  }

  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5 = a3;
  [v5 appendString:self->_identifier withName:@"identifier"];
  id v4 = (id)[v5 appendObject:self->_systemContext withName:@"systemContext"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBINAppIntent *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      if (BSEqualStrings()) {
        char v8 = BSEqualObjects();
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(SBINAppIntentSystemContext *)self->_systemContext hash] ^ v3;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SBINAppIntentSystemContext)systemContext
{
  return self->_systemContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(uint64_t)a3 systemContext:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBINAppIntent.m";
  __int16 v10 = 1024;
  int v11 = 19;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_25E3AC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)initWithIdentifier:(uint64_t)a3 systemContext:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBINAppIntent.m";
  __int16 v10 = 1024;
  int v11 = 20;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_25E3AC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end