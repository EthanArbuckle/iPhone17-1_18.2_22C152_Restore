@interface ICSColor
+ (BOOL)colorDetailsAreEffectivelyDifferentFirstColor:(id)a3 secondColor:(id)a4 firstSymbolicName:(id)a5 secondSymbolicName:(id)a6;
+ (BOOL)supportsSecureCoding;
+ (id)symbolicColorForLegacyRGB:(id)a3;
- (ICSColor)initWithCoder:(id)a3;
- (ICSColor)initWithRed:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5;
- (unsigned)blue;
- (unsigned)green;
- (unsigned)red;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICSColor

- (ICSColor)initWithRed:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ICSColor;
  result = [(ICSColor *)&v9 init];
  if (result)
  {
    result->_red = a3;
    result->_green = a4;
    result->_blue = a5;
  }
  return result;
}

- (unsigned)red
{
  return self->_red;
}

- (unsigned)green
{
  return self->_green;
}

- (unsigned)blue
{
  return self->_blue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t red = self->_red;
  id v5 = a3;
  [v5 encodeInt:red forKey:@"Red"];
  [v5 encodeInt:self->_green forKey:@"Green"];
  [v5 encodeInt:self->_blue forKey:@"Blue"];
}

- (ICSColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSColor;
  id v5 = [(ICSColor *)&v7 init];
  if (v5)
  {
    v5->_uint64_t red = [v4 decodeIntForKey:@"Red"];
    v5->_green = [v4 decodeIntForKey:@"Green"];
    v5->_blue = [v4 decodeIntForKey:@"Blue"];
  }

  return v5;
}

+ (id)symbolicColorForLegacyRGB:(id)a3
{
  return (id)symbolicColorForLegacyRGB((CFStringRef)a3);
}

+ (BOOL)colorDetailsAreEffectivelyDifferentFirstColor:(id)a3 secondColor:(id)a4 firstSymbolicName:(id)a5 secondSymbolicName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v11)
  {
    int v14 = [v11 isEqualToString:@"custom"] ^ 1;
    if (v13)
    {
LABEL_3:
      int v15 = [v13 isEqualToString:@"custom"] ^ 1;
      goto LABEL_6;
    }
  }
  else
  {
    int v14 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }
  int v15 = 0;
LABEL_6:
  if ((v14 | v15))
  {
    if (v11 != v13)
    {
      LOBYTE(v16) = 1;
      if (v11 && v13)
      {
        v17 = v11;
        id v18 = v13;
LABEL_15:
        int v16 = [v17 isEqualToString:v18] ^ 1;
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_16:
    LOBYTE(v16) = 0;
    goto LABEL_17;
  }
  if (v9 == v10) {
    goto LABEL_16;
  }
  LOBYTE(v16) = 1;
  if (v9 && v10)
  {
    v17 = v9;
    id v18 = v10;
    goto LABEL_15;
  }
LABEL_17:

  return v16;
}

@end