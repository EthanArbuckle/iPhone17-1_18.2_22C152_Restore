@interface ICSMultiValueProperty
- (BOOL)isMultiValued;
- (ICSMultiValueProperty)initWithValue:(id)a3 type:(unint64_t)a4;
- (id)value;
- (id)values;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setValue:(id)a3 type:(unint64_t)a4;
- (void)setValues:(id)a3 valueType:(unint64_t)a4;
@end

@implementation ICSMultiValueProperty

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ICSProperty *)self type];
  if (v7 == 5010 || v7 == 5007)
  {
    v8 = [(ICSProperty *)self parameters];

    if (v8) {
      [(ICSProperty *)self _ICSStringWithOptions:a3 appendingToString:v6 additionalParameters:0];
    }
    uint64_t v9 = [(ICSMultiValueProperty *)self values];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [(ICSMultiValueProperty *)self values];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v13 = [(ICSMultiValueProperty *)self value];
        NSLog(&cfstr_PropertyvalueS.isa, v13);
      }
    }
    [v6 appendString:@":"];
    v14 = [(ICSMultiValueProperty *)self values];
    [v14 _ICSStringsForPropertyValuesWithOptions:a3 appendingToString:v6];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICSMultiValueProperty;
    [(ICSProperty *)&v15 _ICSStringWithOptions:a3 appendingToString:v6];
  }
}

- (ICSMultiValueProperty)initWithValue:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSMultiValueProperty;
  unint64_t v7 = [(ICSMultiValueProperty *)&v10 init];
  v8 = v7;
  if (v7) {
    [(ICSMultiValueProperty *)v7 setValue:v6 type:a4];
  }

  return v8;
}

- (BOOL)isMultiValued
{
  return 1;
}

- (id)value
{
  v2 = [(ICSMultiValueProperty *)self values];
  if ([v2 count])
  {
    v3 = [v2 objectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setValue:(id)a3 type:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(ICSMultiValueProperty *)self setValues:v6 valueType:a4];
}

- (id)values
{
  v4.receiver = self;
  v4.super_class = (Class)ICSMultiValueProperty;
  v2 = [(ICSProperty *)&v4 value];
  return v2;
}

- (void)setValues:(id)a3 valueType:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ICSMultiValueProperty;
  [(ICSProperty *)&v4 setValue:a3 type:a4];
}

@end