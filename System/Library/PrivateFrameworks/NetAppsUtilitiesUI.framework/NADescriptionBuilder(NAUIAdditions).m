@interface NADescriptionBuilder(NAUIAdditions)
- (uint64_t)appendCGFloat:()NAUIAdditions withName:;
- (void)appendCGPoint:()NAUIAdditions withName:;
- (void)appendCGRect:()NAUIAdditions withName:;
- (void)appendCGSize:()NAUIAdditions withName:;
@end

@implementation NADescriptionBuilder(NAUIAdditions)

- (uint64_t)appendCGFloat:()NAUIAdditions withName:
{
  return objc_msgSend(a1, "appendCGFloat:withName:decimalPrecision:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)appendCGPoint:()NAUIAdditions withName:
{
  id v8 = a5;
  v9 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a2, 17, *(void *)&a3];
  id v10 = (id)[a1 appendObject:v9 withName:v8];

  return a1;
}

- (void)appendCGSize:()NAUIAdditions withName:
{
  id v8 = a5;
  v9 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a2, 17, *(void *)&a3];
  id v10 = (id)[a1 appendObject:v9 withName:v8];

  return a1;
}

- (void)appendCGRect:()NAUIAdditions withName:
{
  id v12 = a7;
  v13 = NAStringFromCGRect(a2, a3, a4, a5);
  id v14 = (id)[a1 appendObject:v13 withName:v12];

  return a1;
}

@end