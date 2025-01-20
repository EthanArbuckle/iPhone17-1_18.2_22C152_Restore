@interface UIColor(ProductTemplateAdditions)
- (id)blendWithColor:()ProductTemplateAdditions percentage:;
@end

@implementation UIColor(ProductTemplateAdditions)

- (id)blendWithColor:()ProductTemplateAdditions percentage:
{
  double v5 = fmax(a2, 0.0);
  if (v5 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  double v17 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v10 = 0.0;
  id v7 = a4;
  [a1 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  [v7 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];

  v8 = [MEMORY[0x263F1C550] colorWithRed:v6 * v13 + v17 * (1.0 - v6) green:v6 * v12 + v16 * (1.0 - v6) blue:v6 * v11 + v15 * (1.0 - v6) alpha:v6 * v10 + v14 * (1.0 - v6)];
  return v8;
}

@end