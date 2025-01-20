@interface PETLoggingUtils
+ (id)domainStringForEvent:(id)a3 featureId:(id)a4;
+ (id)keyStringForEvent:(id)a3 featureId:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
+ (id)keyStringForStringifiedPairs:(id)a3;
+ (id)messageKeyStringForKey:(id)a3;
+ (void)_pushToBuffer:(id)a3 keyStringForStringifiedPairs:(id)a4;
@end

@implementation PETLoggingUtils

+ (id)keyStringForEvent:(id)a3 featureId:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[@"com.apple.proactive." mutableCopy];
  [v14 appendString:v12];

  [v14 appendString:@"."];
  [v14 appendString:v13];

  if ([v10 count])
  {
    [v14 appendString:@"."];
    [a1 _pushToBuffer:v14 keyStringForStringifiedPairs:v10];
  }
  if ([v11 count])
  {
    [v14 appendString:@"."];
    [a1 _pushToBuffer:v14 keyStringForStringifiedPairs:v11];
  }
  v15 = (void *)[v14 copy];

  return v15;
}

+ (void)_pushToBuffer:(id)a3 keyStringForStringifiedPairs:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    unint64_t v9 = v6 - 1;
    do
    {
      id v10 = [v5 keyAtIndex:v8];
      [v12 appendString:v10];

      [v12 appendString:@":"];
      id v11 = [v5 valueAtIndex:v8];
      [v12 appendString:v11];

      if (v8 < v9) {
        [v12 appendString:@":"];
      }
      ++v8;
    }
    while (v7 != v8);
  }
}

+ (id)messageKeyStringForKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.message", a3];
}

+ (id)domainStringForEvent:(id)a3 featureId:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.proactive", a4, a3];
}

+ (id)keyStringForStringifiedPairs:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [a1 _pushToBuffer:v5 keyStringForStringifiedPairs:v4];

  return v5;
}

@end