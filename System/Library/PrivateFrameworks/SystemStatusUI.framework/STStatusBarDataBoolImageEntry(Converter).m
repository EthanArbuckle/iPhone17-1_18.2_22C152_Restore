@interface STStatusBarDataBoolImageEntry(Converter)
- (uint64_t)initFromData:()Converter type:imageName:maxLength:BOOLValue:;
@end

@implementation STStatusBarDataBoolImageEntry(Converter)

- (uint64_t)initFromData:()Converter type:imageName:maxLength:BOOLValue:
{
  int v11 = *(unsigned __int8 *)(a3 + a4);
  v12 = objc_opt_class();
  v13 = v12;
  if (v11)
  {
    if (strnlen(a5, a6))
    {
      uint64_t v14 = [NSString stringWithUTF8String:a5];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [v13 entryWithImageNamed:v14 BOOLValue:a7];

    a1 = (void *)v14;
  }
  else
  {
    uint64_t v15 = [v12 disabledEntry];
  }

  return v15;
}

@end