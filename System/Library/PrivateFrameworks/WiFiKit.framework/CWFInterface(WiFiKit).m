@interface CWFInterface(WiFiKit)
- (id)supported20MHzChannels;
- (uint64_t)updateKnownNetworkProfile:()WiFiKit OSSpecificAttributes:error:;
- (unint64_t)deviceSupports6E;
@end

@implementation CWFInterface(WiFiKit)

- (id)supported20MHzChannels
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "hardwareSupportedChannels", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 width] == 20) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    v9 = v2;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (uint64_t)updateKnownNetworkProfile:()WiFiKit OSSpecificAttributes:error:
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = [v8 OSSpecificAttributes];
    id v11 = (id)[v10 mutableCopy];

    if (!v11) {
      id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v11 addEntriesFromDictionary:v9];
    [v8 setOSSpecificAttributes:v11];
  }
  uint64_t v12 = [a1 updateKnownNetworkProfile:v8 properties:0 error:a5];

  return v12;
}

- (unint64_t)deviceSupports6E
{
  v2 = [a1 capabilities];
  if ([v2 indexOfObject:&unk_26D9E1E70] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = ((unint64_t)[a1 countryBandSupport] >> 2) & 1;
  }

  return v3;
}

@end