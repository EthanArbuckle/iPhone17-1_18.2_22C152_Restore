@interface SBRebootContext
- (BOOL)isDark;
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (SBRebootContext)initWithReason:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDark:(BOOL)a3;
@end

@implementation SBRebootContext

- (SBRebootContext)initWithReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRebootContext;
  v6 = [(SBRebootContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reason, a3);
  }

  return v7;
}

- (id)description
{
  if (self->_isDark) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<SBRebootContext:%p - reason:'%@'; dark:%@>",
               self,
               self->_reason,
               v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  reason = self->_reason;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __27__SBRebootContext_isEqual___block_invoke;
  v20[3] = &unk_1E6AF5180;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:reason counterpart:v20];
  BOOL isDark = self->_isDark;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __27__SBRebootContext_isEqual___block_invoke_2;
  v18[3] = &unk_1E6AF99E8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendBool:isDark counterpart:v18];
  uint64_t fromOTASoftwareUpdate = self->_fromOTASoftwareUpdate;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __27__SBRebootContext_isEqual___block_invoke_3;
  v16[3] = &unk_1E6AF99E8;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendBool:fromOTASoftwareUpdate counterpart:v16];
  LOBYTE(fromOTASoftwareUpdate) = [v5 isEqual];

  return fromOTASoftwareUpdate;
}

id __27__SBRebootContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __27__SBRebootContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
}

uint64_t __27__SBRebootContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[SBRebootContext alloc] initWithReason:self->_reason];
  [(SBRebootContext *)v4 setDark:self->_isDark];
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (void)setDark:(BOOL)a3
{
  self->_BOOL isDark = a3;
}

- (void).cxx_destruct
{
}

@end