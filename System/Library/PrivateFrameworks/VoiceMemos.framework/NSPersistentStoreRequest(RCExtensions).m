@interface NSPersistentStoreRequest(RCExtensions)
- (void)rc_setAffectedStore:()RCExtensions;
@end

@implementation NSPersistentStoreRequest(RCExtensions)

- (void)rc_setAffectedStore:()RCExtensions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [a1 setAffectedStores:v6];
  }
  else
  {
    [a1 setAffectedStores:0];
  }
}

@end