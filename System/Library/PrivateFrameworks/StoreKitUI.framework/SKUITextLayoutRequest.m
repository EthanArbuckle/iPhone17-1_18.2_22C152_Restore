@interface SKUITextLayoutRequest
- (Class)layoutClass;
- (NSAttributedString)attributedText;
- (NSString)text;
- (SKUITextLayoutRequest)init;
- (double)fontSize;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)fontWeight;
- (int64_t)numberOfLines;
- (unsigned)textAlignment;
- (void)init;
- (void)setAttributedText:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setFontWeight:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(unsigned __int8)a3;
- (void)setWidth:(double)a3;
@end

@implementation SKUITextLayoutRequest

- (SKUITextLayoutRequest)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITextLayoutRequest init]();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUITextLayoutRequest;
  result = [(SKUITextLayoutRequest *)&v4 init];
  if (result) {
    result->_fontSize = 12.0;
  }
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSAttributedString *)self->_attributedText copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(void *)(v5 + 24) = self->_fontWeight;
  *(double *)(v5 + 16) = self->_fontSize;
  *(void *)(v5 + 32) = self->_numberOfLines;
  uint64_t v8 = [(NSString *)self->_text copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(unsigned char *)(v5 + 48) = self->_textAlignment;
  *(double *)(v5 + 56) = self->_width;
  return (id)v5;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (unsigned)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unsigned __int8)a3
{
  self->_textAlignment = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_attributedText, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITextLayoutRequest init]";
}

@end