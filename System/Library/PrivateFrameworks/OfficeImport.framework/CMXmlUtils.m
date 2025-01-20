@interface CMXmlUtils
+ (id)copyFilteredString:(id)a3;
+ (id)copyHeadElement;
+ (id)copyHeadElementForDeviceWidth:(int)a3;
+ (id)copyHeadElementWithTitle:(id)a3;
+ (id)copyHeadElementWithTitle:(id)a3 deviceWidth:(int)a4;
+ (id)copyXhtmlDocument;
+ (id)xhtmlStringWithXmlData:(id)a3;
+ (void)filterString:(id)a3;
@end

@implementation CMXmlUtils

+ (id)copyXhtmlDocument
{
  v2 = +[OIXMLElement elementWithType:7];
  v3 = [[OIXMLDocument alloc] initWithRootElement:v2];
  [(OIXMLDocument *)v3 setVersion:@"1.0"];
  [(OIXMLDocument *)v3 setCharacterEncoding:@"UTF-8"];

  return v3;
}

+ (id)copyHeadElementWithTitle:(id)a3 deviceWidth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[a1 copyHeadElementForDeviceWidth:v4];
  if (v6)
  {
    v8 = +[OIXMLElement elementWithType:20 stringValue:v6];
    [v7 addChild:v8];
  }
  return v7;
}

+ (id)copyHeadElementForDeviceWidth:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = (void *)[a1 copyHeadElement];
  v5 = +[OIXMLElement elementWithType:12];
  id v6 = +[OIXMLAttribute attributeWithName:@"name" stringValue:@"viewport"];
  [v5 addAttribute:v6];

  v7 = [NSString stringWithFormat:@"width=%d, maximum-scale=4.0", v3];
  v8 = +[OIXMLAttribute attributeWithName:@"content" stringValue:v7];
  [v5 addAttribute:v8];

  [v4 addChild:v5];
  return v4;
}

+ (id)copyHeadElement
{
  v2 = [[OIXMLElement alloc] initWithType:6 stringValue:0];
  uint64_t v3 = +[OIXMLElement elementWithType:12];
  uint64_t v4 = +[OIXMLAttribute attributeWithName:@"charset" stringValue:@"utf-8"];
  [v3 addAttribute:v4];

  [(OIXMLElement *)v2 addChild:v3];
  return v2;
}

+ (id)copyHeadElementWithTitle:(id)a3
{
  id v4 = a3;
  v5 = (void *)[a1 copyHeadElement];
  if (v4)
  {
    id v6 = +[OIXMLElement elementWithType:20 stringValue:v4];
    [v5 addChild:v6];
  }
  v7 = +[OIXMLElement elementWithType:12];
  v8 = +[OIXMLAttribute attributeWithName:@"name" stringValue:@"viewport"];
  [v7 addAttribute:v8];

  [v5 addChild:v7];
  return v5;
}

+ (id)copyFilteredString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v4];
  [a1 filterString:v5];

  return v5;
}

+ (void)filterString:(id)a3
{
  id v3 = a3;
  id v9 = v3;
  do
  {
    uint64_t v4 = objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"  ", @" &nbsp;",
           2,
           0,
           [v3 length]);
    id v3 = v9;
  }
  while (v4);
  unint64_t v5 = [v9 length];
  if (v5)
  {
    for (unint64_t i = 0; i < v5; ++i)
    {
      int v7 = [v9 characterAtIndex:i];
      if (v7 > 2027)
      {
        v8 = v9;
        if (v7 == 2028)
        {
LABEL_12:
          objc_msgSend(v8, "replaceCharactersInRange:withString:", i, 1, @"<br/>");
          v5 += 4;
        }
        else if (v7 == 61607 || v7 == 61623)
        {
          objc_msgSend(v9, "replaceCharactersInRange:withString:", i, 1, @"&bull;");
          v5 += 5;
        }
      }
      else
      {
        v8 = v9;
        switch(v7)
        {
          case 11:
          case 13:
            goto LABEL_12;
          case 12:
          case 14:
            objc_msgSend(v9, "replaceCharactersInRange:withString:", i, 1, @" ");
            break;
          default:
            continue;
        }
      }
    }
  }
}

+ (id)xhtmlStringWithXmlData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithData:v3 encoding:4];
  while (objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"  ", @" &nbsp;",
            2,
            0,
            [v4 length]))
    ;
  unint64_t v5 = [NSString stringWithFormat:@" &nbsp; &nbsp;"];
  unint64_t v6 = [v4 length];
  if (v6)
  {
    for (unint64_t i = 0; i < v6; ++i)
    {
      int v8 = [v4 characterAtIndex:i];
      if (v8 > 2027)
      {
        if (v8 != 2028)
        {
          if (v8 == 61607 || v8 == 61623)
          {
            objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, @"&bull;");
            v6 += 5;
          }
          continue;
        }
      }
      else if ((v8 - 10) >= 5)
      {
        if (v8 == 9)
        {
          objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, v5);
          v6 += 13;
        }
        continue;
      }
      objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, @"<br/>");
      v6 += 4;
    }
  }

  return v4;
}

@end