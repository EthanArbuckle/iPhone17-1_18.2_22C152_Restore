@interface _TUIElementNavigationBarItemBuilder
- (BOOL)menuIsPrimary;
- (NSArray)hostingIdentifiers;
- (NSArray)hostingProperities;
- (NSAttributedString)attributedTitle;
- (NSAttributedString)placeholderText;
- (TUIMenuContainer)menuContainer;
- (UIImage)image;
- (void)addAttributedString:(id)a3 forRole:(id)a4;
- (void)addImageModel:(id)a3 forRole:(id)a4;
- (void)addMenuContainer:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setHostingIdentifiers:(id)a3;
- (void)setHostingProperities:(id)a3;
- (void)setImage:(id)a3;
- (void)setMenuIsPrimary:(BOOL)a3;
- (void)setPlaceholderText:(id)a3;
@end

@implementation _TUIElementNavigationBarItemBuilder

- (void)addAttributedString:(id)a3 forRole:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6 || [v6 isEqualToString:@"title"])
  {
    v8 = (objc_class *)[v11 copy];
    uint64_t v9 = 64;
LABEL_4:
    v10 = *(Class *)((char *)&self->super.super.super.isa + v9);
    *(Class *)((char *)&self->super.super.super.isa + v9) = v8;

    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"placeholder"])
  {
    v8 = (objc_class *)[v11 copy];
    uint64_t v9 = 80;
    goto LABEL_4;
  }
LABEL_5:
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6 || [v6 isEqualToString:@"image"])
  {
    v8 = [v10 image];
    image = self->_image;
    self->_image = v8;
  }
}

- (void)addMenuContainer:(id)a3
{
}

- (NSArray)hostingIdentifiers
{
  return self->_hostingIdentifiers;
}

- (void)setHostingIdentifiers:(id)a3
{
}

- (NSArray)hostingProperities
{
  return self->_hostingProperities;
}

- (void)setHostingProperities:(id)a3
{
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_hostingProperities, 0);

  objc_storeStrong((id *)&self->_hostingIdentifiers, 0);
}

@end