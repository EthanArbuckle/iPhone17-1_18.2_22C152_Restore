@interface TMSimpleAssertion
- (BOOL)isValid;
- (NSString)identifier;
- (NSString)reason;
- (TMSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5;
- (id)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation TMSimpleAssertion

- (TMSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TMSimpleAssertion;
  v8 = [(TMSimpleAssertion *)&v10 init];
  if (v8)
  {
    v8->_identifier = (NSString *)[a3 copy];
    v8->_reason = (NSString *)[a4 copy];
    atomic_store(0, (unsigned __int8 *)&v8->_invalidated);
    v8->_invalidationBlock = [a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TMSimpleAssertion;
  [(TMSimpleAssertion *)&v2 dealloc];
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (void)invalidate
{
  char v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v2)
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();

    self->_invalidationBlock = 0;
  }
}

- (id)description
{
  return &stru_100089390;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)reason
{
  return self->_reason;
}

@end