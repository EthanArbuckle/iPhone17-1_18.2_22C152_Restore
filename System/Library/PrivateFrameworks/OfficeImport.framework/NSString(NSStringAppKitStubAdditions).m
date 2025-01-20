@interface NSString(NSStringAppKitStubAdditions)
- (double)oi_sizeWithFontName:()NSStringAppKitStubAdditions size:bold:italic:;
- (uint64_t)oi_rangeOfCharactersFromSet:()NSStringAppKitStubAdditions index:;
- (uint64_t)oi_sizeWithFontName:()NSStringAppKitStubAdditions size:;
@end

@implementation NSString(NSStringAppKitStubAdditions)

- (uint64_t)oi_sizeWithFontName:()NSStringAppKitStubAdditions size:
{
  return objc_msgSend(a1, "oi_sizeWithFontName:size:bold:italic:", a3, a4, 0, 0);
}

- (double)oi_sizeWithFontName:()NSStringAppKitStubAdditions size:bold:italic:
{
  unint64_t v9 = [a1 length];
  double v10 = 0.49;
  if (a5 | a6) {
    double v10 = 0.58;
  }
  return v10 * (double)a4 * (double)v9;
}

- (uint64_t)oi_rangeOfCharactersFromSet:()NSStringAppKitStubAdditions index:
{
  id v6 = a3;
  unint64_t v7 = [a1 length];
  uint64_t v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a4, v7 - a4);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = v8 + 1;
    if (v8 + 1 < v7)
    {
      do
      {
        if (!objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v12))) {
          break;
        }
        ++v11;
        ++v12;
      }
      while (v7 != v12);
    }
  }

  return v9;
}

@end