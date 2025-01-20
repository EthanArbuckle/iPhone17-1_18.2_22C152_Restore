@interface UIFont(PCXFontAdditions)
- (uint64_t)pcxIsBold;
- (uint64_t)pcxIsItalic;
@end

@implementation UIFont(PCXFontAdditions)

- (uint64_t)pcxIsBold
{
  return (objc_msgSend((id)objc_msgSend(a1, "fontDescriptor"), "symbolicTraits") >> 1) & 1;
}

- (uint64_t)pcxIsItalic
{
  return objc_msgSend((id)objc_msgSend(a1, "fontDescriptor"), "symbolicTraits") & 1;
}

@end