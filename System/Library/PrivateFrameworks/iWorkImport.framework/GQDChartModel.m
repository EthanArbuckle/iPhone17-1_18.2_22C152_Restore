@interface GQDChartModel
- (BOOL)hasFloatValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(float *)a5;
- (BOOL)hasIntValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(int *)a5;
- (BOOL)hasStringValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(const __CFString *)a5;
- (BOOL)hasValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(const void *)a5;
- (BOOL)isFormulaChart;
- (__CFArray)chartData;
- (__CFArray)columnNames;
- (__CFArray)rowNames;
- (__CFArray)seriesArray;
- (__CFDictionary)propertiesForSeriesAtIndex:(int64_t)a3;
- (__CFDictionary)propertyBag;
- (__CFString)catagoryTitle;
- (__CFString)title;
- (__CFString)value2Title;
- (__CFString)valueTitle;
- (int64_t)direction;
- (void)dealloc;
- (void)setProcessorBundle:(__CFBundle *)a3;
- (void)transpose;
@end

@implementation GQDChartModel

- (__CFArray)chartData
{
  return self->mChartData;
}

- (__CFArray)columnNames
{
  return self->mColumnNames;
}

- (__CFArray)rowNames
{
  return self->mRowNames;
}

- (__CFDictionary)propertyBag
{
  return self->mPropertyBag;
}

- (__CFArray)seriesArray
{
  result = self->mPropertyBag;
  if (result) {
    return (__CFArray *)CFDictionaryGetValue(result, @"SFCChartModelSeriesStorageKey");
  }
  return result;
}

- (__CFDictionary)propertiesForSeriesAtIndex:(int64_t)a3
{
  result = [(GQDChartModel *)self seriesArray];
  if (result)
  {
    v6 = [(GQDChartModel *)self seriesArray];
    return (__CFDictionary *)CFArrayGetValueAtIndex(v6, a3);
  }
  return result;
}

- (BOOL)hasValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(const void *)a5
{
  v9 = [(GQDChartModel *)self propertiesForSeriesAtIndex:a4];
  if (v9) {
    LOBYTE(v9) = CFDictionaryGetValueIfPresent([(GQDChartModel *)self propertiesForSeriesAtIndex:a4], a3, a5) != 0;
  }
  return (char)v9;
}

- (BOOL)hasStringValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(const __CFString *)a5
{
  CFStringRef v8 = 0;
  BOOL v6 = [(GQDChartModel *)self hasValueForProperty:a3 forSeriesAtIndex:a4 value:&v8];
  if (v6) {
    *a5 = v8;
  }
  return v6;
}

- (BOOL)hasIntValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(int *)a5
{
  CFNumberRef number = 0;
  BOOL v6 = [(GQDChartModel *)self hasValueForProperty:a3 forSeriesAtIndex:a4 value:&number];
  if (v6) {
    CFNumberGetValue(number, kCFNumberIntType, a5);
  }
  return v6;
}

- (BOOL)hasFloatValueForProperty:(__CFString *)a3 forSeriesAtIndex:(int64_t)a4 value:(float *)a5
{
  CFNumberRef number = 0;
  BOOL v6 = [(GQDChartModel *)self hasValueForProperty:a3 forSeriesAtIndex:a4 value:&number];
  if (v6) {
    CFNumberGetValue(number, kCFNumberFloatType, a5);
  }
  return v6;
}

- (int64_t)direction
{
  return self->mDirection;
}

- (__CFString)title
{
  result = self->mTitle;
  if (!result)
  {
    result = (__CFString *)CFBundleCopyLocalizedString(self->mProcessorBundle, @"Title", @"Title", 0);
    self->mTitle = result;
  }
  return result;
}

- (__CFString)catagoryTitle
{
  result = self->mCatagoryTitle;
  if (!result)
  {
    result = (__CFString *)CFBundleCopyLocalizedString(self->mProcessorBundle, @"Category Title", @"Category Title", 0);
    self->mCatagoryTitle = result;
  }
  return result;
}

- (__CFString)valueTitle
{
  result = self->mValueTitle;
  if (!result)
  {
    result = (__CFString *)CFBundleCopyLocalizedString(self->mProcessorBundle, @"Value Title", @"Value Title", 0);
    self->mValueTitle = result;
  }
  return result;
}

- (__CFString)value2Title
{
  result = self->mValue2Title;
  if (!result)
  {
    result = (__CFString *)CFBundleCopyLocalizedString(self->mProcessorBundle, @"Value Y2 Title", @"Value Y2 Title", 0);
    self->mValue2Title = result;
  }
  return result;
}

- (BOOL)isFormulaChart
{
  return self->mIsFormulaChart;
}

- (void)dealloc
{
  mChartData = self->mChartData;
  if (mChartData) {
    CFRelease(mChartData);
  }
  mColumnNames = self->mColumnNames;
  if (mColumnNames) {
    CFRelease(mColumnNames);
  }
  mRowNames = self->mRowNames;
  if (mRowNames) {
    CFRelease(mRowNames);
  }
  mPropertyBag = self->mPropertyBag;
  if (mPropertyBag) {
    CFRelease(mPropertyBag);
  }
  mTitle = self->mTitle;
  if (mTitle) {
    CFRelease(mTitle);
  }
  mCatagoryTitle = self->mCatagoryTitle;
  if (mCatagoryTitle) {
    CFRelease(mCatagoryTitle);
  }
  mValueTitle = self->mValueTitle;
  if (mValueTitle) {
    CFRelease(mValueTitle);
  }
  mValue2Title = self->mValue2Title;
  if (mValue2Title) {
    CFRelease(mValue2Title);
  }
  v11.receiver = self;
  v11.super_class = (Class)GQDChartModel;
  [(GQDChartModel *)&v11 dealloc];
}

- (void)transpose
{
  if (self->mChartData)
  {
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    uint64_t Count = CFArrayGetCount(self->mChartData);
    if (Count)
    {
      unint64_t v5 = 0;
      do
      {
        CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->mChartData, v5);
        uint64_t v7 = CFArrayGetCount(ValueAtIndex);
        if (v7)
        {
          unint64_t v8 = 0;
          do
          {
            if (!v5)
            {
              CFMutableArrayRef v9 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
              CFArraySetValueAtIndex(Mutable, v8, v9);
              CFRelease(v9);
            }
            if (v8 < CFArrayGetCount(Mutable))
            {
              CFArrayRef v10 = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v8);
              unsigned int v11 = CFArrayGetCount(v10);
              if (v10)
              {
                if (v5 <= v11)
                {
                  v12 = CFArrayGetValueAtIndex(ValueAtIndex, v8);
                  CFArraySetValueAtIndex(v10, v5, v12);
                }
              }
            }
            ++v8;
          }
          while (v7 != v8);
        }
        ++v5;
      }
      while (v5 != Count);
    }
    CFRelease(self->mChartData);
    self->mChartData = Mutable;
  }
}

- (void)setProcessorBundle:(__CFBundle *)a3
{
  self->mProcessorBundle = a3;
}

@end