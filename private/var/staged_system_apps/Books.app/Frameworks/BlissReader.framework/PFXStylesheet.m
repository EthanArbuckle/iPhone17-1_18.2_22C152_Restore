@interface PFXStylesheet
+ (BOOL)isMediaTypeSupportedInAll:(id)a3;
+ (BOOL)isMediaTypeSupportedInFlow:(id)a3;
+ (BOOL)isMediaTypeSupportedInPaginated:(id)a3;
+ (BOOL)readStylesheetFromEntry:(id)a3 readerState:(id)a4;
+ (BOOL)readStylesheetFromString:(const char *)a3 sourceURL:(id)a4 toDictionary:(id)a5 toFontDictionary:(id)a6 pageCache:(id)a7;
+ (BOOL)readStylesheetFromStyleAttributeContents:(const char *)a3 sourceURL:(id)a4 toDictionary:(id)a5 toFontDictionary:(id)a6 readerState:(id)a7;
+ (BOOL)readStylesheetFromStyleNodeContents:(id)a3 sourceURL:(id)a4 readerState:(id)a5;
+ (id)basicMediaTypes;
+ (id)flowMediaTypes;
+ (id)paginatedMediaTypes;
+ (void)registerFontsFromDictionary:(id)a3 readerState:(id)a4;
@end

@implementation PFXStylesheet

+ (BOOL)readStylesheetFromString:(const char *)a3 sourceURL:(id)a4 toDictionary:(id)a5 toFontDictionary:(id)a6 pageCache:(id)a7
{
  if (a3 && *a3) {
    +[PFSStyleParser parseCSSFrom:intoDict:fontDict:sourceUrl:pageCache:](PFSStyleParser, "parseCSSFrom:intoDict:fontDict:sourceUrl:pageCache:");
  }
  return 1;
}

+ (BOOL)readStylesheetFromStyleAttributeContents:(const char *)a3 sourceURL:(id)a4 toDictionary:(id)a5 toFontDictionary:(id)a6 readerState:(id)a7
{
  if (a3 && *a3)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_5733E8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_5733E8))
    {
      byte_5733E0 = 1;
      __cxa_guard_release(&qword_5733E8);
    }
    size_t v12 = strlen(a3);
    uint64_t v13 = 6;
    if (!byte_5733E0) {
      uint64_t v13 = 0;
    }
    if (v12 <= (v13 ^ 0xFFFFFFFFFFFFFFFELL))
    {
      v14 = (char *)malloc_type_malloc(v12 + v13 + 1, 0x80D8C3C2uLL);
      if (v14)
      {
        v15 = v14;
        sprintf(v14, "* {%s}", a3);
        unsigned __int8 v16 = [a1 readStylesheetFromString:v15 sourceURL:a4 toDictionary:a5 toFontDictionary:a6 pageCache:0];
        free(v15);
        LOBYTE(v14) = v16;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 1;
  }
  return (char)v14;
}

+ (BOOL)readStylesheetFromEntry:(id)a3 readerState:(id)a4
{
  id v7 = [a4 currentHtmlDocMediaState];
  if (([v7 loadedDocumentSelectorsForEntry:a3] & 1) == 0)
  {
    id v9 = [a4 absoluteEntryForRelativeUri:a3];
    id v10 = [a4 propertiesForStylesheetEntry:v9];
    if (v10)
    {
      v11 = v10;
      id v31 = v9;
      v32 = v7;
      size_t v12 = &isPad_ptr;
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v14 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v36;
        id v33 = v13;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v11);
            }
            uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            objc_opt_class();
            [v11 objectForKey:v18];
            uint64_t v19 = TSUDynamicCast();
            if (!v19)
            {
              v20 = v12;
              id v21 = +[TSUAssertionHandler currentHandler];
              v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFXStylesheet readStylesheetFromEntry:readerState:]");
              v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXStylesheet.mm"];
              v24 = v21;
              size_t v12 = v20;
              id v13 = v33;
              [v24 handleFailureInFunction:v22 file:v23 lineNumber:128 description:@"invalid nil value for '%s'", "properties"];
            }
            id v25 = [objc_alloc((Class)v12[413]) initWithDictionary:v19];
            [v13 setObject:v25 forKey:v18];
          }
          id v15 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v15);
      }
      [v32 addStylesheetProperties:v13 forEntry:v31];
    }
    else
    {
      id v8 = objc_msgSend(objc_msgSend(a4, "archive"), "decryptEntryWithName:error:", v9, 0);
      if (!v8) {
        return (char)v8;
      }
      id v13 = objc_alloc_init((Class)NSMutableData);
      if ([v8 readIntoData:v13])
      {
        char v34 = 0;
        LOBYTE(v8) = 1;
        [v13 appendBytes:&v34 length:1];
        id v27 = [v13 bytes];
        if (v27)
        {
          id v28 = v27;
          id v29 = objc_alloc_init((Class)NSMutableDictionary);
          id v30 = objc_alloc_init((Class)NSMutableDictionary);
          LOBYTE(v8) = objc_msgSend(a1, "readStylesheetFromString:sourceURL:toDictionary:toFontDictionary:pageCache:", v28, +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v9, +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", @"/", 1)), v29, v30, objc_msgSend(v7, "pageCache"));
          [a4 setStylesheetProperties:v29 forEntry:v9];
          [v7 addStylesheetProperties:v29 forEntry:v9];
          [a1 registerFontsFromDictionary:v30 readerState:a4];
        }
        goto LABEL_15;
      }
    }
    LOBYTE(v8) = 1;
LABEL_15:

    return (char)v8;
  }
  LOBYTE(v8) = 1;
  return (char)v8;
}

+ (BOOL)readStylesheetFromStyleNodeContents:(id)a3 sourceURL:(id)a4 readerState:(id)a5
{
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v11 = [a1 readStylesheetFromString:[a3 UTF8String] sourceURL:a4 toDictionary:v9 toFontDictionary:v10 pageCache:0];
  if (v11)
  {
    objc_msgSend(objc_msgSend(a5, "currentHtmlDocMediaState"), "addStylesheetProperties:", v9);
    [a1 registerFontsFromDictionary:v10 readerState:a5];
  }

  return v11;
}

+ (BOOL)isMediaTypeSupportedInAll:(id)a3
{
  id v4 = [a1 basicMediaTypes];

  return [v4 containsObject:a3];
}

+ (BOOL)isMediaTypeSupportedInFlow:(id)a3
{
  id v4 = [a1 flowMediaTypes];

  return [v4 containsObject:a3];
}

+ (BOOL)isMediaTypeSupportedInPaginated:(id)a3
{
  id v4 = [a1 paginatedMediaTypes];

  return [v4 containsObject:a3];
}

+ (id)basicMediaTypes
{
  return &off_499B48;
}

+ (id)flowMediaTypes
{
  return &off_499B60;
}

+ (id)paginatedMediaTypes
{
  return &off_499B78;
}

+ (void)registerFontsFromDictionary:(id)a3 readerState:(id)a4
{
  id v18 = objc_msgSend(objc_msgSend(a4, "archive"), "fontObfuscationInfo");
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [a3 allValues];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v9);
        objc_opt_class();
        [v10 objectForKey:@"src"];
        unsigned int v11 = (void *)TSUDynamicCast();
        objc_opt_class();
        [v11 lastObject];
        size_t v12 = (void *)TSUDynamicCast();
        if (v12)
        {
          id v13 = v12;
          if ([v12 type] == (char *)&stru_108.addr + 1)
          {
            objc_opt_class();
            [v13 value];
            id v14 = (void *)TSUDynamicCast();
            id v15 = (char *)[v14 length];
            if ((unint64_t)v15 >= 6)
            {
              uint64_t v16 = v15;
              if ([v14 hasPrefix:@"url("]
              {
                if ([v14 characterAtIndex:v16 - 1] == 41)
                {
                  id v17 = [v14 substringWithRange:4, v16 - 5];
                  if ((objc_msgSend(@"otf", "isEqualToString:", objc_msgSend(v17, "pathExtension")) & 1) != 0
                    || objc_msgSend(@"ttf", "isEqualToString:", objc_msgSend(v17, "pathExtension")))
                  {
                    id v19 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "rootFolder"), "stringByAppendingPathComponent:", v17);
                    objc_opt_class();
                    objc_msgSend(objc_msgSend(v10, "objectForKey:", @"font-family"), "lastObject");
                    -[TSWPLoadableFonts registerFontName:forPath:forGroup:isObfuscated:backgroundLoad:](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "registerFontName:forPath:forGroup:isObfuscated:backgroundLoad:", [(id)TSUDynamicCast() stringValue], v19, objc_msgSend(objc_msgSend(objc_msgSend(a4, "thDocumentRoot"), "bookDescription"), "uniquifier"), objc_msgSend(v18, "containsObject:", v17), 1);
                  }
                }
              }
            }
          }
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

@end