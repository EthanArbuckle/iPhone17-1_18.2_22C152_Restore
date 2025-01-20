@interface UIColor(PDUExtras)
+ (id)pdu_colorWithString:()PDUExtras;
- (id)convertedToRGB;
@end

@implementation UIColor(PDUExtras)

+ (id)pdu_colorWithString:()PDUExtras
{
  id v3 = a3;
  if ([v3 hasPrefix:@"system"]
    && (SEL v4 = NSSelectorFromString((NSString *)v3), (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v5 = [MEMORY[0x263F1C550] performSelector:v4];
  }
  else
  {
    uint64_t v5 = PDUConvertColorString(v3);
  }
  v6 = (void *)v5;

  return v6;
}

- (id)convertedToRGB
{
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00260]);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v2, kCGRenderingIntentDefault, (CGColorRef)[a1 CGColor], 0);
  if (CopyByMatchingToColorSpace) {
    SEL v4 = (void *)[objc_alloc(MEMORY[0x263F1C550]) initWithCGColor:CopyByMatchingToColorSpace];
  }
  else {
    SEL v4 = 0;
  }
  CGColorSpaceRelease(v2);
  CGColorRelease(CopyByMatchingToColorSpace);
  return v4;
}

@end