@interface NSDate(NotesDateUtilities)
+ (id)_notes_fallbackDateFormatter;
+ (id)_notes_relativeDateFormatter;
+ (id)_notes_todayDateFormatter;
- (id)userFriendlyString;
- (id)userFriendlyStringWithTime;
@end

@implementation NSDate(NotesDateUtilities)

- (id)userFriendlyStringWithTime
{
  if (!__notesDisplayDateFormatterWithYear)
  {
    v2 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v4 = (void *)__notesDisplayDateFormatterWithYear;
    __notesDisplayDateFormatterWithYear = (uint64_t)v3;

    [(id)__notesDisplayDateFormatterWithYear setLocale:v2];
    [(id)__notesDisplayDateFormatterWithYear setDateStyle:0];
    [(id)__notesDisplayDateFormatterWithYear setTimeStyle:0];
    v5 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"MMMMdyjmm" options:0 locale:v2];
    if (v5) {
      [(id)__notesDisplayDateFormatterWithYear setDateFormat:v5];
    }
  }
  id v6 = a1;
  v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];

    id v6 = (id)v9;
  }
  v10 = [(id)__notesDisplayDateFormatterWithYear stringFromDate:v6];

  return v10;
}

+ (id)_notes_todayDateFormatter
{
  if (_notes_todayDateFormatter_onceToken != -1) {
    dispatch_once(&_notes_todayDateFormatter_onceToken, &__block_literal_global_72);
  }
  v0 = (void *)__notesTodayDateFormatter;
  return v0;
}

+ (id)_notes_relativeDateFormatter
{
  if (_notes_relativeDateFormatter_onceToken != -1) {
    dispatch_once(&_notes_relativeDateFormatter_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)__notesRelativeDateFormatter;
  return v0;
}

+ (id)_notes_fallbackDateFormatter
{
  if (_notes_fallbackDateFormatter_onceToken != -1) {
    dispatch_once(&_notes_fallbackDateFormatter_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)__notesFallbackFormatter;
  return v0;
}

- (id)userFriendlyString
{
  v2 = _calendar();
  id v3 = (void *)__Today;
  if (!__Today)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = _dateForDay(v4);
    id v6 = (void *)__Today;
    __Today = v5;

    id v3 = (void *)__Today;
  }
  id v7 = v3;
  int v8 = [v2 dateByAddingUnit:16 value:-1 toDate:v7 options:0];
  uint64_t v9 = [v2 dateByAddingUnit:0x2000 value:-1 toDate:v7 options:0];
  uint64_t v10 = [a1 compare:v7];

  if (v10 == 1)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "_notes_todayDateFormatter");
    goto LABEL_8;
  }
  if ([a1 compare:v8] != 1 && objc_msgSend(a1, "compare:", v9) == 1)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "_notes_relativeDateFormatter");
LABEL_8:
    v12 = v11;
    v13 = [v11 stringFromDate:a1];

    if (v13) {
      goto LABEL_10;
    }
  }
  v14 = objc_msgSend(MEMORY[0x1E4F1C9C8], "_notes_fallbackDateFormatter");
  v13 = [v14 stringFromDate:a1];

LABEL_10:
  return v13;
}

@end