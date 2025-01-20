@interface PFSUtilities
+ (BOOL)tokenRepresentsLength:(id)a3;
+ (double)floatFromString:(id)a3 usingDefault:(double)a4 restOfString:(_NSRange *)a5;
+ (double)fontPointSizeFromHtmlStr:(id)a3 parentSize:(double)a4;
+ (double)fontWeightFromHtmlStr:(id)a3 parentWeight:(double)a4;
+ (double)htmlValueToBorderWidth:(id)a3 parentFontSize:(double)a4;
+ (double)htmlValueToLineHeight:(id)a3 parentFontSize:(double)a4;
+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4;
+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 isPercent:(BOOL *)a5;
+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 percentageBasis:(double)a5;
+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 percentageBasis:(double)a5 usePercentageBasis:(BOOL)a6 isPercent:(BOOL *)a7;
+ (id)identValueOrNilFromPair:(id)a3;
+ (id)prioritizedPropertyValueLookup:(id)a3 usingNames:(id)a4;
@end

@implementation PFSUtilities

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4
{
  char v5 = 0;
  [a1 htmlValueToPointLength:a3 parentFontSize:1 percentageBasis:&v5 usePercentageBasis:a4 isPercent:a4];
  return result;
}

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 percentageBasis:(double)a5
{
  char v6 = 0;
  [a1 htmlValueToPointLength:a3 parentFontSize:1 percentageBasis:&v6 usePercentageBasis:a4 isPercent:a5];
  return result;
}

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 isPercent:(BOOL *)a5
{
  [a1 htmlValueToPointLength:a3 parentFontSize:0 percentageBasis:a5 usePercentageBasis:a4 isPercent:0.0];
  return result;
}

+ (BOOL)tokenRepresentsLength:(id)a3
{
  id v3 = [a3 type];
  return ((unint64_t)v3 & 0xFFFFFFFFFFFFFFFBLL) == 0x118
      || ((unint64_t)v3 & 0xFFFFFFFFFFFFFFFELL) == 278
      || ((unint64_t)v3 & 0xFFFFFFFFFFFFFFFDLL) == 281
      || v3 == &stru_108.segname[2]
      || v3 == &stru_108.segname[5]
      || (char *)v3 - 295 < (unsigned char *)&dword_0 + 2;
}

+ (double)htmlValueToLineHeight:(id)a3 parentFontSize:(double)a4
{
  if ([a3 type] == &stru_108.addr)
  {
    [a1 floatFromString:[a3 value] usingDefault:&v10 restOfString:-65536.0];
    double v8 = 1.0;
    if (v7 != -65536.0) {
      double v8 = a4;
    }
    return v7 * v8;
  }
  else
  {
    [a1 htmlValueToPointLength:a3 parentFontSize:a4];
  }
  return result;
}

+ (double)htmlValueToBorderWidth:(id)a3 parentFontSize:(double)a4
{
  double v7 = (section_64 *)[a3 type];
  id v8 = objc_msgSend(objc_msgSend(a3, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (v7 != &stru_108
    || (v9 = v8, unsigned __int8 v10 = [v8 isEqualToString:@"thin"],
                 double result = 1.0,
                 (v10 & 1) == 0)
    && (v12 = objc_msgSend(v9, "isEqualToString:", @"medium", 1.0), double result = 3.0, (v12 & 1) == 0)
    && (v13 = objc_msgSend(v9, "isEqualToString:", @"thick", 3.0), double result = 5.0, (v13 & 1) == 0))
  {
    [a1 htmlValueToPointLength:a3 parentFontSize:a4];
  }
  return result;
}

+ (double)fontWeightFromHtmlStr:(id)a3 parentWeight:(double)a4
{
  double v7 = (uint64_t *)[a3 type];
  id v8 = [a3 value];
  v9 = v8;
  if (v7 != (uint64_t *)&stru_108)
  {
    if (v7 == &stru_108.addr)
    {
      [a1 floatFromString:v8 usingDefault:0 restOfString:-65536.0];
      double v11 = v10;
      goto LABEL_4;
    }
    return 100.0;
  }
  if ([v8 isEqualToString:@"normal"]) {
    return 400.0;
  }
  if ([v9 isEqualToString:@"bold"]) {
    return 700.0;
  }
  if ([v9 isEqualToString:@"lighter"])
  {
    double v14 = -100.0;
  }
  else
  {
    if (![v9 isEqualToString:@"bolder"]) {
      return 100.0;
    }
    if (a4 == 400.0) {
      return 600.0;
    }
    double v14 = 100.0;
  }
  double v11 = a4 + v14;
LABEL_4:
  double result = 100.0;
  if (v11 >= 100.0)
  {
    double result = v11;
    if (v11 > 900.0) {
      return 900.0;
    }
  }
  return result;
}

+ (double)fontPointSizeFromHtmlStr:(id)a3 parentSize:(double)a4
{
  if ([a3 type] == &stru_108)
  {
    id v7 = [a3 value];
    +[PFSFontSizeNameMap fontSizeForName:v7 parentSize:a4];
  }
  else if ([a1 tokenRepresentsLength:a3])
  {
    [a1 htmlValueToPointLength:a3 parentFontSize:a4];
  }
  else
  {
    return -65536.0;
  }
  return result;
}

+ (id)identValueOrNilFromPair:(id)a3
{
  if ([a3 type] != &stru_108) {
    return 0;
  }

  return [a3 value];
}

+ (id)prioritizedPropertyValueLookup:(id)a3 usingNames:(id)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id result = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(a4);
      }
      id result = [a3 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v9)];
      if (result) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id result = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v7 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

+ (double)floatFromString:(id)a3 usingDefault:(double)a4 restOfString:(_NSRange *)a5
{
  id v8 = [a3 length];
  if (!v8)
  {
    NSUInteger v10 = 0;
    if (!a5) {
      return a4;
    }
    goto LABEL_18;
  }
  id v9 = v8;
  v15 = a5;
  NSUInteger v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v16 = 1;
  do
  {
    unsigned int v13 = [a3 characterAtIndex:v10, v15];
    if (v13 < (unsigned __int16)PFXCh0 || v13 > (unsigned __int16)PFXCh9)
    {
      if (v10 || v13 != (unsigned __int16)PFXChDash)
      {
        if (v13 != (unsigned __int16)PFXChPeriod || v11) {
          goto LABEL_14;
        }
        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v16 = -1;
      }
    }
    else
    {
      uint64_t v12 = 10 * v12 + v13 - (unsigned __int16)PFXCh0;
      v11 *= 10;
    }
    ++v10;
  }
  while (v9 != (id)v10);
  NSUInteger v10 = (NSUInteger)v9;
LABEL_14:
  if (v10)
  {
    a4 = (double)(v16 * v12);
    if (v11) {
      a4 = a4 / (double)v11;
    }
  }
  a5 = v15;
  if (v15)
  {
LABEL_18:
    a5->location = v10;
    a5->length = (NSUInteger)[a3 length] - v10;
  }
  return a4;
}

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 percentageBasis:(double)a5 usePercentageBasis:(BOOL)a6 isPercent:(BOOL *)a7
{
  BOOL v8 = a6;
  if (!objc_msgSend(a1, "tokenRepresentsLength:")) {
    return -65536.0;
  }
  id v13 = [a3 type];
  double v14 = -65536.0;
  [a1 floatFromString:[a3 value] usingDefault:&v19 restOfString:-65536.0];
  if (v15 != -65536.0)
  {
    double v14 = v15;
    switch((unint64_t)v13)
    {
      case 0x116uLL:
        return v15 * a4;
      case 0x117uLL:
        double v15 = v15 * a4;
        double v17 = 0.5;
        return v15 * v17;
      case 0x118uLL:
      case 0x11CuLL:
      case 0x128uLL:
        return v14;
      case 0x119uLL:
        double v15 = v15 * 72.0;
        double v18 = 2.53999996;
        goto LABEL_16;
      case 0x11AuLL:
        double v15 = v15 * 72.0;
        double v18 = 25.3999996;
        goto LABEL_16;
      case 0x11BuLL:
        double v17 = 72.0;
        return v15 * v17;
      case 0x11DuLL:
        double v18 = 12.0;
        goto LABEL_16;
      case 0x127uLL:
        if (v8)
        {
          double v15 = v15 * a5;
          double v18 = 100.0;
        }
        else
        {
          double v18 = 100.0;
          *a7 = 1;
        }
LABEL_16:
        double v14 = v15 / v18;
        break;
      default:
        return -65536.0;
    }
  }
  return v14;
}

@end