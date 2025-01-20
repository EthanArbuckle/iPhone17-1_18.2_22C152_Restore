@interface TSWPDataDetectors
+ (id)calculateScanRanges:(id)a3 changedRange:(_NSRange)a4;
+ (id)scanString:(id)a3 scanRanges:(id)a4;
+ (void)registerDataDetectorClass:(Class)a3;
@end

@implementation TSWPDataDetectors

+ (void)registerDataDetectorClass:(Class)a3
{
  if (class_conformsToProtocol(a3, (Protocol *)&unk_26D7BCDC8))
  {
    id v4 = (id)gRegisteredDataDetectors;
    if (!gRegisteredDataDetectors)
    {
      id v4 = (id)[MEMORY[0x263EFF980] array];
      gRegisteredDataDetectors = (uint64_t)v4;
    }
    [v4 addObject:a3];
  }
}

+ (id)calculateScanRanges:(id)a3 changedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)gRegisteredDataDetectors;
  uint64_t v8 = [(id)gRegisteredDataDetectors countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "calculateScanRangeForString:changedRange:", a3, location, length);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v13, v14), objc_msgSend(v12, "detectorIdentifier"));
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  return v7;
}

+ (id)scanString:(id)a3 scanRanges:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = (void *)[MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = (void *)gRegisteredDataDetectors;
  uint64_t v8 = [(id)gRegisteredDataDetectors countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(v12, "detectorIdentifier")), "rangeValue");
        if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0)
        {
          uint64_t v16 = objc_msgSend(v12, "scanString:scanRange:", a3, v13, v14);
          if (v16) {
            [v6 addObjectsFromArray:v16];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  return v6;
}

@end