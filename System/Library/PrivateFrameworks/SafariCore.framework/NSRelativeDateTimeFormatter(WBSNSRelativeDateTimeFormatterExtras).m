@interface NSRelativeDateTimeFormatter(WBSNSRelativeDateTimeFormatterExtras)
+ (id)safari_suggestionsRelativeDateTimeFormatter;
- (__CFString)safari_suggestionsLocalizedStringRelativeToNowForDate:()WBSNSRelativeDateTimeFormatterExtras;
@end

@implementation NSRelativeDateTimeFormatter(WBSNSRelativeDateTimeFormatterExtras)

+ (id)safari_suggestionsRelativeDateTimeFormatter
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28FE0]);
  [v0 setDateTimeStyle:1];
  [v0 setFormattingContext:4];
  return v0;
}

- (__CFString)safari_suggestionsLocalizedStringRelativeToNowForDate:()WBSNSRelativeDateTimeFormatterExtras
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v6 = [v5 isDateInToday:v4];

  if (v6)
  {
    v7 = @"Today (Frequently Visited)";
LABEL_5:
    _WBSLocalizedString(v7, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v9 = [v8 isDateInYesterday:v4];

  if (v9)
  {
    v7 = @"Yesterday";
    goto LABEL_5;
  }
  if (v4)
  {
    v12 = [MEMORY[0x1E4F1C9C8] now];
    v10 = [a1 localizedStringForDate:v4 relativeToDate:v12];
  }
  else
  {
    v10 = &stru_1F105D3F0;
  }
LABEL_6:

  return v10;
}

@end