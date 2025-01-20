@interface CNContact(TUHandle)
+ (id)tu_contactHandlesForHandle:()TUHandle;
@end

@implementation CNContact(TUHandle)

+ (id)tu_contactHandlesForHandle:()TUHandle
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
  v5 = [v3 value];
  if ([v5 length]) {
    [v4 addObject:v5];
  }
  v6 = [v3 normalizedValue];
  if ([v6 length]) {
    [v4 addObject:v6];
  }
  v7 = [v4 allObjects];

  return v7;
}

@end