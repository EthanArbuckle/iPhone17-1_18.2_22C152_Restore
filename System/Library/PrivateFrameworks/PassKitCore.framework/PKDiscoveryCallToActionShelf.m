@interface PKDiscoveryCallToActionShelf
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)useImageAsTitle;
- (PKDiscoveryCallToAction)callToAction;
- (PKDiscoveryCallToActionShelf)initWithCoder:(id)a3;
- (PKDiscoveryCallToActionShelf)initWithDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)localizeWithBundle:(id)a3 table:(id)a4;
- (void)setItem:(id)a3;
@end

@implementation PKDiscoveryCallToActionShelf

- (PKDiscoveryCallToActionShelf)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryCallToActionShelf;
  v5 = [(PKDiscoveryCallToActionShelf *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(PKDiscoveryShelf *)v5 setType:4];
    v6->_useImageAsTitle = [v4 PKBoolForKey:@"useImageAsTitle"];
    v7 = [v4 PKDictionaryForKey:@"callToAction"];
    if (v7)
    {
      v8 = [[PKDiscoveryCallToAction alloc] initWithDictionary:v7];
      callToAction = v6->_callToAction;
      v6->_callToAction = v8;
    }
  }

  return v6;
}

- (void)setItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryCallToActionShelf;
  id v4 = a3;
  [(PKDiscoveryShelf *)&v5 setItem:v4];
  -[PKDiscoveryCallToAction setItem:](self->_callToAction, "setItem:", v4, v5.receiver, v5.super_class);
}

- (void)localizeWithBundle:(id)a3
{
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDiscoveryCallToActionShelf;
  if ([(PKDiscoveryShelf *)&v10 isEqual:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      callToAction = self->_callToAction;
      v6 = (PKDiscoveryCallToAction *)v4[5];
      if (callToAction) {
        BOOL v7 = v6 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7)
      {
        if (callToAction == v6)
        {
LABEL_12:
          BOOL v8 = self->_useImageAsTitle == *((unsigned __int8 *)v4 + 32);
          goto LABEL_10;
        }
      }
      else if (-[PKDiscoveryCallToAction isEqual:](callToAction, "isEqual:"))
      {
        goto LABEL_12;
      }
    }
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)PKDiscoveryCallToActionShelf;
  id v3 = [(PKDiscoveryShelf *)&v8 hash];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 safelyAddObject:self->_callToAction];
  uint64_t v5 = PKCombinedHash((uint64_t)v3, v4);
  unint64_t v6 = self->_useImageAsTitle - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%ld'; ", @"shelfType", -[PKDiscoveryShelf type](self, "type")];
  [v3 appendFormat:@"%@: '%@'; ", @"callToAction", self->_callToAction];
  if (self->_useImageAsTitle) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"useImageAsTitle", v4];
  [v3 appendFormat:@">"];
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryCallToActionShelf;
  id v4 = a3;
  [(PKDiscoveryShelf *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_callToAction, @"callToAction", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_useImageAsTitle forKey:@"useImageAsTitle"];
}

- (PKDiscoveryCallToActionShelf)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryCallToActionShelf;
  objc_super v5 = [(PKDiscoveryShelf *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callToAction"];
    callToAction = v5->_callToAction;
    v5->_callToAction = (PKDiscoveryCallToAction *)v6;

    v5->_useImageAsTitle = [v4 decodeBoolForKey:@"useImageAsTitle"];
  }

  return v5;
}

- (PKDiscoveryCallToAction)callToAction
{
  return self->_callToAction;
}

- (BOOL)useImageAsTitle
{
  return self->_useImageAsTitle;
}

- (void).cxx_destruct
{
}

@end