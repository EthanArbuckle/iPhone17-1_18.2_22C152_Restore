@interface PFSStyleParser
+ (BOOL)mediaListIncludesScreen:(id)a3;
+ (BOOL)parseCSSFrom:(const char *)a3 intoDict:(id)a4 fontDict:(id)a5 sourceUrl:(id)a6 pageCache:(id)a7;
+ (id)newFullUri:(id)a3 sourceUrl:(id)a4;
+ (void)mergeCSSDict:(id)a3 intoCSSDict:(id)a4;
+ (void)mergeFontDict:(id)a3 intoFontDict:(id)a4;
@end

@implementation PFSStyleParser

+ (BOOL)parseCSSFrom:(const char *)a3 intoDict:(id)a4 fontDict:(id)a5 sourceUrl:(id)a6 pageCache:(id)a7
{
  if (a3) {
    PFSStyleParserHandler::PFSStyleParserHandler((PFSStyleParserHandler *)v8, a3, (NSURL *)a6, (PFSPageCache *)a7);
  }
  return 1;
}

+ (void)mergeCSSDict:(id)a3 intoCSSDict:(id)a4
{
  if (a4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v11 = [a3 objectForKey:v10];
          id v12 = [a4 objectForKey:v10];
          if (v12) {
            [v12 addEntriesFromDictionary:v11];
          }
          else {
            [a4 setObject:v11 forKey:v10];
          }
        }
        id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

+ (void)mergeFontDict:(id)a3 intoFontDict:(id)a4
{
  if (a4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v11 = [a3 objectForKey:v10];
          id v12 = [a4 objectForKey:v10];
          if (v12) {
            [v12 addEntriesFromDictionary:v11];
          }
          else {
            [a4 setObject:v11 forKey:v10];
          }
        }
        id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

+ (BOOL)mediaListIncludesScreen:(id)a3
{
  id v4 = [a3 count];
  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [a3 objectAtIndex:v5];
      if (([v6 isEqualToString:PFXStrAll] & 1) != 0
        || [v6 isEqualToString:PFXStrScreen])
      {
        break;
      }
      if (++v5 >= (unint64_t)[a3 count])
      {
        LOBYTE(v4) = 0;
        return (char)v4;
      }
    }
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

+ (id)newFullUri:(id)a3 sourceUrl:(id)a4
{
  uint64_t v5 = (NSString *)a3;
  if (([a3 hasPrefix:@"#"] & 1) == 0) {
    uint64_t v5 = [(NSString *)[[+[NSURL URLWithString:v5 relativeToURL:a4] absoluteURL] path] substringFromIndex:1];
  }
  return [objc_alloc((Class)NSString) initWithFormat:@"url(%@)", v5];
}

@end