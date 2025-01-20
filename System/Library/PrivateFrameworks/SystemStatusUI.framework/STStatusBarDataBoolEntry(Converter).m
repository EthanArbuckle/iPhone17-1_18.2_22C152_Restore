@interface STStatusBarDataBoolEntry(Converter)
- (uint64_t)initFromData:()Converter type:BOOLValue:;
@end

@implementation STStatusBarDataBoolEntry(Converter)

- (uint64_t)initFromData:()Converter type:BOOLValue:
{
  int v7 = *(unsigned __int8 *)(a3 + a4);
  v8 = objc_opt_class();
  if (v7) {
    [v8 entryWithBoolValue:a5];
  }
  else {
  uint64_t v9 = [v8 disabledEntry];
  }

  return v9;
}

@end