@interface STStatusBarDataImageEntry(Converter)
- (uint64_t)initFromData:()Converter type:imageName:maxLength:;
@end

@implementation STStatusBarDataImageEntry(Converter)

- (uint64_t)initFromData:()Converter type:imageName:maxLength:
{
  int v9 = *(unsigned __int8 *)(a3 + a4);
  v10 = objc_opt_class();
  v11 = v10;
  if (v9)
  {
    if (strnlen(a5, a6))
    {
      uint64_t v12 = [NSString stringWithUTF8String:a5];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [v11 entryWithImageNamed:v12];

    a1 = (void *)v12;
  }
  else
  {
    uint64_t v13 = [v10 disabledEntry];
  }

  return v13;
}

@end