@interface TSUDateFormatCategory
- (TSUDateFormatCategory)initWithInitialPattern:(id)a3 locale:(__CFLocale *)a4;
- (__CFDate)newDateFromString:(__CFString *)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(const __CFString *)a5 perfect:(BOOL *)a6;
- (id)entryForSeparator:(unsigned __int16)a3;
- (void)addSeparator:(unsigned __int16)a3 format:(id)a4 locale:(__CFLocale *)a5;
- (void)dealloc;
@end

@implementation TSUDateFormatCategory

- (TSUDateFormatCategory)initWithInitialPattern:(id)a3 locale:(__CFLocale *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSUDateFormatCategory;
  v6 = [(TSUDateFormatCategory *)&v12 init];
  if (v6)
  {
    v7 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    v6->mInitialFormatter = v7;
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x263EFFBA0], (CFTypeRef)*MEMORY[0x263EFFB38]);
    mInitialFormatter = v6->mInitialFormatter;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFC10];
    CFTimeZoneRef v10 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(mInitialFormatter, v9, v10);
    CFDateFormatterSetFormat(v6->mInitialFormatter, (CFStringRef)a3);
    v6->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v6;
}

- (void)dealloc
{
  CFRelease(self->mInitialFormatter);

  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatCategory;
  [(TSUDateFormatCategory *)&v3 dealloc];
}

- (void)addSeparator:(unsigned __int16)a3 format:(id)a4 locale:(__CFLocale *)a5
{
  uint64_t v7 = a3;
  CFStringRef v9 = -[TSUDateFormatCategory entryForSeparator:](self, "entryForSeparator:");
  if (!v9)
  {
    CFStringRef v9 = [[TSUDateFormatCategoryEntry alloc] initWithSeparator:v7];
    [(NSMutableArray *)self->mEntries addObject:v9];
  }
  [(TSUDateFormatCategoryEntry *)v9 addFormat:a4 locale:a5];
}

- (id)entryForSeparator:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v5 = [(NSMutableArray *)self->mEntries count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  while (1)
  {
    v8 = (void *)[(NSMutableArray *)self->mEntries objectAtIndex:v7];
    if ([v8 separator] == v3) {
      break;
    }
    if (v6 == ++v7) {
      return 0;
    }
  }
  return v8;
}

- (__CFDate)newDateFromString:(__CFString *)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(const __CFString *)a5 perfect:(BOOL *)a6
{
  BOOL v8 = a4;
  CFIndex Length = CFStringGetLength(a3);
  v17.location = 0;
  v17.length = Length;
  int AbsoluteTimeFromString = CFDateFormatterGetAbsoluteTimeFromString(self->mInitialFormatter, a3, &v17, 0);
  result = 0;
  if (AbsoluteTimeFromString) {
    BOOL v14 = v17.location == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14 && v17.length >= 1)
  {
    if (v17.length >= Length) {
      uint64_t CharacterAtIndex = 0;
    }
    else {
      uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v17.length);
    }
    result = [(TSUDateFormatCategory *)self entryForSeparator:CharacterAtIndex];
    if (result) {
      return (__CFDate *)[(__CFDate *)result newDateFromString:a3 forceAllowAMPM:v8 successfulFormatString:a5 perfect:a6];
    }
  }
  return result;
}

@end