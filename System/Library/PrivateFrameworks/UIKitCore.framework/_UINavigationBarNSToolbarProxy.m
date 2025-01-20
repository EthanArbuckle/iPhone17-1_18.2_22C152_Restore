@interface _UINavigationBarNSToolbarProxy
+ (BOOL)_supportsNSToolbarNavigationHosting;
- (NSString)title;
- (NSToolbar)toolbar;
- (NSURL)representedURL;
- (UITitlebar)owningTitlebar;
- (_UINavigationBarNSToolbarProxy)initWithTitlebar:(id)a3;
- (_UITabBarControllerVisualStyle_Mac)tabBarVisualStyle;
- (id)description;
- (id)representedDragItemsProvider;
- (void)setTabBarVisualStyle:(id)a3;
@end

@implementation _UINavigationBarNSToolbarProxy

+ (BOOL)_supportsNSToolbarNavigationHosting
{
  return 0;
}

- (_UINavigationBarNSToolbarProxy)initWithTitlebar:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarNSToolbarProxy;
  v5 = [(_UINavigationBarNSToolbarProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_owningTitlebar, v4);
  }

  return v6;
}

- (NSToolbar)toolbar
{
  return 0;
}

- (NSString)title
{
  [(_UINavigationBarNSToolbarProxy *)self _updateIfNecessary];
  title = self->_title;
  return title;
}

- (NSURL)representedURL
{
  [(_UINavigationBarNSToolbarProxy *)self _updateIfNecessary];
  representedURL = self->_representedURL;
  return representedURL;
}

- (id)representedDragItemsProvider
{
  [(_UINavigationBarNSToolbarProxy *)self _updateIfNecessary];
  v3 = _Block_copy(self->_representedDragItemsProvider);
  return v3;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UINavigationBarNSToolbarProxy;
  v3 = [(_UINavigationBarNSToolbarProxy *)&v17 description];
  id v4 = (void *)[v3 mutableCopy];

  if (*(unsigned char *)&self->_flags) {
    [v4 appendString:@" updatePending. call -_updateIfNecessary to force."];
  }
  if (self->_title) {
    [v4 appendFormat:@" title='%@'", self->_title];
  }
  if (self->_representedURL) {
    [v4 appendFormat:@" representedURL='%@'", self->_representedURL];
  }
  [v4 appendString:@" participants = {"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_registeredParticipants;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v10 layoutForNSToolbar:self];
        [v4 appendFormat:@"\n\t%p : %@\n", v10, v11, (void)v13];
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  [v4 appendString:@"}\n"];
  return v4;
}

- (UITitlebar)owningTitlebar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningTitlebar);
  return (UITitlebar *)WeakRetained;
}

- (_UITabBarControllerVisualStyle_Mac)tabBarVisualStyle
{
  return self->_tabBarVisualStyle;
}

- (void)setTabBarVisualStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarVisualStyle, 0);
  objc_destroyWeak((id *)&self->_owningTitlebar);
  objc_storeStrong((id *)&self->_registeredParticipants, 0);
  objc_storeStrong(&self->_representedDragItemsProvider, 0);
  objc_storeStrong((id *)&self->_representedURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end