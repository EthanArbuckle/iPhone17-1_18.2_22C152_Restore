@interface RFAspectRatio
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)height;
- (NSNumber)width;
- (RFAspectRatio)initWithCoder:(id)a3;
- (RFAspectRatio)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHeight:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation RFAspectRatio

- (RFAspectRatio)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RFAspectRatio;
  v5 = [(RFAspectRatio *)&v14 init];
  if (v5)
  {
    [v4 width];
    if (v6 != 0.0)
    {
      v7 = NSNumber;
      [v4 width];
      v8 = objc_msgSend(v7, "numberWithFloat:");
      [(RFAspectRatio *)v5 setWidth:v8];
    }
    [v4 height];
    if (v9 != 0.0)
    {
      v10 = NSNumber;
      [v4 height];
      v11 = objc_msgSend(v10, "numberWithFloat:");
      [(RFAspectRatio *)v5 setHeight:v11];
    }
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

- (void)setHeight:(id)a3
{
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setWidth:(id)a3
{
}

- (NSNumber)width
{
  return self->_width;
}

- (unint64_t)hash
{
  v3 = [(RFAspectRatio *)self width];
  uint64_t v4 = [v3 hash];
  v5 = [(RFAspectRatio *)self height];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFAspectRatio *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFAspectRatio *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(RFAspectRatio *)self width];
      v8 = [(RFAspectRatio *)v6 width];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      float v9 = [(RFAspectRatio *)self width];
      if (v9)
      {
        v3 = [(RFAspectRatio *)self width];
        v10 = [(RFAspectRatio *)v6 width];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(RFAspectRatio *)self height];
      v13 = [(RFAspectRatio *)v6 height];
      objc_super v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(RFAspectRatio *)self height];
        if (v15)
        {
          v16 = (void *)v15;
          v19 = [(RFAspectRatio *)self height];
          [(RFAspectRatio *)v6 height];
          v17 = v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFAspectRatio *)self width];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setWidth:v6];

  v7 = [(RFAspectRatio *)self height];
  v8 = (void *)[v7 copy];
  [v4 setHeight:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFAspectRatio alloc] initWithFacade:self];
  v3 = [(_SFPBRFAspectRatio *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFAspectRatio alloc] initWithFacade:self];
  v3 = [(_SFPBRFAspectRatio *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBRFAspectRatio alloc] initWithFacade:self];
  v5 = [(_SFPBRFAspectRatio *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFAspectRatio)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBRFAspectRatio alloc] initWithData:v5];
  v7 = [(RFAspectRatio *)self initWithProtobuf:v6];

  return v7;
}

@end