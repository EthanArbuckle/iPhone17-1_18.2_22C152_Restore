@interface CMLengthProperty
+ (double)convertToPoints:(double)result unit:(int)a4;
+ (id)cssStringValue:(double)a3 unit:(int)a4;
- (CMLengthProperty)initWithNumber:(double)a3;
- (CMLengthProperty)initWithNumber:(double)a3 unit:(int)a4;
- (double)value;
- (id)cssString;
- (id)cssStringForName:(id)a3;
- (id)description;
- (int)compareValue:(id)a3;
- (int)intValue;
- (int)unitType;
- (void)addNumber:(double)a3 unit:(int)a4;
@end

@implementation CMLengthProperty

+ (id)cssStringValue:(double)a3 unit:(int)a4
{
  switch(a4)
  {
    case 2:
      uint64_t v5 = (int)(a3 / 20.0);
      goto LABEL_12;
    case 6:
      uint64_t v5 = ((int)a3 / 2);
      goto LABEL_12;
    case 8:
    case 9:
      objc_msgSend(NSString, "stringWithFormat:", @":%f;", *(void *)&a3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 10:
      uint64_t v5 = ((int)a3 / 8);
      goto LABEL_12;
    default:
      if (a3 > 1.0 || a3 <= 0.5) {
        uint64_t v5 = (int)a3;
      }
      else {
        uint64_t v5 = 1;
      }
LABEL_12:
      v7 = [NSNumber numberWithInt:v5];
      v8 = +[CMGlobalCache lengthPropertyCache];
      v9 = [v8 objectForKey:v7];
      v10 = v9;
      if (v9)
      {
        id v4 = v9;
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @":%dpx;", v5);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        [v8 setObject:v4 forKey:v7];
      }

LABEL_16:
      return v4;
  }
}

- (CMLengthProperty)initWithNumber:(double)a3 unit:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CMLengthProperty;
  result = [(CMLengthProperty *)&v7 init];
  if (result)
  {
    result->value = a3;
    result->unitType = a4;
  }
  return result;
}

- (id)cssStringForName:(id)a3
{
  id v4 = a3;
  switch(self->unitType)
  {
    case 2:
      uint64_t v6 = (int)(self->value / 20.0);
      goto LABEL_12;
    case 3:
      uint64_t v6 = (int)(self->value / 20.0);
      objc_super v7 = @"%@:%dpt;";
      goto LABEL_13;
    case 6:
      uint64_t v6 = ((int)self->value / 2);
      goto LABEL_12;
    case 8:
    case 9:
      uint64_t v5 = [NSString stringWithFormat:@"%@:%f;", v4, *(void *)&self->value];
      goto LABEL_14;
    default:
      double value = self->value;
      BOOL v9 = value > 1.0 || value <= 0.5;
      LODWORD(v6) = (int)value;
      if (v9) {
        uint64_t v6 = v6;
      }
      else {
        uint64_t v6 = 1;
      }
LABEL_12:
      objc_super v7 = @"%@:%d;";
LABEL_13:
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", v7, v4, v6);
LABEL_14:
      v10 = (void *)v5;

      return v10;
  }
}

- (double)value
{
  return self->value;
}

- (int)unitType
{
  return self->unitType;
}

- (CMLengthProperty)initWithNumber:(double)a3
{
  return [(CMLengthProperty *)self initWithNumber:1 unit:a3];
}

- (id)cssString
{
  switch(self->unitType)
  {
    case 2:
      uint64_t v2 = (int)(self->value / 20.0);
      goto LABEL_11;
    case 3:
      objc_msgSend(NSString, "stringWithFormat:", @"%dpt;", (int)(self->value / 20.0));
      goto LABEL_13;
    case 6:
      uint64_t v2 = ((int)self->value / 2);
      goto LABEL_11;
    case 8:
    case 9:
      objc_msgSend(NSString, "stringWithFormat:", @"%f;", *(void *)&self->value);
      goto LABEL_13;
    default:
      double value = self->value;
      BOOL v4 = value > 1.0 || value <= 0.5;
      LODWORD(v2) = (int)value;
      if (v4) {
        uint64_t v2 = v2;
      }
      else {
        uint64_t v2 = 1;
      }
LABEL_11:
      objc_msgSend(NSString, "stringWithFormat:", @"%d;", v2);
      uint64_t v5 = LABEL_13:;
      return v5;
  }
}

- (int)intValue
{
  return (int)self->value;
}

- (int)compareValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double value = self->value;
    [v5 value];
    if (value == v7)
    {
      int unitType = self->unitType;
      if (unitType == [v5 unitType]) {
        int v8 = 0;
      }
      else {
        int v8 = -1;
      }
    }
    else
    {
      int v8 = -1;
    }
  }
  else
  {
    int v8 = -1;
  }

  return v8;
}

+ (double)convertToPoints:(double)result unit:(int)a4
{
  if ((a4 - 2) < 2) {
    return result / 20.0;
  }
  if (a4 == 6) {
    return result * 0.5;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CMLengthProperty *)self cssString];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (void)addNumber:(double)a3 unit:(int)a4
{
  if (self->unitType == a4)
  {
    self->double value = self->value + a3;
  }
  else
  {
    uint64_t v6 = *(void *)&a4;
    [(id)objc_opt_class() convertToPoints:self->unitType unit:self->value];
    double v8 = v7;
    [(id)objc_opt_class() convertToPoints:v6 unit:a3];
    self->double value = v8 + v9;
    self->int unitType = 1;
  }
}

@end