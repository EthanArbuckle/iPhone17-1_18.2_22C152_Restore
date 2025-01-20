@interface NUFullExtentPolicy
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extentForImageExtent:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation NUFullExtentPolicy

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extentForImageExtent:(SEL)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  retstr->var0 = a4->var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

@end