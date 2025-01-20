@interface STStatusBarDataQuietModeEntry(Converter)
- (uint64_t)initFromData:()Converter type:focusName:maxFocusLength:imageName:maxImageLength:BOOLValue:;
@end

@implementation STStatusBarDataQuietModeEntry(Converter)

- (uint64_t)initFromData:()Converter type:focusName:maxFocusLength:imageName:maxImageLength:BOOLValue:
{
  int v14 = *(unsigned __int8 *)(a3 + a4);
  v15 = objc_opt_class();
  v16 = v15;
  if (v14)
  {
    if (strnlen(a5, a6))
    {
      v17 = [NSString stringWithUTF8String:a5];
    }
    else
    {
      v17 = 0;
    }
    if (strnlen(a7, a8))
    {
      v19 = [NSString stringWithUTF8String:a7];
    }
    else
    {
      v19 = 0;
    }
    uint64_t v18 = [v16 entryWithFocusName:v17 imageNamed:v19 BOOLValue:a9];
  }
  else
  {
    uint64_t v18 = [v15 disabledEntry];
    v17 = a1;
  }

  return v18;
}

@end