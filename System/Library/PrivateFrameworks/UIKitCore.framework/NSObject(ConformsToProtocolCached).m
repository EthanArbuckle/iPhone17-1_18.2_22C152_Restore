@interface NSObject(ConformsToProtocolCached)
- (uint64_t)conformsToProtocolCached:()ConformsToProtocolCached;
@end

@implementation NSObject(ConformsToProtocolCached)

- (uint64_t)conformsToProtocolCached:()ConformsToProtocolCached
{
  id v4 = a3;
  if (qword_1EB261400 != -1) {
    dispatch_once(&qword_1EB261400, &__block_literal_global_294);
  }
  v5 = [[_ConformsToProtocolCachedKey alloc] initWithObject:a1 protocol:v4];
  v6 = [(id)_MergedGlobals_1100 objectForKey:v5];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v8 = [a1 conformsToProtocol:v4];
    v9 = (void *)_MergedGlobals_1100;
    v10 = [NSNumber numberWithBool:v8];
    [v9 setObject:v10 forKey:v5];
  }
  return v8;
}

@end