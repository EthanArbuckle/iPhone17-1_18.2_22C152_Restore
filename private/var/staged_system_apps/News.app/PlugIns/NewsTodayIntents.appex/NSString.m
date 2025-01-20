@interface NSString
- (BOOL)fr_hasPrefixEquivalentToString:(id)a3;
- (BOOL)fr_isEquivalentToString:(id)a3;
- (double)heightConstrainedToWidth:(double)a3 font:(id)a4 singleLine:(BOOL)a5;
- (id)fr_StringByTrimmingLeadingWhiteSpace;
- (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement;
- (id)fr_accessibilityAttributedStringWithLowPitchPrefix:(id)a3;
- (id)fr_accessibilityLowPitchAttributedString;
- (id)fr_convertNewlinesToPTags;
- (id)fr_encodeHTMLEntities;
- (id)fr_lowerCaseStringByTrimmingWhiteSpace;
- (id)fr_stringByDecodingHTMLEntities;
- (id)fr_stringInitials;
- (id)fr_stripHTMLTags;
@end

@implementation NSString

- (id)fr_stringInitials
{
  v3 = +[NSMutableString string];
  v4 = +[NSSet setWithArray:&off_10001D740];
  v5 = +[NSMutableArray array];
  NSUInteger v6 = [(NSString *)self length];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100002E44;
  v23[3] = &unk_10001CA68;
  id v7 = v4;
  id v24 = v7;
  id v8 = v5;
  id v25 = v8;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v23);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "length", (void)v19))
        {
          v15 = [v14 substringWithRange:0, 1];
          v16 = [v15 uppercaseString];
          [v3 appendString:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v11);
  }

  id v17 = [v3 copy];

  return v17;
}

- (id)fr_convertNewlinesToPTags
{
  v2 = [(NSString *)self componentsSeparatedByString:@"\n"];
  v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[NSString stringWithFormat:@"<p>%@</p>", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 componentsJoinedByString:@"\n"];

  return v10;
}

- (id)fr_encodeHTMLEntities
{
  v2 = [(NSString *)self stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  v3 = [v2 stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];

  id v4 = [v3 stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];

  return v4;
}

- (id)fr_stripHTMLTags
{
  v2 = [(NSString *)self stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  v3 = +[NSString stringWithFormat:@"<root>%@</root>", v2];

  id v4 = [v3 dataUsingEncoding:[v3 fastestEncoding]];
  id v5 = [objc_alloc((Class)NSXMLParser) initWithData:v4];
  id v6 = objc_alloc_init(FRHTMLStrippingXMLDelegate);
  [v5 setDelegate:v6];
  [v5 parse];
  uint64_t v7 = [(FRHTMLStrippingXMLDelegate *)v6 strippedString];
  id v8 = [v7 fr_stringByDecodingHTMLEntities];

  id v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  return v10;
}

- (id)fr_stringByDecodingHTMLEntities
{
  v3 = +[NSMutableString string];
  id v4 = +[NSScanner scannerWithString:self];
  [v4 setCharactersToBeSkipped:0];
  if (([v4 isAtEnd] & 1) == 0)
  {
    do
    {
      id v21 = 0;
      unsigned int v5 = [v4 scanUpToString:@"&" intoString:&v21];
      id v6 = v21;
      if (v5) {
        [v3 appendString:v6];
      }
      if (![v4 scanString:@"&" intoString:0]) {
        goto LABEL_29;
      }
      uint64_t v7 = [v4 scanLocation];
      if ([v4 scanString:@"#" intoString:0])
      {
        if ([v4 scanString:@"x" intoString:0])
        {
          int v20 = 0;
          unsigned int v8 = [v4 scanHexInt:&v20];
          char v9 = v8;
          unsigned __int16 v10 = v20;
          BOOL v11 = v8 == 0;
        }
        else
        {
          int v20 = 0;
          unsigned int v15 = [v4 scanInt:&v20];
          unsigned __int16 v10 = v20;
          BOOL v16 = v20 >= 0;
          char v9 = v15 & v16;
          BOOL v11 = (v15 & v16) == 0;
        }
        if (v11) {
          unsigned __int16 v14 = 0;
        }
        else {
          unsigned __int16 v14 = v10;
        }
        if (![v4 scanString:@";" intoString:0] || (v9 & 1) == 0) {
          goto LABEL_28;
        }
      }
      else
      {
        id v19 = v6;
        unsigned int v12 = [v4 scanUpToString:@";" intoString:&v19];
        id v13 = v19;

        if (!v12 || ![v4 scanString:@";" intoString:0])
        {
LABEL_27:
          id v6 = v13;
LABEL_28:
          id v17 = -[NSString substringWithRange:](self, "substringWithRange:", v7, (unsigned char *)[v4 scanLocation] - v7);
          [v3 appendString:v17];

          goto LABEL_29;
        }
        if ([v13 isEqualToString:@"amp"])
        {
          unsigned __int16 v14 = 38;
        }
        else if ([v13 isEqualToString:@"quot"])
        {
          unsigned __int16 v14 = 34;
        }
        else if ([v13 isEqualToString:@"lt"])
        {
          unsigned __int16 v14 = 60;
        }
        else
        {
          if (([v13 isEqualToString:@"gt"] & 1) == 0) {
            goto LABEL_27;
          }
          unsigned __int16 v14 = 62;
        }
        id v6 = v13;
      }
      [v3 appendFormat:@"%C" v14];
LABEL_29:
    }
    while (![v4 isAtEnd]);
  }

  return v3;
}

- (id)fr_accessibilityLowPitchAttributedString
{
  return +[NSAttributedString fr_accessibilityAttributedStringForSpeakingStringInLowerPitch:self];
}

- (id)fr_accessibilityAttributedStringWithLowPitchPrefix:(id)a3
{
  v10[0] = a3;
  v10[1] = self;
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:v10 count:2];
  unsigned int v5 = [v4 componentsJoinedByString:@", "];

  id v6 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];
  id v7 = [v3 length];

  [v6 fr_accessibilityApplyLowerPitchTokenToRange:0, v7];
  id v8 = [v6 copy];

  return v8;
}

- (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement
{
  return +[NSAttributedString fr_accessibilityAttributedStringForHighPriorityAnnouncement:self];
}

- (id)fr_StringByTrimmingLeadingWhiteSpace
{
  if ([(NSString *)self length])
  {
    unint64_t v3 = 0;
    if ([(NSString *)self length])
    {
      do
      {
        id v4 = +[NSCharacterSet whitespaceCharacterSet];
        unsigned int v5 = [v4 characterIsMember:[self characterAtIndex:v3]];

        if (!v5) {
          break;
        }
        ++v3;
      }
      while (v3 < [(NSString *)self length]);
    }
    id v6 = [(NSString *)self substringFromIndex:v3];
  }
  else
  {
    id v6 = [(NSString *)self copy];
  }

  return v6;
}

- (id)fr_lowerCaseStringByTrimmingWhiteSpace
{
  if ([(NSString *)self length])
  {
    unint64_t v3 = +[NSCharacterSet whitespaceCharacterSet];
    id v4 = [(NSString *)self stringByTrimmingCharactersInSet:v3];
    id v5 = [v4 lowercaseString];
  }
  else
  {
    id v5 = [(NSString *)self copy];
  }

  return v5;
}

- (BOOL)fr_isEquivalentToString:(id)a3
{
  return [(NSString *)self compare:a3 options:385] == NSOrderedSame;
}

- (BOOL)fr_hasPrefixEquivalentToString:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  BOOL v6 = v5 <= (id)[(NSString *)self length]
    && -[NSString compare:options:range:](self, "compare:options:range:", v4, 385, 0, [v4 length]) == NSOrderedSame;

  return v6;
}

- (double)heightConstrainedToWidth:(double)a3 font:(id)a4 singleLine:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSStringDrawingContext);
  if (v5) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 3;
  }
  NSAttributedStringKey v15 = NSFontAttributeName;
  id v16 = v8;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", v10, v11, v9, a3, 1.79769313e308);
  double v13 = v12;

  return v13;
}

@end