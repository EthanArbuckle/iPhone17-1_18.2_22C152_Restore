@interface NSString
+ (char)toHex:(char)a3;
+ (id)convertToHexString:(int64_t)a3;
@end

@implementation NSString

+ (char)toHex:(char)a3
{
  if (a3 <= 9) {
    char v3 = 48;
  }
  else {
    char v3 = 87;
  }
  return v3 + a3;
}

+ (id)convertToHexString:(int64_t)a3
{
  int64_t v11 = a3;
  id v3 = [objc_alloc((Class)NSData) initWithBytes:&v11 length:4];
  v4 = (char *)[v3 length];
  v5 = (char *)[v3 bytes];
  for (id i = objc_alloc_init((Class)NSMutableString); v4; --v4)
  {
    [i appendFormat:@"%c", +[NSString toHex:](NSString, "toHex:", *v5 >> 4)];
    char v7 = *v5++;
    [i appendFormat:@"%c", +[NSString toHex:](NSString, "toHex:", v7 & 0xF)];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331ED8);
  }
  v8 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = i;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#hawkeye #firmwareUpdate - convertToHexString: %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331ED8);
    }
    int v12 = 138412290;
    id v13 = i;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "+[NSString(IntegerToLowerCaseHexString) convertToHexString:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  return [objc_alloc((Class)NSString) initWithString:i];
}

@end