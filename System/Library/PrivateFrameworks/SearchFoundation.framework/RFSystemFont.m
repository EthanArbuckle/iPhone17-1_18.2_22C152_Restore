@interface RFSystemFont
+ (BOOL)supportsSecureCoding;
- (BOOL)hasWeight;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)size;
- (RFSystemFont)initWithCoder:(id)a3;
- (RFSystemFont)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)weight;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSize:(id)a3;
- (void)setWeight:(int)a3;
@end

@implementation RFSystemFont

- (RFSystemFont)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RFSystemFont;
  v5 = [(RFSystemFont *)&v11 init];
  if (v5)
  {
    [v4 size];
    if (v6 != 0.0)
    {
      v7 = NSNumber;
      [v4 size];
      v8 = objc_msgSend(v7, "numberWithFloat:");
      [(RFSystemFont *)v5 setSize:v8];
    }
    if ([v4 weight]) {
      -[RFSystemFont setWeight:](v5, "setWeight:", [v4 weight]);
    }
    v9 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (int)weight
{
  return self->_weight;
}

- (void)setSize:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (unint64_t)hash
{
  v3 = [(RFSystemFont *)self size];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(RFSystemFont *)self weight];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  float v6 = (RFSystemFont *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFSystemFont *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(RFSystemFont *)self size];
      v9 = [(RFSystemFont *)v7 size];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(RFSystemFont *)self size];
      if (!v10
        || ([(RFSystemFont *)self size],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(RFSystemFont *)v7 size],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int v12 = [(RFSystemFont *)self weight];
        BOOL v11 = v12 == [(RFSystemFont *)v7 weight];
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_12;
    }
    BOOL v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = [(RFSystemFont *)self size];
  float v6 = (void *)[v5 copy];
  [v4 setSize:v6];

  objc_msgSend(v4, "setWeight:", -[RFSystemFont weight](self, "weight"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFFont_RFSystemFont alloc] initWithFacade:self];
  v3 = [(_SFPBRFFont_RFSystemFont *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFFont_RFSystemFont alloc] initWithFacade:self];
  v3 = [(_SFPBRFFont_RFSystemFont *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  float v6 = [[_SFPBRFFont_RFSystemFont alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBRFFont_RFSystemFont *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFSystemFont)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  float v6 = [[_SFPBRFFont_RFSystemFont alloc] initWithData:v5];
  v7 = [(RFSystemFont *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasWeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWeight:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_weight = a3;
}

@end