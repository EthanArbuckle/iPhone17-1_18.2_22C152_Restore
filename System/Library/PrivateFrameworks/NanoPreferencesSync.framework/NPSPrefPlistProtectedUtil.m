@interface NPSPrefPlistProtectedUtil
+ (BOOL)isPlistProtectedAtPath:(id)a3;
@end

@implementation NPSPrefPlistProtectedUtil

+ (BOOL)isPlistProtectedAtPath:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NPSPrefPlistProtectedUtil" reason:@"Path cannot be nil" userInfo:0];
    objc_exception_throw(v11);
  }
  id v4 = v3;
  int v5 = open_dprotected_np((const char *)[v4 UTF8String], 0, 0, 1);
  if (v5 == -1)
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else
  {
    int v6 = v5;
    uint64_t v7 = fcntl(v5, 63);
    close(v6);
  }
  NSLog(&cfstr_SProtectionCla.isa, "+[NPSPrefPlistProtectedUtil isPlistProtectedAtPath:]", v4, v7);
  BOOL v9 = v7 != -1 && (int)v7 < 4;

  return v9;
}

@end