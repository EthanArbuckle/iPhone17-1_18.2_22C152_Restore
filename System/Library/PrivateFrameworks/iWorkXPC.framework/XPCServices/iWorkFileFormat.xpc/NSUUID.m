@interface NSUUID
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 UUID:(id)a4;
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 bytes:(const void *)a4 size:(unint64_t)a5;
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 doubleValue:(double)a4;
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 integerValue:(int64_t)a4;
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 name:(id)a4;
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 timeInterval:(double)a4;
+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 unsignedIntegerValue:(unint64_t)a4;
- (int64_t)tsu_compare:(id)a3;
@end

@implementation NSUUID

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (const char *)[v6 UTF8String];
  v9 = objc_msgSend(a1, "tsu_UUIDWithNamespaceUUID:bytes:size:", v7, v8, strlen(v8));

  return v9;
}

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 UUID:(id)a4
{
  v9[0] = 0;
  v9[1] = 0;
  id v6 = a3;
  [a4 getUUIDBytes:v9];
  id v7 = objc_msgSend(a1, "tsu_UUIDWithNamespaceUUID:bytes:size:", v6, v9, 16);

  return v7;
}

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 timeInterval:(double)a4
{
  double v6 = a4;
  v4 = objc_msgSend(a1, "tsu_UUIDWithNamespaceUUID:bytes:size:", a3, &v6, 8);
  return v4;
}

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 doubleValue:(double)a4
{
  double v6 = a4;
  v4 = objc_msgSend(a1, "tsu_UUIDWithNamespaceUUID:bytes:size:", a3, &v6, 8);
  return v4;
}

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 unsignedIntegerValue:(unint64_t)a4
{
  unint64_t v6 = a4;
  v4 = objc_msgSend(a1, "tsu_UUIDWithNamespaceUUID:bytes:size:", a3, &v6, 8);
  return v4;
}

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 integerValue:(int64_t)a4
{
  int64_t v6 = a4;
  v4 = objc_msgSend(a1, "tsu_UUIDWithNamespaceUUID:bytes:size:", a3, &v6, 8);
  return v4;
}

+ (id)tsu_UUIDWithNamespaceUUID:(id)a3 bytes:(const void *)a4 size:(unint64_t)a5
{
  CC_LONG v5 = a5;
  id v7 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  long long data = 0uLL;
  if (!v7)
  {
    int v8 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD150);
    }
    v9 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166A68(v8, v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSUUID(NSUUID_TSUAdditions) tsu_UUIDWithNamespaceUUID:bytes:size:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSUUID_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 47, 0, "invalid nil value for '%{public}s'", "namespaceUUID");

    +[TSUAssertionHandler logBacktraceThrottled];
    id v7 = objc_alloc_init((Class)NSUUID);
  }
  [v7 getUUIDBytes:&data];
  CC_SHA1_Update(&c, &data, 0x10u);
  CC_SHA1_Update(&c, a4, v5);
  CC_SHA1_Final(md, &c);
  long long data = *(_OWORD *)md;
  BYTE6(data) = md[6] & 0xF | 0x50;
  BYTE8(data) = md[8] & 0x3F | 0x80;
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&data];

  return v12;
}

- (int64_t)tsu_compare:(id)a3
{
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  id v4 = a3;
  [(NSUUID *)self getUUIDBytes:&v14];
  [v4 getUUIDBytes:&v12];

  unint64_t v5 = bswap64(v14);
  unint64_t v6 = bswap64(v12);
  if (v5 == v6 && (v5 = bswap64(v15), unint64_t v6 = bswap64(v13), v5 == v6))
  {
    int v7 = 0;
  }
  else if (v5 < v6)
  {
    int v7 = -1;
  }
  else
  {
    int v7 = 1;
  }
  BOOL v8 = v7 == 0;
  BOOL v9 = v7 < 0;
  int64_t v10 = -1;
  if (!v9) {
    int64_t v10 = 1;
  }
  if (v8) {
    return 0;
  }
  else {
    return v10;
  }
}

@end