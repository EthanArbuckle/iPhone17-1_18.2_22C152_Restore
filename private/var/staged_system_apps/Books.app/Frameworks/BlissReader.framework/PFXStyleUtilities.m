@interface PFXStyleUtilities
+ (BOOL)BOOLValueInPair:(id)a3;
+ (double)angleInDegreesInPair:(id)a3 readerState:(id)a4;
+ (double)colorComponentFromPair:(id)a3;
+ (double)percentageInPair:(id)a3;
+ (double)percentageStringToFraction:(id)a3;
+ (double)percentageWidthInArray:(id)a3 readerState:(id)a4;
+ (double)percentageWidthInPair:(id)a3 readerState:(id)a4;
+ (double)pointLengthInArray:(id)a3 readerState:(id)a4;
+ (double)pointLengthInPair:(id)a3 readerState:(id)a4;
+ (double)pointLengthInString:(id)a3 readerState:(id)a4;
+ (id)colorCache;
+ (id)colorInArray:(id)a3;
+ (id)htmlPairToColor:(id)a3;
+ (id)htmlStringToColor:(id)a3;
+ (id)identValueInPair:(id)a3;
+ (id)numberStringInPair:(id)a3;
+ (id)stringInPair:(id)a3;
+ (id)stringInPair:(id)a3 expectedType:(int64_t)a4;
+ (id)uriValueInPair:(id)a3;
+ (int64_t)integerValueInPair:(id)a3;
+ (int64_t)xmlChar2HexDigit:(unsigned __int8)a3;
+ (void)initialize;
@end

@implementation PFXStyleUtilities

+ (void)initialize
{
  if (objc_opt_class()) {
    whitespaceCharacterSet = +[NSCharacterSet whitespaceCharacterSet];
  }
}

+ (id)colorInArray:(id)a3
{
  id result = [a3 count];
  if (result)
  {
    uint64_t v6 = 0;
    while (1)
    {
      id result = [a1 htmlPairToColor:[a3 objectAtIndex:v6]];
      if (result) {
        break;
      }
      if (++v6 >= (unint64_t)[a3 count]) {
        return 0;
      }
    }
  }
  return result;
}

+ (double)colorComponentFromPair:(id)a3
{
  v4 = (uint64_t *)[a3 type];
  if (v4 == (uint64_t *)&stru_108.segname[15])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    double v7 = 100.0;
  }
  else
  {
    double result = 0.0;
    if (v4 != &stru_108.addr) {
      return result;
    }
    double v6 = (double)(uint64_t)objc_msgSend(objc_msgSend(a3, "value", 0.0), "integerValue");
    double v7 = 255.0;
  }
  return v6 / v7;
}

+ (id)htmlPairToColor:(id)a3
{
  v5 = (section_64 *)[a3 type];
  if (v5 == &stru_108)
  {
    id v9 = [a3 value];
    id v10 = +[PFXColorPaletteEntry entryForColor:](PFXColorPaletteEntry, "entryForColor:", [v9 stringByTrimmingCharactersInSet:whitespaceCharacterSet]);
    if (!v10) {
      return 0;
    }
    v11 = v10;
    [v10 red];
    double v13 = v12;
    [v11 green];
    double v15 = v14;
    [v11 blue];
    double v17 = v16;
    double v18 = 1.0;
    double v19 = v13;
    double v20 = v15;
  }
  else
  {
    if (v5 != (section_64 *)((char *)&stru_108.addr + 2))
    {
      if (v5 == (section_64 *)&stru_108.sectname[1])
      {
        id v6 = [a3 value];
        id v7 = [v6 stringByTrimmingCharactersInSet:whitespaceCharacterSet];
        return [a1 htmlStringToColor:v7];
      }
      return 0;
    }
    id v21 = [a3 value];
    double v22 = 1.0;
    double v23 = 0.0;
    if ([v21 count] == (char *)&dword_0 + 2 {
      && ((id v24 = [v21 objectAtIndex:0],
    }
           ([v24 isEqualToString:@"rgb("] != 0)
       || [v24 isEqualToString:@"rgba("])
    {
      id v25 = [v21 objectAtIndex:1];
      double v26 = 0.0;
      double v27 = 0.0;
      if ((unint64_t)[v25 count] >= 5)
      {
        [a1 colorComponentFromPair:[v25 objectAtIndex:0]];
        double v23 = v28;
        [a1 colorComponentFromPair:[v25 objectAtIndex:2]];
        double v26 = v29;
        [a1 colorComponentFromPair:[v25 objectAtIndex:4]];
        double v27 = v30;
      }
      if (objc_msgSend(v24, "isEqualToString:", @"rgba(") {
        && (unint64_t)[v25 count] >= 7)
      }
      {
        objc_msgSend(objc_msgSend(objc_msgSend(v25, "objectAtIndex:", 6), "value"), "doubleValue");
        double v22 = v31;
      }
    }
    else
    {
      double v26 = 0.0;
      double v27 = 0.0;
    }
    double v19 = v23;
    double v20 = v26;
    double v17 = v27;
    double v18 = v22;
  }

  return +[TSUColor colorWithRed:v19 green:v20 blue:v17 alpha:v18];
}

+ (id)colorCache
{
  id result = (id)qword_573710;
  if (!qword_573710)
  {
    qword_573710 = (uint64_t)objc_alloc_init((Class)NSCache);
    [(id)qword_573710 setCountLimit:10];
    return (id)qword_573710;
  }
  return result;
}

+ (id)htmlStringToColor:(id)a3
{
  id v5 = +[PFXStyleUtilities colorCache];
  id v6 = (TSUColor *)[v5 objectForKey:a3];
  if (!v6)
  {
    if ([a3 length])
    {
      id v7 = +[PFXColorPaletteEntry entryForColor:a3];
      id v6 = v7;
      if (v7)
      {
        [(TSUColor *)v7 red];
        double v9 = v8;
        [(TSUColor *)v6 green];
        double v11 = v10;
        [(TSUColor *)v6 blue];
        id v6 = +[TSUColor colorWithRed:v9 green:v11 blue:v12 alpha:1.0];
      }
      if ([a3 hasPrefix:@"rgba("]
      {
        id v13 = [a3 substringWithRange:5, (char *)[a3 length] - 6];
        id v14 = [[v13 stringByTrimmingCharactersInSet:whitespaceCharacterSet] componentsSeparatedByString:@","];
        uint64_t v15 = 0;
        double v37 = 0.0;
        double v38 = 0.0;
        double v39 = 0.0;
        do
        {
          id v16 = [v14 objectAtIndex:v15, *(void *)&v37, *(void *)&v38, *(void *)&v39];
          if ([v16 hasSuffix:@"%"])
          {
            [v16 doubleValue];
            double v18 = v17 / 100.0;
          }
          else
          {
            double v18 = (double)(uint64_t)[v16 integerValue] / 255.0;
          }
          *(&v37 + v15++) = v18;
        }
        while (v15 != 3);
        objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 3), "doubleValue");
        id v6 = +[TSUColor colorWithRed:v37 green:v38 blue:v39 alpha:v19];
      }
      if (v6) {
        goto LABEL_40;
      }
      double v20 = (unsigned __int8 *)[a3 UTF8String];
      if (PFXChHash == *v20) {
        id v21 = v20 + 1;
      }
      else {
        id v21 = v20;
      }
      int v22 = xmlStrlen(v21);
      if (*v21)
      {
        int v23 = v22;
        id v24 = [a1 xmlChar2HexDigit:];
        if (v23 == 3) {
          uint64_t v25 = 17 * (void)v24;
        }
        else {
          uint64_t v25 = 16 * (void)v24;
        }
        int v26 = v21[1];
        if (v21[1]) {
          BOOL v27 = v23 == 3;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          v25 += (uint64_t)[a1 xmlChar2HexDigit:];
          int v26 = v21[2];
          ++v21;
        }
        if (v26)
        {
          id v28 = [a1 xmlChar2HexDigit:];
          if (v23 == 3) {
            uint64_t v29 = 17 * (void)v28;
          }
          else {
            uint64_t v29 = 16 * (void)v28;
          }
          int v30 = v21[2];
          if (v21[2]) {
            BOOL v31 = v23 == 3;
          }
          else {
            BOOL v31 = 1;
          }
          if (v31)
          {
            uint64_t v34 = 2;
          }
          else
          {
            v29 += (uint64_t)[a1 xmlChar2HexDigit:];
            int v30 = v21[3];
            uint64_t v34 = 3;
          }
          if (v30)
          {
            v35 = &v21[v34];
            id v36 = [a1 xmlChar2HexDigit:];
            if (v23 == 3) {
              uint64_t v32 = 17 * (void)v36;
            }
            else {
              uint64_t v32 = 16 * (void)v36;
            }
            if (v35[1] && v23 != 3) {
              v32 += (uint64_t)[a1 xmlChar2HexDigit:];
            }
            goto LABEL_39;
          }
LABEL_38:
          uint64_t v32 = 0;
LABEL_39:
          id v6 = +[TSUColor colorWithRed:(double)v25 / 255.0 green:(double)v29 / 255.0 blue:(double)v32 / 255.0 alpha:1.0];
LABEL_40:
          [v5 setObject:v6 forKey:a3];
          return v6;
        }
      }
      else
      {
        uint64_t v25 = 0;
      }
      uint64_t v29 = 0;
      goto LABEL_38;
    }
    return 0;
  }
  return v6;
}

+ (int64_t)xmlChar2HexDigit:(unsigned __int8)a3
{
  uint64_t v3 = (unsigned __int16)PFXCha;
  if (a3 >= (unsigned __int16)PFXCha && (unsigned __int16)PFXChf >= a3) {
    return a3 - v3 + 10;
  }
  uint64_t v3 = (unsigned __int16)PFXChA;
  if (a3 >= (unsigned __int16)PFXChA && (unsigned __int16)PFXChF >= a3) {
    return a3 - v3 + 10;
  }
  if (a3 < (unsigned __int16)PFXCh0) {
    return 0;
  }
  if ((unsigned __int16)PFXCh9 >= a3) {
    return a3 - (unint64_t)(unsigned __int16)PFXCh0;
  }
  return 0;
}

+ (double)pointLengthInPair:(id)a3 readerState:(id)a4
{
  switch((unint64_t)[a3 type])
  {
    case 0x119uLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      double v6 = v7 * 132.0;
      double v8 = 2.54;
      goto LABEL_8;
    case 0x11AuLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      double v6 = v9 * 132.0;
      double v8 = 25.4;
      goto LABEL_8;
    case 0x11BuLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      double v11 = v10 * 132.0;
      return v11 * 0.545454545;
    case 0x11CuLL:
    case 0x128uLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      goto LABEL_7;
    case 0x11DuLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      double v6 = v12 * 12.0;
LABEL_7:
      double v8 = 0.545454545;
LABEL_8:
      double v11 = v6 / v8;
      break;
    case 0x127uLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      double v15 = v14;
      objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlStackEntry"), "currentEntryMediaState"), "blockWidth");
      double v11 = v15 / 100.0 * v16;
      break;
    default:
      objc_opt_class();
      [a3 value];
      [(id)TSUDynamicCast() doubleValue];
      break;
  }
  return v11 * 0.545454545;
}

+ (double)pointLengthInArray:(id)a3 readerState:(id)a4
{
  id v6 = [a3 lastObject];

  [a1 pointLengthInPair:v6 readerState:a4];
  return result;
}

+ (double)pointLengthInString:(id)a3 readerState:(id)a4
{
  [a3 doubleValue];
  return result;
}

+ (double)angleInDegreesInPair:(id)a3 readerState:(id)a4
{
  id v5 = (char *)[a3 type];
  if (v5 == &stru_108.segname[8])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    double v9 = v8 * 90.0;
    double v10 = 100.0;
    return v9 / v10;
  }
  if (v5 == &stru_108.segname[7])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    double v9 = v11 * 180.0;
    double v10 = 3.14159265;
    return v9 / v10;
  }
  double result = 0.0;
  if (v5 == &stru_108.segname[6])
  {
    id v7 = [a3 value:0.0];
    [v7 doubleValue];
  }
  return result;
}

+ (double)percentageWidthInPair:(id)a3 readerState:(id)a4
{
  if ([a3 type] == &stru_108.segname[15])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    return v7 / 100.0;
  }
  else
  {
    id v9 = [a4 currentHtmlStackEntry];
    [a1 pointLengthInPair:a3 readerState:a4];
    double v11 = v10 / 0.545454545;
    objc_msgSend(objc_msgSend(v9, "currentEntryMediaState"), "blockWidth");
    return v11 / v12;
  }
}

+ (double)percentageWidthInArray:(id)a3 readerState:(id)a4
{
  id v6 = [a3 lastObject];

  [a1 percentageWidthInPair:v6 readerState:a4];
  return result;
}

+ (double)percentageStringToFraction:(id)a3
{
  if (![a3 hasSuffix:@"%"]) {
    return NAN;
  }
  [a3 doubleValue];
  return v4 / 100.0;
}

+ (double)percentageInPair:(id)a3
{
  if ([a3 type] != &stru_108.segname[15]) {
    return NAN;
  }
  objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
  return v4 / 100.0;
}

+ (id)stringInPair:(id)a3 expectedType:(int64_t)a4
{
  if (a4 && [a3 type] != (id)a4)
  {
    +[NSException raise:NSGenericException format:@"Malformed pair"];
    return 0;
  }
  else
  {
    objc_opt_class();
    [a3 value];
    return (id)TSUDynamicCast();
  }
}

+ (id)stringInPair:(id)a3
{
  return [a1 stringInPair:a3 expectedType:263];
}

+ (id)numberStringInPair:(id)a3
{
  return [a1 stringInPair:a3 expectedType:296];
}

+ (BOOL)BOOLValueInPair:(id)a3
{
  id v4 = [a1 stringInPair:a3 expectedType:0];
  id v5 = (uint64_t *)[a3 type];
  if (v5 == &stru_108.addr)
  {
    CFStringRef v7 = @"1";
  }
  else
  {
    if (v5 != (uint64_t *)&stru_108)
    {
      +[NSException raise:NSGenericException format:@"Not a BOOL pair"];
      return 0;
    }
    id v4 = [v4 lowercaseString];
    if (([v4 isEqualToString:@"t"] & 1) != 0
      || ([v4 isEqualToString:@"true"] & 1) != 0
      || ([v4 isEqualToString:@"y"] & 1) != 0)
    {
      return 1;
    }
    CFStringRef v7 = @"yes";
  }

  return [v4 isEqualToString:v7];
}

+ (id)uriValueInPair:(id)a3
{
  id v3 = [a1 stringInPair:a3 expectedType:297];

  return [v3 stringWithURLFromCssUriValue];
}

+ (id)identValueInPair:(id)a3
{
  return [a1 stringInPair:a3 expectedType:264];
}

+ (int64_t)integerValueInPair:(id)a3
{
  id v3 = [a1 stringInPair:a3 expectedType:296];

  return (int64_t)[v3 integerValue];
}

@end