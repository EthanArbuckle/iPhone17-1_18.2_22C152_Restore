@interface RFMonogramImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage_style;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)letters;
- (RFMonogramImage)initWithCoder:(id)a3;
- (RFMonogramImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)image_style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage_style:(int)a3;
- (void)setLetters:(id)a3;
@end

@implementation RFMonogramImage

- (RFMonogramImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFMonogramImage;
  v5 = [(RFMonogramImage *)&v10 init];
  if (v5)
  {
    v6 = [v4 letters];

    if (v6)
    {
      v7 = [v4 letters];
      [(RFMonogramImage *)v5 setLetters:v7];
    }
    if (objc_msgSend(v4, "image_style")) {
      -[RFMonogramImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v8 = v5;
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

- (int)image_style
{
  return self->_image_style;
}

- (void)setLetters:(id)a3
{
}

- (NSString)letters
{
  return self->_letters;
}

- (unint64_t)hash
{
  v3 = [(RFMonogramImage *)self letters];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(RFMonogramImage *)self image_style];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (RFMonogramImage *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFMonogramImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(RFMonogramImage *)self letters];
      v9 = [(RFMonogramImage *)v7 letters];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      objc_super v10 = [(RFMonogramImage *)self letters];
      if (!v10
        || ([(RFMonogramImage *)self letters],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(RFMonogramImage *)v7 letters],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int v12 = [(RFMonogramImage *)self image_style];
        BOOL v11 = v12 == [(RFMonogramImage *)v7 image_style];
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
  unint64_t v5 = [(RFMonogramImage *)self letters];
  v6 = (void *)[v5 copy];
  [v4 setLetters:v6];

  objc_msgSend(v4, "setImage_style:", -[RFMonogramImage image_style](self, "image_style"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFMonogramImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFMonogramImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFMonogramImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFMonogramImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFMonogramImage alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBRFMonogramImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFMonogramImage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFMonogramImage alloc] initWithData:v5];
  v7 = [(RFMonogramImage *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasImage_style
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setImage_style:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_image_style = a3;
}

@end