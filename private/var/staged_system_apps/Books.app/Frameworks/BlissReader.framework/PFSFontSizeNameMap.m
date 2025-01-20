@interface PFSFontSizeNameMap
+ (double)floatValueForKey:(id)a3;
+ (double)fontSizeForName:(id)a3 parentSize:(double)a4;
+ (id)fontSizeNameMap;
+ (void)addFontSize:(double)a3 forName:(id)a4;
+ (void)initialize;
@end

@implementation PFSFontSizeNameMap

+ (id)fontSizeNameMap
{
  id result = (id)qword_573488;
  if (!qword_573488)
  {
    id result = objc_alloc_init((Class)NSMutableDictionary);
    qword_573488 = (uint64_t)result;
  }
  return result;
}

+ (void)addFontSize:(double)a3 forName:(id)a4
{
  id v6 = [objc_alloc((Class)NSNumber) initWithDouble:a3];
  objc_msgSend(objc_msgSend(a1, "fontSizeNameMap"), "setObject:forKey:", v6, objc_msgSend(a4, "lowercaseString"));
}

+ (void)initialize
{
  [a1 addFontSize:@"xx-small" forName:7.0];
  [a1 addFontSize:@"x-small" forName:8.0];
  [a1 addFontSize:@"small" forName:10.0];
  [a1 addFontSize:@"medium" forName:12.0];
  [a1 addFontSize:@"large" forName:14.0];
  [a1 addFontSize:@"x-large" forName:18.0];

  [a1 addFontSize:@"xx-large" forName:24.0];
}

+ (double)floatValueForKey:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a1, "fontSizeNameMap"), "objectForKey:", a3);
  if (!v3) {
    return -65536.0;
  }

  [v3 doubleValue];
  return result;
}

+ (double)fontSizeForName:(id)a3 parentSize:(double)a4
{
  id v7 = objc_msgSend(objc_msgSend(a1, "fontSizeNameMap"), "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  if (v7)
  {
    [v7 doubleValue];
    return result;
  }
  if (([a3 isEqualToString:@"larger"] & 1) == 0
    && ![a3 isEqualToString:@"smaller"])
  {
    return -65536.0;
  }
  id v9 = [[[PFSFontSizeNameMap fontSizeNameMap] allKeys] sortedArrayUsingSelector:@"compare:"];
  v10 = (char *)(((unint64_t)[v9 count] + 1) >> 1);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    double v12 = 10000000.0;
    do
    {
      [a1 floatValueForKey:[v9 objectAtIndex:v11]];
      double v14 = vabdd_f64(v13, a4);
      if (v14 < v12)
      {
        double v12 = v14;
        v10 = (char *)v11;
      }
      ++v11;
    }
    while (v11 < (unint64_t)[v9 count]);
  }
  if (([a3 isEqualToString:@"larger"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"smaller"])
    {
      if (!v10) {
        return a4 / 1.2;
      }
      v15 = v10 - 1;
      goto LABEL_18;
    }
    return -65536.0;
  }
  if (v10 >= (char *)[v9 count] - 1) {
    return a4 * 1.2;
  }
  v15 = v10 + 1;
LABEL_18:
  id v16 = [v9 objectAtIndex:v15];

  [a1 floatValueForKey:v16];
  return result;
}

@end