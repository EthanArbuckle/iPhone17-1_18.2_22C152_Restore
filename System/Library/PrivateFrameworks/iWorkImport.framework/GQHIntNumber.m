@interface GQHIntNumber
- (__CFString)createStringRef;
- (int)type;
- (int)value;
- (void)setType:(int)a3 value:(int)a4;
@end

@implementation GQHIntNumber

- (void)setType:(int)a3 value:(int)a4
{
  self->mType = a3;
  self->mValue = a4;
}

- (int)type
{
  return self->mType;
}

- (int)value
{
  return self->mValue;
}

- (__CFString)createStringRef
{
  CFStringRef v2 = @"%d";
  int mType = self->mType;
  uint64_t mValue = self->mValue;
  if (mType == 2) {
    CFStringRef v2 = @"%dpt";
  }
  if (mType == 1) {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%dpx", mValue);
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, v2, mValue);
  }
}

@end