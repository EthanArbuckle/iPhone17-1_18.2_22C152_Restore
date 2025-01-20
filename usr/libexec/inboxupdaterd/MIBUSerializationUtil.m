@interface MIBUSerializationUtil
+ (id)maxLengthForTag:(id)a3;
+ (id)tagLengthMapping;
+ (id)tagTypeMapping;
+ (id)typeForTag:(id)a3;
+ (id)typeLengthMapping;
@end

@implementation MIBUSerializationUtil

+ (id)typeLengthMapping
{
  if (qword_10006C928 != -1) {
    dispatch_once(&qword_10006C928, &stru_10005C118);
  }
  v2 = (void *)qword_10006C920;

  return v2;
}

+ (id)tagTypeMapping
{
  if (qword_10006C938 != -1) {
    dispatch_once(&qword_10006C938, &stru_10005C138);
  }
  v2 = (void *)qword_10006C930;

  return v2;
}

+ (id)tagLengthMapping
{
  if (qword_10006C948 != -1) {
    dispatch_once(&qword_10006C948, &stru_10005C158);
  }
  v2 = (void *)qword_10006C940;

  return v2;
}

+ (id)typeForTag:(id)a3
{
  id v4 = a3;
  v5 = [a1 tagTypeMapping];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)maxLengthForTag:(id)a3
{
  id v4 = a3;
  v5 = [a1 tagTypeMapping];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [a1 typeLengthMapping];
    v8 = [v7 objectForKey:v6];

    if (!v8)
    {
      v9 = [a1 tagLengthMapping];
      v8 = [v9 objectForKey:v4];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end