@interface SUUIImageGridViewElement
- (CGSize)size;
- (SUUIImageGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (UIEdgeInsets)contentInset;
- (int64_t)columnCount;
@end

@implementation SUUIImageGridViewElement

- (SUUIImageGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIImageGridViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"height"];
    v11 = [v8 getAttribute:@"width"];
    if ([v10 length] && objc_msgSend(v11, "length"))
    {
      [v10 doubleValue];
      v9->_size.height = v12;
      [v11 doubleValue];
      v9->_size.width = v13;
    }
  }
  return v9;
}

- (int64_t)columnCount
{
  v2 = [(SUUIImageGridViewElement *)self style];
  int64_t v3 = [v2 columnCount];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (UIEdgeInsets)contentInset
{
  v2 = [(SUUIImageGridViewElement *)self style];
  [v2 elementPadding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end