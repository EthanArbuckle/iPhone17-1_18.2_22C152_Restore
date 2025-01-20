@interface _HDSPOSTransaction
+ (id)assertionWithIdentifier:(id)a3;
+ (id)assertionWithIdentifier:(id)a3 timeout:(double)a4;
- (NSString)identifier;
- (OS_dispatch_source)timer;
- (OS_os_transaction)transaction;
- (_HDSPOSTransaction)initWithIdentifier:(id)a3 timeout:(double)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (os_unfair_lock_s)transactionLock;
- (unint64_t)signpost_id;
- (void)_locked_release;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)releaseAssertion;
@end

@implementation _HDSPOSTransaction

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

- (_HDSPOSTransaction)initWithIdentifier:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_HDSPOSTransaction;
  v8 = [(_HDSPOSTransaction *)&v28 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_transactionLock._os_unfair_lock_opaque = 0;
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
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_221A52000, v14, OS_SIGNPOST_INTERVAL_BEGIN, signpost_id, "_HDSPOSTransaction", (const char *)&unk_221AE03BD, (uint8_t *)buf, 2u);
      }
    }
    [v7 UTF8String];
    uint64_t v16 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v16;

    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    timer = v9->_timer;
    v9->_timer = (OS_dispatch_source *)v18;

    objc_initWeak(buf, v9);
    v20 = v9->_timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke;
    handler[3] = &unk_2645DA138;
    objc_copyWeak(&v26, buf);
    dispatch_source_set_event_handler(v20, handler);
    v21 = v9->_timer;
    dispatch_time_t v22 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v9->_timer);
    v23 = v9;
    objc_destroyWeak(&v26);
    objc_destroyWeak(buf);
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  p_transactionLock = &self->_transactionLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_transactionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_transactionLock);
}

- (void)releaseAssertion
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38___HDSPOSTransaction_releaseAssertion__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(_HDSPOSTransaction *)self _withLock:v2];
}

- (void)_locked_release
{
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

  id v5 = self->_timer;
  self->_timer = 0;

  v6 = HKSPLogForCategory();
  BOOL v7 = os_signpost_enabled(v6);

  if (v7)
  {
    v8 = HKSPLogForCategory();
    v9 = v8;
    os_signpost_id_t signpost_id = self->_signpost_id;
    if (signpost_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_221A52000, v9, OS_SIGNPOST_INTERVAL_END, signpost_id, "_HDSPOSTransaction", (const char *)&unk_221AE03BD, v11, 2u);
    }
  }
}

- (void)dealloc
{
  [(_HDSPOSTransaction *)self releaseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)_HDSPOSTransaction;
  [(_HDSPOSTransaction *)&v3 dealloc];
}

- (id)succinctDescription
{
  v2 = [(_HDSPOSTransaction *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(_HDSPOSTransaction *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_HDSPOSTransaction *)self descriptionBuilderWithMultilinePrefix:a3];
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

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (os_unfair_lock_s)transactionLock
{
  return self->_transactionLock;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end