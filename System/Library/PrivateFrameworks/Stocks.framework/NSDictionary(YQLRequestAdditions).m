@interface NSDictionary(YQLRequestAdditions)
- (id)yql_objectForKey:()YQLRequestAdditions ofClass:;
@end

@implementation NSDictionary(YQLRequestAdditions)

- (id)yql_objectForKey:()YQLRequestAdditions ofClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = v1;
  if (v1)
  {
    if (objc_opt_isKindOfClass()) {
      v1 = v2;
    }
    else {
      v1 = 0;
    }
  }
  id v3 = v1;

  return v3;
}

@end