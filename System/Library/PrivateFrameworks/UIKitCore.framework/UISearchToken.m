@interface UISearchToken
+ (UISearchToken)tokenWithIcon:(UIImage *)icon text:(NSString *)text;
+ (UISearchToken)tokenWithImage:(id)a3;
- (NSString)text;
- (UIImage)image;
- (id)_initToken;
- (id)representedObject;
- (void)setImage:(id)a3;
- (void)setRepresentedObject:(id)representedObject;
- (void)setText:(id)a3;
@end

@implementation UISearchToken

- (id)_initToken
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchToken;
  return [(UISearchToken *)&v3 init];
}

+ (UISearchToken)tokenWithImage:(id)a3
{
  id v3 = a3;
  id v4 = [[_UISearchToken alloc] _initToken];
  [v4 setImage:v3];

  return (UISearchToken *)v4;
}

+ (UISearchToken)tokenWithIcon:(UIImage *)icon text:(NSString *)text
{
  v5 = text;
  v6 = icon;
  id v7 = [[_UISearchToken alloc] _initToken];
  [v7 setImage:v6];

  [v7 setText:v5];
  return (UISearchToken *)v7;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)representedObject
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_representedObject, 0);
}

@end