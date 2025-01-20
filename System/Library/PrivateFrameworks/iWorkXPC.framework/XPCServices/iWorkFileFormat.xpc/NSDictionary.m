@interface NSDictionary
- (BOOL)tsu_BOOLValueForKey:(id)a3;
- (NSSet)tsu_allKeysAsSet;
- (id)tsu_invertedCopy;
- (id)tsu_onlyKeyForObject:(id)a3;
@end

@implementation NSDictionary

- (id)tsu_invertedCopy
{
  NSUInteger v3 = [(NSDictionary *)self count];
  if (v3)
  {
    id v4 = (id)v3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B5D88;
    v10[3] = &unk_1001CEB70;
    id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v3];
    id v11 = v5;
    [(NSDictionary *)self enumerateKeysAndObjectsUsingBlock:v10];
    if (v4 == [v5 count])
    {

      if (v5) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEB90);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016A890();
  }
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSDictionary(TSUAdditions) tsu_invertedCopy]");
  v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSDictionaryAdditions.m"];
  +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:41 isFatal:0 description:"Source dictionary is not invertible."];

  +[TSUAssertionHandler logBacktraceThrottled];
  id v5 = 0;
LABEL_11:
  id v8 = [v5 copy];

  return v8;
}

- (BOOL)tsu_BOOLValueForKey:(id)a3
{
  NSUInteger v3 = [(NSDictionary *)self objectForKeyedSubscript:a3];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSSet)tsu_allKeysAsSet
{
  v2 = [(NSDictionary *)self allKeys];
  NSUInteger v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (id)tsu_onlyKeyForObject:(id)a3
{
  NSUInteger v3 = [(NSDictionary *)self allKeysForObject:a3];
  if ((unint64_t)[v3 count] >= 2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEBB0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A9E0();
    }
    unsigned __int8 v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSDictionary(TSUAdditions) tsu_onlyKeyForObject:]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSDictionaryAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:129 isFatal:0 description:"tsu_onlyKeyForObject assumes that there's only one key for any object in the dictionary."];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v6 = [v3 firstObject];

  return v6;
}

@end