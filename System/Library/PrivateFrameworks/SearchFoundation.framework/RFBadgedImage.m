@interface RFBadgedImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFBadgedImage)initWithCoder:(id)a3;
- (RFBadgedImage)initWithProtobuf:(id)a3;
- (RFImageSource)badge;
- (RFImageSource)image;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBadge:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation RFBadgedImage

- (RFBadgedImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFBadgedImage;
  v5 = [(RFBadgedImage *)&v16 init];
  if (v5)
  {
    v6 = [v4 image];

    if (v6)
    {
      v7 = [RFImageSource alloc];
      v8 = [v4 image];
      v9 = [(RFImageSource *)v7 initWithProtobuf:v8];
      [(RFBadgedImage *)v5 setImage:v9];
    }
    v10 = [v4 badge];

    if (v10)
    {
      v11 = [RFImageSource alloc];
      v12 = [v4 badge];
      v13 = [(RFImageSource *)v11 initWithProtobuf:v12];
      [(RFBadgedImage *)v5 setBadge:v13];
    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setBadge:(id)a3
{
}

- (RFImageSource)badge
{
  return self->_badge;
}

- (void)setImage:(id)a3
{
}

- (RFImageSource)image
{
  return self->_image;
}

- (unint64_t)hash
{
  v3 = [(RFBadgedImage *)self image];
  uint64_t v4 = [v3 hash];
  v5 = [(RFBadgedImage *)self badge];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFBadgedImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFBadgedImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(RFBadgedImage *)self image];
      v8 = [(RFBadgedImage *)v6 image];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(RFBadgedImage *)self image];
      if (v9)
      {
        v3 = [(RFBadgedImage *)self image];
        v10 = [(RFBadgedImage *)v6 image];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(RFBadgedImage *)self badge];
      v13 = [(RFBadgedImage *)v6 badge];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(RFBadgedImage *)self badge];
        if (v15)
        {
          objc_super v16 = (void *)v15;
          v19 = [(RFBadgedImage *)self badge];
          [(RFBadgedImage *)v6 badge];
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
  v5 = [(RFBadgedImage *)self image];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setImage:v6];

  v7 = [(RFBadgedImage *)self badge];
  v8 = (void *)[v7 copy];
  [v4 setBadge:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFBadgedImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFBadgedImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFBadgedImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFBadgedImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBRFBadgedImage alloc] initWithFacade:self];
  v5 = [(_SFPBRFBadgedImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFBadgedImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBRFBadgedImage alloc] initWithData:v5];
  v7 = [(RFBadgedImage *)self initWithProtobuf:v6];

  return v7;
}

@end