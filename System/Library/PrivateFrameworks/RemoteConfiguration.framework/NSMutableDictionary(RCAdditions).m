@interface NSMutableDictionary(RCAdditions)
- (void)rc_safelySetObjectAllowingNil:()RCAdditions forKey:;
@end

@implementation NSMutableDictionary(RCAdditions)

- (void)rc_safelySetObjectAllowingNil:()RCAdditions forKey:
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6) {
      [a1 setObject:v6 forKey:v7];
    }
    else {
      [a1 removeObjectForKey:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NSMutableDictionary(RCAdditions) rc_safelySetObjectAllowingNil:forKey:]();
  }
}

- (void)rc_safelySetObjectAllowingNil:()RCAdditions forKey:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"invalid nil value for '%s'"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"key", v6, 2u);
}

@end