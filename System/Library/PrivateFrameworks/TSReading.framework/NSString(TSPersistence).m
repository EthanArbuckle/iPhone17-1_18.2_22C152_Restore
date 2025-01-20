@interface NSString(TSPersistence)
+ (id)tsp_stringForDigest:()TSPersistence length:;
+ (uint64_t)tsp_stringWithExtensionFieldComponent:()TSPersistence;
- (id)tsp_stringByAppendingExtensionFieldComponent:()TSPersistence;
@end

@implementation NSString(TSPersistence)

+ (id)tsp_stringForDigest:()TSPersistence length:
{
  v6 = [MEMORY[0x263F089D8] stringWithCapacity:2 * a4];
  if (a4)
  {
    unint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      objc_msgSend(v6, "appendFormat:", @"%02x", *(unsigned __int8 *)(a3 + v7));
      unint64_t v7 = v8++;
    }
    while (v7 < a4);
  }

  return v6;
}

+ (uint64_t)tsp_stringWithExtensionFieldComponent:()TSPersistence
{
  return objc_msgSend(NSString, "stringWithFormat:", @">%d", a3);
}

- (id)tsp_stringByAppendingExtensionFieldComponent:()TSPersistence
{
  v2 = objc_msgSend(NSString, "tsp_stringWithExtensionFieldComponent:");
  v3 = [a1 stringByAppendingPathComponent:v2];

  return v3;
}

@end