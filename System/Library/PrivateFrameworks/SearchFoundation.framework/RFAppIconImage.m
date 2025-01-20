@interface RFAppIconImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage_style;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)application_bundle_identifier;
- (RFAppIconImage)initWithCoder:(id)a3;
- (RFAppIconImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)image_style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication_bundle_identifier:(id)a3;
- (void)setImage_style:(int)a3;
@end

@implementation RFAppIconImage

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

- (void)setApplication_bundle_identifier:(id)a3
{
}

- (NSString)application_bundle_identifier
{
  return self->_application_bundle_identifier;
}

- (unint64_t)hash
{
  v3 = [(RFAppIconImage *)self application_bundle_identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(RFAppIconImage *)self image_style];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (RFAppIconImage *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(RFAppIconImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(RFAppIconImage *)self application_bundle_identifier];
      v9 = [(RFAppIconImage *)v7 application_bundle_identifier];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(RFAppIconImage *)self application_bundle_identifier];
      if (!v10
        || ([(RFAppIconImage *)self application_bundle_identifier],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(RFAppIconImage *)v7 application_bundle_identifier],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int v12 = [(RFAppIconImage *)self image_style];
        BOOL v11 = v12 == [(RFAppIconImage *)v7 image_style];
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
  unint64_t v5 = [(RFAppIconImage *)self application_bundle_identifier];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setApplication_bundle_identifier:", v6);

  objc_msgSend(v4, "setImage_style:", -[RFAppIconImage image_style](self, "image_style"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFAppIconImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFAppIconImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFAppIconImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFAppIconImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFAppIconImage alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBRFAppIconImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFAppIconImage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFAppIconImage alloc] initWithData:v5];
  v7 = [(RFAppIconImage *)self initWithProtobuf:v6];

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

- (RFAppIconImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RFAppIconImage;
  unint64_t v5 = [(RFAppIconImage *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "application_bundle_identifier");

    if (v6)
    {
      v7 = objc_msgSend(v4, "application_bundle_identifier");
      [(RFAppIconImage *)v5 setApplication_bundle_identifier:v7];
    }
    if (objc_msgSend(v4, "image_style")) {
      -[RFAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v8 = v5;
  }

  return v5;
}

@end