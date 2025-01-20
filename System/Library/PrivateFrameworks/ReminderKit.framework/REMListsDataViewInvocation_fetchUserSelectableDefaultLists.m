@interface REMListsDataViewInvocation_fetchUserSelectableDefaultLists
+ (BOOL)supportsSecureCoding;
- (BOOL)debug_useInMemoryPreferredDefaultListStorage;
- (BOOL)isEqual:(id)a3;
- (REMListsDataViewInvocation_fetchUserSelectableDefaultLists)initWithCoder:(id)a3;
- (REMListsDataViewInvocation_fetchUserSelectableDefaultLists)initWithDebugUseInMemoryPreferredDefaultListStorage:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDebug_useInMemoryPreferredDefaultListStorage:(BOOL)a3;
@end

@implementation REMListsDataViewInvocation_fetchUserSelectableDefaultLists

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_fetchUserSelectableDefaultLists)initWithDebugUseInMemoryPreferredDefaultListStorage:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMListsDataViewInvocation_fetchUserSelectableDefaultLists;
  result = [(REMStoreInvocationValueStorage *)&v5 init];
  if (result) {
    result->_debug_useInMemoryPreferredDefaultListStorage = a3;
  }
  return result;
}

- (REMListsDataViewInvocation_fetchUserSelectableDefaultLists)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"debug_useInMemoryPreferredDefaultListStorage"];

  return [(REMListsDataViewInvocation_fetchUserSelectableDefaultLists *)self initWithDebugUseInMemoryPreferredDefaultListStorage:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListsDataViewInvocation_fetchUserSelectableDefaultLists debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage"), @"debug_useInMemoryPreferredDefaultListStorage");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(REMListsDataViewInvocation_fetchUserSelectableDefaultLists *)self debug_useInMemoryPreferredDefaultListStorage];
    char v7 = objc_msgSend(v5, "debug_useInMemoryPreferredDefaultListStorage");

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)REMListsDataViewInvocation_fetchUserSelectableDefaultLists;
  id v3 = [(REMStoreInvocationValueStorage *)&v5 hash];
  return (unint64_t)v3
       + [(REMListsDataViewInvocation_fetchUserSelectableDefaultLists *)self debug_useInMemoryPreferredDefaultListStorage];
}

- (BOOL)debug_useInMemoryPreferredDefaultListStorage
{
  return self->_debug_useInMemoryPreferredDefaultListStorage;
}

- (void)setDebug_useInMemoryPreferredDefaultListStorage:(BOOL)a3
{
  self->_debug_useInMemoryPreferredDefaultListStorage = a3;
}

@end