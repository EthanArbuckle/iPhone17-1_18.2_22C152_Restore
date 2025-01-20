@interface REHTMLConstantElement
- (REHTMLConstantElement)initWithContent:(id)a3;
- (id)_contentString;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation REHTMLConstantElement

- (REHTMLConstantElement)initWithContent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REHTMLConstantElement;
  v5 = [(REHTMLElement *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    content = v5->_content;
    v5->_content = (NSString *)v6;
  }
  return v5;
}

- (id)_contentString
{
  return self->_content;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REHTMLConstantElement;
  id v4 = [(REHTMLElement *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_content);
  return v4;
}

- (void).cxx_destruct
{
}

@end