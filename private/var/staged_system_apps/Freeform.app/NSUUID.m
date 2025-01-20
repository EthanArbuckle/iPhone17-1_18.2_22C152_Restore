@interface NSUUID
+ (id)crl_uuidByCryptographicHashOfString:(id)a3;
- (id)combineUUIDWithUUID:(id)a3;
- (id)combineUUIDWithUUID:(id)a3 mixValue:(unsigned int)a4;
- (id)crl_combineCryptographicallyWithString:(id)a3;
- (int64_t)crl_compare:(id)a3;
@end

@implementation NSUUID

- (int64_t)crl_compare:(id)a3
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
  if (v5 == v6 && (unint64_t v5 = bswap64(v15), v6 = bswap64(v13), v5 == v6))
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

- (id)combineUUIDWithUUID:(id)a3
{
  return [(NSUUID *)self combineUUIDWithUUID:a3 mixValue:0xFFFFFFFFLL];
}

- (id)combineUUIDWithUUID:(id)a3 mixValue:(unsigned int)a4
{
  id v6 = a3;
  [(NSUUID *)self getUUIDBytes:&v14];
  [v6 getUUIDBytes:&v13];
  v7.i32[1] = v13.i32[1];
  int8x16_t v8 = veorq_s8(v13, v14);
  int8x16_t v12 = v8;
  if (a4 != -1)
  {
    v8.i32[0] = v12.i32[0];
    int16x8_t v9 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v8.i8);
    v7.i32[0] = a4;
    *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)v9.i8, vzip1_s8(v7, *(int8x8_t *)v9.i8));
    v12.i32[0] = vmovn_s16(v9).u32[0];
  }
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v12];

  return v10;
}

+ (id)crl_uuidByCryptographicHashOfString:(id)a3
{
  v3 = (__CFString *)a3;
  CFStringRef v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4190);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108EEF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E41B0);
    }
    unint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSUUID(NSUUID_CRLAdditions) crl_uuidByCryptographicHashOfString:]");
    int8x8_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSUUID_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 67, 0, "invalid nil value for '%{public}s'", "string");

    CFStringRef v4 = &stru_101538650;
  }
  int8x16_t v8 = [@"com.apple.Freeform" stringByAppendingString:v4];
  int16x8_t v9 = [v8 dataUsingEncoding:4];
  id v10 = +[NSMutableData dataWithLength:32];
  id v11 = v9;
  id v12 = [v11 bytes];
  CC_LONG v13 = [v11 length];
  id v14 = v10;
  CC_SHA256(v12, v13, (unsigned __int8 *)[v14 mutableBytes]);
  id v15 = v14;
  v16 = [v15 mutableBytes];
  v16[6] = v16[6] & 0xF | 0x50;
  v16[8] = v16[8] & 0x3F | 0x80;
  if ((unint64_t)[v15 length] <= 0xF)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E41D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108EE58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E41F0);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSUUID(NSUUID_CRLAdditions) crl_uuidByCryptographicHashOfString:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSUUID_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:84 isFatal:0 description:"SHA256 hash should return 32(CC_SHA256_DIGEST_LENGTH) bytes."];
  }
  id v20 = objc_alloc((Class)NSUUID);
  id v21 = v15;
  id v22 = [v20 initWithUUIDBytes:[v21 bytes]];

  return v22;
}

- (id)crl_combineCryptographicallyWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    unint64_t v5 = [(NSUUID *)self UUIDString];
    id v6 = +[NSString stringWithFormat:@"%@-%@", v5, v4];

    [objc_opt_class() crl_uuidByCryptographicHashOfString:v6];
    int8x8_t v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int8x8_t v7 = self;
  }

  return v7;
}

@end