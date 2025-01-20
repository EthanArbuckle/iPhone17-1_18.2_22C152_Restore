@interface SUUIItemOfferButtonAppearance
- (SUUIItemOfferButtonAppearance)initWithColorScheme:(id)a3;
- (UIColor)buttonColor;
- (UIColor)confirmationColor;
@end

@implementation SUUIItemOfferButtonAppearance

- (SUUIItemOfferButtonAppearance)initWithColorScheme:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIItemOfferButtonAppearance;
    v5 = [(SUUIItemOfferButtonAppearance *)&v15 init];
    if (v5)
    {
      uint64_t v6 = [v4 secondaryTextColor];
      buttonColor = v5->_buttonColor;
      v5->_buttonColor = (UIColor *)v6;

      switch([v4 schemeStyle])
      {
        case 0:
        case 2:
          v8 = (void *)MEMORY[0x263F825C8];
          double v9 = 0.0980392157;
          double v10 = 0.670588235;
          double v11 = 0.125490196;
          goto LABEL_7;
        case 1:
        case 3:
          v8 = (void *)MEMORY[0x263F825C8];
          double v9 = 0.2;
          double v10 = 0.792156863;
          double v11 = 0.231372549;
LABEL_7:
          uint64_t v12 = [v8 colorWithRed:v9 green:v10 blue:v11 alpha:1.0];
          confirmationColor = v5->_confirmationColor;
          v5->_confirmationColor = (UIColor *)v12;

          break;
        default:
          break;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (UIColor)confirmationColor
{
  return self->_confirmationColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationColor, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
}

@end