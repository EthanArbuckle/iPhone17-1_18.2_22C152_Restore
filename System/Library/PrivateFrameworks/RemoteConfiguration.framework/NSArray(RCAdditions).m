@interface NSArray(RCAdditions)
- (BOOL)rc_containsObjectPassingTest:()RCAdditions;
- (id)rc_arrayByTransformingWithBlock:()RCAdditions;
- (id)rc_arrayByTransformingWithBlockWithIndex:()RCAdditions;
- (id)rc_firstObjectPassingTest:()RCAdditions;
- (uint64_t)rc_description;
@end

@implementation NSArray(RCAdditions)

- (BOOL)rc_containsObjectPassingTest:()RCAdditions
{
  v1 = objc_msgSend(a1, "rc_firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)rc_firstObjectPassingTest:()RCAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSArray(RCAdditions) rc_firstObjectPassingTest:]();
  }
  v5 = [a1 objectEnumerator];
  v6 = objc_msgSend(v5, "rc_firstObjectPassingTest:", v4);

  return v6;
}

- (uint64_t)rc_description
{
  return [a1 componentsJoinedByString:@", "];
}

- (id)rc_arrayByTransformingWithBlock:()RCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_RCAdditions__rc_arrayByTransformingWithBlock___block_invoke;
  v8[3] = &unk_1E5B76240;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "rc_arrayByTransformingWithBlockWithIndex:", v8);

  return v6;
}

- (id)rc_arrayByTransformingWithBlockWithIndex:()RCAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__NSArray_RCAdditions__rc_arrayByTransformingWithBlockWithIndex___block_invoke;
  v11[3] = &unk_1E5B76218;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (void)rc_firstObjectPassingTest:()RCAdditions .cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
  *(_DWORD *)buf = 136315906;
  BOOL v2 = "-[NSArray(RCAdditions) rc_firstObjectPassingTest:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Categories/NSArray+RCAdditions.m";
  __int16 v5 = 1024;
  int v6 = 18;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end