@interface NSURL
+ (id)ps_URLWithPath:(const void *)a3;
+ (id)ps_URLWithStlString:(const void *)a3;
@end

@implementation NSURL

+ (id)ps_URLWithStlString:(const void *)a3
{
  v3 = +[NSString ps_stringWithSTL:a3];
  v4 = +[NSURL URLWithString:v3];

  return v4;
}

+ (id)ps_URLWithPath:(const void *)a3
{
  v4 = +[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:");
  sub_100056B28((const char *)a3, 0, &v7);
  v5 = +[NSURL fileURLWithPath:v4 isDirectory:v7 == 3];

  return v5;
}

@end