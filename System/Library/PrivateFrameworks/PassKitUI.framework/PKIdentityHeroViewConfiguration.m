@interface PKIdentityHeroViewConfiguration
- (NSString)primaryButtonTitle;
- (NSString)secondaryButtonTitle;
- (NSString)subtitle;
- (NSString)title;
- (PKIdentityHeroViewConfiguration)initWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 primaryButtonTitle:(id)a6 secondaryButtonTitle:(id)a7;
- (PKPaymentHeroImage)image;
- (void)setImage:(id)a3;
- (void)setPrimaryButtonTitle:(id)a3;
- (void)setSecondaryButtonTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKIdentityHeroViewConfiguration

- (PKIdentityHeroViewConfiguration)initWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 primaryButtonTitle:(id)a6 secondaryButtonTitle:(id)a7
{
  id v13 = a3;
  id v20 = a4;
  id v14 = a5;
  id v15 = a6;
  id v19 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKIdentityHeroViewConfiguration;
  v16 = [(PKIdentityHeroViewConfiguration *)&v21 init];
  v17 = v16;
  if (v16)
  {
    if (v13 && v20 && v14 && v15)
    {
      objc_storeStrong((id *)&v16->_image, a3);
      objc_storeStrong((id *)&v17->_title, a4);
      objc_storeStrong((id *)&v17->_subtitle, a5);
      objc_storeStrong((id *)&v17->_primaryButtonTitle, a6);
      objc_storeStrong((id *)&v17->_secondaryButtonTitle, a7);
    }
    else
    {

      v17 = 0;
    }
  }

  return v17;
}

- (PKPaymentHeroImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end