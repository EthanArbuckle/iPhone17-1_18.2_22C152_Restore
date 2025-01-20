@interface NSDate(Goodies)
- (id)mf_replyPrefixForSender:()Goodies;
@end

@implementation NSDate(Goodies)

- (id)mf_replyPrefixForSender:()Goodies
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v6 = [v5 localeIdentifier];
  uint64_t v7 = [@"ja_JP_TRADITIONAL" caseInsensitiveCompare:v6];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"ja"];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;

      v5 = v10;
    }
  }
  v11 = CFDateFormatterCreate(0, (CFLocaleRef)v5, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  if (v11)
  {
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v11, a1);
    CFRelease(v11);
  }
  else
  {
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "#Warning failed to create date formatter", buf, 2u);
    }

    StringWithDate = 0;
  }
  v14 = CFDateFormatterCreate(0, (CFLocaleRef)v5, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  if (v14)
  {
    v15 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v14, a1);
    CFRelease(v14);
  }
  else
  {
    v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "#Warning failed to create time formatter", v36, 2u);
    }

    v15 = 0;
  }
  id v17 = v4;
  v18 = [v17 emailAddressValue];
  v19 = [v18 displayName];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v17 stringValue];
  }
  v22 = v21;

  id v23 = v17;
  v24 = [v23 emailAddressValue];
  v25 = [v24 simpleAddress];
  v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [v23 stringValue];
  }
  v28 = v27;

  v29 = v23;
  if (v22)
  {
    v29 = v23;
    if (v28)
    {
      v29 = v23;
      if (([v22 isEqual:v28] & 1) == 0)
      {
        v30 = NSString;
        v31 = MFLookupLocalizedString(@"REPLY_ATTRIBUTION_SENDER", @"%@ <%@>", @"Message");
        v29 = objc_msgSend(v30, "stringWithFormat:", v31, v22, v28);
      }
    }
  }
  v32 = 0;
  if (StringWithDate && v15)
  {
    v33 = NSString;
    v34 = MFLookupLocalizedString(@"REPLY_ATTRIBUTION", @"On %@, at %@, %@ wrote:\n\n", @"Delayed");
    v32 = objc_msgSend(v33, "stringWithFormat:", v34, StringWithDate, v15, v29);
  }
  return v32;
}

@end