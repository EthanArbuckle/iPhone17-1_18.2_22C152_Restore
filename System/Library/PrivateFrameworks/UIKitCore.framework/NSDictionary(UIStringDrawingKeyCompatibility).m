@interface NSDictionary(UIStringDrawingKeyCompatibility)
- (id)_ui_attributesForDictionaryContainingUIStringDrawingKeys;
- (uint64_t)_ui_dictionaryContainsUIStringDrawingKeys;
@end

@implementation NSDictionary(UIStringDrawingKeyCompatibility)

- (id)_ui_attributesForDictionaryContainingUIStringDrawingKeys
{
  v2 = (void *)[a1 allKeys];
  if ([v2 containsObject:@"Font"]
    && (uint64_t v3 = *(void *)off_1E52D2040, ([v2 containsObject:*(void *)off_1E52D2040] & 1) == 0))
  {
    id v4 = (id)[a1 mutableCopy];
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a1, "valueForKey:", @"Font"), v3);
  }
  else
  {
    id v4 = 0;
  }
  if ([v2 containsObject:@"TextColor"])
  {
    uint64_t v5 = *(void *)off_1E52D2048;
    if (([v2 containsObject:*(void *)off_1E52D2048] & 1) == 0)
    {
      if (!v4) {
        id v4 = (id)[a1 mutableCopy];
      }
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a1, "valueForKey:", @"TextColor"), v5);
    }
  }
  if (([v2 containsObject:@"TextShadowColor"] & 1) != 0
    || [v2 containsObject:@"TextShadowOffset"])
  {
    uint64_t v6 = *(void *)off_1E52D2238;
    if (([v2 containsObject:*(void *)off_1E52D2238] & 1) == 0)
    {
      if (!v4) {
        id v4 = (id)[a1 mutableCopy];
      }
      id v7 = objc_alloc_init((Class)off_1E52D2E28);
      if ([v2 containsObject:@"TextShadowColor"]) {
        objc_msgSend(v7, "setShadowColor:", objc_msgSend(a1, "valueForKey:", @"TextShadowColor"));
      }
      if ([v2 containsObject:@"TextShadowOffset"])
      {
        objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"TextShadowOffset"), "CGSizeValue");
        objc_msgSend(v7, "setShadowOffset:");
      }
      [v4 setValue:v7 forKey:v6];
    }
  }
  if (v4) {
    return v4;
  }
  else {
    return a1;
  }
}

- (uint64_t)_ui_dictionaryContainsUIStringDrawingKeys
{
  v1 = (void *)[a1 allKeys];
  if (([v1 containsObject:@"Font"] & 1) != 0
    || ([v1 containsObject:@"TextColor"] & 1) != 0
    || ([v1 containsObject:@"TextShadowColor"] & 1) != 0)
  {
    return 1;
  }
  return [v1 containsObject:@"TextShadowOffset"];
}

@end