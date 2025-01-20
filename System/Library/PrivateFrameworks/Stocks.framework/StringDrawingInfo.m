@interface StringDrawingInfo
+ (id)stringDrawingInfoWithString:(id)a3 color:(id)a4 font:(id)a5 size:(CGSize)a6;
- (CGSize)size;
- (NSString)string;
- (UIColor)color;
- (UIFont)font;
- (void)setColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setString:(id)a3;
@end

@implementation StringDrawingInfo

+ (id)stringDrawingInfoWithString:(id)a3 color:(id)a4 font:(id)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(StringDrawingInfo);
  [(StringDrawingInfo *)v13 setString:v12];

  [(StringDrawingInfo *)v13 setColor:v11];
  [(StringDrawingInfo *)v13 setFont:v10];

  -[StringDrawingInfo setSize:](v13, "setSize:", width, height);

  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end