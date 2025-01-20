@interface PIParallaxStyleNumberParameter
- (BOOL)isEqualToParallaxStyleParameter:(id)a3;
- (NSNumber)numberValue;
- (NSString)unit;
- (PIParallaxStyleNumberParameter)init;
- (PIParallaxStyleNumberParameter)initWithNumber:(id)a3;
- (PIParallaxStyleNumberParameter)initWithNumber:(id)a3 unit:(id)a4;
- (id)description;
- (id)evaluateWithContext:(id)a3 error:(id *)a4;
- (id)type;
@end

@implementation PIParallaxStyleNumberParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
}

- (NSString)unit
{
  return self->_unit;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PIParallaxStyleNumberParameter *)self numberValue];
  v5 = [(PIParallaxStyleNumberParameter *)self unit];
  v6 = [v3 stringWithFormat:@"(%@, unit: %@) ", v4, v5];

  return v6;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(PIParallaxStyleNumberParameter *)self unit];
  int v7 = [v6 isEqualToString:@"pixels"];

  if (v7)
  {
    v8 = [(PIParallaxStyleNumberParameter *)self numberValue];
    [v8 doubleValue];
    double v10 = v9;

    [v5 renderScale];
    v11 = NSNumber;
    double v13 = v10 * v12;
  }
  else
  {
    v14 = [(PIParallaxStyleNumberParameter *)self unit];
    int v15 = [v14 isEqualToString:@"degrees"];

    v16 = [(PIParallaxStyleNumberParameter *)self numberValue];
    v17 = v16;
    if (!v15) {
      goto LABEL_6;
    }
    [v16 doubleValue];
    double v19 = v18;

    double v13 = v19 / 180.0 * 3.14159265;
    v11 = NSNumber;
  }
  v17 = [v11 numberWithDouble:v13];
LABEL_6:

  return v17;
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"number"];

  if (v6)
  {
    id v7 = v4;
    v8 = [(PIParallaxStyleNumberParameter *)self unit];
    double v9 = [v7 unit];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      v11 = [(PIParallaxStyleNumberParameter *)self numberValue];
      double v12 = [v7 numberValue];
      char v13 = [v11 isEqualToNumber:v12];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)type
{
  return @"number";
}

- (PIParallaxStyleNumberParameter)initWithNumber:(id)a3 unit:(id)a4
{
  int v6 = (NSNumber *)a3;
  id v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PIParallaxStyleNumberParameter;
  v8 = [(PIParallaxStyleNumberParameter *)&v13 init];
  numberValue = v8->_numberValue;
  v8->_numberValue = v6;
  int v10 = v6;

  unit = v8->_unit;
  v8->_unit = v7;

  return v8;
}

- (PIParallaxStyleNumberParameter)initWithNumber:(id)a3
{
  return [(PIParallaxStyleNumberParameter *)self initWithNumber:a3 unit:@"none"];
}

- (PIParallaxStyleNumberParameter)init
{
  return [(PIParallaxStyleNumberParameter *)self initWithNumber:&unk_1F0009BD8];
}

@end