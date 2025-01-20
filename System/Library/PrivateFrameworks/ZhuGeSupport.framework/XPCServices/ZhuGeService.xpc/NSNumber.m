@interface NSNumber
+ (id)BOOLFromData:(id)a3 needNegate:(BOOL)a4;
+ (id)integerFromCInt:(unint64_t)a3 size:(unint64_t)a4 isSigned:(BOOL)a5 needSwap:(BOOL)a6;
+ (id)integerFromData:(id)a3 size:(unint64_t)a4 truncate:(int64_t)a5 isSigned:(BOOL)a6 needSwap:(BOOL)a7;
@end

@implementation NSNumber

+ (id)integerFromCInt:(unint64_t)a3 size:(unint64_t)a4 isSigned:(BOOL)a5 needSwap:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v9 = a3;
  unint64_t v10 = 0;
  if (a3)
  {
    unint64_t v11 = a3;
    do
    {
      ++v10;
      BOOL v12 = v11 >= 0x100;
      v11 >>= 8;
    }
    while (v12);
  }
  if (a4 > 8 || ((1 << a4) & 0x116) == 0)
  {
    v13 = +[NSNumber numberWithUnsignedLong:a4];
    ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m", "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]", 31, @"Required size is %@, while usually it should be %@ or %@ or %@ or %@", v14, v15, v16, (uint64_t)v13);
  }
  if (v10 > a4)
  {
    v17 = +[NSNumber numberWithUnsignedLong:v10];
    v28 = +[NSNumber numberWithUnsignedLong:a4];
    ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m", "+[NSNumber(ZhuGe) integerFromCInt:size:isSigned:needSwap:]", 36, @"Bits will be truncated since real size is %@, while required size is %@", v18, v19, v20, (uint64_t)v17);

    v9 &= 0xFFFFFFFFFFFFFFFFLL >> (-8 * a4);
  }
  v21 = &off_100017720;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_31;
    case 1uLL:
      if (a5) {
        +[NSNumber numberWithChar:(char)v9];
      }
      else {
        +[NSNumber numberWithUnsignedChar:v9];
      }
      goto LABEL_27;
    case 2uLL:
      unsigned int v24 = bswap32(v9) >> 16;
      if (!v6) {
        LOWORD(v24) = v9;
      }
      if (a5) {
        +[NSNumber numberWithShort:(__int16)v24];
      }
      else {
        +[NSNumber numberWithUnsignedShort:(unsigned __int16)v24];
      }
      goto LABEL_27;
    case 3uLL:
    case 4uLL:
      unsigned int v22 = bswap32(v9);
      if (v6) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = v9;
      }
      if (a5) {
        +[NSNumber numberWithInt:v23];
      }
      else {
        +[NSNumber numberWithUnsignedInt:v23];
      }
      goto LABEL_27;
    default:
      unint64_t v25 = bswap64(v9);
      if (v6) {
        unint64_t v26 = v25;
      }
      else {
        unint64_t v26 = v9;
      }
      if (a5) {
        +[NSNumber numberWithLongLong:v26];
      }
      else {
        +[NSNumber numberWithUnsignedLongLong:v26];
      }
LABEL_27:
      v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
LABEL_31:
      return v21;
  }
}

+ (id)integerFromData:(id)a3 size:(unint64_t)a4 truncate:(int64_t)a5 isSigned:(BOOL)a6 needSwap:(BOOL)a7
{
  uint64_t v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  v13 = v12;
  uint64_t v32 = 0;
  if (v12)
  {
    uint64_t v14 = (char *)[v12 length];
    uint64_t v15 = v14;
    BOOL v17 = (unint64_t)v14 > 8 || (unint64_t)v14 > a4;
    if (v17)
    {
      CFStringRef v18 = @"LSB";
      if (!a5) {
        CFStringRef v18 = @"MSB";
      }
      uint64_t v30 = (uint64_t)v18;
      +[NSNumber numberWithUnsignedLong:v14];
      uint64_t v19 = v31 = v7;
      uint64_t v20 = +[NSNumber numberWithUnsignedLong:a4];
      v29 = +[NSNumber numberWithUnsignedLong:8];
      ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSNumber+ZhuGe.m", "+[NSNumber(ZhuGe) integerFromData:size:truncate:isSigned:needSwap:]", 122, @"Data %@ might be truncated(data size %@, required size %@, maximum supported size %@)", v21, v22, v23, v30);

      uint64_t v7 = v31;
    }
    unint64_t v24 = 8;
    if (a4 < 8) {
      unint64_t v24 = a4;
    }
    if (v17) {
      unint64_t v25 = v24;
    }
    else {
      unint64_t v25 = (unint64_t)v15;
    }
    if (a5 == 1) {
      unint64_t v26 = &v15[-v25];
    }
    else {
      unint64_t v26 = 0;
    }
    [v13 getBytes:&v32 range:v26];
    v27 = [a1 integerFromCInt:v32 size:a4 isSigned:v8 needSwap:v7];
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)BOOLFromData:(id)a3 needNegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
    BOOL v8 = [v7 bytes];
    id v9 = [v7 length];
    if (*v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = memcmp(v8, v8 + 1, (size_t)v9 - 1) != 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  unint64_t v11 = +[NSNumber numberWithBool:v10 ^ v4];

  return v11;
}

@end