@interface GQDTDateCell
- (__CFDate)date;
- (__CFString)createStringValue;
- (__CFString)getDateFormat;
- (int)readAttributesForDateCell:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDTDateCell

- (void)dealloc
{
  mDate = self->mDate;
  if (mDate) {
    CFRelease(mDate);
  }

  v4.receiver = self;
  v4.super_class = (Class)GQDTDateCell;
  [(GQDTCell *)&v4 dealloc];
}

- (__CFDate)date
{
  return self->mDate;
}

- (__CFString)getDateFormat
{
  v3 = 0;
  [(GQDSStyle *)self->super.mStyle hasValueForObjectProperty:123 value:&v3];
  return v3;
}

- (__CFString)createStringValue
{
  if (self->mDate)
  {
    mComputedFormat = self->mComputedFormat;
    if (!mComputedFormat
      || ![(GQDTComputedFormatSpec *)mComputedFormat isDateFormat]
      || (objc_super v4 = (__CFString *)objc_msgSend(-[GQDTComputedFormatSpec format](self->mComputedFormat, "format"), "formatString")) == 0)
    {
      objc_super v4 = [(GQDTDateCell *)self getDateFormat];
    }
    CFLocaleRef v5 = sub_52F10();
    v6 = CFDateFormatterCreate(0, v5, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFTimeZoneRef v7 = (CFTimeZoneRef)qword_A40E0;
    if (!qword_A40E0)
    {
      CFTimeZoneRef v7 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
      qword_A40E0 = (uint64_t)v7;
    }
    CFDateFormatterSetProperty(v6, kCFDateFormatterTimeZone, v7);
    if (v4) {
      CFDateFormatterSetFormat(v6, v4);
    }
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v6, self->mDate);
    CFRelease(v6);
    return StringWithDate;
  }
  else
  {
    return (__CFString *)CFRetain(&stru_85630);
  }
}

- (int)readAttributesForDateCell:(_xmlTextReader *)a3 processor:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "root"), "documentReleaseVersion");
  if ((unint64_t)v6 >= qword_9CA98)
  {
    double v13 = 0.0;
    if (sub_43164(a3, qword_A35E8, (xmlChar *)"cell-date", &v13))
    {
      id v11 = objc_alloc((Class)NSDate);
      self->mDate = (__CFDate *)[v11 initWithTimeIntervalSinceReferenceDate:v13];
      return 1;
    }
  }
  else
  {
    CFTimeZoneRef v7 = sub_4340C(a3, qword_A35E8, (xmlChar *)"cell-date");
    if (v7)
    {
      CFStringRef v8 = (const __CFString *)v7;
      if (CFStringGetLength((CFStringRef)v7) >= 1)
      {
        CFLocaleRef System = CFLocaleGetSystem();
        v10 = CFDateFormatterCreate(kCFAllocatorDefault, System, kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
        CFDateFormatterSetFormat(v10, @"yyyy-MM-dd'T'HH:mm:ssZZ");
        self->mDate = CFDateFormatterCreateDateFromString(kCFAllocatorDefault, v10, v8, 0);
        CFRelease(v10);
      }
      CFRelease(v8);
      return 1;
    }
  }
  return 3;
}

@end