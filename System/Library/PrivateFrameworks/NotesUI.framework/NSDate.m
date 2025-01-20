@interface NSDate
@end

@implementation NSDate

uint64_t __55__NSDate_NotesDateUtilities___notes_todayDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)__notesTodayDateFormatter;
  __notesTodayDateFormatter = (uint64_t)v0;

  v2 = (void *)__notesTodayDateFormatter;
  return [v2 setTimeStyle:1];
}

void __58__NSDate_NotesDateUtilities___notes_relativeDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)__notesRelativeDateFormatter;
  __notesRelativeDateFormatter = (uint64_t)v0;

  v2 = (void *)__notesRelativeDateFormatter;
  v3 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [v3 dateFormatFromTemplate:@"cccc" options:0 locale:v5];
  [v2 setDateFormat:v4];
}

uint64_t __58__NSDate_NotesDateUtilities___notes_fallbackDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)__notesFallbackFormatter;
  __notesFallbackFormatter = (uint64_t)v0;

  [(id)__notesFallbackFormatter setDoesRelativeDateFormatting:1];
  v2 = (void *)__notesFallbackFormatter;
  return [v2 setDateStyle:1];
}

@end