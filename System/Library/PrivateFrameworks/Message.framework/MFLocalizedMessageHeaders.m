@interface MFLocalizedMessageHeaders
+ (id)localizedHeaders;
- (id)copyFormattedHeaderValueFromAddressList:(id)a3;
- (id)markupString;
- (void)appendHeaderMarkupForKey:(id)a3 value:(id)a4 toString:(id)a5;
@end

@implementation MFLocalizedMessageHeaders

- (id)copyFormattedHeaderValueFromAddressList:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5 = [v3 componentsJoinedByString:@", "];
  [v4 appendString:v5];

  if ([v4 length])
  {
    sanitizeStringForMarkup(v4);
    [v4 appendString:@"<BR>"];
  }

  return v4;
}

- (void)appendHeaderMarkupForKey:(id)a3 value:(id)a4 toString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v26 = v8;
  v11 = +[MFLocalizedMessageHeaders localizedHeaders];
  id v12 = [v11 objectForKey:v26];

  if (!v12) {
    id v12 = v26;
  }
  v13 = (void *)[v12 mutableCopy];
  sanitizeStringForMarkup(v13);
  v14 = (void *)[[NSString alloc] initWithFormat:@"<B>%@:</B> ", v13];

  [v10 appendString:v14];
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v9;
      v16 = [v26 lowercaseString];
      if ([v16 isEqualToString:*MEMORY[0x1E4F60738]])
      {
        v17 = [MEMORY[0x1E4F608E8] subjectStringForDisplayForSubjectString:v15];
        v18 = (void *)[v17 mutableCopy];

        sanitizeStringForMarkup(v18);
        id v19 = (id)[[NSString alloc] initWithFormat:@"<B>%@</B><BR>", v18];
      }
      else if ([v16 isEqualToString:*MEMORY[0x1E4F606A0]])
      {
        CFDateRef v20 = (const __CFDate *)objc_msgSend(MEMORY[0x1E4F1C9C8], "mf_copyDateInCommonFormatsWithString:", v15);
        if (v20)
        {
          CFDateRef date = v20;
          CFLocaleRef cf = CFLocaleCopyCurrent();
          v21 = CFDateFormatterCreate(0, cf, kCFDateFormatterLongStyle, kCFDateFormatterLongStyle);
          StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v21, date);
          v18 = (void *)[(__CFString *)StringWithDate mutableCopy];
          sanitizeStringForMarkup(v18);
          id v19 = [v18 stringByAppendingString:@"<BR>"];
          CFRelease(v21);
          CFRelease(cf);

          CFDateRef v20 = date;
        }
        else
        {
          id v19 = 0;
          v18 = 0;
        }
      }
      else
      {
        v23 = (void *)[v15 mutableCopy];
        sanitizeStringForMarkup(v23);
        id v19 = (id)[[NSString alloc] initWithFormat:@"%@<BR>", v23];
        v18 = v23;
      }

      if (!v19) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    if ([(id)objc_opt_class() isStructuredHeaderKey:v26])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [(MFLocalizedMessageHeaders *)self copyFormattedHeaderValueFromAddressList:v9];
        if (!v19)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        [v10 appendString:v19];
        goto LABEL_19;
      }
    }
  }
LABEL_20:
}

- (id)markupString
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F73508] basicHeaders];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = 0;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v5 = 0;
      uint64_t v15 = v4;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v22 + 1) + 8 * v5);
        v17 = [(MFMessageHeaders *)self headersForKey:v6];
        if (v17)
        {
          v7 = [(MFMessageHeaders *)self _capitalizedKeyForKey:v6];
          if (!v3) {
            id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          }
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v8 = v17;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v19;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v19 != v10) {
                  objc_enumerationMutation(v8);
                }
                id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
                if (([v12 isEqualToString:&stru_1EFF11268] & 1) == 0) {
                  [(MFLocalizedMessageHeaders *)self appendHeaderMarkupForKey:v7 value:v12 toString:v3];
                }
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v9);
          }

          uint64_t v4 = v15;
        }

        ++v5;
      }
      while (v5 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  return v3;
}

+ (id)localizedHeaders
{
  v2 = (void *)localizedHeaders_headers;
  if (!localizedHeaders_headers)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v17 = MFLookupLocalizedString(@"To", @"To", @"Message");
    uint64_t v16 = MFLookupLocalizedString(@"Reply-To", @"Reply-To", @"Message");
    uint64_t v15 = MFLookupLocalizedString(@"Subject", @"Subject", @"Message");
    v14 = MFLookupLocalizedString(@"From", @"From", @"Message");
    v13 = MFLookupLocalizedString(@"Cc", @"Cc", @"Message");
    id v12 = MFLookupLocalizedString(@"Bcc", @"Bcc", @"Message");
    uint64_t v4 = MFLookupLocalizedString(@"Date", @"Date", @"Message");
    v11 = MFLookupLocalizedString(@"Attachments", @"Attachments", @"Message");
    uint64_t v10 = MFLookupLocalizedString(@"Resent-To", @"Resent-To", @"Message");
    uint64_t v5 = MFLookupLocalizedString(@"Resent-Cc", @"Resent-Cc", @"Message");
    uint64_t v6 = MFLookupLocalizedString(@"Resent-From", @"Resent-From", @"Message");
    uint64_t v7 = objc_msgSend(v3, "initWithObjectsAndKeys:", v17, @"To", v16, @"Reply-To", v15, @"Subject", v14, @"From", v13, @"Cc", v12, @"Bcc", v4, @"Date", v11, @"Attachments", v10,
           @"Resent-To",
           v5,
           @"Resent-Cc",
           v6,
           @"Resent-From",
           0);
    id v8 = (void *)localizedHeaders_headers;
    localizedHeaders_headers = v7;

    v2 = (void *)localizedHeaders_headers;
  }
  return v2;
}

@end