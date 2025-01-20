@interface SiriActivityAssertion
- (BOOL)isValid;
- (NSString)identifier;
- (NSString)reason;
- (NSString)reference;
- (SiriActivityAssertion)initWithIdentifier:(id)a3 reference:(id)a4 reason:(id)a5 timestamp:(double)a6 invalidationBlock:(id)a7;
- (double)timestamp;
- (void)dealloc;
- (void)invalidate;
- (void)invalidatedAtTimestamp:(double)a3;
@end

@implementation SiriActivityAssertion

- (SiriActivityAssertion)initWithIdentifier:(id)a3 reference:(id)a4 reason:(id)a5 timestamp:(double)a6 invalidationBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SiriActivityAssertion;
  v16 = [(SiriActivityAssertion *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    reason = v16->_reason;
    v16->_reason = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    reference = v16->_reference;
    v16->_reference = (NSString *)v21;

    v16->_timestamp = a6;
    uint64_t v23 = [v15 copy];
    id invalidationBlock = v16->_invalidationBlock;
    v16->_id invalidationBlock = (id)v23;
  }
  return v16;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_invalidationBlock)
  {
    v3 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      reason = self->_reason;
      *(_DWORD *)buf = 136315650;
      v8 = "-[SiriActivityAssertion dealloc]";
      __int16 v9 = 2112;
      v10 = identifier;
      __int16 v11 = 2112;
      id v12 = reason;
      _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s Deallocated SiriActivityAssertion (identifier=%@, reason=%@) before it was properly invalidated.", buf, 0x20u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SiriActivityAssertion;
  [(SiriActivityAssertion *)&v6 dealloc];
}

- (void)invalidate
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(SiriActivityAssertion *)self invalidatedAtTimestamp:Current];
}

- (void)invalidatedAtTimestamp:(double)a3
{
  id invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v8 = (void (**)(id, SiriActivityAssertion *, double))_Block_copy(invalidationBlock);
    id v6 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;

    double v7 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
    v8[2](v8, self, v7);
  }
}

- (BOOL)isValid
{
  return self->_invalidationBlock != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reference
{
  return self->_reference;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end