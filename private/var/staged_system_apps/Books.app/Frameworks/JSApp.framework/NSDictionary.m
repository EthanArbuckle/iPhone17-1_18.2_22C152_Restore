@interface NSDictionary
- (id)jsa_stringDictionaryForRequestHeaderOrURLParam;
@end

@implementation NSDictionary

- (id)jsa_stringDictionaryForRequestHeaderOrURLParam
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C128;
  v6[3] = &unk_B25B0;
  id v7 = (id)objc_opt_new();
  id v3 = v7;
  [(NSDictionary *)self enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = [v3 copy];

  return v4;
}

@end