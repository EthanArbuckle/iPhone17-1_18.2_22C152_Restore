@interface NSString(WiFiKitUI)
- (BOOL)isEmpty;
- (BOOL)isValidIPv4Address;
- (BOOL)isValidSubnetMask;
- (id)formattedWiFiAddress;
- (id)placeholderStringWithMaxCharacters:()WiFiKitUI;
@end

@implementation NSString(WiFiKitUI)

- (BOOL)isEmpty
{
  v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)isValidIPv4Address
{
  int v3 = 0;
  return inet_pton(2, (const char *)[a1 cStringUsingEncoding:4], &v3) == 1
      && (v3 - 1) < 0xFFFFFFFE;
}

- (BOOL)isValidSubnetMask
{
  int v2 = 0;
  return inet_pton(2, (const char *)[a1 cStringUsingEncoding:4], &v2) == 1;
}

- (id)formattedWiFiAddress
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v1 = [a1 componentsSeparatedByString:@":"];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1;
    v20 = __Block_byref_object_dispose__1;
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__NSString_WiFiKitUI__formattedWiFiAddress__block_invoke;
    v15[3] = &unk_264756730;
    v15[4] = &v16;
    [v1 enumerateObjectsUsingBlock:v15];
    int v2 = [(id)v17[5] firstObject];
    [(id)v17[5] removeObjectAtIndex:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = (id)v17[5];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        v7 = v2;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          v8 = [NSString stringWithFormat:@":%@", *(void *)(*((void *)&v11 + 1) + 8 * v6)];
          int v2 = [v7 stringByAppendingString:v8];

          ++v6;
          v7 = v2;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v22 count:16];
      }
      while (v4);
    }

    v9 = [v2 uppercaseString];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)placeholderStringWithMaxCharacters:()WiFiKitUI
{
  uint64_t v3 = a3;
  if ([a1 length] < a3) {
    uint64_t v3 = [a1 length];
  }
  for (i = [MEMORY[0x263F089D8] string];
    objc_msgSend(i, "appendFormat:", @"%C", 63386);
  return i;
}

@end