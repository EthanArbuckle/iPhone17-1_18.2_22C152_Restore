@interface PKPassTileStateDefaultV2
+ (BOOL)supportsSecureCoding;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEqualToUnresolvedState:(id)a3;
- (PKPassTileAccessory)accessory;
- (PKPassTileAccessory)secondaryAccessory;
- (PKPassTileImage)bodyImage;
- (PKPassTileStateDefaultV2)initWithCoder:(id)a3;
- (PKPassTileValue)body;
- (PKPassTileValue)footer;
- (PKPassTileValue)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4;
- (int64_t)preferredStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setBody:(id)a3;
- (void)setBodyImage:(id)a3;
- (void)setFooter:(id)a3;
- (void)setPreferredStyle:(int64_t)a3;
- (void)setSecondaryAccessory:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPassTileStateDefaultV2

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPassTileStateDefaultV2;
  if ([(PKPassTileState *)&v26 _setUpWithDictionary:v4])
  {
    v5 = [v4 PKDictionaryForKey:@"title"];
    v6 = +[PKPassTileValue _createForDictionary:v5];
    title = self->_title;
    self->_title = v6;

    v8 = [v4 PKDictionaryForKey:@"body"];
    v9 = +[PKPassTileValue _createForDictionary:v8];
    body = self->_body;
    self->_body = v9;

    v11 = [v4 PKDictionaryForKey:@"bodyImage"];
    v12 = +[PKPassTileImage _createForDictionary:v11];
    bodyImage = self->_bodyImage;
    self->_bodyImage = v12;

    if (self->_body || self->_bodyImage)
    {
      v14 = [v4 PKDictionaryForKey:@"footer"];
      v15 = +[PKPassTileValue _createForDictionary:v14];
      footer = self->_footer;
      self->_footer = v15;

      v17 = [v4 PKDictionaryForKey:@"accessory"];
      if (v17
        && (v18 = +[PKPassTileAccessory _createForDictionary:v17], accessory = self->_accessory, self->_accessory = v18, accessory, !self->_accessory))
      {
        BOOL v24 = 0;
      }
      else
      {
        v20 = [v4 PKDictionaryForKey:@"secondaryAccessory"];
        if (v20
          && (v21 = +[PKPassTileAccessory _createForDictionary:v20], secondaryAccessory = self->_secondaryAccessory, self->_secondaryAccessory = v21, secondaryAccessory, !self->_secondaryAccessory))
        {
          BOOL v24 = 0;
        }
        else
        {
          v23 = [v4 PKStringForKey:@"preferredStyle"];
          self->_preferredStyle = PKPassTileStateStyleFromString(v23);

          BOOL v24 = 1;
        }
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileStateDefaultV2;
  id v4 = [(PKPassTileState *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 8, self->_title);
  objc_storeStrong(v4 + 9, self->_body);
  objc_storeStrong(v4 + 10, self->_bodyImage);
  objc_storeStrong(v4 + 11, self->_footer);
  v4[12] = self->_preferredStyle;
  objc_storeStrong(v4 + 13, self->_accessory);
  objc_storeStrong(v4 + 14, self->_secondaryAccessory);
  return v4;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)PKPassTileStateDefaultV2;
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKPassTileState *)&v22 createResolvedStateWithBundle:v7 privateBundle:v6];
  id v9 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](self->_title, "createResolvedValueWithBundle:privateBundle:", v7, v6, v22.receiver, v22.super_class);
  v10 = (void *)v8[8];
  v8[8] = v9;

  id v11 = [(PKPassTileValue *)self->_body createResolvedValueWithBundle:v7 privateBundle:v6];
  v12 = (void *)v8[9];
  v8[9] = v11;

  id v13 = [(PKPassTileImage *)self->_bodyImage createResolvedImageWithBundle:v7 privateBundle:v6];
  v14 = (void *)v8[10];
  v8[10] = v13;

  id v15 = [(PKPassTileValue *)self->_footer createResolvedValueWithBundle:v7 privateBundle:v6];
  v16 = (void *)v8[11];
  v8[11] = v15;

  v8[12] = self->_preferredStyle;
  id v17 = [(PKPassTileAccessory *)self->_accessory createResolvedAccessoryWithBundle:v7 privateBundle:v6];
  v18 = (void *)v8[13];
  v8[13] = v17;

  id v19 = [(PKPassTileAccessory *)self->_secondaryAccessory createResolvedAccessoryWithBundle:v7 privateBundle:v6];
  v20 = (void *)v8[14];
  v8[14] = v19;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateDefaultV2)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPassTileStateDefaultV2;
  v5 = [(PKPassTileState *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (PKPassTileValue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    body = v5->_body;
    v5->_body = (PKPassTileValue *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyImage"];
    bodyImage = v5->_bodyImage;
    v5->_bodyImage = (PKPassTileImage *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footer"];
    footer = v5->_footer;
    v5->_footer = (PKPassTileValue *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredStyle"];
    v5->_preferredStyle = PKPassTileStateStyleFromString(v14);

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    accessory = v5->_accessory;
    v5->_accessory = (PKPassTileAccessory *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryAccessory"];
    secondaryAccessory = v5->_secondaryAccessory;
    v5->_secondaryAccessory = (PKPassTileAccessory *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileStateDefaultV2;
  [(PKPassTileState *)&v7 encodeWithCoder:v4];
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeObject:self->_body forKey:@"body"];
  [v4 encodeObject:self->_bodyImage forKey:@"bodyImage"];
  [v4 encodeObject:self->_footer forKey:@"footer"];
  unint64_t v5 = self->_preferredStyle - 1;
  if (v5 > 4) {
    uint64_t v6 = @"twoLineDefault";
  }
  else {
    uint64_t v6 = off_1E56E1500[v5];
  }
  [v4 encodeObject:v6 forKey:@"preferredStyle"];
  [v4 encodeObject:self->_accessory forKey:@"accessory"];
  [v4 encodeObject:self->_secondaryAccessory forKey:@"secondaryAccessory"];
}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPassTileStateDefaultV2;
  if ([(PKPassTileState *)&v23 isEqualToUnresolvedState:v4])
  {
    unint64_t v5 = v4;
    uint64_t v6 = (PKPassTileValue *)v5[8];
    title = self->_title;
    if (v6) {
      BOOL v8 = title == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (v6 != title) {
        goto LABEL_40;
      }
    }
    else if (!-[PKPassTileValue isEqual:](v6, "isEqual:"))
    {
      goto LABEL_40;
    }
    uint64_t v10 = (PKPassTileValue *)v5[9];
    body = self->_body;
    if (v10) {
      BOOL v12 = body == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (v10 != body) {
        goto LABEL_40;
      }
    }
    else if (!-[PKPassTileValue isEqual:](v10, "isEqual:"))
    {
      goto LABEL_40;
    }
    id v13 = (PKPassTileImage *)v5[10];
    bodyImage = self->_bodyImage;
    if (v13) {
      BOOL v15 = bodyImage == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (v13 != bodyImage) {
        goto LABEL_40;
      }
    }
    else if (!-[PKPassTileImage isEqual:](v13, "isEqual:"))
    {
      goto LABEL_40;
    }
    v16 = (PKPassTileValue *)v5[11];
    footer = self->_footer;
    if (v16 && footer)
    {
      if (!-[PKPassTileValue isEqual:](v16, "isEqual:")) {
        goto LABEL_40;
      }
    }
    else if (v16 != footer)
    {
      goto LABEL_40;
    }
    if (v5[12] == self->_preferredStyle)
    {
      v18 = (void *)v5[13];
      accessory = self->_accessory;
      if (v18)
      {
        if (!accessory || (objc_msgSend(v18, "isEqualToUnresolvedAccessory:") & 1) == 0) {
          goto LABEL_40;
        }
LABEL_36:
        objc_super v20 = (PKPassTileAccessory *)v5[14];
        secondaryAccessory = self->_secondaryAccessory;
        if (v20 && secondaryAccessory) {
          BOOL v9 = -[PKPassTileAccessory isEqualToUnresolvedAccessory:](v20, "isEqualToUnresolvedAccessory:");
        }
        else {
          BOOL v9 = v20 == secondaryAccessory;
        }
        goto LABEL_41;
      }
      if (!accessory) {
        goto LABEL_36;
      }
    }
LABEL_40:
    BOOL v9 = 0;
LABEL_41:

    goto LABEL_42;
  }
  BOOL v9 = 0;
LABEL_42:

  return v9;
}

- (PKPassTileValue)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (PKPassTileValue)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (PKPassTileImage)bodyImage
{
  return self->_bodyImage;
}

- (void)setBodyImage:(id)a3
{
}

- (PKPassTileValue)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
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
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end