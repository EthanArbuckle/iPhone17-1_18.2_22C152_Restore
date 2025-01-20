@interface NSError(NRSafeDescription)
- (id)nr_filteredError;
- (id)nr_safeDescription;
@end

@implementation NSError(NRSafeDescription)

- (id)nr_safeDescription
{
  if (_NRIsInternalInstall___onceToken != -1) {
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  }
  if (_NRIsInternalInstall___internalInstall)
  {
    v2 = [a1 description];
  }
  else
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [a1 code];
    v7 = [a1 domain];
    v2 = [v3 stringWithFormat:@"class=%@ code=%lld domain=%@", v5, v6, v7];
  }

  return v2;
}

- (id)nr_filteredError
{
  uint64_t v2 = MEMORY[0x1E4F28C58];
  v3 = [a1 userInfo];
  v4 = +[NSError nr_filteredPlistDictionary:](v2, v3);

  v5 = [a1 userInfo];

  if (v4 == v5)
  {
    id v8 = a1;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = [a1 domain];
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, objc_msgSend(a1, "code"), v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end