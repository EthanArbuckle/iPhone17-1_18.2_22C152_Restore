@interface GQDWPAutoNumber
- (__CFString)value;
- (int)type;
- (void)dealloc;
@end

@implementation GQDWPAutoNumber

- (void)dealloc
{
  mValue = self->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPAutoNumber;
  [(GQDWPAutoNumber *)&v4 dealloc];
}

- (int)type
{
  return self->mType;
}

- (__CFString)value
{
  return self->mValue;
}

@end