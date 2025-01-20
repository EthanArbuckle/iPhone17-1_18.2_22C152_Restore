@interface SKUISearchBarViewElement
- (NSString)accessoryText;
- (NSString)placeholderString;
- (NSString)searchHintsURLString;
- (NSString)trendingSearchURLString;
- (SKUISearchBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElementText)defaultText;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (unint64_t)elementType;
@end

@implementation SKUISearchBarViewElement

- (SKUISearchBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchBarViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUISearchBarViewElement;
  v11 = [(SKUIInputViewElement *)&v23 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = [v8 getAttribute:@"accessoryText"];
    accessoryText = v11->_accessoryText;
    v11->_accessoryText = (NSString *)v12;

    uint64_t v14 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
    defaultText = v11->_defaultText;
    v11->_defaultText = (SKUIViewElementText *)v14;

    uint64_t v16 = [v8 getAttribute:@"placeholder"];
    placeholderString = v11->_placeholderString;
    v11->_placeholderString = (NSString *)v16;

    uint64_t v18 = [v8 getAttribute:@"searchHints"];
    searchHintsURLString = v11->_searchHintsURLString;
    v11->_searchHintsURLString = (NSString *)v18;

    uint64_t v20 = [v8 getAttribute:@"trendingSearch"];
    trendingSearchURLString = v11->_trendingSearchURLString;
    v11->_trendingSearchURLString = (NSString *)v20;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUISearchBarViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUISearchBarViewElement;
  v5 = [(SKUIViewElement *)&v18 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SKUISearchBarViewElement *)v4 accessoryText];
    accessoryText = self->_accessoryText;
    self->_accessoryText = v7;

    id v9 = [(SKUISearchBarViewElement *)v4 defaultText];
    defaultText = self->_defaultText;
    self->_defaultText = v9;

    v11 = [(SKUISearchBarViewElement *)v4 placeholderString];
    placeholderString = self->_placeholderString;
    self->_placeholderString = v11;

    v13 = [(SKUISearchBarViewElement *)v4 searchHintsURLString];
    searchHintsURLString = self->_searchHintsURLString;
    self->_searchHintsURLString = v13;

    v15 = [(SKUISearchBarViewElement *)v4 trendingSearchURLString];
    trendingSearchURLString = self->_trendingSearchURLString;
    self->_trendingSearchURLString = v15;
  }

  return v6;
}

- (unint64_t)elementType
{
  return 106;
}

- (int64_t)pageComponentType
{
  return 25;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (SKUIViewElementText)defaultText
{
  return self->_defaultText;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (NSString)searchHintsURLString
{
  return self->_searchHintsURLString;
}

- (NSString)trendingSearchURLString
{
  return self->_trendingSearchURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchURLString, 0);
  objc_storeStrong((id *)&self->_searchHintsURLString, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);

  objc_storeStrong((id *)&self->_accessoryText, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISearchBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end