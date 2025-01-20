@interface SFImageCopyItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFImage)image;
- (SFImageCopyItem)initWithCoder:(id)a3;
- (SFImageCopyItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation SFImageCopyItem

- (void).cxx_destruct
{
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFImageCopyItem;
  unint64_t v3 = [(SFCopyItem *)&v7 hash];
  v4 = [(SFImageCopyItem *)self image];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFImageCopyItem *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFImageCopyItem *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFImageCopyItem,
             [(SFCopyItem *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFImageCopyItem *)self image];
    objc_super v7 = [(SFImageCopyItem *)v5 image];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFImageCopyItem *)self image];
      if (v8)
      {
        v9 = [(SFImageCopyItem *)self image];
        v10 = [(SFImageCopyItem *)v5 image];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFImageCopyItem;
  id v4 = [(SFCopyItem *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFImageCopyItem *)self image];
  v6 = (void *)[v5 copy];
  [v4 setImage:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBImageCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBImageCopyItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBImageCopyItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBImageCopyItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImageCopyItem alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBImageCopyItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFImageCopyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImageCopyItem alloc] initWithData:v5];
  objc_super v7 = [(SFImageCopyItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFImageCopyItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFImageCopyItem;
  unint64_t v5 = [(SFImageCopyItem *)&v12 init];
  if (v5)
  {
    v6 = [v4 image];

    if (v6)
    {
      objc_super v7 = [SFImage alloc];
      objc_super v8 = [v4 image];
      v9 = [(SFImage *)v7 initWithProtobuf:v8];
      [(SFImageCopyItem *)v5 setImage:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end