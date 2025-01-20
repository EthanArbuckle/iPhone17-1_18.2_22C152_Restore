@interface SUUIBadgeViewElement
- (CGSize)size;
- (NSAttributedString)attributedString;
- (NSString)resourceName;
- (NSURL)URL;
- (SUUIBadgeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (UIImage)fallbackImage;
- (id)accessibilityText;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)badgeType;
@end

@implementation SUUIBadgeViewElement

- (SUUIBadgeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIBadgeViewElement;
  v9 = [(SUUIViewElement *)&v25 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"src"];
    if ([v10 length])
    {
      v11 = (void *)[objc_alloc(NSURL) initWithString:v10];
      v12 = [v11 scheme];
      int v13 = [v12 isEqualToString:@"resource"];

      if (v13)
      {
        uint64_t v14 = [v11 host];
        resourceName = (NSURL *)v9->_resourceName;
        v9->_resourceName = (NSString *)v14;
      }
      else
      {
        v16 = v11;
        resourceName = v9->_url;
        v9->_url = v16;
      }
    }
    if (!v9->_resourceName && !v9->_url)
    {
      v17 = [v8 getAttribute:@"content"];
      if (![v17 length])
      {
        uint64_t v18 = [v8 getAttribute:@"text"];

        v17 = (void *)v18;
      }
      if ([v17 length]) {
        objc_storeStrong((id *)&v9->_text, v17);
      }
    }
    v19 = [v8 getAttribute:@"height"];
    v20 = [v8 getAttribute:@"width"];
    if ([v19 length] && objc_msgSend(v20, "length"))
    {
      [v20 floatValue];
      CGFloat v22 = v21;
      [v19 floatValue];
      v9->_size.width = v22;
      v9->_size.height = v23;
    }
  }
  return v9;
}

- (NSAttributedString)attributedString
{
  if (self->_text)
  {
    v3 = [(SUUIBadgeViewElement *)self style];
    v4 = SUUIViewElementFontWithStyle(v3);
    if (!v4)
    {
      v4 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
    }
    v5 = [v3 ikColor];
    v6 = [v5 color];

    if (!v6)
    {
      v6 = [MEMORY[0x263F825C8] whiteColor];
    }
    v7 = [MEMORY[0x263F81658] defaultParagraphStyle];
    id v8 = (void *)[v7 mutableCopy];

    [v8 setLineBreakMode:4];
    id v9 = objc_alloc(NSDictionary);
    v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v4, *MEMORY[0x263F814F0], v8, *MEMORY[0x263F81540], v6, *MEMORY[0x263F81500], 0);
    v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:self->_text attributes:v10];
  }
  else
  {
    v11 = 0;
  }
  return (NSAttributedString *)v11;
}

- (int64_t)badgeType
{
  v3 = [(SUUIBadgeViewElement *)self fallbackImage];
  if (!v3 && !self->_resourceName) {
    return self->_url == 0;
  }

  return 0;
}

- (id)accessibilityText
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIBadgeViewElement;
  v3 = [(SUUIBadgeViewElement *)&v6 accessibilityText];
  if (![v3 length])
  {
    v4 = self->_text;

    v3 = v4;
  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIBadgeViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUIBadgeViewElement;
  v5 = [(SUUIViewElement *)&v18 applyUpdatesWithElement:v4];
  objc_super v6 = v5;
  if (v4 != self)
  {
    if (!v4) {
      goto LABEL_10;
    }
LABEL_6:
    if (v4->_hasValidFallbackImage)
    {
      id v8 = [(SUUIBadgeViewElement *)v4 fallbackImage];
      fallbackImage = self->_fallbackImage;
      self->_fallbackImage = v8;

      self->_hasValidFallbackImage = 1;
    }
    else
    {
      self->_hasValidFallbackImage = 0;
      v10 = self->_fallbackImage;
      self->_fallbackImage = 0;
    }
    v11 = [(SUUIBadgeViewElement *)v4 resourceName];
    resourceName = self->_resourceName;
    self->_resourceName = v11;

    [(SUUIBadgeViewElement *)v4 size];
    self->_size.width = v13;
    self->_size.height = v14;
    objc_storeStrong((id *)&self->_text, v4->_text);
    v15 = [(SUUIBadgeViewElement *)v4 URL];
    url = self->_url;
    self->_url = v15;

    goto LABEL_10;
  }
  uint64_t v7 = [v5 updateType];
  if (v4 && v7) {
    goto LABEL_6;
  }
LABEL_10:

  return v6;
}

- (UIImage)fallbackImage
{
  if (!self->_hasValidFallbackImage)
  {
    self->_hasValidFallbackImage = 1;
    v3 = [(SUUIBadgeViewElement *)self style];
    v4 = [v3 badgeTreatment];
    int v5 = [v4 isEqualToString:@"rect"];

    if (v5)
    {
      objc_super v6 = self->_text;
      uint64_t v7 = [v3 ikColor];
      id v8 = [v7 color];

      if (v8)
      {
        SUUIBadgeImageFromText(v6, v8, 1);
        id v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        fallbackImage = self->_fallbackImage;
        self->_fallbackImage = v9;
      }
      else
      {
        v11 = [MEMORY[0x263F825C8] colorWithWhite:0.62745098 alpha:1.0];
        SUUIBadgeImageFromText(v6, v11, 1);
        v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
        CGFloat v13 = self->_fallbackImage;
        self->_fallbackImage = v12;

        fallbackImage = (UIImage *)v6;
        objc_super v6 = (NSString *)v11;
      }
    }
  }
  CGFloat v14 = self->_fallbackImage;
  return v14;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
}

@end