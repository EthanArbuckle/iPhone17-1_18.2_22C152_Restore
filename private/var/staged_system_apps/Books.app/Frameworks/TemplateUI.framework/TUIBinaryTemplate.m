@interface TUIBinaryTemplate
- ($738B17BD11CC339B30296C0EA03CEC2B)rootElementNode;
- (NSArray)parsingErrors;
- (NSURL)url;
- (TUIBinaryTemplate)initWithPackage:(id)a3 url:(id)a4 rootElementNode:(id)a5;
- (TUIPackage)package;
@end

@implementation TUIBinaryTemplate

- (TUIBinaryTemplate)initWithPackage:(id)a3 url:(id)a4 rootElementNode:(id)a5
{
  v8 = (TUIBinaryPackage *)a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIBinaryTemplate;
  v10 = [(TUIBinaryTemplate *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_package = v8;
    objc_storeStrong((id *)&v10->_url, a4);
    v11->_rootElementNode.index = a5.var0;
  }

  return v11;
}

- (TUIPackage)package
{
  return (TUIPackage *)self->_package;
}

- (NSArray)parsingErrors
{
  return 0;
}

- (NSURL)url
{
  return self->_url;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)rootElementNode
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_rootElementNode.index;
}

- (void).cxx_destruct
{
}

@end