@interface XMLWrapperNamespace
- (NSString)href;
- (NSString)prefix;
- (XMLWrapperNamespace)initWithNsNode:(_xmlNs *)a3 error:(id *)a4;
- (_xmlNs)xmlNsForNode:(_xmlNode *)a3 error:(id *)a4;
- (void)setHref:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation XMLWrapperNamespace

- (XMLWrapperNamespace)initWithNsNode:(_xmlNs *)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)XMLWrapperNamespace;
  v5 = [(XMLWrapperNamespace *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_xmlNs = a3;
    if (a3->href)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:");
      href = v6->_href;
      v6->_href = (NSString *)v7;
    }
    if (a3->prefix)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:");
      prefix = v6->_prefix;
      v6->_prefix = (NSString *)v9;
    }
    else
    {
      prefix = v6->_prefix;
      v6->_prefix = (NSString *)&stru_26F2AD000;
    }
  }
  return v6;
}

- (_xmlNs)xmlNsForNode:(_xmlNode *)a3 error:(id *)a4
{
  uint64_t v7 = [(XMLWrapperNamespace *)self href];
  if (v7)
  {
    id v8 = [(XMLWrapperNamespace *)self href];
    uint64_t v9 = xmlCharStrdup((const char *)[v8 UTF8String]);
  }
  else
  {
    uint64_t v9 = 0;
  }

  v10 = [(XMLWrapperNamespace *)self prefix];
  if (v10)
  {
    id v11 = [(XMLWrapperNamespace *)self prefix];
    objc_super v12 = xmlCharStrdup((const char *)[v11 UTF8String]);
  }
  else
  {
    objc_super v12 = 0;
  }

  xmlNsPtr v13 = xmlNewNs(a3, v9, v12);
  v14 = v13;
  if (a4 && !v13)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"XMLWrapperErrorDomain" code:205 userInfo:0];
  }
  return v14;
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end