@interface _TUIElementTextPlainBuilder
- (NSString)role;
- (NSString)text;
- (TUIFontSpec)fontSpec;
- (UIColor)color;
- (_NSRange)appendWithBlock:(id)a3;
- (_TUIElementTextPlainBuilder)init;
- (double)baselineOffset;
- (id)finalizeTextModelWithContext:(id)a3;
- (unint64_t)options;
- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4;
- (void)appendString:(id)a3;
- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6;
- (void)setBaselineOffset:(double)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRole:(id)a3;
@end

@implementation _TUIElementTextPlainBuilder

- (_TUIElementTextPlainBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TUIElementTextPlainBuilder;
  v2 = [(_TUIElementTextPlainBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    string = v2->_string;
    v2->_string = (NSMutableString *)v3;
  }
  return v2;
}

- (NSString)text
{
  id v2 = [(NSMutableString *)self->_string copy];

  return (NSString *)v2;
}

- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)appendString:(id)a3
{
}

- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6
{
  if (a6) {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (_NSRange)appendWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(NSMutableString *)self->_string length];
  if (v4) {
    v4[2](v4);
  }
  objc_super v6 = (char *)((unsigned char *)[(NSMutableString *)self->_string length] - v5);

  NSUInteger v7 = (NSUInteger)v5;
  NSUInteger v8 = (NSUInteger)v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)finalizeTextModelWithContext:(id)a3
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end