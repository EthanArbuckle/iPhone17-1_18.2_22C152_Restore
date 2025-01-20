@interface NSMutableString(Utils)
- (void)appendWithTabDepth:()Utils format:;
@end

@implementation NSMutableString(Utils)

- (void)appendWithTabDepth:()Utils format:
{
  va_start(va, format);
  for (CFStringRef i = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, format, va); a3; --a3)
    [a1 appendString:@"\t"];
  [a1 appendString:i];
  CFRelease(i);
}

@end