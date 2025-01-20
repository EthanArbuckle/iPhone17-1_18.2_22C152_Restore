@interface SASyncSyncPromise
+ (id)syncPromise;
- (BOOL)requiresResponse;
- (NSArray)keys;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKeys:(id)a3;
@end

@implementation SASyncSyncPromise

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"SyncPromise";
}

+ (id)syncPromise
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)keys
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"keys"];
}

- (void)setKeys:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end