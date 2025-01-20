@interface NUSquareExtentPolicy
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extentForImageExtent:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation NUSquareExtentPolicy

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
  int64_t var0 = a4->var1.var0;
  int64_t var1 = a4->var1.var1;
  if (var0 >= var1) {
    int64_t v6 = a4->var1.var1;
  }
  else {
    int64_t v6 = a4->var1.var0;
  }
  BOOL v7 = var0 < v6;
  uint64_t v8 = var0 - v6;
  if (v7) {
    ++v8;
  }
  int64_t v9 = a4->var0.var0 + (v8 >> 1);
  BOOL v7 = var1 < v6;
  uint64_t v10 = var1 - v6;
  if (v7) {
    ++v10;
  }
  int64_t v11 = a4->var0.var1 + (v10 >> 1);
  retstr->var0.int64_t var0 = v9;
  retstr->var0.int64_t var1 = v11;
  retstr->var1.int64_t var0 = v6;
  retstr->var1.int64_t var1 = v6;
  return self;
}

@end