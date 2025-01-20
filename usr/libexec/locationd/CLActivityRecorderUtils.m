@interface CLActivityRecorderUtils
+ (id)getDbDetails:(void *)a3;
@end

@implementation CLActivityRecorderUtils

+ (id)getDbDetails:(void *)a3
{
  id v4 = objc_alloc((Class)NSString);
  sub_1011F9520((uint64_t)a3, (uint64_t)__p);
  if (v13 >= 0) {
    v5 = __p;
  }
  else {
    v5 = (void **)__p[0];
  }
  id v6 = [v4 initWithUTF8String:v5];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
  id v8 = objc_alloc((Class)NSString);
  (*(void (**)(void **__return_ptr, void *))(*(void *)a3 + 32))(__p, a3);
  if (v13 >= 0) {
    v9 = __p;
  }
  else {
    v9 = (void **)__p[0];
  }
  id v10 = [v8 initWithUTF8String:v9];
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  v14[0] = @"url";
  v14[1] = @"name";
  v15[0] = v7;
  v15[1] = v10;
  return +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
}

@end