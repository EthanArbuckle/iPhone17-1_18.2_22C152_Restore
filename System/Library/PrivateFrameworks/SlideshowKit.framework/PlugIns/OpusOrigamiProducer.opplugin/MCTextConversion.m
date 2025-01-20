@interface MCTextConversion
+ (id)attributedStringWithCTAttributesFromStringAttributes:(id)a3;
+ (id)attributedStringWithNSAttributesFromStringAttributes:(id)a3;
+ (id)stretchForFontDisplayName:(id)a3 andFamilyName:(id)a4;
+ (id)stringAttributesWithAttributedString:(id)a3;
+ (id)stringFromLigature:(int64_t)a3;
+ (id)stringFromTextAlignment:(int64_t)a3;
+ (id)styleForFontDisplayName:(id)a3 andFamilyName:(id)a4;
+ (id)textFormatFromUnderlineStyle:(unint64_t)a3;
+ (id)textFormatWithCTAttributesForText:(id)a3 attributes:(id)a4;
+ (id)textFormatWithNSAttributesForText:(id)a3 attributes:(id)a4;
+ (id)weightForFontDisplayName:(id)a3 andFamilyName:(id)a4;
+ (int64_t)ligatureFromString:(id)a3;
+ (int64_t)textAlignmentFromString:(id)a3;
+ (unint64_t)underlineStyleFromTextFormat:(id)a3;
@end

@implementation MCTextConversion

+ (id)styleForFontDisplayName:(id)a3 andFamilyName:(id)a4
{
  id v5 = a3;
  if ([a3 hasPrefix:a4]) {
    id v5 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a4, "length"));
  }
  CFStringRef v6 = @"italic";
  if ([v5 rangeOfString:@"italic" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v6 = @"oblique";
    if ([v5 rangeOfString:@"oblique" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
      return @"normal";
    }
  }
  return (id)v6;
}

+ (id)weightForFontDisplayName:(id)a3 andFamilyName:(id)a4
{
  id v5 = a3;
  if ([a3 hasPrefix:a4]) {
    id v5 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a4, "length"));
  }
  if ([v5 rangeOfString:@"light" options:1] != (id)0x7FFFFFFFFFFFFFFFLL) {
    return @"lighter";
  }
  if ([v5 rangeOfString:@"bold" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return @"normal";
  }
  return @"bold";
}

+ (id)stretchForFontDisplayName:(id)a3 andFamilyName:(id)a4
{
  id v5 = a3;
  if ([a3 hasPrefix:a4]) {
    id v5 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a4, "length"));
  }
  if ([v5 rangeOfString:@"condensed" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return @"condensed";
  }
}

+ (int64_t)textAlignmentFromString:(id)a3
{
  if ([a3 isEqualToString:@"left"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"right"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"center"]) {
    return 2;
  }
  return 0;
}

+ (id)stringFromTextAlignment:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"center";
  }
  else {
    return off_1AB500[a3];
  }
}

+ (int64_t)ligatureFromString:(id)a3
{
  if ([a3 isEqualToString:@"noLigatures"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"defaultLigatures"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"allLigatures"]) {
    return 2;
  }
  return 1;
}

+ (id)stringFromLigature:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"defaultLigatures";
  }
  else {
    return off_1AB518[a3];
  }
}

+ (unint64_t)underlineStyleFromTextFormat:(id)a3
{
  id v4 = [a3 objectForKey:@"thickness"];
  if ([v4 isEqualToString:@"single"])
  {
    unint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"thick"])
  {
    unint64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"double"])
  {
    unint64_t v5 = 9;
  }
  else
  {
    unint64_t v5 = 1;
  }
  id v6 = [a3 objectForKey:@"pattern"];
  if (([v6 isEqualToString:@"solid"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"dot"])
    {
      v5 |= 0x100uLL;
    }
    else if ([v6 isEqualToString:@"dash"])
    {
      v5 |= 0x200uLL;
    }
    else if ([v6 isEqualToString:@"dashdot"])
    {
      v5 |= 0x300uLL;
    }
    else if ([v6 isEqualToString:@"dashdotdot"])
    {
      v5 |= 0x400uLL;
    }
  }
  return v5;
}

+ (id)textFormatFromUnderlineStyle:(unint64_t)a3
{
  __int16 v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  unint64_t v5 = v4;
  CFStringRef v6 = @"single";
  if (v3 == 2) {
    CFStringRef v6 = @"thick";
  }
  if (v3 == 9) {
    CFStringRef v7 = @"double";
  }
  else {
    CFStringRef v7 = v6;
  }
  [v4 setObject:v7 forKey:@"thickness"];
  if ((HIBYTE(v3) - 1) > 3u) {
    CFStringRef v8 = @"solid";
  }
  else {
    CFStringRef v8 = off_1AB530[(char)(HIBYTE(v3) - 1)];
  }
  [v5 setObject:v8 forKey:@"pattern"];
  [v5 setObject:&__kCFBooleanFalse forKey:@"byWord"];
  return v5;
}

+ (id)textFormatWithCTAttributesForText:(id)a3 attributes:(id)a4
{
  id v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:a3 forKey:@"text"];
  CFStringRef v7 = (const __CTFont *)[a4 objectForKey:kCTFontAttributeName];
  if (!v7) {
    CFStringRef v7 = CTFontCreateWithName(@"Helvetica", 12.0, 0);
  }
  CFStringRef v8 = (id)CTFontCopyPostScriptName(v7);
  CFStringRef v9 = (id)CTFontCopyFamilyName(v7);
  CFStringRef v10 = (id)CTFontCopyDisplayName(v7);
  [v6 setObject:v8 forKey:@"fontName"];
  [v6 setObject:v9 forKey:@"fontFamily"];
  CGFloat v11 = CTFontGetSize(v7);
  *(float *)&CGFloat v11 = v11;
  objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11), @"fontSize");
  objc_msgSend(v6, "setObject:forKey:", +[MCTextConversion styleForFontDisplayName:andFamilyName:](MCTextConversion, "styleForFontDisplayName:andFamilyName:", v10, v9), @"fontStyle");
  objc_msgSend(v6, "setObject:forKey:", +[MCTextConversion weightForFontDisplayName:andFamilyName:](MCTextConversion, "weightForFontDisplayName:andFamilyName:", v10, v9), @"fontWeight");
  id v12 = +[MCTextConversion stretchForFontDisplayName:v10 andFamilyName:v9];
  if (v12) {
    [v6 setObject:v12 forKey:@"fontStretch"];
  }
  v13 = (CGColor *)[a4 objectForKey:kCTForegroundColorAttributeName];
  if (!v13) {
    v13 = +[MPUtilities blackCGColor];
  }
  objc_msgSend(v6, "setObject:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v13), @"foregroundColor");
  id v14 = [a4 objectForKey:@"backgroundColor"];
  if (v14) {
    objc_msgSend(v6, "setObject:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v14), @"backgroundColor");
  }
  v15 = (const __CTParagraphStyle *)[a4 objectForKey:kCTParagraphStyleAttributeName];
  if (v15)
  {
    v16 = v15;
    unsigned __int8 valueBuffer = 0;
    if (CTParagraphStyleGetValueForSpecifier(v15, kCTParagraphStyleSpecifierAlignment, 1uLL, &valueBuffer)) {
      objc_msgSend(v6, "setObject:forKey:", +[MCTextConversion stringFromTextAlignment:](MCTextConversion, "stringFromTextAlignment:", valueBuffer), @"alignment");
    }
    double v43 = 0.0;
    if (CTParagraphStyleGetValueForSpecifier(v16, kCTParagraphStyleSpecifierFirstLineHeadIndent, 8uLL, &v43))
    {
      HIDWORD(v17) = HIDWORD(v43);
      *(float *)&double v17 = v43;
      objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17), @"firstLineHeadIndent");
    }
    double valuePtr = 0.0;
    if (CTParagraphStyleGetValueForSpecifier(v16, kCTParagraphStyleSpecifierHeadIndent, 8uLL, &valuePtr))
    {
      HIDWORD(v18) = HIDWORD(valuePtr);
      *(float *)&double v18 = valuePtr;
      objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18), @"headIndent");
    }
  }
  LODWORD(v43) = 0;
  id v19 = [a4 objectForKey:@"shadow"];
  if (v19)
  {
    v20 = v19;
    id v21 = +[NSMutableDictionary dictionary];
    id v22 = [v20 objectForKey:@"color"];
    if (v22) {
      objc_msgSend(v21, "setObject:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v22), @"color");
    }
    id v23 = [v20 objectForKey:@"offset"];
    if (v23)
    {
      [v23 CGSizeValue];
      [v21 setObject:NSStringFromCGSize(v45) forKey:@"offset"];
    }
    CFNumberRef v24 = (const __CFNumber *)[v20 objectForKey:@"blurRadius"];
    if (v24)
    {
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(v24, kCFNumberFloat32Type, &valuePtr);
      LODWORD(v25) = LODWORD(valuePtr);
      objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25), @"blurRadius");
    }
    [v6 setObject:v21 forKey:@"shadow"];
  }
  CFNumberRef v26 = (const __CFNumber *)[a4 objectForKey:kCTUnderlineStyleAttributeName];
  if (v26)
  {
    CFNumberRef v27 = v26;
    id v28 = +[NSMutableDictionary dictionary];
    CFNumberGetValue(v27, kCFNumberSInt32Type, &v43);
    objc_msgSend(v28, "addEntriesFromDictionary:", +[MCTextConversion textFormatFromUnderlineStyle:](MCTextConversion, "textFormatFromUnderlineStyle:", SLODWORD(v43)));
    id v29 = [a4 objectForKey:kCTUnderlineColorAttributeName];
    if (v29) {
      objc_msgSend(v28, "setObject:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v29), @"color");
    }
    [v6 setObject:v28 forKey:@"underline"];
  }
  CFNumberRef v30 = (const __CFNumber *)[a4 objectForKey:kCTSuperscriptAttributeName];
  if (v30)
  {
    CFNumberGetValue(v30, kCFNumberSInt32Type, &v43);
    objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(v43)), @"superscript");
  }
  CFNumberRef v31 = (const __CFNumber *)[a4 objectForKey:kCTLigatureAttributeName];
  if (v31)
  {
    CFNumberGetValue(v31, kCFNumberSInt32Type, &v43);
    objc_msgSend(v6, "setObject:forKey:", +[MCTextConversion stringFromLigature:](MCTextConversion, "stringFromLigature:", SLODWORD(v43)), @"ligature");
  }
  CFNumberRef v32 = (const __CFNumber *)[a4 objectForKey:kCTKernAttributeName];
  if (v32)
  {
    CFNumberGetValue(v32, kCFNumberSInt32Type, &v43);
    objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(v43)), @"kern");
  }
  CFNumberRef v33 = (const __CFNumber *)[a4 objectForKey:kCTStrokeWidthAttributeName];
  if (v33)
  {
    CFNumberRef v34 = v33;
    id v35 = +[NSMutableDictionary dictionary];
    CFNumberGetValue(v34, kCFNumberSInt32Type, &v43);
    objc_msgSend(v6, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(v43)), @"strokeWidth");
    id v36 = [a4 objectForKey:kCTStrokeColorAttributeName];
    if (v36) {
      objc_msgSend(v35, "setObject:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v36), @"strokeColor");
    }
  }
  id v37 = [a4 objectForKey:@"strikethrough"];
  if (v37)
  {
    v38 = v37;
    id v39 = +[NSMutableDictionary dictionary];
    LODWORD(v43) = [v38 integerValue];
    objc_msgSend(v39, "addEntriesFromDictionary:", +[MCTextConversion textFormatFromUnderlineStyle:](MCTextConversion, "textFormatFromUnderlineStyle:", SLODWORD(v43)));
    id v40 = [a4 objectForKey:kCTUnderlineColorAttributeName];
    if (v40) {
      objc_msgSend(v39, "setObject:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", v40), @"color");
    }
    [v6 setObject:v39 forKey:@"strikethrough"];
  }
  return v6;
}

+ (id)textFormatWithNSAttributesForText:(id)a3 attributes:(id)a4
{
  return +[NSMutableDictionary dictionary];
}

+ (id)stringAttributesWithAttributedString:(id)a3
{
  id v4 = (char *)[a3 length];
  id v5 = [a3 string];
  id v6 = +[NSMutableArray array];
  if (v4)
  {
    uint64_t v7 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      id v8 = objc_msgSend(a3, "attributesAtIndex:longestEffectiveRange:inRange:", v7, &v11, v7, v4);
      objc_msgSend(v6, "addObject:", +[MCTextConversion textFormatWithCTAttributesForText:attributes:](MCTextConversion, "textFormatWithCTAttributesForText:attributes:", objc_msgSend(v5, "substringWithRange:", v11, v12), v8));
      CFStringRef v9 = &v4[v7];
      uint64_t v7 = v12 + v11;
      id v4 = &v9[-v12 - v11];
    }
    while (v9 != (char *)(v12 + v11));
  }
  return v6;
}

+ (id)attributedStringWithCTAttributesFromStringAttributes:(id)a3
{
  id v59 = objc_alloc_init((Class)NSMutableAttributedString);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v67;
    uint64_t v60 = *(void *)v67;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v67 != v6) {
          objc_enumerationMutation(a3);
        }
        id v8 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        id v9 = [v8 objectForKey:@"text"];
        if (v9)
        {
          CFStringRef v10 = v9;
          if ([v9 length])
          {
            uint64_t v11 = (__CFAttributedString *)[objc_alloc((Class)NSMutableAttributedString) initWithString:v10];
            id v12 = [v10 length];
            id v13 = [v8 objectForKey:@"foregroundColor"];
            if (v13)
            {
              id v14 = +[MPUtilities CGColorFromString:v13];
              v72.location = 0;
              v72.length = (CFIndex)v12;
              CFAttributedStringSetAttribute(v11, v72, kCTForegroundColorAttributeName, v14);
            }
            CFIndex v61 = (CFIndex)v12;
            v62 = v11;
            id v15 = [v8 objectForKey:@"backgroundColor"];
            if (v15)
            {
              v16 = +[MPUtilities CGColorFromString:v15];
              v73.length = (CFIndex)v12;
              v73.location = 0;
              CFAttributedStringSetAttribute(v11, v73, @"backgroundColor", v16);
            }
            CFStringRef v17 = (const __CFString *)[v8 objectForKey:@"fontName"];
            if (v17)
            {
              CFStringRef v18 = v17;
              id v19 = [v8 objectForKey:@"fontSize"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v19 = [v19 objectForKey:@"3x4"];
              }
              [v19 floatValue];
              id v21 = CTFontCreateWithName(v18, v20, 0);
              v74.length = v61;
              v74.location = 0;
              CFAttributedStringSetAttribute(v11, v74, kCTFontAttributeName, v21);
              uint64_t v6 = v60;
            }
            unsigned __int8 v65 = 0;
            double v63 = 0.0;
            double v64 = 0.0;
            id v22 = [v8 objectForKey:@"alignment"];
            if (v22)
            {
              unsigned __int8 v65 = +[MCTextConversion textAlignmentFromString:v22];
              size_t v23 = 1;
              *(void *)&settings[0].spec = 0;
              settings[0].valueSize = 1;
              settings[0].value = &v65;
            }
            else
            {
              size_t v23 = 0;
            }
            id v24 = [v8 objectForKey:@"firstLineHeadIndent"];
            if (v24)
            {
              [v24 floatValue];
              double v64 = v25;
              CFNumberRef v26 = &settings[v23];
              *(void *)&v26->spec = 1;
              ++v23;
              v26->valueSize = 8;
              v26->value = &v64;
            }
            id v27 = [v8 objectForKey:@"headIndent"];
            if (v27)
            {
              [v27 floatValue];
              double v63 = v28;
              id v29 = &settings[v23];
              *(void *)&v29->spec = 2;
              ++v23;
              v29->valueSize = 8;
              v29->value = &v63;
              goto LABEL_24;
            }
            if (v23)
            {
LABEL_24:
              CTParagraphStyleRef v30 = CTParagraphStyleCreate(settings, v23);
              v75.length = v61;
              v75.location = 0;
              CFAttributedStringSetAttribute(v11, v75, kCTParagraphStyleAttributeName, v30);
              CFRelease(v30);
            }
            id v31 = [v8 objectForKey:@"shadow"];
            if (v31)
            {
              CFNumberRef v32 = v31;
              id v33 = +[NSMutableDictionary dictionary];
              id v34 = [v32 objectForKey:@"color"];
              if (v34) {
                objc_msgSend(v33, "setObject:forKey:", +[MPUtilities CGColorFromString:](MPUtilities, "CGColorFromString:", v34), @"color");
              }
              id v35 = (NSString *)[v32 objectForKey:@"offset"];
              if (v35)
              {
                CGSize v36 = CGSizeFromString(v35);
                uint64_t v6 = v60;
                objc_msgSend(v33, "setObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v36.width, v36.height), @"offset");
              }
              id v37 = [v32 objectForKey:@"blurRadius"];
              if (v37)
              {
                [v37 floatValue];
                objc_msgSend(v33, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), @"blurRadius");
              }
              v76.length = v61;
              v76.location = 0;
              CFAttributedStringSetAttribute(v62, v76, @"shadow", v33);
            }
            id v38 = [v8 objectForKey:@"underline"];
            if (v38)
            {
              id v39 = v38;
              id v40 = [v38 objectForKey:@"color"];
              if (v40)
              {
                v41 = +[MPUtilities CGColorFromString:v40];
                v77.location = 0;
                v77.length = v61;
                CFAttributedStringSetAttribute(v62, v77, kCTForegroundColorAttributeName, v41);
              }
              v42 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[MCTextConversion underlineStyleFromTextFormat:v39]);
              v78.location = 0;
              v78.length = v61;
              CFAttributedStringSetAttribute(v62, v78, kCTUnderlineStyleAttributeName, v42);
            }
            id v43 = [v8 objectForKey:@"strikethrough"];
            if (v43)
            {
              id v44 = v43;
              id v45 = [v43 objectForKey:@"color"];
              if (v45)
              {
                v46 = +[MPUtilities CGColorFromString:v45];
                v79.location = 0;
                v79.length = v61;
                CFAttributedStringSetAttribute(v62, v79, kCTForegroundColorAttributeName, v46);
              }
              v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MCTextConversion underlineStyleFromTextFormat:v44]);
              v80.location = 0;
              v80.length = v61;
              CFAttributedStringSetAttribute(v62, v80, @"strikethrough", v47);
            }
            id v48 = [v8 objectForKey:@"superscript"];
            if (v48)
            {
              v49 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v48 intValue]);
              v81.location = 0;
              v81.length = v61;
              CFAttributedStringSetAttribute(v62, v81, kCTSuperscriptAttributeName, v49);
            }
            id v50 = [v8 objectForKey:@"ligature"];
            if (v50)
            {
              v51 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v50 intValue]);
              v82.location = 0;
              v82.length = v61;
              CFAttributedStringSetAttribute(v62, v82, kCTLigatureAttributeName, v51);
            }
            id v52 = [v8 objectForKey:@"kern"];
            if (v52)
            {
              v53 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v52 intValue]);
              v83.location = 0;
              v83.length = v61;
              CFAttributedStringSetAttribute(v62, v83, kCTKernAttributeName, v53);
            }
            id v54 = [v8 objectForKey:@"strokeWidth"];
            if (v54)
            {
              v55 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v54 intValue]);
              v84.location = 0;
              v84.length = v61;
              CFAttributedStringSetAttribute(v62, v84, kCTStrokeWidthAttributeName, v55);
              id v56 = [v8 objectForKey:@"strokeColor"];
              if (v56)
              {
                v57 = +[MPUtilities CGColorFromString:v56];
                v85.location = 0;
                v85.length = v61;
                CFAttributedStringSetAttribute(v62, v85, kCTStrokeColorAttributeName, v57);
              }
            }
            [v59 appendAttributedString:v62];

            continue;
          }
        }
      }
      id v5 = [a3 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v5);
  }
  return v59;
}

+ (id)attributedStringWithNSAttributesFromStringAttributes:(id)a3
{
  id v3 = objc_alloc_init((Class)NSMutableAttributedString);
  return v3;
}

@end