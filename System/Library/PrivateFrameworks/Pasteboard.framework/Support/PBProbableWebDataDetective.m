@interface PBProbableWebDataDetective
- (NSSet)patterns;
- (id)detectedPatternValuesInValue:(id)a3;
@end

@implementation PBProbableWebDataDetective

- (NSSet)patterns
{
  return +[NSSet setWithObjects:@"com.apple.uikit.pasteboard-detection-pattern.probable-web-search", @"com.apple.uikit.pasteboard-detection-pattern.probable-web-url", 0];
}

- (id)detectedPatternValuesInValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((unint64_t)(sub_10001AE3C(v10) - 1) < 2)
        {
          CFStringRef v24 = @"com.apple.uikit.pasteboard-detection-pattern.probable-web-url";
          v25 = v10;
          v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

          goto LABEL_18;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = sub_10001AE3C(v3);
  if ((unint64_t)(v11 - 1) < 2)
  {
    CFStringRef v22 = @"com.apple.uikit.pasteboard-detection-pattern.probable-web-url";
    id v23 = v3;
    v12 = &v23;
    v13 = &v22;
    goto LABEL_17;
  }
  if (v11 && v11 != 3)
  {
LABEL_14:
    v14 = &__NSDictionary0__struct;
    goto LABEL_18;
  }
  CFStringRef v20 = @"com.apple.uikit.pasteboard-detection-pattern.probable-web-search";
  id v21 = v3;
  v12 = &v21;
  v13 = &v20;
LABEL_17:
  v14 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:1];
LABEL_18:

  return v14;
}

@end