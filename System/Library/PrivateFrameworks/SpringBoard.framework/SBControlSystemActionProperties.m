@interface SBControlSystemActionProperties
+ (id)propertiesForControlInstance:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (uint64_t)_initWithViewModel:(void *)a3 control:(void *)a4 descriptor:;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBControlSystemActionProperties

+ (id)propertiesForControlInstance:(uint64_t)a1
{
  id v2 = a2;
  v3 = (objc_class *)self;
  if (v2)
  {
    v4 = objc_msgSend(v2, "sb_viewModel");
    if (v4)
    {
      v5 = [v2 control];
      v6 = [v2 descriptor];
      v7 = (void *)-[SBControlSystemActionProperties _initWithViewModel:control:descriptor:]([v3 alloc], v4, v5, v6);
    }
    else
    {
      v7 = 0;
    }

    return v7;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"controlInstance != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBControlSystemActionProperties propertiesForControlInstance:(uint64_t)v9];
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (uint64_t)_initWithViewModel:(void *)a3 control:(void *)a4 descriptor:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
LABEL_17:

    return (uint64_t)a1;
  }
  if (v7)
  {
    v37.receiver = a1;
    v37.super_class = (Class)SBControlSystemActionProperties;
    a1 = objc_msgSendSuper2(&v37, sel_init);
    if (a1)
    {
      v10 = [v7 title];
      v11 = (void *)[v10 copy];
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = [v9 displayName];
      }
      v14 = (void *)a1[1];
      a1[1] = v13;

      v15 = objc_msgSend(v7, "sb_secondaryText");
      uint64_t v16 = [v15 copy];
      v17 = (void *)a1[2];
      a1[2] = v16;

      uint64_t v18 = objc_msgSend(v7, "sb_secondaryTextColor");
      v19 = (void *)a1[3];
      a1[3] = v18;

      uint64_t v20 = objc_msgSend(v7, "sb_keyColor");
      v21 = (void *)a1[4];
      a1[4] = v20;

      uint64_t v36 = 0;
      v22 = objc_msgSend(v7, "sb_actionHintTextWithType:", &v36);
      if (!v22)
      {
        v22 = [v9 displayName];
        uint64_t v36 = 0;
      }
      uint64_t v23 = [v22 copy];
      v24 = (void *)a1[5];
      a1[5] = v23;

      a1[6] = v36;
      uint64_t v25 = [v7 isRedacted];
      if ([v7 isDisabled]) {
        v25 |= 2uLL;
      }
      int v26 = [v7 hasError];
      uint64_t v27 = v25 | 4;
      if (!v26) {
        uint64_t v27 = v25;
      }
      a1[7] = v27;
      v28 = [v7 accessibilityIdentifier];
      v29 = v28;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        id v30 = [v8 kind];
      }
      v31 = v30;

      uint64_t v32 = [v31 copy];
      v33 = (void *)a1[8];
      a1[8] = v32;
    }
    goto LABEL_17;
  }
  v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"viewModel != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBControlSystemActionProperties _initWithViewModel:control:descriptor:](sel__initWithViewModel_control_descriptor_, (uint64_t)a1, (uint64_t)v35);
  }
  [v35 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SBControlSystemActionProperties_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __64__SBControlSystemActionProperties_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"titleText" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"secondaryText" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 40) withName:@"actionHintText"];
  id v2 = *(void **)(a1 + 32);
  v3 = NSStringFromSBControlSystemActionHintType(*(void *)(*(void *)(a1 + 40) + 48));
  [v2 appendString:v3 withName:@"actionHintType"];

  id v4 = *(void **)(a1 + 32);
  id v5 = NSStringFromSBControlSystemActionAttributes(*(void *)(*(void *)(a1 + 40) + 56));
  [v4 appendString:v5 withName:@"attributes" skipIfEmpty:1];

  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 64) withName:@"accessibilityIdentifier"];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"secondaryTextColor"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"keyColor"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBControlSystemActionProperties *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (BSEqualStrings()
        && BSEqualStrings()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualStrings()
        && self->_actionHintType == v5->_actionHintType
        && self->_attributes == v5->_attributes)
      {
        char v6 = BSEqualStrings();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_titleText hash];
  NSUInteger v4 = [(NSString *)self->_secondaryText hash] ^ v3;
  uint64_t v5 = [(UIColor *)self->_secondaryTextColor hash];
  uint64_t v6 = v4 ^ v5 ^ [(UIColor *)self->_keyColor hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_actionHintText hash] ^ self->_actionHintType ^ self->_attributes;
  return v7 ^ [(NSString *)self->_accessibilityIdentifier hash];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_actionHintText, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

+ (void)propertiesForControlInstance:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBControlSystemActionProperties.m";
  __int16 v10 = 1024;
  int v11 = 84;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_initWithViewModel:(const char *)a1 control:(uint64_t)a2 descriptor:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBControlSystemActionProperties.m";
  __int16 v10 = 1024;
  int v11 = 97;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end