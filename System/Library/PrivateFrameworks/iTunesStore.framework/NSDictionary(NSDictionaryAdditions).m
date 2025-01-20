@interface NSDictionary(NSDictionaryAdditions)
- (id)objectForKey:()NSDictionaryAdditions matching:;
@end

@implementation NSDictionary(NSDictionaryAdditions)

- (id)objectForKey:()NSDictionaryAdditions matching:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end