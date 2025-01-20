@interface SUUIBrowseViewElement
- (NSString)title;
- (SUUIBrowseViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUIBrowseViewElement

- (SUUIBrowseViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIBrowseViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"title"];
    title = v9->_title;
    v9->_title = (NSString *)v10;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIBrowseViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIBrowseViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUIBrowseViewElement *)v4 title];
    title = self->_title;
    self->_title = v7;
  }
  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end