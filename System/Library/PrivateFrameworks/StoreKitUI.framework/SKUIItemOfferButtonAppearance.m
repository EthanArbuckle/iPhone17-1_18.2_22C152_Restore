@interface SKUIItemOfferButtonAppearance
- (SKUIItemOfferButtonAppearance)initWithColorScheme:(id)a3;
- (UIColor)buttonColor;
- (UIColor)confirmationColor;
@end

@implementation SKUIItemOfferButtonAppearance

- (SKUIItemOfferButtonAppearance)initWithColorScheme:(id)a3
{
  id v4 = a3;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    if (v4) {
      goto LABEL_5;
    }
LABEL_11:
    id v5 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[SKUIItemOfferButtonAppearance initWithColorScheme:]();
  if (!v4) {
    goto LABEL_11;
  }
LABEL_5:
  v14.receiver = self;
  v14.super_class = (Class)SKUIItemOfferButtonAppearance;
  id v5 = [(SKUIItemOfferButtonAppearance *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 secondaryTextColor];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    switch([v4 schemeStyle])
    {
      case 0:
      case 2:
        v8 = (void *)MEMORY[0x1E4FB1618];
        double v9 = 0.0980392157;
        double v10 = 0.670588235;
        double v11 = 0.125490196;
        goto LABEL_9;
      case 1:
      case 3:
        v8 = (void *)MEMORY[0x1E4FB1618];
        double v9 = 0.2;
        double v10 = 0.792156863;
        double v11 = 0.231372549;
LABEL_9:
        uint64_t v12 = [v8 colorWithRed:v9 green:v10 blue:v11 alpha:1.0];
        self = (SKUIItemOfferButtonAppearance *)*((void *)v5 + 2);
        *((void *)v5 + 2) = v12;
        goto LABEL_12;
      default:
        break;
    }
  }
LABEL_13:

  return (SKUIItemOfferButtonAppearance *)v5;
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

- (void)initWithColorScheme:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemOfferButtonAppearance initWithColorScheme:]";
}

@end