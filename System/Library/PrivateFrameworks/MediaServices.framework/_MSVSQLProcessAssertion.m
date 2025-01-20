@interface _MSVSQLProcessAssertion
- (NSString)description;
- (void)invalidate;
@end

@implementation _MSVSQLProcessAssertion

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_name];
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock);
  if (__assertionCount-- <= 1)
  {
    __assertionCount = 0;
    uint32_t v3 = arc4random();
    __assertionInvalidationNonce = v3;
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    v5 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37___MSVSQLProcessAssertion_invalidate__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    uint32_t v7 = v3;
    dispatch_after(v4, v5, block);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
}

@end