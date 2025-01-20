@interface MFLocalizedMessageHeaders
+ (id)englishHeadersFromLocalizedHeaders:(id)a3;
+ (id)localizedHeaders;
+ (id)localizedHeadersFromEnglishHeaders:(id)a3;
- (id)copyFormattedHeaderValueFromAddressList:(id)a3;
- (id)markupString;
- (void)appendHeaderMarkupForKey:(id)a3 value:(id)a4 toString:(id)a5;
@end

@implementation MFLocalizedMessageHeaders

- (id)copyFormattedHeaderValueFromAddressList:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v4 appendString:objc_msgSend(a3, "componentsJoinedByString:", @", ")];
  if ([v4 length])
  {
    sanitizeStringForMarkup(v4);
    [v4 appendString:@"<BR>"];
  }
  return v4;
}

- (void)appendHeaderMarkupForKey:(id)a3 value:(id)a4 toString:(id)a5
{
  id v9 = (id)objc_msgSend(+[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders"), "objectForKey:", a3);
  if (!v9) {
    id v9 = a3;
  }
  v10 = (void *)[v9 mutableCopy];
  sanitizeStringForMarkup(v10);
  v11 = (void *)[[NSString alloc] initWithFormat:@"<B>%@:</B> ", v10];
  [a5 appendString:v11];

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (![(id)objc_opt_class() isStructuredHeaderKey:a3]) {
        return;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return;
      }
      id v15 = [(MFLocalizedMessageHeaders *)self copyFormattedHeaderValueFromAddressList:a4];
      if (!v15) {
        return;
      }
      goto LABEL_17;
    }
    v12 = (void *)[a3 lowercaseString];
    if ([v12 isEqualToString:*MEMORY[0x1E4F60738]])
    {
      v13 = objc_msgSend((id)objc_msgSend(a4, "mf_stringByLocalizingReOrFwdPrefix"), "mutableCopy");
      sanitizeStringForMarkup(v13);
      uint64_t v14 = [[NSString alloc] initWithFormat:@"<B>%@</B><BR>", v13];
    }
    else
    {
      if ([v12 isEqualToString:*MEMORY[0x1E4F606A0]])
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mf_copyDateInCommonFormatsWithString:", a4);
        if (!v16) {
          return;
        }
        CFDateRef v17 = (const __CFDate *)v16;
        CFLocaleRef v18 = CFLocaleCopyCurrent();
        v19 = CFDateFormatterCreate(0, v18, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
        StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v19, v17);
        v21 = (void *)[(__CFString *)StringWithDate mutableCopy];
        sanitizeStringForMarkup(v21);
        id v23 = (id)[v21 stringByAppendingString:@"<BR>"];

        id v15 = v23;
        if (!v23) {
          return;
        }
        goto LABEL_17;
      }
      v22 = (void *)[a4 mutableCopy];
      sanitizeStringForMarkup(v22);
      uint64_t v14 = [[NSString alloc] initWithFormat:@"%@<BR>", v22];
    }
    id v15 = (id)v14;
    if (!v14) {
      return;
    }
LABEL_17:
    id v24 = v15;
    [a5 appendString:v15];
  }
}

- (id)markupString
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)[MEMORY[0x1E4F73508] basicHeaders];
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v26;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      uint64_t v19 = v4;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        id v9 = [(MFMessageHeaders *)self headersForKey:v8];
        if (v9)
        {
          v10 = v9;
          id v11 = [(MFMessageHeaders *)self _capitalizedKeyForKey:v8];
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          }
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                if (([v16 isEqualToString:&stru_1F265CF90] & 1) == 0) {
                  [(MFLocalizedMessageHeaders *)self appendHeaderMarkupForKey:v11 value:v16 toString:v5];
                }
              }
              uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v13);
            uint64_t v6 = v18;
            uint64_t v4 = v19;
          }
        }
        ++v7;
      }
      while (v7 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)localizedHeaders
{
  id result = (id)localizedHeaders_headers;
  if (!localizedHeaders_headers)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = MFLookupLocalizedString(@"To", @"To", 0);
    uint64_t v11 = MFLookupLocalizedString(@"Reply-To", @"Reply-To", 0);
    uint64_t v10 = MFLookupLocalizedString(@"Subject", @"Subject", 0);
    uint64_t v9 = MFLookupLocalizedString(@"From", @"From", 0);
    uint64_t v8 = MFLookupLocalizedString(@"Cc", @"Cc", 0);
    uint64_t v3 = MFLookupLocalizedString(@"Bcc", @"Bcc", 0);
    uint64_t v4 = MFLookupLocalizedString(@"Date", @"Date", 0);
    uint64_t v5 = MFLookupLocalizedString(@"Attachments", @"Attachments", 0);
    uint64_t v6 = MFLookupLocalizedString(@"Resent-To", @"Resent-To", 0);
    uint64_t v7 = MFLookupLocalizedString(@"Resent-Cc", @"Resent-Cc", 0);
    id result = (id)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, @"To", v11, @"Reply-To", v10, @"Subject", v9, @"From", v8, @"Cc", v3, @"Bcc", v4, @"Date", v5, @"Attachments", v6,
                   @"Resent-To",
                   v7,
                   @"Resent-Cc",
                   MFLookupLocalizedString(@"Resent-From", @"Resent-From", 0),
                   @"Resent-From",
                   0);
    localizedHeaders_headers = (uint64_t)result;
  }
  return result;
}

+ (id)localizedHeadersFromEnglishHeaders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(+[MFLocalizedMessageHeaders localizedHeaders](MFLocalizedMessageHeaders, "localizedHeaders"), "objectForKey:", v9);
        if (v10 && (uint64_t v11 = v10, ([v10 isEqualToString:&stru_1F265CF90] & 1) == 0))
        {
          uint64_t v12 = v4;
          id v13 = v11;
        }
        else
        {
          uint64_t v12 = v4;
          id v13 = v9;
        }
        [v12 addObject:v13];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return v4;
}

+ (id)englishHeadersFromLocalizedHeaders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  id v5 = +[MFLocalizedMessageHeaders localizedHeaders];
  uint64_t v6 = (void *)[v5 allValues];
  uint64_t v7 = (void *)[v5 allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v6 indexOfObject:v12];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v12 = [v7 objectAtIndex:v13];
        }
        [v4 addObject:v12];
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return v4;
}

@end