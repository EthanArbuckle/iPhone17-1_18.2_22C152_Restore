@interface NSString
+ (void)safari_reverseEnumerateComponents:(id)a3 usingBlock:(id)a4;
- (BOOL)_webkit_looksLikeAbsoluteURL;
- (NSString)safari_highLevelDomainFromHost;
- (_NSRange)_webkit_rangeOfURLScheme;
- (id)_webkit_stringByTrimmingWhitespace;
- (id)safari_possibleTopLevelDomainCorrectionForUserTypedString;
- (id)safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString;
- (id)safari_topLevelDomainUsingCFFromComponents:(id)a3;
@end

@implementation NSString

- (id)safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString
{
  v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v4 = [(NSString *)self stringByTrimmingCharactersInSet:v3];

  id v5 = [v4 mutableCopy];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_100032C78, 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"\r", &stru_100032C78, 0, 0, objc_msgSend(v5, "length"));
  if ([v5 length] && objc_msgSend(v5, "characterAtIndex:", 0) == 60)
  {
    objc_msgSend(v5, "deleteCharactersInRange:", 0, 1);
    id v6 = [@"URL:" length];
    id v7 = [v5 length];
    if (v7 >= [@"URL:" length]
      && !objc_msgSend(v5, "compare:options:range:", @"URL:", 1, 0, v6))
    {
      objc_msgSend(v5, "deleteCharactersInRange:", 0, v6);
    }
    v8 = (char *)[v5 length];
    if (v8)
    {
      v9 = v8 - 1;
      if ([v5 characterAtIndex:v8 - 1] == 62) {
        objc_msgSend(v5, "deleteCharactersInRange:", v9, 1);
      }
    }
  }

  return v5;
}

- (id)safari_possibleTopLevelDomainCorrectionForUserTypedString
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100039640, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100039640))
  {
    qword_100039638 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @".cmo", @".com", @"c.om", @".com", @".xom", @".net", @".ent", @".net", @".nte", @".org", @".ogr", @".org", @".rog", @".info", @".ifno", @".info", @".ifnp",
                                 0);
    __cxa_guard_release(&qword_100039640);
  }
  unsigned int v3 = [(NSString *)self hasSuffix:@"."];
  NSUInteger v4 = [(NSString *)self length];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)qword_100039638;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    NSUInteger v7 = v4 - v3;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v10, 13, 0, v7);
        if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = v11;
          v15 = [(id)qword_100039638 objectForKeyedSubscript:v10];
          v13 = -[NSString stringByReplacingCharactersInRange:withString:](self, "stringByReplacingCharactersInRange:withString:", v12, v14, v15);

          goto LABEL_12;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (void)safari_reverseEnumerateComponents:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, uint64_t, char *))a4;
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v14 = v5;
  NSUInteger v7 = [v5 reverseObjectEnumerator];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
      if (v10)
      {
        [v10 insertString:@"." atIndex:0];
      }
      else
      {
        uint64_t v10 = +[NSMutableString stringWithCapacity:16];
      }
      [v10 insertString:v13 atIndex:0];
      v6[2](v6, v10, v9 + v12, &v19);
      if (v19) {
        break;
      }
      if (v8 == (id)++v12)
      {
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        v9 += v12;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
}

- (id)safari_topLevelDomainUsingCFFromComponents:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_10001AB74;
  uint64_t v13 = sub_10001AB84;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001AB8C;
  v8[3] = &unk_100031C38;
  v8[4] = &v9;
  v8[5] = &v15;
  objc_msgSend((id)objc_opt_class(), "safari_reverseEnumerateComponents:usingBlock:", v4, v8);
  if (*((unsigned char *)v16 + 24))
  {
    id v5 = [(id)v10[5] length];
    if (v5 != (id)[(NSString *)self length]) {
      self = (NSString *)v10[5];
    }
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (NSString)safari_highLevelDomainFromHost
{
  if ([(NSString *)self length])
  {
    if ([(NSString *)self _web_looksLikeIPAddress])
    {
      unsigned int v3 = self;
    }
    else
    {
      id v4 = [(NSString *)self componentsSeparatedByString:@"."];
      unsigned int v3 = [(NSString *)self safari_topLevelDomainUsingCFFromComponents:v4];
    }
  }
  else
  {
    unsigned int v3 = 0;
  }
  return v3;
}

- (_NSRange)_webkit_rangeOfURLScheme
{
  id v3 = [(NSString *)self rangeOfString:@":"];
  if (v3) {
    BOOL v4 = v3 == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_6;
  }
  NSUInteger v5 = (NSUInteger)v3;
  if (!qword_100039630)
  {
    id v8 = +[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+.-"];
    uint64_t v9 = [v8 invertedSet];
    uint64_t v10 = (void *)qword_100039630;
    qword_100039630 = v9;
  }
  id v11 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:");
  NSUInteger v6 = 0;
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    NSUInteger v5 = 0;
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)_webkit_looksLikeAbsoluteURL
{
  v2 = [(NSString *)self _webkit_stringByTrimmingWhitespace];
  BOOL v3 = objc_msgSend(v2, "_webkit_rangeOfURLScheme") != (id)0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)_webkit_stringByTrimmingWhitespace
{
  v2 = (__CFString *)[(NSString *)self mutableCopy];
  CFStringTrimWhitespace(v2);
  return v2;
}

@end