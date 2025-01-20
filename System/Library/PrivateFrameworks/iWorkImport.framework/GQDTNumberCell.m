@interface GQDTNumberCell
- (__CFString)createStringValue;
- (double)value;
- (int)readAttributesForNCell:(_xmlTextReader *)a3;
- (int)readAttributesForNumberCell:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDTNumberCell

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTNumberCell;
  [(GQDTCell *)&v3 dealloc];
}

- (double)value
{
  return self->mValue;
}

- (__CFString)createStringValue
{
  CFAllocatorRef alloc = 0;
  mComputedFormat = self->mComputedFormat;
  if (mComputedFormat)
  {
    if ([(GQDTComputedFormatSpec *)mComputedFormat isNumberFormat])
    {
      CFAllocatorRef v4 = [(GQDTComputedFormatSpec *)self->mComputedFormat format];
      CFAllocatorRef alloc = v4;
      if (v4) {
        return (__CFString *)[(__CFAllocator *)v4 createStringFromDouble:self->mValue];
      }
    }
  }
  [(GQDSStyle *)self->super.mStyle hasValueForObjectProperty:122 value:&alloc];
  CFAllocatorRef v4 = alloc;
  if (alloc) {
    return (__CFString *)[(__CFAllocator *)v4 createStringFromDouble:self->mValue];
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(0, 0, @"%f", *(void *)&self->mValue);
  }
}

- (int)readAttributesForNumberCell:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"value");
  self->mValue = v4;
  return 1;
}

- (int)readAttributesForNCell:(_xmlTextReader *)a3
{
  sub_433CC(a3, qword_A35E8, (xmlChar *)"v");
  self->mValue = v4;
  return 1;
}

@end