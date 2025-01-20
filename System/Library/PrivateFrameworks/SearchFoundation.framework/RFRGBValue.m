@interface RFRGBValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)blue;
- (NSNumber)green;
- (NSNumber)red;
- (RFRGBValue)initWithCoder:(id)a3;
- (RFRGBValue)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBlue:(id)a3;
- (void)setGreen:(id)a3;
- (void)setRed:(id)a3;
@end

@implementation RFRGBValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blue, 0);
  objc_storeStrong((id *)&self->_green, 0);
  objc_storeStrong((id *)&self->_red, 0);
}

- (void)setBlue:(id)a3
{
}

- (NSNumber)blue
{
  return self->_blue;
}

- (void)setGreen:(id)a3
{
}

- (NSNumber)green
{
  return self->_green;
}

- (void)setRed:(id)a3
{
}

- (NSNumber)red
{
  return self->_red;
}

- (unint64_t)hash
{
  v3 = [(RFRGBValue *)self red];
  uint64_t v4 = [v3 hash];
  v5 = [(RFRGBValue *)self green];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFRGBValue *)self blue];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFRGBValue *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFRGBValue *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFRGBValue *)self red];
      unint64_t v8 = [(RFRGBValue *)v6 red];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(RFRGBValue *)self red];
      if (v9)
      {
        v3 = [(RFRGBValue *)self red];
        v10 = [(RFRGBValue *)v6 red];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(RFRGBValue *)self green];
      v13 = [(RFRGBValue *)v6 green];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(RFRGBValue *)self green];
      if (v15)
      {
        v25 = v12;
        v16 = [(RFRGBValue *)self green];
        v28 = [(RFRGBValue *)v6 green];
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      v17 = [(RFRGBValue *)self blue];
      v18 = [(RFRGBValue *)v6 blue];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(RFRGBValue *)self blue];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(RFRGBValue *)self blue];
          v20 = [(RFRGBValue *)v6 blue];
          char v11 = objc_msgSend(v22, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
        v3 = v27;
        if (!v30) {
          goto LABEL_26;
        }
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFRGBValue *)self red];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setRed:v6];

  v7 = [(RFRGBValue *)self green];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setGreen:v8];

  v9 = [(RFRGBValue *)self blue];
  v10 = (void *)[v9 copy];
  [v4 setBlue:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFRGBValue alloc] initWithFacade:self];
  v3 = [(_SFPBRFRGBValue *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFRGBValue alloc] initWithFacade:self];
  v3 = [(_SFPBRFRGBValue *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFRGBValue alloc] initWithFacade:self];
  v5 = [(_SFPBRFRGBValue *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFRGBValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFRGBValue alloc] initWithData:v5];
  v7 = [(RFRGBValue *)self initWithProtobuf:v6];

  return v7;
}

- (RFRGBValue)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RFRGBValue;
  v5 = [(RFRGBValue *)&v17 init];
  if (v5)
  {
    [v4 red];
    if (v6 != 0.0)
    {
      v7 = NSNumber;
      [v4 red];
      unint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
      [(RFRGBValue *)v5 setRed:v8];
    }
    [v4 green];
    if (v9 != 0.0)
    {
      v10 = NSNumber;
      [v4 green];
      char v11 = objc_msgSend(v10, "numberWithFloat:");
      [(RFRGBValue *)v5 setGreen:v11];
    }
    [v4 blue];
    if (v12 != 0.0)
    {
      v13 = NSNumber;
      [v4 blue];
      v14 = objc_msgSend(v13, "numberWithFloat:");
      [(RFRGBValue *)v5 setBlue:v14];
    }
    v15 = v5;
  }

  return v5;
}

@end