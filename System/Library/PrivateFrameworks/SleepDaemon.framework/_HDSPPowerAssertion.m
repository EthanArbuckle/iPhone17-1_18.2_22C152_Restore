@interface _HDSPPowerAssertion
+ (id)assertionWithIdentifier:(id)a3;
+ (id)assertionWithIdentifier:(id)a3 timeout:(double)a4;
- (NSString)identifier;
- (_HDSPPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (os_unfair_lock_s)assertionLock;
- (unint64_t)signpost_id;
- (unsigned)assertionID;
- (void)_locked_release;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)releaseAssertion;
@end

@implementation _HDSPPowerAssertion

+ (id)assertionWithIdentifier:(id)a3
{
  return (id)[a1 assertionWithIdentifier:a3 timeout:5.0];
}

+ (id)assertionWithIdentifier:(id)a3 timeout:(double)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v5 timeout:a4];

  return v6;
}

- (_HDSPPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  v35[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_HDSPPowerAssertion;
  v8 = [(_HDSPPowerAssertion *)&v27 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_assertionLock._os_unfair_lock_opaque = 0;
    v10 = HKSPLogForCategory();
    v9->_os_signpost_id_t signpost_id = os_signpost_id_generate(v10);

    v11 = HKSPLogForCategory();
    BOOL v12 = os_signpost_enabled(v11);

    if (v12)
    {
      v13 = HKSPLogForCategory();
      v14 = v13;
      os_signpost_id_t signpost_id = v9->_signpost_id;
      if (signpost_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_221A52000, v14, OS_SIGNPOST_INTERVAL_BEGIN, signpost_id, "_HDSPPowerAssertion", (const char *)&unk_221AE03BD, buf, 2u);
      }
    }
    v34[0] = @"AssertType";
    v34[1] = @"AssertName";
    v35[0] = @"PreventUserIdleSystemSleep";
    v35[1] = v7;
    v35[2] = @"TimeoutActionRelease";
    v34[2] = @"TimeoutAction";
    v34[3] = @"TimeoutSeconds";
    v16 = [NSNumber numberWithDouble:a4];
    v35[3] = v16;
    CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

    uint64_t v18 = IOPMAssertionCreateWithProperties(v17, &v9->_assertionID);
    if (v18)
    {
      uint64_t v19 = v18;
      v20 = HKSPLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        v24 = NSNumber;
        id v25 = v23;
        v26 = [v24 numberWithInt:v19];
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        __int16 v30 = 2114;
        v31 = v26;
        __int16 v32 = 2114;
        id v33 = v7;
        _os_log_error_impl(&dword_221A52000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error %{public}@ taking power assert for %{public}@", buf, 0x20u);
      }
    }
    v21 = v9;
  }
  return v9;
}

- (void)_withLock:(id)a3
{
  p_assertionLock = &self->_assertionLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_assertionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_assertionLock);
}

- (void)releaseAssertion
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39___HDSPPowerAssertion_releaseAssertion__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(_HDSPPowerAssertion *)self _withLock:v2];
}

- (void)_locked_release
{
  IOPMAssertionID assertionID = self->_assertionID;
  if (assertionID)
  {
    IOPMAssertionRelease(assertionID);
    self->_IOPMAssertionID assertionID = 0;
    v4 = HKSPLogForCategory();
    BOOL v5 = os_signpost_enabled(v4);

    if (v5)
    {
      v6 = HKSPLogForCategory();
      id v7 = v6;
      os_signpost_id_t signpost_id = self->_signpost_id;
      if (signpost_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)v9 = 0;
        _os_signpost_emit_with_name_impl(&dword_221A52000, v7, OS_SIGNPOST_INTERVAL_END, signpost_id, "_HDSPPowerAssertion", (const char *)&unk_221AE03BD, v9, 2u);
      }
    }
  }
}

- (void)dealloc
{
  [(_HDSPPowerAssertion *)self releaseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)_HDSPPowerAssertion;
  [(_HDSPPowerAssertion *)&v3 dealloc];
}

- (id)succinctDescription
{
  v2 = [(_HDSPPowerAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(_HDSPPowerAssertion *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_HDSPPowerAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)signpost_id
{
  return self->_signpost_id;
}

- (os_unfair_lock_s)assertionLock
{
  return self->_assertionLock;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void).cxx_destruct
{
}

@end