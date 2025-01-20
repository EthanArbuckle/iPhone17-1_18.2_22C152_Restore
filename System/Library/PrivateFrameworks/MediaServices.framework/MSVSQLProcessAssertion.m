@interface MSVSQLProcessAssertion
@end

@implementation MSVSQLProcessAssertion

void __37___MSVSQLProcessAssertion_invalidate__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock);
  if (*(_DWORD *)(a1 + 32) == __assertionInvalidationNonce && __assertionCount <= 0 && __assertion != 0)
  {
    v3 = os_log_create("com.apple.amp.MediaServices", "SQL");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "[SQL] Invalidating Process Assertion Timeout", v5, 2u);
    }

    [(id)__assertion invalidate];
    v4 = (void *)__assertion;
    __assertion = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
}

@end