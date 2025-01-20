@interface _UIActivityDiscoveryContext
+ (BOOL)supportsSecureCoding;
+ (id)contextFromExtensionItem:(id)a3;
- (NSArray)activityItemValueExtensionMatchingDictionaries;
- (_UIActivityDiscoveryContext)initWithCoder:(id)a3;
- (id)newExtensionItem;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3;
@end

@implementation _UIActivityDiscoveryContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contextFromExtensionItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 userInfo];

  v7 = [v6 objectForKeyedSubscript:@"_UIActivityViewDiscoveryContextKey"];
  v8 = [v3 unarchivedObjectOfClass:v5 fromData:v7 error:0];

  return v8;
}

- (_UIActivityDiscoveryContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIActivityDiscoveryContext;
  uint64_t v5 = [(_UIActivityDiscoveryContext *)&v11 init];
  if (v5)
  {
    v6 = _UISecureStandardPropertyListClasses();
    v7 = NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
    uint64_t v8 = [v4 decodeObjectOfClasses:v6 forKey:v7];
    activityItemValueExtensionMatchingDictionaries = v5->_activityItemValueExtensionMatchingDictionaries;
    v5->_activityItemValueExtensionMatchingDictionaries = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  activityItemValueExtensionMatchingDictionaries = self->_activityItemValueExtensionMatchingDictionaries;
  id v4 = a3;
  NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:activityItemValueExtensionMatchingDictionaries forKey:v5];
}

- (id)newExtensionItem
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  v6 = @"_UIActivityViewDiscoveryContextKey";
  v7[0] = v2;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 setUserInfo:v4];

  return v3;
}

- (NSArray)activityItemValueExtensionMatchingDictionaries
{
  return self->_activityItemValueExtensionMatchingDictionaries;
}

- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end