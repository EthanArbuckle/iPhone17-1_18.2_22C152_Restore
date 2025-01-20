@interface PRPosterAppearance
- (BOOL)isEqual:(id)a3;
- (PRPosterAppearance)initWithFont:(id)a3 labelColor:(id)a4 preferredTitleAlignment:(unint64_t)a5 preferredTitleLayout:(unint64_t)a6;
- (PRPosterColor)labelColor;
- (UIFont)font;
- (unint64_t)preferredTitleAlignment;
- (unint64_t)preferredTitleLayout;
@end

@implementation PRPosterAppearance

- (PRPosterAppearance)initWithFont:(id)a3 labelColor:(id)a4 preferredTitleAlignment:(unint64_t)a5 preferredTitleLayout:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRPosterAppearance;
  v13 = [(PRPosterAppearance *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_font, a3);
    objc_storeStrong((id *)&v14->_labelColor, a4);
    v14->_preferredTitleAlignment = a5;
    v14->_preferredTitleLayout = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterAppearance *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PRPosterAppearance *)v5 font];
      v7 = [(PRPosterAppearance *)self font];
      int v8 = [v6 isEqual:v7];

      if (!v8) {
        goto LABEL_9;
      }
      v9 = [(PRPosterAppearance *)v5 labelColor];
      v10 = [(PRPosterAppearance *)self labelColor];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
      uint64_t v12 = [(PRPosterAppearance *)v5 preferredTitleAlignment];
      if (v12 == [(PRPosterAppearance *)self preferredTitleAlignment])
      {
        uint64_t v13 = [(PRPosterAppearance *)v5 preferredTitleLayout];
        BOOL v14 = v13 == [(PRPosterAppearance *)self preferredTitleLayout];
      }
      else
      {
LABEL_9:
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (PRPosterColor)labelColor
{
  return self->_labelColor;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
}

@end