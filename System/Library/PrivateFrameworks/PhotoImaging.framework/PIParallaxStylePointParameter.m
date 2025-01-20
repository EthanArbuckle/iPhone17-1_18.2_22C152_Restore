@interface PIParallaxStylePointParameter
- (BOOL)isEqualToParallaxStyleParameter:(id)a3;
- (NSNumber)xValue;
- (NSNumber)yValue;
- (NSString)unit;
- (PIParallaxStylePointParameter)init;
- (PIParallaxStylePointParameter)initWithX:(id)a3 Y:(id)a4;
- (PIParallaxStylePointParameter)initWithX:(id)a3 Y:(id)a4 unit:(id)a5;
- (id)description;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
- (id)type;
@end

@implementation PIParallaxStylePointParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

- (NSString)unit
{
  return self->_unit;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PIParallaxStylePointParameter *)self xValue];
  v5 = [(PIParallaxStylePointParameter *)self yValue];
  v6 = [(PIParallaxStylePointParameter *)self unit];
  v7 = [v3 stringWithFormat:@"(X:%@, Y:%@, unit: %@)", v4, v5, v6];

  return v7;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(PIParallaxStylePointParameter *)self xValue];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [(PIParallaxStylePointParameter *)self yValue];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [(PIParallaxStylePointParameter *)self unit];
  LODWORD(v9) = [v12 isEqualToString:@"pixels"];

  if (v9)
  {
    [v5 visibleRect];
    NUAbsolutePointInRect();
    double v8 = v13;
    double v11 = v14;
  }
  v15 = [MEMORY[0x1E4F1E080] vectorWithX:v8 Y:v11];

  return v15;
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"point"];

  if (v6)
  {
    id v7 = v4;
    double v8 = [(PIParallaxStylePointParameter *)self unit];
    v9 = [v7 unit];
    int v10 = [v8 isEqualToString:v9];

    if (v10
      && ([(PIParallaxStylePointParameter *)self xValue],
          double v11 = objc_claimAutoreleasedReturnValue(),
          [v7 xValue],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v11 isEqualToNumber:v12],
          v12,
          v11,
          v13))
    {
      double v14 = [(PIParallaxStylePointParameter *)self yValue];
      v15 = [v7 yValue];
      char v16 = [v14 isEqualToNumber:v15];
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)type
{
  return @"point";
}

- (PIParallaxStylePointParameter)initWithX:(id)a3 Y:(id)a4 unit:(id)a5
{
  double v8 = (NSNumber *)a3;
  v9 = (NSNumber *)a4;
  int v10 = (NSString *)a5;
  v18.receiver = self;
  v18.super_class = (Class)PIParallaxStylePointParameter;
  double v11 = [(PIParallaxStylePointParameter *)&v18 init];
  xValue = v11->_xValue;
  v11->_xValue = v8;
  int v13 = v8;

  yValue = v11->_yValue;
  v11->_yValue = v9;
  v15 = v9;

  unit = v11->_unit;
  v11->_unit = v10;

  return v11;
}

- (PIParallaxStylePointParameter)initWithX:(id)a3 Y:(id)a4
{
  return [(PIParallaxStylePointParameter *)self initWithX:a3 Y:a4 unit:@"none"];
}

- (PIParallaxStylePointParameter)init
{
  return [(PIParallaxStylePointParameter *)self initWithX:&unk_1F000A4F8 Y:&unk_1F000A4F8];
}

@end