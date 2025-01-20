@interface SKUIEditorialLinkLayoutRequest
- (Class)layoutClass;
- (NSArray)links;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (void)layoutClass;
- (void)setLinks:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation SKUIEditorialLinkLayoutRequest

- (Class)layoutClass
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialLinkLayoutRequest layoutClass]();
  }
  v2 = objc_opt_class();

  return (Class)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialLinkLayoutRequest copyWithZone:]();
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setLinks:self->_links];
  [v5 setWidth:self->_width];
  return v5;
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
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

- (void)layoutClass
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialLinkLayoutRequest layoutClass]";
}

- (void)copyWithZone:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialLinkLayoutRequest copyWithZone:]";
}

@end