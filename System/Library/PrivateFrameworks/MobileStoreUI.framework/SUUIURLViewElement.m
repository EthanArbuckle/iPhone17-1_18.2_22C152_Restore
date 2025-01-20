@interface SUUIURLViewElement
- (NSURL)URL;
- (SUUIURLViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SUUIURLViewElement

- (SUUIURLViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIURLViewElement;
  v9 = [(SUUIViewElement *)&v16 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 textContent];
    if ([v10 length])
    {
      v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

      uint64_t v13 = [objc_alloc(NSURL) initWithString:v12];
      url = v9->_url;
      v9->_url = (NSURL *)v13;

      v10 = (void *)v12;
    }
  }
  return v9;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end