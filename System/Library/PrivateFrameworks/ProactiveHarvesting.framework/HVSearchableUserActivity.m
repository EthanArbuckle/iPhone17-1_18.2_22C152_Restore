@interface HVSearchableUserActivity
+ (id)uniqueIdForPersistentIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CSSearchableItem)searchableItem;
- (HVSearchableUserActivity)initWithUserActivity:(id)a3 searchableItem:(id)a4;
- (NSString)bundleId;
- (NSString)domainId;
- (NSString)uniqueId;
- (NSUserActivity)userActivity;
- (double)absoluteTimestamp;
- (unint64_t)hash;
@end

@implementation HVSearchableUserActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItem, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);

  objc_storeStrong((id *)&self->_persistentIdentifierOrFallback, 0);
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HVSearchableUserActivity *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      userActivity = self->_userActivity;
      v7 = [(HVSearchableUserActivity *)v5 userActivity];
      if ([(NSUserActivity *)userActivity isEqual:v7]
        && [(NSString *)self->_persistentIdentifierOrFallback isEqual:v5->_persistentIdentifierOrFallback])
      {
        searchableItem = self->_searchableItem;
        v9 = [(HVSearchableUserActivity *)v5 searchableItem];
        char v10 = [(CSSearchableItem *)searchableItem isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_persistentIdentifierOrFallback hash];
}

- (NSString)bundleId
{
  return (NSString *)[(CSSearchableItem *)self->_searchableItem bundleID];
}

- (NSString)uniqueId
{
  return (NSString *)+[HVSearchableUserActivity uniqueIdForPersistentIdentifier:self->_persistentIdentifierOrFallback];
}

- (NSString)domainId
{
  return (NSString *)@"__ProactiveHarvesting__.HVSearchableUserActivity";
}

- (double)absoluteTimestamp
{
  v2 = [(CSSearchableItem *)self->_searchableItem attributeSet];
  v3 = [v2 contentCreationDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (HVSearchableUserActivity)initWithUserActivity:(id)a3 searchableItem:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HVSearchableUserActivity;
  v9 = [(HVSearchableUserActivity *)&v19 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userActivity, a3);
    objc_storeStrong((id *)&v10->_searchableItem, a4);
    uint64_t v11 = [v7 persistentIdentifier];
    persistentIdentifierOrFallback = v10->_persistentIdentifierOrFallback;
    v10->_persistentIdentifierOrFallback = (NSString *)v11;

    v13 = v10->_persistentIdentifierOrFallback;
    if (v13)
    {
      v14 = v13;
    }
    else
    {
      char v21 = 0;
      uint64_t __buf = 0;
      arc4random_buf(&__buf, 9uLL);
      v15 = (void *)MEMORY[0x22A6667F0]();
      v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&__buf length:9];
      v14 = [v16 base64EncodedStringWithOptions:0];
    }
    v17 = v10->_persistentIdentifierOrFallback;
    v10->_persistentIdentifierOrFallback = v14;
  }
  return v10;
}

+ (id)uniqueIdForPersistentIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x22A6667F0]();
  double v5 = [@"__ProactiveHarvesting__persistentIdentifier:" stringByAppendingString:v3];

  return v5;
}

@end