@interface NSException(PSYSafeDescription)
- (id)psy_safeDescription;
@end

@implementation NSException(PSYSafeDescription)

- (id)psy_safeDescription
{
  if (_IsInternalInstall___onceToken != -1) {
    dispatch_once(&_IsInternalInstall___onceToken, &__block_literal_global_3);
  }
  if (_IsInternalInstall___internalInstall)
  {
    v2 = [a1 description];
  }
  else
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [a1 name];
    v7 = [a1 reason];
    v2 = [v3 stringWithFormat:@"class=%@ name=%@ reason=%@", v5, v6, v7];
  }

  return v2;
}

@end