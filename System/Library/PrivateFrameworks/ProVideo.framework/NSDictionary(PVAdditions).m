@interface NSDictionary(PVAdditions)
+ (id)objectForKey:()PVAdditions inDictionary:orInDefaultDictionary:;
@end

@implementation NSDictionary(PVAdditions)

+ (id)objectForKey:()PVAdditions inDictionary:orInDefaultDictionary:
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 objectForKeyedSubscript:v7];
  if (!v9)
  {
    v9 = [v8 objectForKeyedSubscript:v7];
  }

  return v9;
}

@end