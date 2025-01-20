@interface GQDWPFootnote
- (__CFString)value;
- (void)dealloc;
@end

@implementation GQDWPFootnote

- (void)dealloc
{
  mValue = self->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPFootnote;
  [(GQDWPFootnote *)&v4 dealloc];
}

- (__CFString)value
{
  return self->mValue;
}

@end