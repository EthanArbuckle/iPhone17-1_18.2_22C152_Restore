@interface NSException(SFUtilityAdditions)
+ (uint64_t)errnoRaise:()SFUtilityAdditions format:;
- (uint64_t)localErrno;
@end

@implementation NSException(SFUtilityAdditions)

+ (uint64_t)errnoRaise:()SFUtilityAdditions format:
{
  id v11 = (id)[[NSString alloc] initWithFormat:a4 arguments:&a9];
  v12 = NSString;
  v13 = __error();
  uint64_t v14 = [v12 stringWithFormat:@"%@: %s", v11, strerror(*v13)];
  return objc_msgSend((id)objc_msgSend(a1, "exceptionWithName:reason:userInfo:", a3, v14, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", *__error()), @"SFUFileUtilsErrnoKey")), "raise");
}

- (uint64_t)localErrno
{
  uint64_t v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", @"SFUFileUtilsErrnoKey");
  if (!v1) {
    return 0;
  }
  v2 = (void *)v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v2 intValue];
}

@end