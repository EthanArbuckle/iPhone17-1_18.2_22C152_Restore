@interface NSArray(_WTColor)
- (id)CGColors;
@end

@implementation NSArray(_WTColor)

- (id)CGColors
{
  v2 = objc_opt_new();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__NSArray__WTColor__CGColors__block_invoke;
  v5[3] = &unk_26558E378;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateObjectsUsingBlock:v5];

  return v3;
}

@end