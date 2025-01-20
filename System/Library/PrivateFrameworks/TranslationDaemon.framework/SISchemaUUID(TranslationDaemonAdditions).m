@interface SISchemaUUID(TranslationDaemonAdditions)
- (id)ltd_safeUUID;
@end

@implementation SISchemaUUID(TranslationDaemonAdditions)

- (id)ltd_safeUUID
{
  if (objc_opt_respondsToSelector()) {
    [a1 toSafeNSUUID];
  }
  else {
  v2 = [a1 toNSUUID];
  }
  return v2;
}

@end