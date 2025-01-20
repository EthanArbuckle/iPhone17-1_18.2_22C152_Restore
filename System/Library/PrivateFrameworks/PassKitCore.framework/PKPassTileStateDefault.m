@interface PKPassTileStateDefault
+ (BOOL)supportsSecureCoding;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqualToUnresolvedState:(id)a3;
- (NSString)body;
- (NSString)title;
- (PKPassTileAccessory)accessory;
- (PKPassTileAccessory)secondaryAccessory;
- (PKPassTileStateDefault)initWithCoder:(id)a3;
- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setBody:(id)a3;
- (void)setSecondaryAccessory:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPassTileStateDefault

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileStateDefault;
  if (![(PKPassTileState *)&v17 _setUpWithDictionary:v4]) {
    goto LABEL_8;
  }
  v5 = [v4 PKStringForKey:@"title"];
  title = self->_title;
  self->_title = v5;

  v7 = [v4 PKStringForKey:@"body"];
  body = self->_body;
  self->_body = v7;

  if (self->_body)
  {
    v9 = [v4 PKDictionaryForKey:@"accessory"];
    if (v9
      && (v10 = +[PKPassTileAccessory _createForDictionary:v9], accessory = self->_accessory, self->_accessory = v10, accessory, !self->_accessory))
    {
      BOOL v15 = 0;
    }
    else
    {
      v12 = [v4 PKDictionaryForKey:@"secondaryAccessory"];
      BOOL v15 = 1;
      if (v12)
      {
        v13 = +[PKPassTileAccessory _createForDictionary:v12];
        secondaryAccessory = self->_secondaryAccessory;
        self->_secondaryAccessory = v13;

        if (!self->_secondaryAccessory) {
          BOOL v15 = 0;
        }
      }
    }
  }
  else
  {
LABEL_8:
    BOOL v15 = 0;
  }

  return v15;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)PKPassTileStateDefault;
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKPassTileState *)&v18 createResolvedStateWithBundle:v7 privateBundle:v6];
  uint64_t v9 = PKLocalizedPassStringForPassBundle(self->_title, v7, v6);
  v10 = (void *)v8[8];
  v8[8] = v9;

  uint64_t v11 = PKLocalizedPassStringForPassBundle(self->_body, v7, v6);
  v12 = (void *)v8[9];
  v8[9] = v11;

  id v13 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_accessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6, v18.receiver, v18.super_class);
  v14 = (void *)v8[10];
  v8[10] = v13;

  id v15 = [(PKPassTileAccessory *)self->_secondaryAccessory createResolvedAccessoryWithBundle:v7 privateBundle:v6];
  v16 = (void *)v8[11];
  v8[11] = v15;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateDefault)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassTileStateDefault;
  v5 = [(PKPassTileState *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    accessory = v5->_accessory;
    v5->_accessory = (PKPassTileAccessory *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryAccessory"];
    secondaryAccessory = v5->_secondaryAccessory;
    v5->_secondaryAccessory = (PKPassTileAccessory *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateDefault;
  id v4 = a3;
  [(PKPassTileState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_body forKey:@"body"];
  [v4 encodeObject:self->_accessory forKey:@"accessory"];
  [v4 encodeObject:self->_secondaryAccessory forKey:@"secondaryAccessory"];
}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPassTileStateDefault;
  if ([(PKPassTileState *)&v22 isEqualToUnresolvedState:v4])
  {
    objc_super v5 = (id *)v4;
    title = self->_title;
    id v7 = (NSString *)v5[8];
    uint64_t v8 = title;
    if (v7 == v8)
    {
    }
    else
    {
      uint64_t v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        goto LABEL_17;
      }
      BOOL v11 = [(NSString *)v7 isEqualToString:v8];

      if (!v11) {
        goto LABEL_18;
      }
    }
    body = self->_body;
    id v7 = (NSString *)v5[9];
    v14 = body;
    if (v7 == v14)
    {

LABEL_23:
      id v18 = v5[10];
      accessory = self->_accessory;
      if (v18)
      {
        if (!accessory || (objc_msgSend(v18, "isEqualToUnresolvedAccessory:") & 1) == 0) {
          goto LABEL_18;
        }
LABEL_28:
        v20 = (PKPassTileAccessory *)v5[11];
        secondaryAccessory = self->_secondaryAccessory;
        if (v20 && secondaryAccessory) {
          BOOL v12 = -[PKPassTileAccessory isEqualToUnresolvedAccessory:](v20, "isEqualToUnresolvedAccessory:");
        }
        else {
          BOOL v12 = v20 == secondaryAccessory;
        }
        goto LABEL_19;
      }
      if (!accessory) {
        goto LABEL_28;
      }
LABEL_18:
      BOOL v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v9 = v14;
    if (v7) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      BOOL v17 = [(NSString *)v7 isEqualToString:v14];

      if (!v17) {
        goto LABEL_18;
      }
      goto LABEL_23;
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_20:

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (PKPassTileAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (PKPassTileAccessory)secondaryAccessory
{
  return self->_secondaryAccessory;
}

- (void)setSecondaryAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAccessory, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end