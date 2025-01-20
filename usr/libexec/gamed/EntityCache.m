@interface EntityCache
- (void)deleteWithBagKey:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchWithBagKey:(NSString *)a3 id:(NSString *)a4 completionHandler:(id)a5;
- (void)storeWithBagKey:(NSString *)a3 id:(NSString *)a4 entity:(NSSecureCoding *)a5 expiresAt:(NSDate *)a6 completionHandler:(id)a7;
@end

@implementation EntityCache

- (void)deleteWithBagKey:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)fetchWithBagKey:(NSString *)a3 id:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)storeWithBagKey:(NSString *)a3 id:(NSString *)a4 entity:(NSSecureCoding *)a5 expiresAt:(NSDate *)a6 completionHandler:(id)a7
{
}

@end