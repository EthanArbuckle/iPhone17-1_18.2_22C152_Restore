@interface NSString(UISafeInstantiators)
- (uint64_t)_initWithUTF8String:()UISafeInstantiators maxLength:;
@end

@implementation NSString(UISafeInstantiators)

- (uint64_t)_initWithUTF8String:()UISafeInstantiators maxLength:
{
  v7 = memchr(__s, 0, __n);
  if (v7) {
    size_t v8 = v7 - (unsigned char *)__s;
  }
  else {
    size_t v8 = __n;
  }
  return [a1 initWithBytes:__s length:v8 encoding:4];
}

@end