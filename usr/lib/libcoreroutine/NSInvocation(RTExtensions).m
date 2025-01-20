@interface NSInvocation(RTExtensions)
- (uint64_t)blockArgumentIndex;
@end

@implementation NSInvocation(RTExtensions)

- (uint64_t)blockArgumentIndex
{
  v1 = [a1 methodSignature];
  unint64_t v2 = [v1 numberOfArguments];
  if (v2 < 3)
  {
LABEL_5:
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v3 = v2;
    uint64_t v4 = 2;
    while (strcmp((const char *)[v1 getArgumentTypeAtIndex:v4], "@?"))
    {
      if (v3 == ++v4) {
        goto LABEL_5;
      }
    }
  }

  return v4;
}

@end