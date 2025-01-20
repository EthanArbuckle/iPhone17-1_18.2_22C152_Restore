@interface SBShutdownContext
- (BOOL)fromUserPowerDown;
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (SBShutdownContext)initWithReason:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFromUserPowerDown:(BOOL)a3;
@end

@implementation SBShutdownContext

- (SBShutdownContext)initWithReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBShutdownContext;
  v6 = [(SBShutdownContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reason, a3);
  }

  return v7;
}

- (id)description
{
  if (self->_fromUserPowerDown) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<SBShutdownContext:%p - reason:'%@'; fromUserPowerDown:%@>",
               self,
               self->_reason,
               v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  reason = self->_reason;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __29__SBShutdownContext_isEqual___block_invoke;
  v18[3] = &unk_1E6AF5180;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:reason counterpart:v18];
  uint64_t fromUserPowerDown = self->_fromUserPowerDown;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __29__SBShutdownContext_isEqual___block_invoke_2;
  v16 = &unk_1E6AF99E8;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendBool:fromUserPowerDown counterpart:&v13];
  LOBYTE(fromUserPowerDown) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return fromUserPowerDown;
}

id __29__SBShutdownContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __29__SBShutdownContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[SBShutdownContext alloc] initWithReason:self->_reason];
  [(SBShutdownContext *)v4 setFromUserPowerDown:self->_fromUserPowerDown];
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)fromUserPowerDown
{
  return self->_fromUserPowerDown;
}

- (void)setFromUserPowerDown:(BOOL)a3
{
  self->_uint64_t fromUserPowerDown = a3;
}

- (void).cxx_destruct
{
}

@end