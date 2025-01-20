@interface FMDDigestSanitizer
+ (id)_digestObject:(id)a3 withExclusionKeys:(id)a4;
+ (id)_sanitizeArray:(id)a3 withExclusionKeys:(id)a4;
+ (id)_sanitizeDictionary:(id)a3 withExclusionKeys:(id)a4;
@end

@implementation FMDDigestSanitizer

+ (id)_digestObject:(id)a3 withExclusionKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = 0;
    goto LABEL_11;
  }
  if (!v7 || ![v7 count]) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [a1 _sanitizeArray:v6 withExclusionKeys:v8];
      goto LABEL_10;
    }
LABEL_9:
    id v9 = v6;
    goto LABEL_10;
  }
  id v9 = [a1 _sanitizeDictionary:v6 withExclusionKeys:v8];
LABEL_10:
  v10 = v9;
LABEL_11:

  return v10;
}

+ (id)_sanitizeDictionary:(id)a3 withExclusionKeys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F574;
  v12[3] = &unk_1002DA3C8;
  id v14 = (id)objc_opt_new();
  id v15 = a1;
  id v13 = v6;
  id v8 = v14;
  id v9 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = [v8 copy];

  return v10;
}

+ (id)_sanitizeArray:(id)a3 withExclusionKeys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F708;
  v12[3] = &unk_1002DA3F0;
  id v14 = (id)objc_opt_new();
  id v15 = a1;
  id v13 = v6;
  id v8 = v14;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  id v10 = [v8 copy];

  return v10;
}

@end