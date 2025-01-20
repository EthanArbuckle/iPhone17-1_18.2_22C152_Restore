@interface NSData
- (id)asHexString;
@end

@implementation NSData

- (id)asHexString
{
  CFIndex Length = CFDataGetLength((CFDataRef)self);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
  BytePtr = CFDataGetBytePtr((CFDataRef)self);
  CFIndex v6 = CFDataGetLength((CFDataRef)self);
  if (v6 >= 1)
  {
    CFIndex v7 = v6;
    do
    {
      unsigned int v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, @"%02X", v8);
      --v7;
    }
    while (v7);
  }

  return Mutable;
}

@end