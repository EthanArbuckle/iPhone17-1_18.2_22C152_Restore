@interface UIKBAutoFillTestTableViewHeaderFooterData
- (NSString)title;
- (UIKBAutoFillTestTableViewHeaderFooterData)initWithCoder:(id)a3;
- (UIKBAutoFillTestTableViewHeaderFooterData)initWithTitle:(id)a3 view:(id)a4 height:(double)a5;
- (UIView)headerFooterView;
- (double)height;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIKBAutoFillTestTableViewHeaderFooterData

- (UIKBAutoFillTestTableViewHeaderFooterData)initWithTitle:(id)a3 view:(id)a4 height:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIKBAutoFillTestTableViewHeaderFooterData;
  v10 = [(UIKBAutoFillTestTableViewHeaderFooterData *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    objc_storeStrong((id *)&v10->_headerFooterView, a4);
    v10->_height = a5;
    v13 = v10;
  }

  return v10;
}

- (UIKBAutoFillTestTableViewHeaderFooterData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"title"];
  v6 = [v4 decodeObjectForKey:@"headerFooterView"];
  [v4 decodeDoubleForKey:@"height"];
  double v8 = v7;

  id v9 = [(UIKBAutoFillTestTableViewHeaderFooterData *)self initWithTitle:v5 view:v6 height:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  title = self->_title;
  id v7 = v4;
  if (title)
  {
    [v4 encodeObject:title forKey:@"title"];
    id v4 = v7;
  }
  headerFooterView = self->_headerFooterView;
  if (headerFooterView)
  {
    [v7 encodeObject:headerFooterView forKey:@"headerFooterView"];
    id v4 = v7;
  }
  [v4 encodeDouble:@"height" forKey:self->_height];
}

- (NSString)title
{
  return self->_title;
}

- (UIView)headerFooterView
{
  return self->_headerFooterView;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFooterView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end