@interface TXRPixelFormatInfo
+ (BOOL)hasAlpha:(unint64_t)a3;
+ (BOOL)isASTC:(unint64_t)a3;
+ (BOOL)isBC1to5:(unint64_t)a3;
+ (BOOL)isBC6to7:(unint64_t)a3;
+ (BOOL)isCompressed:(unint64_t)a3;
+ (BOOL)isETC2:(unint64_t)a3;
+ (BOOL)isFloat:(unint64_t)a3;
+ (BOOL)isGammaEncoded:(unint64_t)a3;
+ (BOOL)isInteger:(unint64_t)a3;
+ (BOOL)isPVRTC:(unint64_t)a3;
+ (BOOL)isSRGB:(unint64_t)a3;
+ (TXRImageMemoryLayout)packedMemoryLayoutForFormat:(unint64_t)a3 dimensions:;
+ (unsigned)componentsPerPixel:(unint64_t)a3;
+ (unsigned)pixelBytes:(unint64_t)a3;
@end

@implementation TXRPixelFormatInfo

+ (unsigned)pixelBytes:(unint64_t)a3
{
  if ((uint64_t)a3 <= 551)
  {
    unsigned __int8 result = 1;
    switch(a3)
    {
      case 1uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        return result;
      case 0x14uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
      case 0x1EuLL:
      case 0x1FuLL:
      case 0x20uLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x28uLL:
      case 0x29uLL:
      case 0x2AuLL:
      case 0x2BuLL:
        return 2;
      case 0x35uLL:
      case 0x36uLL:
      case 0x37uLL:
      case 0x3CuLL:
      case 0x3EuLL:
      case 0x3FuLL:
      case 0x40uLL:
      case 0x41uLL:
      case 0x46uLL:
      case 0x47uLL:
      case 0x48uLL:
      case 0x49uLL:
      case 0x4AuLL:
      case 0x50uLL:
      case 0x51uLL:
      case 0x5AuLL:
      case 0x5BuLL:
      case 0x5CuLL:
      case 0x5DuLL:
        return 4;
      case 0x67uLL:
      case 0x68uLL:
      case 0x69uLL:
      case 0x6EuLL:
      case 0x70uLL:
      case 0x71uLL:
      case 0x72uLL:
      case 0x73uLL:
        return 8;
      case 0x7BuLL:
      case 0x7CuLL:
      case 0x7DuLL:
        return 16;
      default:
        goto LABEL_11;
    }
  }
  if (a3 - 552 < 2) {
    return 8;
  }
  if (a3 - 554 < 2) {
    return 4;
  }
  if (a3 - 2147483649u >= 2) {
LABEL_11:
  }
    pixelBytes_cold_1();
  return 3;
}

+ (BOOL)isInteger:(unint64_t)a3
{
  BOOL result = 1;
  if ((a3 - 13 > 0x3D || ((1 << (a3 - 13)) & 0x300C030000300C03) == 0)
    && (a3 - 103 > 0x15 || ((1 << (a3 - 103)) & 0x300C03) == 0))
  {
    return 0;
  }
  return result;
}

+ (BOOL)isFloat:(unint64_t)a3
{
  BOOL result = 1;
  if ((uint64_t)a3 <= 91)
  {
    if (a3 - 25 > 0x28 || ((1 << (a3 - 25)) & 0x10040000001) == 0) {
      return 0;
    }
  }
  else if ((a3 - 92 > 0x3A || ((1 << (a3 - 92)) & 0x400000200800003) == 0) {
         && a3 != 2147483670
  }
         && a3 != 2147483686)
  {
    return 0;
  }
  return result;
}

+ (BOOL)isSRGB:(unint64_t)a3
{
  if (isGammaEncoded(a3)) {
    return 1;
  }
  BOOL result = 1;
  if ((uint64_t)a3 <= 91)
  {
    if (a3 - 25 > 0x28 || ((1 << (a3 - 25)) & 0x10040000001) == 0) {
      return 0;
    }
  }
  else if ((a3 - 92 > 0x3A || ((1 << (a3 - 92)) & 0x400000200800003) == 0) {
         && a3 != 2147483670
  }
         && a3 != 2147483686)
  {
    return 0;
  }
  return result;
}

+ (BOOL)isBC1to5:(unint64_t)a3
{
  return (a3 - 130 < 0xE) & (0x3C3Fu >> (a3 + 126));
}

+ (BOOL)isBC6to7:(unint64_t)a3
{
  return a3 - 150 < 4;
}

+ (BOOL)isPVRTC:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFF8) == 160;
}

+ (BOOL)isETC2:(unint64_t)a3
{
  return (a3 - 170 < 0xE) & (0x3F55u >> (a3 + 86));
}

+ (BOOL)isASTC:(unint64_t)a3
{
  return (a3 - 186 < 0x21) & (0x1FF7C7FDFuLL >> (a3 + 70));
}

+ (BOOL)isCompressed:(unint64_t)a3
{
  if (a3 - 130 < 0xE && ((0x3C3Fu >> (a3 + 126)) & 1) != 0) {
    return 1;
  }
  unint64_t v3 = (0x1FF7C7FDF3F55uLL >> (a3 + 86)) & 1;
  if (a3 - 170 >= 0x31) {
    LOBYTE(v3) = 0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFF8) == 0xA0) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3;
  }
  return a3 - 150 < 4 || v4;
}

+ (BOOL)hasAlpha:(unint64_t)a3
{
  BOOL result = 1;
  if ((uint64_t)a3 > 129)
  {
    if ((a3 - 130 > 0x35 || ((1 << (a3 + 126)) & 0x30003C00C0003FLL) == 0) && a3 - 552 >= 2) {
      return 0;
    }
  }
  else if ((a3 - 65 > 0x3C || ((1 << (a3 - 65)) & 0x1C07A000060183E1) == 0) {
         && (a3 > 0x2B || ((1 << a3) & 0xE0000000002) == 0))
  }
  {
    return 0;
  }
  return result;
}

+ (BOOL)isGammaEncoded:(unint64_t)a3
{
  return isGammaEncoded(a3);
}

+ (TXRImageMemoryLayout)packedMemoryLayoutForFormat:(unint64_t)a3 dimensions:
{
  BOOL v4 = a3 - 130 > 0xD || ((1 << (a3 + 126)) & 0x3C3F) == 0;
  if (!v4
    || a3 - 150 < 4
    || (a3 & 0xFFFFFFFFFFFFFFF8) == 0xA0
    || a3 - 170 <= 0x30 && ((1 << (a3 + 86)) & 0x1FF7C7FDF3F55) != 0)
  {
    unsigned int v5 = 17040392;
    switch(a3)
    {
      case 0x82uLL:
      case 0x83uLL:
      case 0x8CuLL:
      case 0x8DuLL:
      case 0xA2uLL:
      case 0xA3uLL:
      case 0xA6uLL:
      case 0xA7uLL:
      case 0xAAuLL:
      case 0xACuLL:
      case 0xB4uLL:
      case 0xB5uLL:
      case 0xB6uLL:
      case 0xB7uLL:
        break;
      case 0x84uLL:
      case 0x85uLL:
      case 0x86uLL:
      case 0x87uLL:
      case 0x8EuLL:
      case 0x8FuLL:
      case 0x96uLL:
      case 0x97uLL:
      case 0x98uLL:
      case 0x99uLL:
      case 0xAEuLL:
      case 0xB0uLL:
      case 0xB2uLL:
      case 0xB3uLL:
      case 0xBAuLL:
      case 0xCCuLL:
        unsigned int v5 = 17040400;
        break;
      case 0xA0uLL:
      case 0xA1uLL:
      case 0xA4uLL:
      case 0xA5uLL:
        goto LABEL_21;
      case 0xBBuLL:
      case 0xCDuLL:
        unsigned int v5 = 17040656;
        break;
      case 0xBCuLL:
      case 0xCEuLL:
        unsigned int v5 = 17106192;
        break;
      case 0xBDuLL:
      case 0xCFuLL:
        unsigned int v5 = 17106448;
        break;
      case 0xBEuLL:
      case 0xD0uLL:
        unsigned int v5 = 17171984;
        break;
      case 0xC0uLL:
      case 0xD2uLL:
        unsigned int v5 = 17106960;
        break;
      case 0xC1uLL:
      case 0xD3uLL:
        int v8 = 17171984;
        goto LABEL_25;
      case 0xC2uLL:
      case 0xD4uLL:
        unsigned int v5 = 17303568;
        break;
      case 0xC3uLL:
      case 0xD5uLL:
        unsigned int v5 = 17104912;
        break;
      case 0xC4uLL:
      case 0xD6uLL:
        unsigned int v5 = 17171984;
LABEL_21:
        v5 += 1024;
        break;
      case 0xC5uLL:
      case 0xD7uLL:
        unsigned int v5 = 17304080;
        break;
      case 0xC6uLL:
      case 0xD8uLL:
        unsigned int v5 = 17435152;
        break;
      case 0xC7uLL:
      case 0xD9uLL:
        int v8 = 17435152;
LABEL_25:
        unsigned int v5 = v8 + 512;
        break;
      case 0xC8uLL:
      case 0xDAuLL:
        unsigned int v5 = 17566736;
        break;
      default:
        +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:]();
    }
    unint64_t v6 = (v3 + ((v5 >> 8) & 0xF) - 1) / ((v5 >> 8) & 0xF) * (unint64_t)(v5 & 0x18);
    unint64_t v7 = (DWORD1(v3) + (HIWORD(v5) & 0xF) - 1) / (HIWORD(v5) & 0xF) * (unint64_t)DWORD2(v3) * v6;
  }
  else
  {
    unsigned int v9 = DWORD1(v3);
    unint64_t v6 = ((uint64_t (*)(unint64_t, SEL))pixelBytes_0)(a3, a2)
       * (unint64_t)v3;
    unint64_t v7 = v6 * v9;
  }
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

+ (unsigned)componentsPerPixel:(unint64_t)a3
{
  if ((uint64_t)a3 <= 551)
  {
    unsigned __int8 result = 1;
    switch(a3)
    {
      case 1uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0x14uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
      case 0x35uLL:
      case 0x36uLL:
      case 0x37uLL:
        return result;
      case 0x1EuLL:
      case 0x1FuLL:
      case 0x20uLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x3CuLL:
      case 0x3EuLL:
      case 0x3FuLL:
      case 0x40uLL:
      case 0x41uLL:
      case 0x67uLL:
      case 0x68uLL:
      case 0x69uLL:
        return 2;
      case 0x28uLL:
      case 0x5CuLL:
      case 0x5DuLL:
        return 3;
      case 0x29uLL:
      case 0x2AuLL:
      case 0x2BuLL:
      case 0x46uLL:
      case 0x47uLL:
      case 0x48uLL:
      case 0x49uLL:
      case 0x4AuLL:
      case 0x50uLL:
      case 0x51uLL:
      case 0x5AuLL:
      case 0x5BuLL:
      case 0x6EuLL:
      case 0x70uLL:
      case 0x71uLL:
      case 0x72uLL:
      case 0x73uLL:
      case 0x7BuLL:
      case 0x7CuLL:
      case 0x7DuLL:
        return 4;
      default:
        goto LABEL_9;
    }
  }
  if (a3 - 552 < 2) {
    return 4;
  }
  if (a3 - 554 >= 2 && a3 - 2147483649u >= 2) {
LABEL_9:
  }
    componentsPerPixel_cold_1();
  return 3;
}

+ (void)packedMemoryLayoutForFormat:dimensions:.cold.1()
{
}

@end