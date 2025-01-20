@interface STStatusBarDataStringEntry(Converter)
- (uint64_t)initFromData:()Converter type:string:maxLength:;
@end

@implementation STStatusBarDataStringEntry(Converter)

- (uint64_t)initFromData:()Converter type:string:maxLength:
{
  if (*(unsigned char *)(a3 + a4) && strnlen(__s1, a6))
  {
    v8 = objc_opt_class();
    uint64_t v9 = [NSString stringWithUTF8String:__s1];
    uint64_t v10 = [v8 entryWithStringValue:v9];

    a1 = (void *)v9;
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() disabledEntry];
  }

  return v10;
}

@end