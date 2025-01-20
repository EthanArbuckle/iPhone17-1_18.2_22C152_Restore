@interface PFXFont
+ (double)mapFontProperties:(id)a3 to:(id)a4 stackEntry:(id)a5;
+ (void)mapFontName:(id)a3 to:(id)a4 index:(unint64_t *)a5 stackEntry:(id)a6;
+ (void)mapFontShorthand:(id)a3 to:(id)a4 parentFontSize:(double *)a5 stackEntry:(id)a6;
+ (void)mapFontSize:(id)a3 to:(id)a4 parentFontSize:(double *)a5 index:(unint64_t *)a6;
+ (void)mapFontStyle:(id)a3 to:(id)a4 index:(unint64_t *)a5;
+ (void)mapFontTagTo:(id)a3 stackEntry:(id)a4;
+ (void)mapFontVariant:(id)a3 to:(id)a4 index:(unint64_t *)a5;
+ (void)mapFontWeight:(id)a3 to:(id)a4 index:(unint64_t *)a5;
@end

@implementation PFXFont

+ (double)mapFontProperties:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  objc_msgSend(objc_msgSend(objc_msgSend(a5, "parentHtmlStackEntry"), "currentEntryMediaState"), "fontSize");
  double v20 = v9;
  uint64_t v19 = 0;
  [a1 mapFontSize:[a3 valueForProperty:@"font-size"] to:a4 parentFontSize:&v20 index:&v19];
  [a1 mapFontShorthand:[a3 valueForProperty:@"font"] to:a4 parentFontSize:&v20 stackEntry:a5];
  id v10 = [a3 valueForProperty:"color"];
  if (v10)
  {
    id v11 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", [v10 lastObject]);
    if (v11) {
      [a4 setObject:v11 forProperty:18];
    }
  }
  id v12 = [a3 valueForProperty:"font-family"];
  if (objc_msgSend(v12, "count", 0))
  {
    uint64_t v13 = 0;
    while (1)
    {
      id v14 = [v12 objectAtIndex:v13];
      if ((char *)[v14 type] - 263 <= (unsigned char *)&dword_0 + 1)
      {
        if (objc_msgSend(objc_msgSend(a5, "htmlReaderState"), "postScriptNameForFamilyName:", objc_msgSend(v14, "value")))
        {
          break;
        }
      }
      if (++v13 >= (unint64_t)[v12 count]) {
        goto LABEL_11;
      }
    }
    uint64_t v19 = v13;
  }
LABEL_11:
  [a1 mapFontName:v12 to:a4 index:&v19 stackEntry:a5];
  id v15 = [a3 valueForProperty:"font-style"];
  uint64_t v19 = 0;
  [a1 mapFontStyle:v15 to:a4 index:&v19];
  id v16 = [a3 valueForProperty:"font-variant"];
  uint64_t v19 = 0;
  [a1 mapFontVariant:v16 to:a4 index:&v19];
  id v17 = [a3 valueForProperty:"font-weight"];
  uint64_t v19 = 0;
  [a1 mapFontWeight:v17 to:a4 index:&v19];
  return v20;
}

+ (void)mapFontTagTo:(id)a3 stackEntry:(id)a4
{
  id v6 = [a4 valueForAttribute:"face"];
  if (v6)
  {
    id v7 = [v6 componentsSeparatedByString:@","];
    if ([v7 count])
    {
      id v8 = [[v7 objectAtIndex:0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      id v9 = objc_msgSend(objc_msgSend(a4, "htmlReaderState"), "postScriptNameForFamilyName:", v8);
      if (v9)
      {
        id v10 = v9;
        id v11 = a3;
      }
      else
      {
        id v11 = a3;
        id v10 = v8;
      }
      [v11 setObject:v10 forProperty:16];
    }
  }
  id v12 = [a4 valueForAttribute:"size"];
  if (v12)
  {
    uint64_t v13 = v12;
    if ([v12 length])
    {
      unsigned int v14 = [v13 characterAtIndex:0];
      if (v14 == (unsigned __int16)PFXChPlus)
      {
        BOOL v15 = 0;
        uint64_t v16 = 1;
      }
      else
      {
        BOOL v15 = [v13 characterAtIndex:0] == (unsigned __int16)PFXChDash;
        uint64_t v16 = v15;
      }
      id v17 = [[v13 substringFromIndex:v16] integerValue];
      uint64_t v18 = (uint64_t)v17 + 3;
      uint64_t v19 = 3 - (void)v17;
      if (!v15) {
        uint64_t v19 = (uint64_t)v17;
      }
      if (v14 != (unsigned __int16)PFXChPlus) {
        uint64_t v18 = v19;
      }
      uint64_t v20 = 7;
      if (v18 < 7) {
        uint64_t v20 = v18;
      }
      uint64_t v21 = v20 - 1;
      if (v18 <= 0) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = v21;
      }
      double v23 = dbl_345790[v22];
      *(float *)&double v23 = v23;
      [a3 setFloatValue:17 forProperty:v23];
    }
  }
  id v24 = [a4 valueForAttribute:"color"];
  if (v24)
  {
    id v25 = +[PFXStyleUtilities htmlStringToColor:v24];
    if (v25)
    {
      [a3 setObject:v25 forProperty:18];
    }
  }
}

+ (void)mapFontName:(id)a3 to:(id)a4 index:(unint64_t *)a5 stackEntry:(id)a6
{
  if (qword_5736D8 == -1)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_5736D8, &stru_45C138);
    if (!a3) {
      return;
    }
  }
  if ((unint64_t)[a3 count] > *a5)
  {
    id v10 = [a3 objectAtIndex:];
    if ((char *)[v10 type] - 263 <= (unsigned char *)&dword_0 + 1)
    {
      id v11 = [v10 value];
      id v12 = (void *)qword_5736D0;
      objc_sync_enter((id)qword_5736D0);
      id v13 = [(id)qword_5736D0 objectForKey:v11];
      if (v13)
      {
LABEL_18:
        [a4 setObject:v13 forProperty:16];
        objc_sync_exit(v12);
        ++*a5;
        return;
      }
      id v13 = objc_msgSend(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", @" ITC", &stru_46D7E8), "stringByReplacingOccurrencesOfString:withString:", @" TT", &stru_46D7E8);
      if ([v13 isEqualToString:@"cursive"])
      {
        unsigned int v14 = (id *)&PFXStrAppleChancery;
      }
      else if ([v13 isEqualToString:@"fantasy"])
      {
        unsigned int v14 = (id *)&PFXStrPapyrus;
      }
      else if ([v13 isEqualToString:@"monospace"])
      {
        unsigned int v14 = (id *)&PFXStrCourier;
      }
      else if ([v13 isEqualToString:@"sans-serif"])
      {
        unsigned int v14 = (id *)&PFXStrHelvetica;
      }
      else
      {
        if (![v13 isEqualToString:@"serif"])
        {
          id v15 = objc_msgSend(objc_msgSend(a6, "htmlReaderState"), "postScriptNameForFamilyName:", v13);
          if (v15) {
            id v13 = v15;
          }
          goto LABEL_17;
        }
        unsigned int v14 = (id *)&PFXStrTimes;
      }
      id v13 = *v14;
LABEL_17:
      [(id)qword_5736D0 setObject:v13 forKey:v11];
      goto LABEL_18;
    }
  }
}

+ (void)mapFontStyle:(id)a3 to:(id)a4 index:(unint64_t *)a5
{
  if (a3)
  {
    if ((unint64_t)[a3 count] > *a5)
    {
      id v8 = [a3 objectAtIndex:];
      if ([v8 type] == &stru_108)
      {
        id v9 = [v8 value];
        if (([v9 isEqualToString:@"italic"] & 1) != 0
          || ([v9 isEqualToString:@"oblique"] & 1) != 0)
        {
          uint64_t v10 = 1;
        }
        else
        {
          if (([v9 isEqualToString:@"normal"] & 1) == 0)
          {
            if (([v9 isEqualToString:@"inherit"] & 1) == 0) {
              return;
            }
            goto LABEL_8;
          }
          uint64_t v10 = 0;
        }
        [a4 setBoolValue:v10 forProperty:20];
LABEL_8:
        ++*a5;
      }
    }
  }
}

+ (void)mapFontVariant:(id)a3 to:(id)a4 index:(unint64_t *)a5
{
  if (a3)
  {
    if ((unint64_t)[a3 count] > *a5)
    {
      id v8 = [a3 objectAtIndex:];
      if ([v8 type] == &stru_108)
      {
        id v9 = [v8 value];
        if ([v9 isEqualToString:@"small-caps"])
        {
          uint64_t v10 = 2;
        }
        else
        {
          if (([v9 isEqualToString:@"normal"] & 1) == 0)
          {
            if (([v9 isEqualToString:@"inherit"] & 1) == 0) {
              return;
            }
            goto LABEL_9;
          }
          uint64_t v10 = 0;
        }
        [a4 setIntValue:v10 forProperty:21];
LABEL_9:
        ++*a5;
      }
    }
  }
}

+ (void)mapFontWeight:(id)a3 to:(id)a4 index:(unint64_t *)a5
{
  if (a3)
  {
    if ((unint64_t)[a3 count] > *a5)
    {
      +[PFSUtilities fontWeightFromHtmlStr:parentWeight:](PFSUtilities, "fontWeightFromHtmlStr:parentWeight:", [a3 objectAtIndex:], 400.0);
      if (v8 > 500.0 || v8 > 0.0)
      {
        [a4 setBoolValue:v8 > 500.0 forProperty:19];
        ++*a5;
      }
    }
  }
}

+ (void)mapFontSize:(id)a3 to:(id)a4 parentFontSize:(double *)a5 index:(unint64_t *)a6
{
  if (a3 && (unint64_t)[a3 count] > *a6)
  {
    +[PFSUtilities fontPointSizeFromHtmlStr:parentSize:](PFSUtilities, "fontPointSizeFromHtmlStr:parentSize:", [a3 objectAtIndex:], *a5);
    if (v10 != -65536.0)
    {
      double v11 = round(v10 * 1000.0);
      double v12 = v11 / 1000.0;
      *(float *)&double v11 = v11 / 1000.0;
      [a4 setFloatValue:17 forProperty:v11];
      ++*a6;
      *a5 = v12;
    }
  }
}

+ (void)mapFontShorthand:(id)a3 to:(id)a4 parentFontSize:(double *)a5 stackEntry:(id)a6
{
  if (a3)
  {
    id v11 = [a3 count];
    if (v11)
    {
      [a4 setBoolValue:0 forProperty:20];
      [a4 setIntValue:0 forProperty:21];
      [a4 setBoolValue:0 forProperty:19];
      LODWORD(v12) = 16.0;
      [a4 setFloatValue:17 forProperty:v12];
      [a4 setObject:@"Times-Roman" forProperty:16];
      unint64_t v13 = 0;
      while (1)
      {
        unint64_t v16 = v13;
        [a1 mapFontSize:a3 to:a4 parentFontSize:a5 index:&v16];
        unint64_t v14 = v16;
        if (v16 != v13) {
          break;
        }
        [a1 mapFontStyle:a3 to:a4 index:&v16];
        unint64_t v14 = v16;
        if (v16 == v13)
        {
          [a1 mapFontVariant:a3 to:a4 index:&v16];
          unint64_t v14 = v16;
          if (v16 == v13)
          {
            [a1 mapFontWeight:a3 to:a4 index:&v16];
            unint64_t v14 = v16;
            if (v16 == v13)
            {
              unint64_t v14 = v13 + 1;
              unint64_t v16 = v13 + 1;
            }
          }
        }
        unint64_t v15 = v14;
        unint64_t v13 = v14;
        if (v14 >= (unint64_t)v11) {
          goto LABEL_15;
        }
      }
      unint64_t v15 = v16;
      if (v16 < (unint64_t)v11
        && objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v16, v15), "type") == &stru_20.segname[7])
      {
        v14 += 2;
        unint64_t v15 = v14;
      }
    }
    else
    {
      unint64_t v14 = 0;
      unint64_t v15 = 0;
      unint64_t v16 = 0;
    }
LABEL_15:
    if (v14 < (unint64_t)v11) {
      [a1 mapFontName:a3 to:a4 index:&v15 stackEntry:a6];
    }
  }
}

@end