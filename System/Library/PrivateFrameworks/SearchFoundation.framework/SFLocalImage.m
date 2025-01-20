@interface SFLocalImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLocalImageType;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFLocalImage)initWithCoder:(id)a3;
- (SFLocalImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)localImageType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalImageType:(int)a3;
@end

@implementation SFLocalImage

- (int)localImageType
{
  return self->_localImageType;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SFLocalImage;
  unint64_t v3 = [(SFImage *)&v5 hash];
  return v3 ^ [(SFLocalImage *)self localImageType];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFLocalImage *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFLocalImage *)v4 isMemberOfClass:objc_opt_class()] {
         && (v10.receiver = self,
  }
             v10.super_class = (Class)SFLocalImage,
             [(SFImage *)&v10 isEqual:v4]))
  {
    objc_super v5 = v4;
    int v6 = [(SFLocalImage *)self localImageType];
    int v7 = [(SFLocalImage *)v5 localImageType];

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
  v6.receiver = self;
  v6.super_class = (Class)SFLocalImage;
  id v4 = [(SFImage *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setLocalImageType:", -[SFLocalImage localImageType](self, "localImageType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBLocalImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLocalImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBLocalImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLocalImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v6 = [[_SFPBImage alloc] initWithFacade:self];
  objc_super v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFLocalImage)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFLocalImage;
  int v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasLocalImageType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocalImageType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_localImageType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFLocalImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFLocalImage;
  objc_super v5 = [(SFLocalImage *)&v8 init];
  if (v5)
  {
    if ([v4 localImageType]) {
      -[SFLocalImage setLocalImageType:](v5, "setLocalImageType:", [v4 localImageType]);
    }
    objc_super v6 = v5;
  }

  return v5;
}

@end