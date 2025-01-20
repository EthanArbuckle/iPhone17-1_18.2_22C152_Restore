@interface TSUDateFormatCategoryEntry
- (TSUDateFormatCategoryEntry)initWithSeparator:(unsigned __int16)a3;
- (__CFDate)newDateFromString:(__CFString *)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(const __CFString *)a5 perfect:(BOOL *)a6;
- (unsigned)separator;
- (void)addFormat:(id)a3 locale:(__CFLocale *)a4;
- (void)dealloc;
@end

@implementation TSUDateFormatCategoryEntry

- (TSUDateFormatCategoryEntry)initWithSeparator:(unsigned __int16)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUDateFormatCategoryEntry;
  v4 = [(TSUDateFormatCategoryEntry *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mSeparator = a3;
    v4->mFormatters = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    v5->mFormatStrings = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->mFormatters);

  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatCategoryEntry;
  [(TSUDateFormatCategoryEntry *)&v3 dealloc];
}

- (unsigned)separator
{
  return self->mSeparator;
}

- (void)addFormat:(id)a3 locale:(__CFLocale *)a4
{
  if ((-[NSMutableSet containsObject:](self->mFormatStrings, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->mFormatStrings addObject:a3];
    objc_super v7 = CFDateFormatterCreate(0, a4, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x263EFFBA0], (CFTypeRef)*MEMORY[0x263EFFB38]);
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFC10];
    CFTimeZoneRef v9 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v7, v8, v9);
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    id v11 = objc_alloc(MEMORY[0x263EFF8F0]);
    id v13 = (id)[v11 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    v12 = (const void *)objc_msgSend(v13, "dateFromComponents:", objc_msgSend(v13, "components:fromDate:", 4, v10));
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x263EFFB90], v12);
    CFDateFormatterSetFormat(v7, (CFStringRef)a3);
    CFArrayAppendValue(self->mFormatters, v7);
    CFRelease(v7);
  }
}

- (__CFDate)newDateFromString:(__CFString *)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(const __CFString *)a5 perfect:(BOOL *)a6
{
  BOOL v31 = a4;
  CFIndex Length = CFStringGetLength(a3);
  v30 = self;
  CFIndex Count = CFArrayGetCount(self->mFormatters);
  v27 = a6;
  *a6 = 0;
  if (Count < 1) {
    return 0;
  }
  CFIndex v11 = Count;
  CFDateRef cf = 0;
  CFStringRef v26 = 0;
  CFStringRef v12 = (const __CFString *)*MEMORY[0x263EFFB88];
  CFStringRef v13 = (const __CFString *)*MEMORY[0x263EFFBB8];
  uint64_t v14 = 1;
  do
  {
    ValueAtIndex = (__CFDateFormatter *)CFArrayGetValueAtIndex(v30->mFormatters, v14 - 1);
    rangep.location = 0;
    rangep.length = Length;
    CFDateRef v16 = CFDateFormatterCreateDateFromString(0, ValueAtIndex, a3, &rangep);
    if (v16) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = !v31;
    }
    if (!v17)
    {
      CFTypeRef v18 = CFDateFormatterCopyProperty(ValueAtIndex, v12);
      CFTypeRef v19 = CFDateFormatterCopyProperty(ValueAtIndex, v13);
      CFDateFormatterSetProperty(ValueAtIndex, v12, @"AM");
      CFDateFormatterSetProperty(ValueAtIndex, v13, @"PM");
      rangep.location = 0;
      rangep.length = Length;
      CFDateRef v16 = CFDateFormatterCreateDateFromString(0, ValueAtIndex, a3, &rangep);
      CFDateFormatterSetProperty(ValueAtIndex, v12, v18);
      CFDateFormatterSetProperty(ValueAtIndex, v13, v19);
      CFRelease(v18);
      CFRelease(v19);
    }
    if (!v16) {
      goto LABEL_18;
    }
    if (rangep.location || rangep.length != Length)
    {
      CFRelease(v16);
LABEL_18:
      CFDateRef v21 = 0;
      continue;
    }
    Format = (__CFString *)CFDateFormatterGetFormat(ValueAtIndex);
    CFDateRef v21 = TSUCreateDateWithGregorianUnitsSetToDefaultValue((uint64_t)v16, Format);
    CFRelease(v16);
    if (a5) {
      *a5 = CFStringCreateCopy(0, Format);
    }
    CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0, ValueAtIndex, v21);
    if (CFStringCompare(StringWithDate, a3, 1uLL) == kCFCompareEqualTo)
    {
      BOOL *v27 = 1;
      goto LABEL_25;
    }
    if (cf)
    {
      CFRelease(v21);
      if (a5)
      {
        CFRelease(*a5);
        v23 = a5;
LABEL_22:
        CFDateRef v21 = 0;
        *v23 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v23 = a5;
      if (a5)
      {
        CFStringRef v26 = *a5;
        CFDateRef cf = v21;
        goto LABEL_22;
      }
      CFDateRef cf = v21;
    }
    CFDateRef v21 = 0;
LABEL_25:
    CFRelease(StringWithDate);
    if (v21) {
      break;
    }
  }
  while (v14++ < v11);
  if (v21 || !cf)
  {
    if (cf) {
      CFRelease(cf);
    }
    if (v26) {
      CFRelease(v26);
    }
    return v21;
  }
  else
  {
    if (a5) {
      *a5 = v26;
    }
    return cf;
  }
}

@end