@interface SKUIMenuPageSectionContext
- (id)sectionsForIndex:(int64_t)a3;
- (int64_t)selectedIndex;
- (void)setSections:(id)a3 forIndex:(int64_t)a4;
- (void)setSelectedIndex:(int64_t)a3;
@end

@implementation SKUIMenuPageSectionContext

- (id)sectionsForIndex:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuPageSectionContext sectionsForIndex:]();
  }
  sections = self->_sections;
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)sections objectForKey:v6];

  return v7;
}

- (void)setSections:(id)a3 forIndex:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuPageSectionContext setSections:forIndex:]();
  }
  sections = self->_sections;
  if (!sections)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_sections;
    self->_sections = v8;

    sections = self->_sections;
  }
  v10 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)sections setObject:v6 forKey:v10];
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
}

- (void)sectionsForIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuPageSectionContext sectionsForIndex:]";
}

- (void)setSections:forIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuPageSectionContext setSections:forIndex:]";
}

@end