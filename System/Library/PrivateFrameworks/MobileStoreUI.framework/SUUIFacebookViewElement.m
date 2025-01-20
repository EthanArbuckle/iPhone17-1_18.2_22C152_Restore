@interface SUUIFacebookViewElement
- (NSString)URLString;
- (SUUIFacebookViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)facebookType;
- (int64_t)pageComponentType;
@end

@implementation SUUIFacebookViewElement

- (SUUIFacebookViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIFacebookViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"type"];
    v9->_facebookType = [v10 isEqualToString:@"large"];

    uint64_t v11 = [v8 getAttribute:@"url"];
    urlString = v9->_urlString;
    v9->_urlString = (NSString *)v11;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIFacebookViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIFacebookViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_facebookType = [(SUUIFacebookViewElement *)v4 facebookType];
    v7 = [(SUUIFacebookViewElement *)v4 URLString];
    urlString = self->_urlString;
    self->_urlString = v7;
  }
  return v6;
}

- (int64_t)pageComponentType
{
  return 20;
}

- (int64_t)facebookType
{
  return self->_facebookType;
}

- (NSString)URLString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
}

@end