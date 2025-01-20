@interface NSEnumerator(RCAdditions)
- (id)rc_firstObjectPassingTest:()RCAdditions;
@end

@implementation NSEnumerator(RCAdditions)

- (id)rc_firstObjectPassingTest:()RCAdditions
{
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSEnumerator(RCAdditions) rc_firstObjectPassingTest:]();
  }
  v5 = 0;
  do
  {
    v6 = v5;
    v5 = [a1 nextObject];
  }
  while (v5 && !v4[2](v4, v5));

  return v5;
}

- (void)rc_firstObjectPassingTest:()RCAdditions .cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NSEnumerator(RCAdditions) rc_firstObjectPassingTest:]";
  __int16 v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Categories/NSEnumerator+RCAdditions.m";
  __int16 v5 = 1024;
  int v6 = 16;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end