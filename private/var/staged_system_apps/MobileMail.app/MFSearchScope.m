@interface MFSearchScope
+ (id)keyFromScopeIndex:(int64_t)a3;
+ (int64_t)indexFromScopeKey:(id)a3;
@end

@implementation MFSearchScope

+ (int64_t)indexFromScopeKey:(id)a3
{
  return [a3 isEqualToString:@"currentMailbox"];
}

+ (id)keyFromScopeIndex:(int64_t)a3
{
  if (a3 == 1) {
    return @"currentMailbox";
  }
  else {
    return @"allMailboxes";
  }
}

@end