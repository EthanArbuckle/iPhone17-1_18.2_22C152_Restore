@interface NSPersistentHistoryToken(RCKeyedArchiving)
+ (id)rc_unarchivedTokenWithData:()RCKeyedArchiving;
- (uint64_t)rc_archiveToken;
@end

@implementation NSPersistentHistoryToken(RCKeyedArchiving)

+ (id)rc_unarchivedTokenWithData:()RCKeyedArchiving
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = a3;
    v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)rc_archiveToken
{
  return [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
}

@end