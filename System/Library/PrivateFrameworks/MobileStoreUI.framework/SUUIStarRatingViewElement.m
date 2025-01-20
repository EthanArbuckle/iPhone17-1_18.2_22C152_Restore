@interface SUUIStarRatingViewElement
- (BOOL)isEnabled;
- (SUUIStarRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElementText)text;
- (float)ratingValue;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)starType;
@end

@implementation SUUIStarRatingViewElement

- (SUUIStarRatingViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIStarRatingViewElement;
  v9 = [(SUUIViewElement *)&v22 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (!v9) {
    goto LABEL_20;
  }
  v10 = [v8 getAttribute:@"value"];
  v11 = v10;
  if (v10)
  {
    [v10 doubleValue];
    *(float *)&double v12 = v12 / 5.0;
    v9->_ratingValue = *(float *)&v12;
  }
  v13 = [v8 getAttribute:@"type"];
  if (!v13) {
    goto LABEL_8;
  }
  if ([@"large" isEqualToString:v13])
  {
    uint64_t v14 = 2;
LABEL_9:
    v9->_starType = v14;
    goto LABEL_10;
  }
  if ([@"large" isEqualToString:v13])
  {
LABEL_8:
    uint64_t v14 = 1;
    goto LABEL_9;
  }
LABEL_10:
  v15 = [v8 getAttribute:@"disabled"];
  if (v15)
  {
    if ([@"yes" isEqualToString:v15]) {
      LOBYTE(v16) = 0;
    }
    else {
      int v16 = [@"true" isEqualToString:v15] ^ 1;
    }
    v9->_enabled = v16;
  }
  v17 = [(SUUIViewElement *)v9 firstChildForElementType:138];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
    v19 = [v18 string];
    uint64_t v20 = [v19 length];

    if (v20) {
      objc_storeStrong((id *)&v9->_text, v18);
    }
  }
LABEL_20:

  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SUUIViewElementText)text
{
  text = self->_text;
  if (text)
  {
    v3 = text;
  }
  else
  {
    v4 = [(SUUIViewElement *)self firstChildForElementType:138];
    v3 = [v4 text];
  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIStarRatingViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIStarRatingViewElement;
  v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    [(SUUIStarRatingViewElement *)v4 ratingValue];
    self->_ratingValue = v7;
    objc_storeStrong((id *)&self->_text, v4->_text);
  }

  return v6;
}

- (int64_t)starType
{
  return self->_starType;
}

- (float)ratingValue
{
  return self->_ratingValue;
}

- (void).cxx_destruct
{
}

@end