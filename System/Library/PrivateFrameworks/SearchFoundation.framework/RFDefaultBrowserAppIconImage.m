@interface RFDefaultBrowserAppIconImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage_style;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFDefaultBrowserAppIconImage)initWithCoder:(id)a3;
- (RFDefaultBrowserAppIconImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)image_style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage_style:(int)a3;
@end

@implementation RFDefaultBrowserAppIconImage

- (RFDefaultBrowserAppIconImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RFDefaultBrowserAppIconImage;
  v5 = [(RFDefaultBrowserAppIconImage *)&v8 init];
  if (v5)
  {
    if (objc_msgSend(v4, "image_style")) {
      -[RFDefaultBrowserAppIconImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    }
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)image_style
{
  return self->_image_style;
}

- (unint64_t)hash
{
  return [(RFDefaultBrowserAppIconImage *)self image_style];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RFDefaultBrowserAppIconImage *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(RFDefaultBrowserAppIconImage *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int v6 = [(RFDefaultBrowserAppIconImage *)self image_style];
    int v7 = [(RFDefaultBrowserAppIconImage *)v5 image_style];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setImage_style:", -[RFDefaultBrowserAppIconImage image_style](self, "image_style"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFDefaultBrowserAppIconImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFDefaultBrowserAppIconImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFDefaultBrowserAppIconImage alloc] initWithFacade:self];
  v3 = [(_SFPBRFDefaultBrowserAppIconImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBRFDefaultBrowserAppIconImage alloc] initWithFacade:self];
  v5 = [(_SFPBRFDefaultBrowserAppIconImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFDefaultBrowserAppIconImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBRFDefaultBrowserAppIconImage alloc] initWithData:v5];
  int v7 = [(RFDefaultBrowserAppIconImage *)self initWithProtobuf:v6];

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