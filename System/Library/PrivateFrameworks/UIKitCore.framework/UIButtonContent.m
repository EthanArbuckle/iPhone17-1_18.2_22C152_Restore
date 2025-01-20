@interface UIButtonContent
- (BOOL)isEmpty;
- (BOOL)updateVariableLengthStringForView:(id)a3;
- (NSAttributedString)attributedTitle;
- (NSNumber)drawingStroke;
- (NSString)title;
- (UIButtonContent)initWithCoder:(id)a3;
- (UIColor)imageColor;
- (UIColor)shadowColor;
- (UIColor)titleColor;
- (UIImage)background;
- (UIImage)image;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBackground:(id)a3;
- (void)setDrawingStroke:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageColor:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation UIButtonContent

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->preferredSymbolConfiguration;
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (NSAttributedString)attributedTitle
{
  return self->attributedTitle;
}

- (UIImage)background
{
  return self->background;
}

- (UIColor)imageColor
{
  return self->imageColor;
}

- (NSNumber)drawingStroke
{
  return self->drawingStroke;
}

- (void)setBackground:(id)a3
{
}

- (void)setAttributedTitle:(id)a3
{
}

- (BOOL)isEmpty
{
  return !self->title
      && !self->attributedTitle
      && !self->image
      && !self->background
      && !self->titleColor
      && !self->imageColor
      && !self->shadowColor
      && self->drawingStroke == 0;
}

- (UIColor)titleColor
{
  return self->titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->drawingStroke, 0);
  objc_storeStrong((id *)&self->shadowColor, 0);
  objc_storeStrong((id *)&self->imageColor, 0);
  objc_storeStrong((id *)&self->titleColor, 0);
  objc_storeStrong((id *)&self->background, 0);
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->attributedTitle, 0);
  objc_storeStrong((id *)&self->title, 0);
}

- (BOOL)updateVariableLengthStringForView:(id)a3
{
  id v4 = a3;
  if (self->isWidthVariant)
  {
    _UIAdaptLocalizedStringForView(self->title, v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = [(NSString *)self->title isEqualToString:v5];
    if (!v6)
    {
      title = self->title;
      self->title = v5;
      v5 = title;
    }
    BOOL v8 = !v6;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (UIColor)shadowColor
{
  return self->shadowColor;
}

- (void)setTitle:(id)a3
{
  v5 = (NSString *)a3;
  if (self->title != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->title, a3);
    char IsWidthVariant = _NSStringIsWidthVariant(self->title);
    v5 = v7;
    self->isWidthVariant = IsWidthVariant;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(UIButtonContent *)self title];
  [v4 setTitle:v5];

  BOOL v6 = [(UIButtonContent *)self attributedTitle];
  [v4 setAttributedTitle:v6];

  v7 = [(UIButtonContent *)self image];
  [v4 setImage:v7];

  BOOL v8 = [(UIButtonContent *)self background];
  [v4 setBackground:v8];

  v9 = [(UIButtonContent *)self titleColor];
  [v4 setTitleColor:v9];

  v10 = [(UIButtonContent *)self imageColor];
  [v4 setImageColor:v10];

  v11 = [(UIButtonContent *)self shadowColor];
  [v4 setShadowColor:v11];

  v12 = [(UIButtonContent *)self drawingStroke];
  [v4 setDrawingStroke:v12];

  v13 = [(UIButtonContent *)self preferredSymbolConfiguration];
  [v4 setPreferredSymbolConfiguration:v13];

  return v4;
}

- (UIButtonContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)UIButtonContent;
  v5 = [(UIButtonContent *)&v28 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectForKey:@"UITitle"];
    if ([v6 length])
    {
      uint64_t v7 = [v6 copy];
      title = v5->title;
      v5->title = (NSString *)v7;
    }
    else
    {
      title = v5->title;
      v5->title = 0;
    }

    v9 = [v4 decodeObjectForKey:@"UIAttributedTitle"];
    v10 = [v9 string];
    if ([v10 length])
    {
      uint64_t v11 = [v9 copy];
      attributedTitle = v5->attributedTitle;
      v5->attributedTitle = (NSAttributedString *)v11;
    }
    else
    {
      attributedTitle = v5->attributedTitle;
      v5->attributedTitle = 0;
    }

    uint64_t v13 = [v4 decodeObjectForKey:@"UIImage"];
    image = v5->image;
    v5->image = (UIImage *)v13;

    uint64_t v15 = [v4 decodeObjectForKey:@"UIImageSymbolConfiguration"];
    preferredSymbolConfiguration = v5->preferredSymbolConfiguration;
    v5->preferredSymbolConfiguration = (UIImageSymbolConfiguration *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"UIBackgroundImage"];
    background = v5->background;
    v5->background = (UIImage *)v17;

    uint64_t v19 = [v4 decodeObjectForKey:@"UITitleColor"];
    titleColor = v5->titleColor;
    v5->titleColor = (UIColor *)v19;

    uint64_t v21 = [v4 decodeObjectForKey:@"UIImageColor"];
    imageColor = v5->imageColor;
    v5->imageColor = (UIColor *)v21;

    uint64_t v23 = [v4 decodeObjectForKey:@"UIShadowColor"];
    shadowColor = v5->shadowColor;
    v5->shadowColor = (UIColor *)v23;

    uint64_t v25 = [v4 decodeObjectForKey:@"UIDrawingStroke"];
    drawingStroke = v5->drawingStroke;
    v5->drawingStroke = (NSNumber *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  title = self->title;
  id v14 = v4;
  if (title)
  {
    [v4 encodeObject:title forKey:@"UITitle"];
    id v4 = v14;
  }
  attributedTitle = self->attributedTitle;
  if (attributedTitle)
  {
    [v14 encodeObject:attributedTitle forKey:@"UIAttributedTitle"];
    id v4 = v14;
  }
  image = self->image;
  if (image)
  {
    [v14 encodeObject:image forKey:@"UIImage"];
    id v4 = v14;
  }
  preferredSymbolConfiguration = self->preferredSymbolConfiguration;
  if (preferredSymbolConfiguration)
  {
    [v14 encodeObject:preferredSymbolConfiguration forKey:@"UIImageSymbolConfiguration"];
    id v4 = v14;
  }
  background = self->background;
  if (background)
  {
    [v14 encodeObject:background forKey:@"UIBackgroundImage"];
    id v4 = v14;
  }
  titleColor = self->titleColor;
  if (titleColor)
  {
    [v14 encodeObject:titleColor forKey:@"UITitleColor"];
    id v4 = v14;
  }
  imageColor = self->imageColor;
  if (imageColor)
  {
    [v14 encodeObject:imageColor forKey:@"UIImageColor"];
    id v4 = v14;
  }
  shadowColor = self->shadowColor;
  if (shadowColor)
  {
    [v14 encodeObject:shadowColor forKey:@"UIShadowColor"];
    id v4 = v14;
  }
  drawingStroke = self->drawingStroke;
  if (drawingStroke)
  {
    [v14 encodeObject:drawingStroke forKey:@"UIDrawingStroke"];
    id v4 = v14;
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p Title = %@, AttributedTitle = %@, Image = %@, Background = %@, TitleColor = %@, ImageColor = %@, ShadowColor = %@, DrawingStroke = %@>", v5, self, self->title, self->attributedTitle, self->image, self->background, self->titleColor, self->imageColor, self->shadowColor, self->drawingStroke];

  return v6;
}

- (void)setImageColor:(id)a3
{
}

- (void)setShadowColor:(id)a3
{
}

- (void)setDrawingStroke:(id)a3
{
}

@end