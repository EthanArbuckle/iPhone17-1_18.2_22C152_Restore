@interface __NSFontExtraData
- (BOOL)_hasVerticalMetricsWithPlatformFont:(__CTFont *)a3;
- (BOOL)isEqualToExtraData:(id)a3;
- (double)initWithFont:(void *)a1;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation __NSFontExtraData

- (unint64_t)hash
{
  unint64_t v2 = ((unint64_t)*(unsigned char *)&self->_fFlags >> 1) & 1;
  return [(NSString *)self->_textStyleForScaling hash] ^ v2 ^ (unint64_t)self->_pointSizeForScaling ^ (unint64_t)self->_maximumPointSizeAfterScaling;
}

- (double)initWithFont:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)__NSFontExtraData;
  v3 = (double *)objc_msgSendSuper2(&v10, sel_init);
  if (v3)
  {
    *((unsigned char *)v3 + 24) = (_BYTE)v3[3] & 0xFE | CTFontIsSystemUIFont();
    double Ascent = CTFontGetAscent(a2);
    double Descent = CTFontGetDescent(a2);
    double v6 = 0.0;
    if ((CTFontIsTextStyleFont() & 1) == 0)
    {
      CFStringRef v7 = CTFontCopyPostScriptName(a2);
      if (v7)
      {
        CFStringRef v8 = v7;
        if (CFStringHasPrefix(v7, @"Times-")
          || CFStringHasPrefix(v8, @"Helvetica-")
          || CFEqual(v8, @"Helvetica"))
        {
          double v6 = (Ascent + Descent) * 0.15;
        }
        CFRelease(v8);
      }
    }
    v3[1] = Ascent + v6;
    v3[2] = Descent + Ascent + v6;
  }
  return v3;
}

- (BOOL)isEqualToExtraData:(id)a3
{
  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (((*((unsigned __int8 *)a3 + 24) ^ *(unsigned char *)&self->_fFlags) & 2) != 0) {
    goto LABEL_9;
  }
  textStyleForScaling = self->_textStyleForScaling;
  if (textStyleForScaling == *((NSString **)a3 + 4)
    || (int v6 = -[NSString isEqual:](textStyleForScaling, "isEqual:")) != 0)
  {
    if (self->_pointSizeForScaling == *((double *)a3 + 5))
    {
      LOBYTE(v6) = self->_maximumPointSizeAfterScaling == *((double *)a3 + 6);
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSFontExtraData;
  [(__NSFontExtraData *)&v3 dealloc];
}

- (BOOL)_hasVerticalMetricsWithPlatformFont:(__CTFont *)a3
{
  int v3 = *(unsigned char *)&self->_fFlags & 0xC;
  if ((*(unsigned char *)&self->_fFlags & 0xC) == 0)
  {
    int v3 = 8;
    if ((CTFontHasTable() & 1) == 0)
    {
      if (CTFontHasTable()) {
        int v3 = 8;
      }
      else {
        int v3 = 4;
      }
    }
    *(unsigned char *)&self->_fFlags = *(unsigned char *)&self->_fFlags & 0xF3 | v3;
  }
  return v3 == 8;
}

@end