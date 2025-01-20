@interface NSKeyedUnarchiver
+ (id)icUnarchivedObjectFromData:(id)a3 withKey:(id)a4;
+ (id)icWhitelistedClasses;
@end

@implementation NSKeyedUnarchiver

+ (id)icWhitelistedClasses
{
  if (qword_1000634A8 != -1) {
    dispatch_once(&qword_1000634A8, &stru_10004CCD0);
  }
  v2 = (void *)qword_1000634A0;

  return v2;
}

+ (id)icUnarchivedObjectFromData:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
    v8 = [(id)objc_opt_class() icWhitelistedClasses];
    v9 = [v7 decodeObjectOfClasses:v8 forKey:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end