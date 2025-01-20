@interface NSTimeZone(UIKitAdditions)
+ (id)_ui_canonicalTimeZoneNameForTimeZoneName:()UIKitAdditions;
@end

@implementation NSTimeZone(UIKitAdditions)

+ (id)_ui_canonicalTimeZoneNameForTimeZoneName:()UIKitAdditions
{
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 length];
    if (v4 >= 0x3FF) {
      uint64_t v5 = 1023;
    }
    else {
      uint64_t v5 = v4;
    }
    objc_msgSend(v3, "getCharacters:range:", v7, 0, v5);
    v7[v5] = 0;
    ucal_getCanonicalTimeZoneID();
  }

  return 0;
}

@end