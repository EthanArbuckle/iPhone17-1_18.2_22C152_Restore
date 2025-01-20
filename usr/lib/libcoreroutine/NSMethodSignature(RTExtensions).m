@interface NSMethodSignature(RTExtensions)
- (uint64_t)argumentIndexForClass:()RTExtensions;
@end

@implementation NSMethodSignature(RTExtensions)

- (uint64_t)argumentIndexForClass:()RTExtensions
{
  v4 = NSString;
  v5 = NSStringFromClass(aClass);
  v6 = [v4 stringWithFormat:@"@\"%@\"", v5];

  if ([a1 numberOfArguments])
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = a1;
      if (!strcmp((const char *)[v8 getArgumentTypeAtIndex:v7], (const char *)[v6 UTF8String]))break; {
      if (++v7 >= (unint64_t)[v8 numberOfArguments])
      }
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

@end