@interface REMListsDataViewInvocation_debugFetchPhantomLists
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation REMListsDataViewInvocation_debugFetchPhantomLists

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)REMListsDataViewInvocation_debugFetchPhantomLists;
  return [(REMStoreInvocationValueStorage *)&v3 hash];
}

@end