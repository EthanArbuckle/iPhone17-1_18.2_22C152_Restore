@interface SUTabBarAppearance
- (UIImage)backgroundImage;
- (UIImage)dividerImage;
- (UIImage)selectedDividerImage;
- (UIImage)selectionIndicatorImage;
- (double)tabBarButtonSpacing;
- (double)tabBarButtonWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)titleTextAttributesForState:(unint64_t)a3;
- (void)dealloc;
- (void)enumerateTitleTextAttributesUsingBlock:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setDividerImage:(id)a3;
- (void)setSelectedDividerImage:(id)a3;
- (void)setSelectionIndicatorImage:(id)a3;
- (void)setTabBarButtonSpacing:(double)a3;
- (void)setTabBarButtonWidth:(double)a3;
- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
@end

@implementation SUTabBarAppearance

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUTabBarAppearance;
  [(SUTabBarAppearance *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_backgroundImage;
  *(void *)(v5 + 16) = self->_dividerImage;
  *(void *)(v5 + 24) = self->_selectedDividerImage;
  *(void *)(v5 + 32) = self->_selectionIndicatorImage;
  *(double *)(v5 + 40) = self->_tabBarButtonSpacing;
  *(double *)(v5 + 48) = self->_tabBarButtonWidth;
  *(void *)(v5 + 56) = [(NSMutableDictionary *)self->_titleTextAttributes mutableCopyWithZone:a3];
  return (id)v5;
}

- (void)enumerateTitleTextAttributesUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  titleTextAttributes = self->_titleTextAttributes;
  uint64_t v6 = [(NSMutableDictionary *)titleTextAttributes countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(titleTextAttributes);
        }
        (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, [*(id *)(*((void *)&v10 + 1) + 8 * i) integerValue], -[NSMutableDictionary objectForKey:](self->_titleTextAttributes, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)));
      }
      uint64_t v7 = [(NSMutableDictionary *)titleTextAttributes countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6 = [objc_alloc(NSNumber) initWithInteger:a4];
  titleTextAttributes = self->_titleTextAttributes;
  id v9 = (id)v6;
  if (a3)
  {
    if (!titleTextAttributes) {
      self->_titleTextAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v8 = (void *)[a3 copy];
    [(NSMutableDictionary *)self->_titleTextAttributes setObject:v8 forKey:v9];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](titleTextAttributes, "removeObjectForKey:");
  }
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  id v5 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_titleTextAttributes, "objectForKey:", v4), "copy");

  return v5;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIImage)dividerImage
{
  return self->_dividerImage;
}

- (void)setDividerImage:(id)a3
{
}

- (UIImage)selectedDividerImage
{
  return self->_selectedDividerImage;
}

- (void)setSelectedDividerImage:(id)a3
{
}

- (UIImage)selectionIndicatorImage
{
  return self->_selectionIndicatorImage;
}

- (void)setSelectionIndicatorImage:(id)a3
{
}

- (double)tabBarButtonSpacing
{
  return self->_tabBarButtonSpacing;
}

- (void)setTabBarButtonSpacing:(double)a3
{
  self->_tabBarButtonSpacing = a3;
}

- (double)tabBarButtonWidth
{
  return self->_tabBarButtonWidth;
}

- (void)setTabBarButtonWidth:(double)a3
{
  self->_tabBarButtonWidth = a3;
}

@end