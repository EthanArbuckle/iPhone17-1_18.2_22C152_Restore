@interface SKUIURLViewElement
- (NSURL)URL;
- (SKUIURLViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SKUIURLViewElement

- (SKUIURLViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIURLViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIURLViewElement;
  v11 = [(SKUIViewElement *)&v18 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 textContent];
    if ([v12 length])
    {
      v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v14];
      url = v11->_url;
      v11->_url = (NSURL *)v15;

      v12 = (void *)v14;
    }
  }
  return v11;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIURLViewElement initWithDOMElement:parent:elementFactory:]";
}

@end