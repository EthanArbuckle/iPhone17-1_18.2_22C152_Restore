@interface NSData(WebNSDataExtras)
- (BOOL)_web_isCaseInsensitiveEqualToCString:()WebNSDataExtras;
- (__CFString)_webkit_guessedMIMEType;
- (__CFString)_webkit_guessedMIMETypeForXML;
@end

@implementation NSData(WebNSDataExtras)

- (__CFString)_webkit_guessedMIMETypeForXML
{
  unint64_t v2 = [a1 length];
  uint64_t v3 = [a1 bytes];
  unsigned int v4 = 1024;
  if (v2 < 0x400) {
    unsigned int v4 = v2;
  }
  if (v4 >= 7)
  {
    v5 = (void *)v3;
    char v6 = 0;
    int v7 = v4 - 6;
    v8 = @"application/rss+xml";
    while (1)
    {
      v9 = (const char *)memchr(v5, 60, v7);
      if (!v9) {
        return 0;
      }
      v10 = v9;
      if (v6) {
        break;
      }
      if (!strncasecmp(v9, "<rdf", 4uLL))
      {
LABEL_6:
        char v6 = 1;
        v7 += v5 - (v10 + 1);
        v5 = (void *)(v10 + 1);
        if (v7 <= 0) {
          return 0;
        }
      }
      else
      {
        if (!strncasecmp(v10, "<rss", 4uLL)) {
          return v8;
        }
        if (!strncasecmp(v10, "<feed", 5uLL)) {
          return @"application/atom+xml";
        }
        if (strncasecmp(v10, "<?", 2uLL) && strncasecmp(v10, "<!", 2uLL)) {
          return 0;
        }
        char v6 = 0;
        v7 += v5 - (v10 + 1);
        v5 = (void *)(v10 + 1);
        if (v7 <= 0) {
          return 0;
        }
      }
    }
    if (!strncasecmp(v9, "<channel", 8uLL)) {
      return v8;
    }
    goto LABEL_6;
  }
  return 0;
}

- (__CFString)_webkit_guessedMIMEType
{
  unint64_t v2 = (__CFString *)objc_msgSend(a1, "_webkit_guessedMIMETypeForXML");
  if ([(__CFString *)v2 length]) {
    return v2;
  }
  unint64_t v4 = [a1 length];
  uint64_t v5 = [a1 bytes];
  char v6 = (const char *)v5;
  if (v4 >= 0x400) {
    unsigned int v7 = 1024;
  }
  else {
    unsigned int v7 = v4;
  }
  if (v7 >= 7)
  {
    unint64_t v2 = @"text/html";
    int v8 = v7 - 6;
    v9 = (void *)v5;
    do
    {
      v10 = (const char *)memchr(v9, 60, v8);
      if (!v10) {
        break;
      }
      v11 = v10;
      if (!strncasecmp(v10, "<html>", 6uLL)
        || !strncasecmp(v11, "<a ", 3uLL)
        || !strncasecmp(v11, "<script", 7uLL)
        || !strncasecmp(v11, "<title>", 7uLL))
      {
        return v2;
      }
      v8 += v9 - (v11 + 1);
      v9 = (void *)(v11 + 1);
    }
    while (v8 > 0);
    if (v7 >= 9)
    {
      int v12 = v7 - 8;
      v13 = (char *)v6;
      unint64_t v2 = @"text/html";
      do
      {
        unint64_t v14 = (unint64_t)memchr(v13, 116, v12);
        v15 = (const char *)memchr(v13, 84, v12);
        if (!(v14 | (unint64_t)v15)) {
          break;
        }
        if ((unint64_t)v15 >= v14 || v15 == 0) {
          v17 = (const char *)v14;
        }
        else {
          v17 = v15;
        }
        if (v14) {
          v18 = v17;
        }
        else {
          v18 = v15;
        }
        if (!strncasecmp(v18, "text/html", 9uLL)) {
          return v2;
        }
        v12 += v13 - (v18 + 1);
        v13 = (char *)(v18 + 1);
      }
      while (v12 > 0);
    }
  }
  if (v4 < 0xB)
  {
    if (!v4) {
      return @"text/plain";
    }
  }
  else
  {
    if (!strncmp(v6, "BEGIN:VCARD", 0xBuLL)) {
      return @"text/vcard";
    }
    if (v4 >= 0xF && !strncmp(v6, "BEGIN:VCALENDAR", 0xFuLL)) {
      return @"text/calendar";
    }
  }
  uint64_t v19 = 0;
  unint64_t v2 = @"text/plain";
  while (1)
  {
    if ((v6[v19] - 127) <= 0xA0u)
    {
      unsigned int v20 = v6[v19];
      BOOL v21 = v20 > 0xD;
      int v22 = (1 << v20) & 0x2600;
      if (v21 || v22 == 0) {
        break;
      }
    }
    if (v4 == ++v19) {
      return v2;
    }
  }
  if (v4 == v19) {
    return @"text/plain";
  }
  if (v4 >= 4 && !strncmp(v6, "\xFF\xD8\xFF\xE0mage/jpeg", 4uLL)) {
    return &stru_1F3C808B0;
  }
  else {
    return 0;
  }
}

- (BOOL)_web_isCaseInsensitiveEqualToCString:()WebNSDataExtras
{
  return strncasecmp((const char *)[a1 bytes], a3, objc_msgSend(a1, "length")) == 0;
}

@end