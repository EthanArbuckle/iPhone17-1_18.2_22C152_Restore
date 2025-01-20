@interface SUUIMenuPageSectionContext
- (id)sectionsForIndex:(int64_t)a3;
- (int64_t)selectedIndex;
- (void)setSections:(id)a3 forIndex:(int64_t)a4;
- (void)setSelectedIndex:(int64_t)a3;
@end

@implementation SUUIMenuPageSectionContext

- (id)sectionsForIndex:(int64_t)a3
{
  sections = self->_sections;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)sections objectForKey:v4];

  return v5;
}

- (void)setSections:(id)a3 forIndex:(int64_t)a4
{
  id v10 = a3;
  sections = self->_sections;
  if (!sections)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = self->_sections;
    self->_sections = v7;

    sections = self->_sections;
  }
  v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)sections setObject:v10 forKey:v9];
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

@end