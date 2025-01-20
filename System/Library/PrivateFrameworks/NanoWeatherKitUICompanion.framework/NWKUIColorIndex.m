@interface NWKUIColorIndex
+ (id)colorForValue:(double)a3;
+ (id)indexForValue:(double)a3;
+ (id)indexWithValue:(double)a3 color:(id)a4;
+ (id)zeroIndex;
- (BOOL)isEqual:(id)a3;
- (NWKUIColorIndex)initWithValue:(double)a3 color:(id)a4;
- (UIColor)color;
- (double)value;
@end

@implementation NWKUIColorIndex

+ (id)colorForValue:(double)a3
{
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26E24A668])
  {
    v4 = [(id)objc_opt_class() allIndices];
    v5 = NWMColorForValueInIndices(v4, a3);
  }
  else
  {
    v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  return v5;
}

+ (id)indexForValue:(double)a3
{
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26E24A668])
  {
    v4 = [(id)objc_opt_class() allIndices];
    v5 = NWMColorIndexForValueInIndices(v4, a3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)zeroIndex
{
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26E24A668])
  {
    v3 = [a1 allIndices];
    [v3 firstObject];
  }
  else
  {
    v3 = [MEMORY[0x263F825C8] whiteColor];
    [a1 indexWithValue:v3 color:0.0];
  v4 = };

  return v4;
}

+ (id)indexWithValue:(double)a3 color:(id)a4
{
  id v5 = a4;
  v6 = [[NWKUIColorIndex alloc] initWithValue:v5 color:a3];

  return v6;
}

- (NWKUIColorIndex)initWithValue:(double)a3 color:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NWKUIColorIndex;
  v8 = [(NWKUIColorIndex *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    objc_storeStrong((id *)&v8->_color, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NWKUIColorIndex *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(NWKUIColorIndex *)self value];
      double v7 = v6;
      [(NWKUIColorIndex *)v5 value];
      if (v7 == v8)
      {
        v9 = [(NWKUIColorIndex *)self color];
        v10 = [(NWKUIColorIndex *)v5 color];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (double)value
{
  return self->_value;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end