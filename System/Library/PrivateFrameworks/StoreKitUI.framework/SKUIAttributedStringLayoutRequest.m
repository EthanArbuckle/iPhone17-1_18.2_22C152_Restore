@interface SKUIAttributedStringLayoutRequest
- (BOOL)wantsBaselineOffset;
- (Class)layoutClass;
- (NSAttributedString)attributedString;
- (SKUIAttributedStringLayoutRequest)initWithAttributedString:(id)a3;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfLines;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setWantsBaselineOffset:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation SKUIAttributedStringLayoutRequest

- (SKUIAttributedStringLayoutRequest)initWithAttributedString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAttributedStringLayoutRequest initWithAttributedString:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIAttributedStringLayoutRequest;
  v5 = [(SKUIAttributedStringLayoutRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAttributedString:", self->_attributedString);
  *((void *)result + 2) = self->_numberOfLines;
  *((unsigned char *)result + 24) = self->_wantsBaselineOffset;
  *((void *)result + 4) = *(void *)&self->_width;
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (BOOL)wantsBaselineOffset
{
  return self->_wantsBaselineOffset;
}

- (void)setWantsBaselineOffset:(BOOL)a3
{
  self->_wantsBaselineOffset = a3;
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
}

- (void)initWithAttributedString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAttributedStringLayoutRequest initWithAttributedString:]";
}

@end