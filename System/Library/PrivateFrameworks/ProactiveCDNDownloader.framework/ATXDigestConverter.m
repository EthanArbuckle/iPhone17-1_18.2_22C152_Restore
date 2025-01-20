@interface ATXDigestConverter
+ (id)binToHex:(id)a3;
@end

@implementation ATXDigestConverter

+ (id)binToHex:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", 2 * objc_msgSend(v3, "length"));
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    if ([v5 length])
    {
      unint64_t v7 = 0;
      do
        objc_msgSend(v4, "appendFormat:", @"%02x", *(unsigned __int8 *)(v6 + v7++));
      while (v7 < [v5 length]);
    }
    v8 = (__CFString *)[v4 copy];
  }
  else
  {
    v8 = &stru_26D1C8960;
  }

  return v8;
}

@end