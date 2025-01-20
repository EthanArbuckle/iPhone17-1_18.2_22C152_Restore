@interface NSEnumerator(FCAdditions)
- (id)fc_firstObjectPassingTest:()FCAdditions;
@end

@implementation NSEnumerator(FCAdditions)

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSEnumerator(FCAdditions) fc_firstObjectPassingTest:]";
    __int16 v11 = 2080;
    v12 = "NSEnumerator+FCAdditions.m";
    __int16 v13 = 1024;
    int v14 = 15;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
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

@end