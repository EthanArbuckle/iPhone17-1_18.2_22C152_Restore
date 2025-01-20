@interface SKUIBadgeViewElement
- (CGSize)size;
- (NSAttributedString)attributedString;
- (NSString)resourceName;
- (NSURL)URL;
- (SKUIBadgeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (UIImage)fallbackImage;
- (id)accessibilityText;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)badgeType;
@end

@implementation SKUIBadgeViewElement

- (SKUIBadgeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIBadgeViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIBadgeViewElement;
  v11 = [(SKUIViewElement *)&v27 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"src"];
    if ([v12 length])
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v12];
      v14 = [v13 scheme];
      int v15 = [v14 isEqualToString:@"resource"];

      if (v15)
      {
        uint64_t v16 = [v13 host];
        resourceName = (NSURL *)v11->_resourceName;
        v11->_resourceName = (NSString *)v16;
      }
      else
      {
        v18 = v13;
        resourceName = v11->_url;
        v11->_url = v18;
      }
    }
    if (!v11->_resourceName && !v11->_url)
    {
      v19 = [v8 getAttribute:@"content"];
      if (![v19 length])
      {
        uint64_t v20 = [v8 getAttribute:@"text"];

        v19 = (void *)v20;
      }
      if ([v19 length]) {
        objc_storeStrong((id *)&v11->_text, v19);
      }
    }
    v21 = [v8 getAttribute:@"height"];
    v22 = [v8 getAttribute:@"width"];
    if ([v21 length] && objc_msgSend(v22, "length"))
    {
      [v22 floatValue];
      CGFloat v24 = v23;
      [v21 floatValue];
      v11->_size.width = v24;
      v11->_size.height = v25;
    }
  }
  return v11;
}

- (NSAttributedString)attributedString
{
  if (self->_text)
  {
    v3 = [(SKUIBadgeViewElement *)self style];
    v4 = SKUIViewElementFontWithStyle(v3);
    if (!v4)
    {
      v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
    }
    v5 = [v3 ikColor];
    v6 = [v5 color];

    if (!v6)
    {
      v6 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    v7 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    id v8 = (void *)[v7 mutableCopy];

    [v8 setLineBreakMode:4];
    id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v4, *MEMORY[0x1E4FB06F8], v8, *MEMORY[0x1E4FB0738], v6, *MEMORY[0x1E4FB0700], 0);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_text attributes:v10];
  }
  else
  {
    v11 = 0;
  }

  return (NSAttributedString *)v11;
}

- (int64_t)badgeType
{
  v3 = [(SKUIBadgeViewElement *)self fallbackImage];
  if (!v3 && !self->_resourceName) {
    return self->_url == 0;
  }

  return 0;
}

- (id)accessibilityText
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIBadgeViewElement;
  v3 = [(SKUIBadgeViewElement *)&v6 accessibilityText];
  if (![v3 length])
  {
    v4 = self->_text;

    v3 = v4;
  }

  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIBadgeViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUIBadgeViewElement;
  v5 = [(SKUIViewElement *)&v18 applyUpdatesWithElement:v4];
  objc_super v6 = v5;
  if (v4 != self)
  {
    if (!v4) {
      goto LABEL_10;
    }
LABEL_6:
    if (v4->_hasValidFallbackImage)
    {
      id v8 = [(SKUIBadgeViewElement *)v4 fallbackImage];
      fallbackImage = self->_fallbackImage;
      self->_fallbackImage = v8;

      self->_hasValidFallbackImage = 1;
    }
    else
    {
      self->_hasValidFallbackImage = 0;
      id v10 = self->_fallbackImage;
      self->_fallbackImage = 0;
    }
    v11 = [(SKUIBadgeViewElement *)v4 resourceName];
    resourceName = self->_resourceName;
    self->_resourceName = v11;

    [(SKUIBadgeViewElement *)v4 size];
    self->_size.width = v13;
    self->_size.height = v14;
    objc_storeStrong((id *)&self->_text, v4->_text);
    int v15 = [(SKUIBadgeViewElement *)v4 URL];
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
    v3 = [(SKUIBadgeViewElement *)self style];
    v4 = [v3 badgeTreatment];
    int v5 = [v4 isEqualToString:@"rect"];

    if (v5)
    {
      objc_super v6 = self->_text;
      uint64_t v7 = [v3 ikColor];
      id v8 = [v7 color];

      if (v8)
      {
        SKUIBadgeImageFromText(v6, v8, 1);
        id v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        fallbackImage = self->_fallbackImage;
        self->_fallbackImage = v9;
      }
      else
      {
        v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.62745098 alpha:1.0];
        SKUIBadgeImageFromText(v6, v11, 1);
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBadgeViewElement initWithDOMElement:parent:elementFactory:]";
}

@end