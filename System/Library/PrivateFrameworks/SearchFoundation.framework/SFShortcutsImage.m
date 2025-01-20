@interface SFShortcutsImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)lnPropertyIdentifier;
- (SFShortcutsImage)initWithCoder:(id)a3;
- (SFShortcutsImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLnPropertyIdentifier:(id)a3;
@end

@implementation SFShortcutsImage

- (void).cxx_destruct
{
}

- (void)setLnPropertyIdentifier:(id)a3
{
}

- (NSString)lnPropertyIdentifier
{
  return self->_lnPropertyIdentifier;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFShortcutsImage;
  unint64_t v3 = [(SFImage *)&v7 hash];
  v4 = [(SFShortcutsImage *)self lnPropertyIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFShortcutsImage *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFShortcutsImage *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFShortcutsImage,
             [(SFImage *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFShortcutsImage *)self lnPropertyIdentifier];
    objc_super v7 = [(SFShortcutsImage *)v5 lnPropertyIdentifier];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFShortcutsImage *)self lnPropertyIdentifier];
      if (v8)
      {
        v9 = [(SFShortcutsImage *)self lnPropertyIdentifier];
        v10 = [(SFShortcutsImage *)v5 lnPropertyIdentifier];
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
  v8.super_class = (Class)SFShortcutsImage;
  id v4 = [(SFImage *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFShortcutsImage *)self lnPropertyIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setLnPropertyIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBShortcutsImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShortcutsImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBShortcutsImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBShortcutsImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImage alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFShortcutsImage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFShortcutsImage;
  objc_super v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShortcutsImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFShortcutsImage;
  unint64_t v5 = [(SFShortcutsImage *)&v10 init];
  if (v5)
  {
    v6 = [v4 lnPropertyIdentifier];

    if (v6)
    {
      objc_super v7 = [v4 lnPropertyIdentifier];
      [(SFShortcutsImage *)v5 setLnPropertyIdentifier:v7];
    }
    objc_super v8 = v5;
  }

  return v5;
}

@end