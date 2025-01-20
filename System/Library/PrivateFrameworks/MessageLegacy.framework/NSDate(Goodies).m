@interface NSDate(Goodies)
- (uint64_t)mf_descriptionForMimeHeaders;
- (uint64_t)mf_replyPrefixForSender:()Goodies;
@end

@implementation NSDate(Goodies)

- (uint64_t)mf_descriptionForMimeHeaders
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"EEE, d MMM yyyy HH:mm:ss ZZ"];
  objc_msgSend(v2, "setLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", @"en_US_POSIX"));
  return [v2 stringFromDate:a1];
}

- (uint64_t)mf_replyPrefixForSender:()Goodies
{
  CFLocaleRef v5 = CFLocaleCopyCurrent();
  if (![@"ja_JP_TRADITIONAL" caseInsensitiveCompare:MEMORY[0x1D25DC870]()])
  {
    CFLocaleRef v6 = CFLocaleCreate(0, @"ja");
    if (v6)
    {
      CFLocaleRef v7 = v6;

      CFLocaleRef v5 = v7;
    }
  }
  v8 = CFDateFormatterCreate(0, v5, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  if (v8)
  {
    v9 = v8;
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v8, a1);
    CFRelease(v9);
  }
  else
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFCFE000, v11, OS_LOG_TYPE_DEFAULT, "#Warning failed to create date formatter", buf, 2u);
    }
    StringWithDate = 0;
  }
  v12 = CFDateFormatterCreate(0, v5, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  if (v12)
  {
    v13 = v12;
    v14 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v12, a1);
    CFRelease(v13);
  }
  else
  {
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1CFCFE000, v15, OS_LOG_TYPE_DEFAULT, "#Warning failed to create time formatter", v21, 2u);
    }
    v14 = 0;
  }
  v16 = objc_msgSend(a3, "mf_addressComment");
  uint64_t v17 = objc_msgSend(a3, "mf_uncommentedAddress");
  if (v16)
  {
    uint64_t v18 = v17;
    if (v17)
    {
      if (([v16 isEqual:v17] & 1) == 0) {
        a3 = (void *)[NSString stringWithFormat:MFLookupLocalizedString(@"REPLY_ATTRIBUTION_SENDER", @"%@ <%@>", 0), v16, v18];
      }
    }
  }
  uint64_t v19 = 0;
  if (StringWithDate && v14) {
    uint64_t v19 = [NSString stringWithFormat:MFLookupLocalizedString(@"REPLY_ATTRIBUTION", @"On %@, at %@, %@ wrote:\n\n", @"Delayed", StringWithDate, v14, a3];
  }

  return v19;
}

@end