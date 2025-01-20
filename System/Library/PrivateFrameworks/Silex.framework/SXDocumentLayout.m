@interface SXDocumentLayout
- (NSString)description;
- (SXDocumentLayout)initWithWidth:(int64_t)a3 margin:(int64_t)a4 gutter:(int64_t)a5 columns:(unint64_t)a6;
- (int64_t)gutter;
- (int64_t)margin;
- (int64_t)width;
- (unint64_t)columns;
@end

@implementation SXDocumentLayout

- (int64_t)margin
{
  return self->_margin;
}

- (SXDocumentLayout)initWithWidth:(int64_t)a3 margin:(int64_t)a4 gutter:(int64_t)a5 columns:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SXDocumentLayout;
  result = [(SXDocumentLayout *)&v11 init];
  if (result)
  {
    result->_width = a3;
    result->_margin = a4;
    result->_gutter = a5;
    result->_columns = a6;
  }
  return result;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; width: %li", -[SXDocumentLayout width](self, "width"));
  objc_msgSend(v3, "appendFormat:", @"; margin: %li", -[SXDocumentLayout margin](self, "margin"));
  objc_msgSend(v3, "appendFormat:", @"; gutter: %li", -[SXDocumentLayout gutter](self, "gutter"));
  objc_msgSend(v3, "appendFormat:", @"; columns: %li", -[SXDocumentLayout columns](self, "columns"));
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)gutter
{
  return self->_gutter;
}

- (unint64_t)columns
{
  return self->_columns;
}

@end