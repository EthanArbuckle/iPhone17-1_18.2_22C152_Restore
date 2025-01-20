@interface MFTriageActionUtilities
+ (BOOL)isActionDestructive:(int64_t)a3;
+ (id)actionKeyForTriageAction:(int64_t)a3;
+ (int64_t)triageActionForActionKey:(id)a3;
@end

@implementation MFTriageActionUtilities

+ (int64_t)triageActionForActionKey:(id)a3
{
  id v3 = a3;
  v4 = sub_10001FE28();
  v5 = [v4 objectForKey:v3];

  if (v5) {
    id v6 = [v5 integerValue];
  }
  else {
    id v6 = 0;
  }

  return (int64_t)v6;
}

+ (id)actionKeyForTriageAction:(int64_t)a3
{
  v4 = sub_10001FE28();
  v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 allKeysForObject:v5];

  if ([v6 count] == (id)1)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isActionDestructive:(int64_t)a3
{
  return a3 == 8;
}

@end