@interface NSHTTPURLResponse(ISAdditions)
- (double)expirationInterval;
- (double)itunes_expirationInterval;
- (uint64_t)_dateFromExpires;
- (uint64_t)_getCacheControlMaxAge:()ISAdditions;
- (uint64_t)_iTunesStore_valueForHTTPHeader:()ISAdditions;
- (uint64_t)itunes_expirationDate;
- (unint64_t)itunes_maxExpectedContentLength;
- (void)expirationInterval;
@end

@implementation NSHTTPURLResponse(ISAdditions)

- (uint64_t)_getCacheControlMaxAge:()ISAdditions
{
  uint64_t result = objc_msgSend(a1, "_iTunesStore_valueForHTTPHeader:", @"Cache-Control");
  if (result)
  {
    v5 = (void *)result;
    uint64_t v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v7 = (void *)[v5 componentsSeparatedByString:@","];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v11), "stringByTrimmingCharactersInSet:", v6), "componentsSeparatedByString:", @"=");
        if ([v13 count] == 2)
        {
          if (objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 0), "hasPrefix:", @"max-age"))
          {
            char v10 = 1;
            objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "doubleValue");
            uint64_t v12 = v14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
    }
    else
    {
      char v10 = 0;
      uint64_t v12 = 0;
    }
    uint64_t result = v10 & 1;
    if (a3) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a3) {
LABEL_13:
    }
      *a3 = v12;
  }
  return result;
}

- (uint64_t)_iTunesStore_valueForHTTPHeader:()ISAdditions
{
  v4 = (void *)[a1 allHeaderFields];
  uint64_t result = [v4 objectForKey:a3];
  if (!result)
  {
    uint64_t v6 = [a3 lowercaseString];
    return [v4 objectForKey:v6];
  }
  return result;
}

- (uint64_t)_dateFromExpires
{
  uint64_t result = objc_msgSend(a1, "_iTunesStore_valueForHTTPHeader:", @"Expires");
  if (result)
  {
    uint64_t v2 = result;
    v3 = (void *)MEMORY[0x263EFF910];
    return [v3 dateWithNaturalLanguageString:v2];
  }
  return result;
}

- (uint64_t)itunes_expirationDate
{
  objc_msgSend(a1, "itunes_expirationInterval");
  if (v1 <= 0.00000011920929) {
    return 0;
  }
  uint64_t v2 = (void *)MEMORY[0x263EFF910];

  return objc_msgSend(v2, "dateWithTimeIntervalSinceNow:");
}

- (double)expirationInterval
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig"), "OSLogObject");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[NSHTTPURLResponse(ISAdditions) expirationInterval](v2);
  }
  double v5 = -1.0;
  if ([a1 _getCacheControlMaxAge:&v5]) {
    return v5;
  }
  v4 = (void *)[a1 _dateFromExpires];
  if (!v4) {
    return -1.0;
  }
  [v4 timeIntervalSinceNow];
  return result;
}

- (double)itunes_expirationInterval
{
  double v4 = -1.0;
  if ([a1 _getCacheControlMaxAge:&v4]) {
    return v4;
  }
  v3 = (void *)[a1 _dateFromExpires];
  if (!v3) {
    return -1.0;
  }
  [v3 timeIntervalSinceNow];
  return result;
}

- (unint64_t)itunes_maxExpectedContentLength
{
  uint64_t v2 = [a1 expectedContentLength];
  if ([a1 statusCode] != 206) {
    return v2;
  }
  v3 = objc_msgSend(a1, "_iTunesStore_valueForHTTPHeader:", @"Content-Range");
  if (!v3) {
    return v2;
  }
  double v4 = (const char *)objc_msgSend((id)objc_msgSend(v3, "lastPathComponent"), "UTF8String");

  return strtoull(v4, 0, 10);
}

- (void)expirationInterval
{
  *(_WORD *)double v1 = 0;
  _os_log_fault_impl(&dword_21601D000, log, OS_LOG_TYPE_FAULT, "Detected call to deprecated method for NSHTTPURLResponse_ISAdditions.m expirationInterval", v1, 2u);
}

@end