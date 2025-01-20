@interface PXApplicationDisabledIdleTimerToken
- (NSString)reason;
- (PXApplicationDisabledIdleTimerToken)init;
- (PXApplicationDisabledIdleTimerToken)initWithReason:(id)a3 powerAssertionID:(unsigned int)a4;
- (id)description;
- (unsigned)powerAssertionID;
@end

@implementation PXApplicationDisabledIdleTimerToken

- (void).cxx_destruct
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (NSString)reason
{
  return self->_reason;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXApplicationDisabledIdleTimerToken *)self reason];
  v6 = (void *)[v3 initWithFormat:@"<%@ %p; reason: %@>", v4, self, v5];

  return v6;
}

- (PXApplicationDisabledIdleTimerToken)initWithReason:(id)a3 powerAssertionID:(unsigned int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXApplicationDisabledIdleTimerToken;
  v7 = [(PXApplicationDisabledIdleTimerToken *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    reason = v7->_reason;
    v7->_reason = (NSString *)v8;

    v7->_powerAssertionID = a4;
  }

  return v7;
}

- (PXApplicationDisabledIdleTimerToken)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXApplicationState.m", 320, @"%s is not available as initializer", "-[PXApplicationDisabledIdleTimerToken init]");

  abort();
}

@end