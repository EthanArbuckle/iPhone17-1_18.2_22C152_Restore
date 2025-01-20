@interface UIColor
+ (id)color:(id)a3 byAddingColor:(id)a4;
- (id)semiTransparentRepresentation;
@end

@implementation UIColor

- (id)semiTransparentRepresentation
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  unsigned int v2 = [(UIColor *)self getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  v3 = 0;
  if (v2)
  {
    v3 = +[UIColor colorWithRed:v8 green:v7 blue:v6 alpha:v5 * 0.5];
  }

  return v3;
}

+ (id)color:(id)a3 byAddingColor:(id)a4
{
  double v14 = 0.0;
  double v15 = 0.0;
  uint64_t v12 = 0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  id v5 = a4;
  [a3 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
  [v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];

  double v6 = +[UIColor colorWithRed:(1.0 - v8) * v15 + v8 * v11 green:(1.0 - v8) * v14 + v8 * v10 blue:(1.0 - v8) * v13 + v8 * v9 alpha:1.0];

  return v6;
}

@end