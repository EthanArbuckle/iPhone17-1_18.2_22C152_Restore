@interface NSTimeZone(ReminderKitAdditions)
+ (uint64_t)remDebugTimeZone_GMT;
+ (uint64_t)remDebugTimeZone_LosAngeles;
+ (uint64_t)remDebugTimeZone_NewYork;
- (uint64_t)rem_isEquivalentTo:()ReminderKitAdditions;
@end

@implementation NSTimeZone(ReminderKitAdditions)

- (uint64_t)rem_isEquivalentTo:()ReminderKitAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  id v6 = v4;
  v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    if ([v5 isEqualToTimeZone:v6])
    {
      uint64_t v8 = 1;
    }
    else
    {
      v9 = [v5 name];
      unint64_t v10 = [v9 length];
      if (v10 >= 0x3F) {
        uint64_t v11 = 63;
      }
      else {
        uint64_t v11 = v10;
      }
      objc_msgSend(v9, "getCharacters:range:", v18, 0, v11);
      v18[v11] = 0;

      v12 = [v7 name];
      unint64_t v13 = [v12 length];
      if (v13 >= 0x3F) {
        uint64_t v14 = 63;
      }
      else {
        uint64_t v14 = v13;
      }
      objc_msgSend(v12, "getCharacters:range:", v17, 0, v14);
      v17[v14] = 0;

      *(_DWORD *)s2 = 0;
      ucal_getCanonicalTimeZoneID();
      ucal_getCanonicalTimeZoneID();
      uint64_t v8 = 0;
    }
  }

  return v8;
}

+ (uint64_t)remDebugTimeZone_LosAngeles
{
  return [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Los_Angeles"];
}

+ (uint64_t)remDebugTimeZone_NewYork
{
  return [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
}

+ (uint64_t)remDebugTimeZone_GMT
{
  return [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
}

@end