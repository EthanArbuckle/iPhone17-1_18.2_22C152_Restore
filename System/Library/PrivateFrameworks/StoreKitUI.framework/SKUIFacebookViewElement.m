@interface SKUIFacebookViewElement
- (NSString)URLString;
- (SKUIFacebookViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)facebookType;
- (int64_t)pageComponentType;
@end

@implementation SKUIFacebookViewElement

- (SKUIFacebookViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIFacebookViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIFacebookViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"type"];
    v11->_facebookType = SKUIFacebookViewElementTypeForString(v12);

    uint64_t v13 = [v8 getAttribute:@"url"];
    urlString = v11->_urlString;
    v11->_urlString = (NSString *)v13;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIFacebookViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIFacebookViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_facebookType = [(SKUIFacebookViewElement *)v4 facebookType];
    v7 = [(SKUIFacebookViewElement *)v4 URLString];
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFacebookViewElement initWithDOMElement:parent:elementFactory:]";
}

@end