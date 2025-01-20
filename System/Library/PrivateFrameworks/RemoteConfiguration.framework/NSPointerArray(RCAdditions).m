@interface NSPointerArray(RCAdditions)
- (BOOL)rc_containsObject:()RCAdditions;
- (uint64_t)rc_firstIndexOfObject:()RCAdditions;
@end

@implementation NSPointerArray(RCAdditions)

- (uint64_t)rc_firstIndexOfObject:()RCAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = 0;
    while ((objc_msgSend(v4, "isEqual:", objc_msgSend(a1, "pointerAtIndex:", v5)) & 1) == 0)
    {
      if (++v5 >= (unint64_t)[a1 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)rc_containsObject:()RCAdditions
{
  return objc_msgSend(a1, "rc_firstIndexOfObject:") != 0x7FFFFFFFFFFFFFFFLL;
}

@end