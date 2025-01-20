@interface SBHIconImageIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)iconIdentifier;
- (SBHIconImageAppearance)imageAppearance;
- (SBHIconImageIdentity)initWithCoder:(id)a3;
- (SBHIconImageIdentity)initWithIcon:(id)a3 imageGeneration:(unint64_t)a4 imageAppearance:(id)a5;
- (SBHIconImageIdentity)initWithIconIdentifier:(id)a3 imageGeneration:(unint64_t)a4 imageAppearance:(id)a5;
- (unint64_t)hash;
- (unint64_t)imageGeneration;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBHIconImageIdentity

- (SBHIconImageIdentity)initWithIcon:(id)a3 imageGeneration:(unint64_t)a4 imageAppearance:(id)a5
{
  id v8 = a5;
  v9 = [a3 iconImageCacheIdentifier];
  v10 = [(SBHIconImageIdentity *)self initWithIconIdentifier:v9 imageGeneration:a4 imageAppearance:v8];

  return v10;
}

- (SBHIconImageIdentity)initWithIconIdentifier:(id)a3 imageGeneration:(unint64_t)a4 imageAppearance:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBHIconImageIdentity;
  v10 = [(SBHIconImageIdentity *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    iconIdentifier = v10->_iconIdentifier;
    v10->_iconIdentifier = (NSString *)v11;

    v10->_imageGeneration = a4;
    uint64_t v13 = [v9 copy];
    imageAppearance = v10->_imageAppearance;
    v10->_imageAppearance = (SBHIconImageAppearance *)v13;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconImageIdentity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      if (BSEqualObjects() && self->_imageGeneration == v7->_imageGeneration) {
        char v8 = BSEqualObjects();
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_iconIdentifier hash];
  imageAppearance = self->_imageAppearance;
  unint64_t v5 = self->_imageGeneration + v3;
  return v5 + [(SBHIconImageAppearance *)imageAppearance hash];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  [(SBHIconImageIdentity *)self appendDescriptionToFormatter:v3];
  v4 = [v3 description];

  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  iconIdentifier = self->_iconIdentifier;
  id v5 = a3;
  [v5 encodeObject:iconIdentifier forKey:@"iconIdentifier"];
  [v5 encodeInteger:self->_imageGeneration forKey:@"imageGeneration"];
  [v5 encodeObject:self->_imageAppearance forKey:@"imageAppearance"];
}

- (SBHIconImageIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"iconIdentifier"];

  v7 = self;
  char v8 = [v4 decodeObjectOfClass:v7 forKey:@"imageAppearance"];

  uint64_t v9 = [v4 decodeIntegerForKey:@"imageGeneration"];
  v10 = [(SBHIconImageIdentity *)self initWithIconIdentifier:v6 imageGeneration:v9 imageAppearance:v8];

  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(SBHIconImageIdentity *)self iconIdentifier];
  [v8 appendString:v4 withName:@"iconIdentifier" skipIfEmpty:0];

  id v5 = (id)objc_msgSend(v8, "appendUnsignedInteger:withName:", -[SBHIconImageIdentity imageGeneration](self, "imageGeneration"), @"imageGeneration");
  v6 = [(SBHIconImageIdentity *)self imageAppearance];
  id v7 = (id)[v8 appendObject:v6 withName:@"imageAppearance"];
}

- (NSString)iconIdentifier
{
  return self->_iconIdentifier;
}

- (unint64_t)imageGeneration
{
  return self->_imageGeneration;
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_iconIdentifier, 0);
}

@end