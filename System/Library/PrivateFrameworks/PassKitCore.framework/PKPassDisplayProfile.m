@interface PKPassDisplayProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBackgroundImage;
- (BOOL)hasStripImage;
- (BOOL)showsBackgroundImage;
- (BOOL)showsStripImage;
- (BOOL)supportsAutomaticForegroundVibrancy;
- (BOOL)supportsAutomaticLabelVibrancy;
- (BOOL)suppressesHeaderDarkening;
- (BOOL)tallCode;
- (NSData)manifestHash;
- (PKColor)backgroundColor;
- (PKColor)footerBackgroundColor;
- (PKColor)foregroundColor;
- (PKColor)labelColor;
- (PKColor)secondaryBackgroundColor;
- (PKColor)stripColor;
- (PKPassDisplayProfile)initWithCoder:(id)a3;
- (PKPassDisplayProfile)initWithDictionary:(id)a3 bundle:(id)a4;
- (int64_t)layoutMode;
- (int64_t)passStyle;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFooterBackgroundColor:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHasBackgroundImage:(BOOL)a3;
- (void)setHasStripImage:(BOOL)a3;
- (void)setLabelColor:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setPassStyle:(int64_t)a3;
- (void)setSecondaryBackgroundColor:(id)a3;
- (void)setStripColor:(id)a3;
- (void)setSupportsAutomaticForegroundVibrancy:(BOOL)a3;
- (void)setSupportsAutomaticLabelVibrancy:(BOOL)a3;
- (void)setSuppressesHeaderDarkening:(BOOL)a3;
- (void)setTallCode:(BOOL)a3;
@end

@implementation PKPassDisplayProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_stripColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_secondaryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)setTallCode:(BOOL)a3
{
  self->_tallCode = a3;
}

- (void)setSupportsAutomaticLabelVibrancy:(BOOL)a3
{
  self->_supportsAutomaticLabelVibrancy = a3;
}

- (void)setSupportsAutomaticForegroundVibrancy:(BOOL)a3
{
  self->_supportsAutomaticForegroundVibrancy = a3;
}

- (void)setHasStripImage:(BOOL)a3
{
  self->_hasStripImage = a3;
}

- (void)setHasBackgroundImage:(BOOL)a3
{
  self->_hasBackgroundImage = a3;
}

- (void)setSecondaryBackgroundColor:(id)a3
{
}

- (int64_t)layoutMode
{
  return PKScreenSize() <= 320.0;
}

- (int64_t)passStyle
{
  return self->_passStyle;
}

- (PKPassDisplayProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPassDisplayProfile;
  v5 = [(PKDisplayProfile *)&v21 initWithCoder:v4];
  if (v5)
  {
    v5->_passStyle = [v4 decodeIntegerForKey:@"passStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryBackgroundColor"];
    secondaryBackgroundColor = v5->_secondaryBackgroundColor;
    v5->_secondaryBackgroundColor = (PKColor *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundColor"];
    foregroundColor = v5->_foregroundColor;
    v5->_foregroundColor = (PKColor *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelColor"];
    labelColor = v5->_labelColor;
    v5->_labelColor = (PKColor *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stripColor"];
    stripColor = v5->_stripColor;
    v5->_stripColor = (PKColor *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v16;

    v5->_tallCode = [v4 decodeBoolForKey:@"tallCode"];
    v5->_hasBackgroundImage = [v4 decodeBoolForKey:@"hasBackgroundImage"];
    v5->_hasStripImage = [v4 decodeBoolForKey:@"hasStripImage"];
    v5->_supportsAutomaticForegroundVibrancy = [v4 decodeBoolForKey:@"supportsAutomaticForegroundVibrancy"];
    v5->_supportsAutomaticLabelVibrancy = [v4 decodeBoolForKey:@"supportsAutomaticLabelVibrancy"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerBackgroundColor"];
    footerBackgroundColor = v5->_footerBackgroundColor;
    v5->_footerBackgroundColor = (PKColor *)v18;

    v5->_suppressesHeaderDarkening = [v4 decodeBoolForKey:@"suppressesHeaderDarkening"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassDisplayProfile;
  id v4 = a3;
  [(PKDisplayProfile *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_passStyle, @"passStyle", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v4 encodeObject:self->_secondaryBackgroundColor forKey:@"secondaryBackgroundColor"];
  [v4 encodeObject:self->_foregroundColor forKey:@"foregroundColor"];
  [v4 encodeObject:self->_labelColor forKey:@"labelColor"];
  [v4 encodeObject:self->_stripColor forKey:@"stripColor"];
  [v4 encodeObject:self->_manifestHash forKey:@"manifestHash"];
  [v4 encodeBool:self->_tallCode forKey:@"tallCode"];
  [v4 encodeBool:self->_hasBackgroundImage forKey:@"hasBackgroundImage"];
  [v4 encodeBool:self->_hasStripImage forKey:@"hasStripImage"];
  [v4 encodeBool:self->_supportsAutomaticForegroundVibrancy forKey:@"supportsAutomaticForegroundVibrancy"];
  [v4 encodeBool:self->_supportsAutomaticLabelVibrancy forKey:@"supportsAutomaticLabelVibrancy"];
  [v4 encodeObject:self->_footerBackgroundColor forKey:@"footerBackgroundColor"];
  [v4 encodeBool:self->_suppressesHeaderDarkening forKey:@"suppressesHeaderDarkening"];
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)supportsAutomaticLabelVibrancy
{
  return self->_supportsAutomaticLabelVibrancy;
}

- (BOOL)supportsAutomaticForegroundVibrancy
{
  return self->_supportsAutomaticForegroundVibrancy;
}

- (PKColor)labelColor
{
  return self->_labelColor;
}

- (PKColor)foregroundColor
{
  return self->_foregroundColor;
}

- (int64_t)type
{
  return 0;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)showsBackgroundImage
{
  unint64_t v3 = [(PKPassDisplayProfile *)self passStyle];
  BOOL result = 0;
  if (v3 <= 9 && ((1 << v3) & 0x244) != 0) {
    return self->_hasBackgroundImage;
  }
  return result;
}

- (BOOL)showsStripImage
{
  v4.origin.x = PKPassFaceStripImageFrame(self);
  return !CGRectIsNull(v4) && self->_hasStripImage;
}

- (PKPassDisplayProfile)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PKPassDisplayProfile;
  uint64_t v8 = [(PKDisplayProfile *)&v36 initWithDictionary:v6 bundle:v7];
  if (v8)
  {
    unint64_t v9 = PKPassStyleForCardDictionary(v6, v7);
    [(PKPassDisplayProfile *)v8 setPassStyle:v9];
    uint64_t v10 = [v6 PKColorForKey:@"backgroundColor"];
    if (!v10)
    {
      if (v9 == 6)
      {
        double v11 = 0.556862745;
        double v12 = 0.576470588;
        double v13 = 1.0;
        double v14 = 0.556862745;
      }
      else
      {
        double v11 = 1.0;
        double v14 = 1.0;
        double v12 = 1.0;
        double v13 = 1.0;
      }
      uint64_t v10 = +[PKColor colorWithR:v11 G:v14 B:v12 A:v13];
    }
    [(PKPassDisplayProfile *)v8 setBackgroundColor:v10];
    if (v9 == 7)
    {
      v15 = [v6 PKColorForKey:@"secondaryBackgroundColor"];
      [(PKPassDisplayProfile *)v8 setSecondaryBackgroundColor:v15];
    }
    uint64_t v16 = [v6 PKColorForKey:@"foregroundColor"];
    if (!v16)
    {
      if (v9 == 6)
      {
        [v10 luminance];
        if (v17 > 0.45)
        {
          double v18 = 0.0;
          double v19 = 0.0;
          double v20 = 0.0;
        }
        else
        {
          double v18 = 1.0;
          double v19 = 1.0;
          double v20 = 1.0;
        }
        uint64_t v16 = +[PKColor colorWithR:v18 G:v19 B:v20 A:1.0];
      }
      else
      {
        if (v9 == 9) {
          [(PKPassDisplayProfile *)v8 setSupportsAutomaticForegroundVibrancy:1];
        }
        uint64_t v16 = 0;
      }
    }
    [(PKPassDisplayProfile *)v8 setForegroundColor:v16];
    objc_super v21 = [v6 PKColorForKey:@"labelColor"];
    if (!v21)
    {
      if (v9 == 9)
      {
        [(PKPassDisplayProfile *)v8 setSupportsAutomaticLabelVibrancy:1];
        double v22 = 1.0;
        double v23 = 1.0;
        double v24 = 1.0;
      }
      else
      {
        double v22 = 0.0;
        double v23 = 0.0;
        double v24 = 0.0;
      }
      objc_super v21 = +[PKColor colorWithR:v22 G:v23 B:v24 A:1.0];
    }
    [(PKPassDisplayProfile *)v8 setLabelColor:v21];
    v25 = [v6 PKColorForKey:@"stripColor"];
    [(PKPassDisplayProfile *)v8 setStripColor:v25];

    v26 = [[PKBarcode alloc] initWithPassDictionary:v6 bundle:v7];
    v27 = v26;
    if (v26) {
      [(PKPassDisplayProfile *)v8 setTallCode:[(PKBarcode *)v26 isTall]];
    }
    v28 = [v7 bundleURL];
    v29 = PKManifestHash(v28);
    [(PKPassDisplayProfile *)v8 setManifestHash:v29];

    v30 = +[PKImage URLForImageNamed:@"background" inBundle:v7 scale:0];
    v8->_hasBackgroundImage = v30 != 0;

    if (v9 == 9 && !v8->_hasBackgroundImage)
    {
      v31 = +[PKImage URLForImageNamed:@"artwork" inBundle:v7 scale:0];
      v8->_hasBackgroundImage = v31 != 0;
    }
    v32 = +[PKImage URLForImageNamed:@"strip" inBundle:v7 scale:0];
    v8->_hasStripImage = v32 != 0;

    -[PKPassDisplayProfile setSuppressesHeaderDarkening:](v8, "setSuppressesHeaderDarkening:", [v6 PKBoolForKey:@"suppressHeaderDarkening"]);
    v33 = [v6 PKColorForKey:@"footerBackgroundColor"];
    [(PKPassDisplayProfile *)v8 setFooterBackgroundColor:v33];

    int v34 = [v6 PKBoolForKey:@"useAutomaticColors"];
    if (v9 == 9 && v34)
    {
      [(PKPassDisplayProfile *)v8 setSupportsAutomaticForegroundVibrancy:1];
      [(PKPassDisplayProfile *)v8 setSupportsAutomaticLabelVibrancy:1];
    }
  }
  return v8;
}

- (void)setSuppressesHeaderDarkening:(BOOL)a3
{
  self->_suppressesHeaderDarkening = a3;
}

- (void)setStripColor:(id)a3
{
}

- (void)setPassStyle:(int64_t)a3
{
  self->_passStyle = a3;
}

- (void)setManifestHash:(id)a3
{
}

- (void)setLabelColor:(id)a3
{
}

- (void)setForegroundColor:(id)a3
{
}

- (void)setFooterBackgroundColor:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (PKColor)stripColor
{
  return self->_stripColor;
}

- (PKColor)secondaryBackgroundColor
{
  return self->_secondaryBackgroundColor;
}

- (BOOL)tallCode
{
  return self->_tallCode;
}

- (BOOL)hasBackgroundImage
{
  return self->_hasBackgroundImage;
}

- (BOOL)hasStripImage
{
  return self->_hasStripImage;
}

- (BOOL)suppressesHeaderDarkening
{
  return self->_suppressesHeaderDarkening;
}

- (PKColor)footerBackgroundColor
{
  return self->_footerBackgroundColor;
}

@end