@interface PBDataDetectorsDetective
+ (id)typeForResult:(id)a3;
- (NSSet)patterns;
- (id)detectedPatternValuesInValue:(id)a3;
@end

@implementation PBDataDetectorsDetective

- (NSSet)patterns
{
  return +[NSSet setWithObjects:@"com.apple.uikit.pasteboard-detection-pattern.dd.phone", @"com.apple.uikit.pasteboard-detection-pattern.dd.link", @"com.apple.uikit.pasteboard-detection-pattern.dd.email", @"com.apple.uikit.pasteboard-detection-pattern.dd.address", @"com.apple.uikit.pasteboard-detection-pattern.dd.event", @"com.apple.uikit.pasteboard-detection-pattern.dd.shipment", @"com.apple.uikit.pasteboard-detection-pattern.dd.flight", @"com.apple.uikit.pasteboard-detection-pattern.dd.money", 0];
}

+ (id)typeForResult:(id)a3
{
  [a3 coreResult];
  switch(DDResultGetCategory())
  {
    case 1u:
      if (DDResultHasType()) {
        id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.email";
      }
      else {
        id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.link";
      }
      break;
    case 2u:
      id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.phone";
      break;
    case 3u:
      id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.address";
      break;
    case 4u:
      id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.event";
      break;
    case 5u:
      if (DDResultHasType())
      {
        id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.flight";
      }
      else if (DDResultHasType())
      {
        id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.shipment";
      }
      else
      {
        id result = 0;
      }
      break;
    case 6u:
      id result = @"com.apple.uikit.pasteboard-detection-pattern.dd.money";
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)detectedPatternValuesInValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v4 = [v3 length]) != 0)
  {
    unint64_t v5 = (unint64_t)v4;
    id v6 = [objc_alloc((Class)DDScannerServiceConfiguration) initWithScannerType:0 passiveIntent:0];
    [v6 setTimeout:DDScannerSmallTimeout];
    if (v5 >= 0x400) {
      uint64_t v7 = 1024;
    }
    else {
      uint64_t v7 = v5;
    }
    v8 = +[DDScannerService scanString:range:configuration:](DDScannerService, "scanString:range:configuration:", v3, 0, v7, v6, v6);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      v11 = 0;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v15 = +[PBDataDetectorsDetective typeForResult:v14];
          if (v15)
          {
            if (v11)
            {
              v16 = [v11 objectForKeyedSubscript:v15];
              v17 = v16;
              if (v16)
              {
                [v16 addObject:v14];
              }
              else
              {
                v18 = +[NSMutableArray arrayWithObject:v14];
                [v11 setObject:v18 forKeyedSubscript:v15];
              }
            }
            else
            {
              v17 = +[NSMutableArray arrayWithObject:v14];
              v11 = +[NSMutableDictionary dictionaryWithObject:v17 forKey:v15];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v11) {
    v19 = v11;
  }
  else {
    v19 = &__NSDictionary0__struct;
  }
  id v20 = v19;

  return v20;
}

@end