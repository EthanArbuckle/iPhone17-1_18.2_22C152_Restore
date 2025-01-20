@interface PKPassTileAccessoryButton
+ (BOOL)supportsSecureCoding;
+ (id)createWithTitle:(id)a3 spinnerEnabled:(BOOL)a4;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isSpinnerEnabled;
- (NSString)title;
- (PKPassTileAccessoryButton)initWithCoder:(id)a3;
- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSpinnerEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPassTileAccessoryButton

+ (id)createWithTitle:(id)a3 spinnerEnabled:(BOOL)a4
{
  id v5 = a3;
  v6 = +[PKPassTileAccessory _createForType:0 resolved:1];
  uint64_t v7 = [v5 copy];

  v8 = (void *)v6[4];
  v6[4] = v7;

  *((unsigned char *)v6 + 24) = a4;
  return v6;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileAccessoryButton;
  if ([(PKPassTileAccessory *)&v9 _setUpWithDictionary:v4]
    && ([v4 PKStringForKey:@"title"],
        id v5 = (NSString *)objc_claimAutoreleasedReturnValue(),
        title = self->_title,
        self->_title = v5,
        title,
        self->_title))
  {
    self->_spinnerEnabled = [v4 PKBoolForKey:@"spinnerEnabled"];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPassTileAccessoryButton;
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKPassTileAccessory *)&v12 createResolvedAccessoryWithBundle:v7 privateBundle:v6];
  uint64_t v9 = PKLocalizedPassStringForPassBundle(self->_title, v7, v6);

  v10 = (void *)v8[4];
  v8[4] = v9;

  *((unsigned char *)v8 + 24) = self->_spinnerEnabled;
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessoryButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileAccessoryButton;
  id v5 = [(PKPassTileAccessory *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_spinnerEnabled = [v4 decodeBoolForKey:@"spinnerEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileAccessoryButton;
  id v4 = a3;
  [(PKPassTileAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_spinnerEnabled forKey:@"spinnerEnabled"];
}

- (unint64_t)hash
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassTileAccessoryButton;
  id v5 = [(PKPassTileAccessory *)&v4 hash];
  NSUInteger v6 = [(NSString *)self->_title hash];
  BOOL spinnerEnabled = self->_spinnerEnabled;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileAccessoryButton;
  if ([(PKPassTileAccessory *)&v14 _isEqual:v4])
  {
    id v5 = (id *)v4;
    title = self->_title;
    id v7 = (NSString *)v5[4];
    v8 = title;
    if (v7 != v8)
    {
      objc_super v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
      }
      else
      {
        BOOL v12 = [(NSString *)v7 isEqualToString:v8];

        if (v12) {
          goto LABEL_12;
        }
      }
      BOOL v11 = 0;
      goto LABEL_14;
    }

LABEL_12:
    BOOL v11 = *((unsigned __int8 *)v5 + 24) == self->_spinnerEnabled;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isSpinnerEnabled
{
  return self->_spinnerEnabled;
}

- (void)setSpinnerEnabled:(BOOL)a3
{
  self->_BOOL spinnerEnabled = a3;
}

- (void).cxx_destruct
{
}

@end