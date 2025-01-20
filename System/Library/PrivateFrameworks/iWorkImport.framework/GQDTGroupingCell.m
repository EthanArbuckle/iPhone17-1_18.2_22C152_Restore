@interface GQDTGroupingCell
+ (__CFString)displayTypeString:(int)a3;
- (BOOL)hasFormulaValue;
- (BOOL)isCollapsed;
- (__CFString)createFormattedValue;
- (id)value;
- (int)readAttributes:(_xmlTextReader *)a3;
- (int)readElement:(_xmlTextReader *)a3;
- (int)readRootFormat:(_xmlTextReader *)a3;
- (int)readValue:(_xmlTextReader *)a3;
- (unsigned)level;
- (unsigned)rowCount;
- (unsigned)rowIdx;
- (void)dealloc;
- (void)setProcessorBundle:(__CFBundle *)a3;
@end

@implementation GQDTGroupingCell

- (void)dealloc
{
  id mValue = self->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  mFormulaValue = self->mFormulaValue;
  if (mFormulaValue) {
    CFRelease(mFormulaValue);
  }

  v5.receiver = self;
  v5.super_class = (Class)GQDTGroupingCell;
  [(GQDTCell *)&v5 dealloc];
}

- (unsigned)level
{
  return self->mLevel;
}

- (unsigned)rowIdx
{
  return self->mRowIdx;
}

- (unsigned)rowCount
{
  return self->mRowCount;
}

- (BOOL)isCollapsed
{
  return self->mIsCollapsed;
}

- (id)value
{
  if (self->mHasValidFormulaValue) {
    v2 = &OBJC_IVAR___GQDTGroupingCell_mFormulaValue;
  }
  else {
    v2 = &OBJC_IVAR___GQDTGroupingCell_mValue;
  }
  return *(Class *)((char *)&self->super.super.isa + *v2);
}

- (__CFString)createFormattedValue
{
  if (self->mHasValidFormulaValue)
  {
    mFormulaValue = self->mFormulaValue;
    if (mFormulaValue) {
      CFRetain(mFormulaValue);
    }
    return mFormulaValue;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = (const __CFString *)[self->mFormat formatString];
    CFDateRef mValue = (const __CFDate *)self->mValue;
    CFLocaleRef v6 = sub_52F10();
    v7 = CFDateFormatterCreate(0, v6, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFTimeZoneRef v8 = sub_143FC();
    CFDateFormatterSetProperty(v7, kCFDateFormatterTimeZone, v8);
    if (v4) {
      CFDateFormatterSetFormat(v7, v4);
    }
    mFormulaValue = (__CFString *)CFDateFormatterCreateStringWithDate(0, v7, mValue);
    CFRelease(v7);
    return mFormulaValue;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double DoubleValue = CFStringGetDoubleValue((CFStringRef)self->mValue);
    id v11 = [self->mFormat formatString];
    mProcessorBundle = self->mProcessorBundle;
    return sub_4E784(v11, mProcessorBundle, DoubleValue);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0;
      }
      id v15 = self->mValue;
      return (__CFString *)self->mValue;
    }
    id mFormat = self->mFormat;
    double v14 = CFStringGetDoubleValue((CFStringRef)self->mValue);
    return (__CFString *)[mFormat createStringFromDouble:v14];
  }
}

- (BOOL)hasFormulaValue
{
  return self->mHasValidFormulaValue;
}

+ (__CFString)displayTypeString:(int)a3
{
  switch(a3)
  {
    case 2:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"GQDTDisplayTypeSubtotal";
      objc_super v5 = @"Subtotal";
      goto LABEL_8;
    case 3:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"GQDTDisplayTypeAverage";
      objc_super v5 = @"Average";
      goto LABEL_8;
    case 4:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"GQDTDisplayTypeMinimum";
      objc_super v5 = @"Minimum";
      goto LABEL_8;
    case 5:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"GQDTDisplayTypeMaximum";
      objc_super v5 = @"Maximum";
      goto LABEL_8;
    case 6:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"GQDTDisplayTypeCount";
      objc_super v5 = @"Count";
LABEL_8:
      result = [(NSBundle *)v3 localizedStringForKey:v4 value:v5 table:0];
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int)readValue:(_xmlTextReader *)a3
{
  self->CFDateRef mValue = sub_4340C(a3, qword_A35E8, (xmlChar *)"value");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFLocaleRef System = CFLocaleGetSystem();
    objc_super v5 = CFDateFormatterCreate(kCFAllocatorDefault, System, kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
    CFDateFormatterSetFormat(v5, @"yyyy-MM-dd'T'HH:mm:ssZZ");
    CFDateRef DateFromString = CFDateFormatterCreateDateFromString(kCFAllocatorDefault, v5, (CFStringRef)self->mValue, 0);
    CFRelease(v5);

    self->CFDateRef mValue = DateFromString;
  }
  return 1;
}

- (int)readElement:(_xmlTextReader *)a3
{
  self->mLevel = sub_43034(a3, qword_A35E8, (xmlChar *)"level", 0);
  self->mRowIdx = sub_43034(a3, qword_A35E8, (xmlChar *)"row-index", 0);
  self->mRowCount = sub_43034(a3, qword_A35E8, (xmlChar *)"row-count", 0);
  self->mIsCollapsed = sub_42DCC(a3, qword_A35E8, (xmlChar *)"collapsed", 0);
  return 1;
}

- (int)readRootFormat:(_xmlTextReader *)a3
{
  objc_super v5 = sub_4340C(a3, qword_A35E8, (xmlChar *)"group-date-format");
  if (v5)
  {
    CFLocaleRef v6 = v5;
    v7 = off_80058;
  }
  else
  {
    CFTimeZoneRef v8 = sub_4340C(a3, qword_A35E8, (xmlChar *)"group-duration-format");
    if (!v8) {
      return 1;
    }
    CFLocaleRef v6 = v8;
    v7 = off_80060;
  }
  id v9 = [objc_alloc(*v7) initWithFormatString:v6];
  CFRelease(v6);
  if (v9)
  {
    id mFormat = self->mFormat;
    if (mFormat)
    {
      CFRelease(mFormat);
      self->id mFormat = v9;
    }
    else
    {
      CFRelease(v9);
    }
  }
  return 1;
}

- (void)setProcessorBundle:(__CFBundle *)a3
{
  self->mProcessorBundle = a3;
}

- (int)readAttributes:(_xmlTextReader *)a3
{
  int v5 = sub_42DCC(a3, qword_A35E8, (xmlChar *)"group-formula-value-valid", 0);
  self->mHasValidFormulaValue = v5;
  if (v5) {
    self->mFormulaValue = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"group-formula-string");
  }
  return 1;
}

@end