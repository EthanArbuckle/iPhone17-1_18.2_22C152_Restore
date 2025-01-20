@interface GQDWPFootnoteMark
- (__CFString)value;
- (void)dealloc;
@end

@implementation GQDWPFootnoteMark

- (void)dealloc
{
  mValue = self->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPFootnoteMark;
  [(GQDWPFootnoteMark *)&v4 dealloc];
}

- (__CFString)value
{
  return self->mValue;
}

@end