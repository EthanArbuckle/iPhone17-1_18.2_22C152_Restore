@interface _UINavigationBarItemStackEntry
+ (id)entryForItem:(id)a3 replaceExistingWithNew:(BOOL)a4;
+ (id)newEntryForItem:(id)a3;
- (BOOL)isSearchActive;
- (UINavigationItem)item;
- (_UINavigationBarLayout)activeLayout;
- (_UINavigationBarLayout)inactiveLayout;
- (_UINavigationBarLayout)normalLayout;
- (_UINavigationBarLayout)searchLayout;
- (id)description;
- (void)dealloc;
- (void)setNormalLayout:(id)a3;
- (void)setSearchActive:(BOOL)a3;
- (void)setSearchLayout:(id)a3;
- (void)updateStateFromCounterpart:(id)a3;
@end

@implementation _UINavigationBarItemStackEntry

- (_UINavigationBarLayout)normalLayout
{
  return self->_normalLayout;
}

- (UINavigationItem)item
{
  return self->_item;
}

- (BOOL)isSearchActive
{
  return self->_searchActive;
}

- (_UINavigationBarLayout)searchLayout
{
  return self->_searchLayout;
}

- (void)setNormalLayout:(id)a3
{
}

- (_UINavigationBarLayout)activeLayout
{
  uint64_t v2 = 32;
  if (!self->_searchActive) {
    uint64_t v2 = 24;
  }
  return (_UINavigationBarLayout *)*(id *)((char *)&self->super.isa + v2);
}

- (_UINavigationBarLayout)inactiveLayout
{
  uint64_t v2 = 24;
  if (!self->_searchActive) {
    uint64_t v2 = 32;
  }
  return (_UINavigationBarLayout *)*(id *)((char *)&self->super.isa + v2);
}

- (void)dealloc
{
  v3 = [(UINavigationItem *)self->_item _stackEntry];

  if (v3 == self) {
    [(UINavigationItem *)self->_item _setStackEntry:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarItemStackEntry;
  [(_UINavigationBarItemStackEntry *)&v4 dealloc];
}

+ (id)newEntryForItem:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)entryForItem:(id)a3 replaceExistingWithNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 _stackEntry];
  if (!v7 || v4)
  {
    uint64_t v8 = objc_opt_new();

    objc_storeStrong((id *)(v8 + 16), a3);
    *(unsigned char *)(v8 + 8) = 0;
    [v6 _setStackEntry:v8];
    v7 = (void *)v8;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchLayout, 0);
  objc_storeStrong((id *)&self->_normalLayout, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)updateStateFromCounterpart:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (_UINavigationBarItemStackEntry *)a3;
  v5 = [(_UINavigationBarItemStackEntry *)v4 item];
  item = self->_item;

  if (os_variant_has_internal_diagnostics())
  {
    if (v5 != item)
    {
      v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v11 = 138412546;
        v12 = self;
        __int16 v13 = 2112;
        v14 = v4;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "%@: Ignoring unexpected nonmatching counterpart: %@\nThis is an internal UIKit bug.", (uint8_t *)&v11, 0x16u);
      }
      goto LABEL_8;
    }
LABEL_4:
    if (v4 == self) {
      goto LABEL_9;
    }
    if ([(_UINavigationBarItemStackEntry *)v4 isSearchActive])
    {
      self->_searchActive = 1;
      goto LABEL_9;
    }
    v7 = [(_UINavigationBarItemStackEntry *)v4 item];
    uint64_t v8 = [v7 _searchControllerIfAllowed];
    self->_searchActive = [v8 isActive];

LABEL_8:
    goto LABEL_9;
  }
  if (v5 == item) {
    goto LABEL_4;
  }
  v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateStateFromCounterpart____s_category) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@: Ignoring unexpected nonmatching counterpart: %@\nThis is an internal UIKit bug.", (uint8_t *)&v11, 0x16u);
  }
LABEL_9:
}

- (void)setSearchActive:(BOOL)a3
{
  self->_searchActive = a3;
}

- (void)setSearchLayout:(id)a3
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarItemStackEntry;
  v3 = [(_UINavigationBarItemStackEntry *)&v7 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  if (self->_searchActive) {
    v5 = @" normalLayout=%p searchLayout[active]=%p";
  }
  else {
    v5 = @" normalLayout[active]=%p searchLayout=%p";
  }
  objc_msgSend(v4, "appendFormat:", v5, self->_normalLayout, self->_searchLayout);
  [v4 appendFormat:@" item=%@", self->_item];
  return v4;
}

@end