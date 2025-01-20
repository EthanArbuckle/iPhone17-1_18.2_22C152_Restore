@interface SKUIStorePageSplit
- (NSArray)pageComponents;
- (SKUIStorePageSectionContext)sectionContext;
- (UIColor)dividerColor;
- (double)widthFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfPageSections;
- (void)description;
- (void)setDividerColor:(id)a3;
- (void)setNumberOfPageSections:(int64_t)a3;
- (void)setPageComponents:(id)a3;
- (void)setSectionContext:(id)a3;
- (void)setWidthFraction:(double)a3;
@end

@implementation SKUIStorePageSplit

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIStorePageSplit copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v13 setDividerColor:self->_dividerColor];
  [v13 setNumberOfPageSections:self->_numberOfPageSections];
  [v13 setPageComponents:self->_pageComponents];
  [v13 setSectionContext:self->_sectionContext];
  [v13 setWidthFraction:self->_widthFraction];
  return v13;
}

- (id)description
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStorePageSplit description]();
  }
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIStorePageSplit;
  v4 = [(SKUIStorePageSplit *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@: Count: %ld, Context: %@", v4, self->_numberOfPageSections, self->_sectionContext];

  return v5;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (void)setDividerColor:(id)a3
{
}

- (int64_t)numberOfPageSections
{
  return self->_numberOfPageSections;
}

- (void)setNumberOfPageSections:(int64_t)a3
{
  self->_numberOfPageSections = a3;
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (void)setPageComponents:(id)a3
{
}

- (SKUIStorePageSectionContext)sectionContext
{
  return self->_sectionContext;
}

- (void)setSectionContext:(id)a3
{
}

- (double)widthFraction
{
  return self->_widthFraction;
}

- (void)setWidthFraction:(double)a3
{
  self->_widthFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContext, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);

  objc_storeStrong((id *)&self->_dividerColor, 0);
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)description
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageSplit description]";
}

@end