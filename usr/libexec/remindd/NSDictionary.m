@interface NSDictionary
- (id)ic_prettyDescriptionWithTabLevel:(unint64_t)a3;
- (id)jsonify;
@end

@implementation NSDictionary

- (id)ic_prettyDescriptionWithTabLevel:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableString);
  [v5 appendString:@"{\n"];
  if (a3)
  {
    v6 = &stru_1008D0E58;
    unint64_t v7 = a3;
    do
    {
      v8 = [(__CFString *)v6 stringByAppendingString:@"\t"];

      v6 = v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = &stru_1008D0E58;
  }
  v9 = [(__CFString *)v8 stringByAppendingString:@"\t"];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100003C28;
  v18 = &unk_1008AD9B8;
  id v10 = v5;
  id v19 = v10;
  v20 = v9;
  unint64_t v21 = a3;
  id v11 = v9;
  [(NSDictionary *)self enumerateKeysAndObjectsUsingBlock:&v15];
  [v10 appendFormat:@"%@}", v8, v15, v16, v17, v18];
  v12 = v20;
  id v13 = v10;

  return v13;
}

- (id)jsonify
{
  v2 = self;
  id v3 = sub_1004141E4();

  return v3;
}

@end