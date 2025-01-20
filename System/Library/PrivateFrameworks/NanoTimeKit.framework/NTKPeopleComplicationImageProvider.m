@interface NTKPeopleComplicationImageProvider
- (BOOL)isEqual:(id)a3;
- (NSString)fullName;
- (NSString)nameAbbreviation;
- (NTKPeopleComplicationImageProvider)init;
- (UIImage)profileImage;
- (double)borderWidth;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBorderWidth:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setFullName:(id)a3;
- (void)setNameAbbreviation:(id)a3;
- (void)setProfileImage:(id)a3;
@end

@implementation NTKPeopleComplicationImageProvider

- (NTKPeopleComplicationImageProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplicationImageProvider;
  v2 = [(CLKImageProvider *)&v5 initPrivate];
  v3 = v2;
  if (v2) {
    [(CLKImageProvider *)v2 setImageViewCreationHandler:&__block_literal_global_150];
  }
  return v3;
}

NTKPeopleComplicationImageView *__42__NTKPeopleComplicationImageProvider_init__block_invoke(double a1, double a2)
{
  v2 = -[NTKPeopleComplicationImageView initWithFrame:]([NTKPeopleComplicationImageView alloc], "initWithFrame:", 0.0, 0.0, a1, a2);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NTKPeopleComplicationImageProvider *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v16 = 1;
    }
    else
    {
      objc_super v5 = v4;
      double borderWidth = self->_borderWidth;
      [(NTKPeopleComplicationImageProvider *)v5 borderWidth];
      if (vabdd_f64(borderWidth, v7) >= 2.22044605e-16
        || (double fontSize = self->_fontSize,
            [(NTKPeopleComplicationImageProvider *)v5 fontSize],
            vabdd_f64(fontSize, v9) >= 2.22044605e-16))
      {
        char v16 = 0;
      }
      else
      {
        profileImage = self->_profileImage;
        v11 = [(NTKPeopleComplicationImageProvider *)v5 profileImage];
        if ([(UIImage *)profileImage isEqual:v11])
        {
          fullName = self->_fullName;
          v13 = [(NTKPeopleComplicationImageProvider *)v5 fullName];
          if ([(NSString *)fullName isEqualToString:v13])
          {
            nameAbbreviation = self->_nameAbbreviation;
            v15 = [(NTKPeopleComplicationImageProvider *)v5 nameAbbreviation];
            char v16 = [(NSString *)nameAbbreviation isEqualToString:v15];
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKPeopleComplicationImageProvider;
  id v5 = -[CLKImageProvider copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    [v5 setBorderWidth:self->_borderWidth];
    [v6 setFontSize:self->_fontSize];
    [v6 setProfileImage:self->_profileImage];
    double v7 = (void *)[(NSString *)self->_fullName copyWithZone:a3];
    [v6 setFullName:v7];

    v8 = (void *)[(NSString *)self->_nameAbbreviation copyWithZone:a3];
    [v6 setNameAbbreviation:v8];
  }
  return v6;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_double borderWidth = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_double fontSize = a3;
}

- (UIImage)profileImage
{
  return self->_profileImage;
}

- (void)setProfileImage:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (NSString)nameAbbreviation
{
  return self->_nameAbbreviation;
}

- (void)setNameAbbreviation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameAbbreviation, 0);
  objc_storeStrong((id *)&self->_fullName, 0);

  objc_storeStrong((id *)&self->_profileImage, 0);
}

@end