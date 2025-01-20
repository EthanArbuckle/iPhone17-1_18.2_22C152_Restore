@interface NSAttributedString(NSAttributedStringAgent)
+ (id)_allowedOptionClasses;
+ (uint64_t)_allowedTokensClasses;
@end

@implementation NSAttributedString(NSAttributedStringAgent)

+ (id)_allowedOptionClasses
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", objc_msgSend(MEMORY[0x1E4F28B18], "allowedSecureCodingClasses"));
  [v0 addObject:objc_opt_class()];
  [v0 addObject:objc_opt_class()];
  [v0 addObject:objc_opt_class()];
  Class v1 = NSClassFromString((NSString *)@"NSAppearance");
  if (v1) {
    [v0 addObject:v1];
  }
  Class v2 = NSClassFromString((NSString *)@"UIColor");
  if (v2) {
    [v0 addObject:v2];
  }
  v3 = (void *)[v0 copy];

  return v3;
}

+ (uint64_t)_allowedTokensClasses
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
}

@end