@interface SUUISearchBarViewElement
- (NSString)accessoryText;
- (NSString)placeholderString;
- (NSString)searchHintsURLString;
- (NSString)trendingSearchURLString;
- (SUUISearchBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElementText)defaultText;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (unint64_t)elementType;
@end

@implementation SUUISearchBarViewElement

- (SUUISearchBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUISearchBarViewElement;
  v9 = [(SUUIInputViewElement *)&v21 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"accessoryText"];
    accessoryText = v9->_accessoryText;
    v9->_accessoryText = (NSString *)v10;

    uint64_t v12 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
    defaultText = v9->_defaultText;
    v9->_defaultText = (SUUIViewElementText *)v12;

    uint64_t v14 = [v8 getAttribute:@"placeholder"];
    placeholderString = v9->_placeholderString;
    v9->_placeholderString = (NSString *)v14;

    uint64_t v16 = [v8 getAttribute:@"searchHints"];
    searchHintsURLString = v9->_searchHintsURLString;
    v9->_searchHintsURLString = (NSString *)v16;

    uint64_t v18 = [v8 getAttribute:@"trendingSearch"];
    trendingSearchURLString = v9->_trendingSearchURLString;
    v9->_trendingSearchURLString = (NSString *)v18;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUISearchBarViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUISearchBarViewElement;
  v5 = [(SUUIViewElement *)&v18 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUISearchBarViewElement *)v4 accessoryText];
    accessoryText = self->_accessoryText;
    self->_accessoryText = v7;

    v9 = [(SUUISearchBarViewElement *)v4 defaultText];
    defaultText = self->_defaultText;
    self->_defaultText = v9;

    v11 = [(SUUISearchBarViewElement *)v4 placeholderString];
    placeholderString = self->_placeholderString;
    self->_placeholderString = v11;

    v13 = [(SUUISearchBarViewElement *)v4 searchHintsURLString];
    searchHintsURLString = self->_searchHintsURLString;
    self->_searchHintsURLString = v13;

    v15 = [(SUUISearchBarViewElement *)v4 trendingSearchURLString];
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

- (SUUIViewElementText)defaultText
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

@end