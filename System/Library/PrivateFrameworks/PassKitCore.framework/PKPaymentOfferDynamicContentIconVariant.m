@interface PKPaymentOfferDynamicContentIconVariant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSURL)url2x;
- (NSURL)url3x;
- (PKPaymentOfferDynamicContentIconVariant)initWithCoder:(id)a3;
- (PKPaymentOfferDynamicContentIconVariant)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)urlForScreenScale:(double)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl2x:(id)a3;
- (void)setUrl3x:(id)a3;
@end

@implementation PKPaymentOfferDynamicContentIconVariant

- (PKPaymentOfferDynamicContentIconVariant)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 PKURLForKey:@"url2x"];
  uint64_t v6 = [v4 PKURLForKey:@"url3x"];

  if (v5 | v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentOfferDynamicContentIconVariant;
    v7 = [(PKPaymentOfferDynamicContentIconVariant *)&v11 init];
    p_isa = (id *)&v7->super.isa;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_url2x, (id)v5);
      objc_storeStrong(p_isa + 2, (id)v6);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSURL *)self->_url2x absoluteString];
  [v3 setObject:v4 forKeyedSubscript:@"url2x"];

  uint64_t v5 = [(NSURL *)self->_url3x absoluteString];
  [v3 setObject:v5 forKeyedSubscript:@"url3x"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

- (id)urlForScreenScale:(double)a3
{
  if (a3 >= 3.0) {
    uint64_t v5 = self->_url3x;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a3 >= 2.0 && v5 == 0) {
    uint64_t v5 = self->_url2x;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferDynamicContentIconVariant *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        url2x = self->_url2x;
        v8 = v6->_url2x;
        if (url2x && v8)
        {
          if (-[NSURL isEqual:](url2x, "isEqual:"))
          {
LABEL_7:
            url3x = self->_url3x;
            v10 = v6->_url3x;
            if (url3x && v10) {
              char v11 = -[NSURL isEqual:](url3x, "isEqual:");
            }
            else {
              char v11 = url3x == v10;
            }
            goto LABEL_15;
          }
        }
        else if (url2x == v8)
        {
          goto LABEL_7;
        }
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_url2x];
  [v3 safelyAddObject:self->_url3x];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"url2x: '%@'; ", self->_url2x];
  [v3 appendFormat:@"url3x: '%@'; ", self->_url3x];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentIconVariant)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferDynamicContentIconVariant;
  uint64_t v5 = [(PKPaymentOfferDynamicContentIconVariant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url2x"];
    url2x = v5->_url2x;
    v5->_url2x = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url3x"];
    url3x = v5->_url3x;
    v5->_url3x = (NSURL *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  url2x = self->_url2x;
  id v5 = a3;
  [v5 encodeObject:url2x forKey:@"url2x"];
  [v5 encodeObject:self->_url3x forKey:@"url3x"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContentIconVariant allocWithZone:](PKPaymentOfferDynamicContentIconVariant, "allocWithZone:") init];
  uint64_t v6 = [(NSURL *)self->_url2x copyWithZone:a3];
  url2x = v5->_url2x;
  v5->_url2x = (NSURL *)v6;

  uint64_t v8 = [(NSURL *)self->_url3x copyWithZone:a3];
  url3x = v5->_url3x;
  v5->_url3x = (NSURL *)v8;

  return v5;
}

- (NSURL)url2x
{
  return self->_url2x;
}

- (void)setUrl2x:(id)a3
{
}

- (NSURL)url3x
{
  return self->_url3x;
}

- (void)setUrl3x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url3x, 0);
  objc_storeStrong((id *)&self->_url2x, 0);
}

@end