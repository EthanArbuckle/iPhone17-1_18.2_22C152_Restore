@interface SKUIDynamicPageSectionIndexMapper
- (BOOL)getItem:(unint64_t *)a3 section:(unint64_t *)a4 forGlobalIndex:(int64_t)a5;
- (SKUIEntityProviding)entityProvider;
- (_NSRange)rangeForSectionAtIndex:(int64_t)a3;
- (id)entityIndexPathForGlobalIndex:(int64_t)a3;
- (int64_t)globalIndexForEntityIndexPath:(id)a3;
- (int64_t)numberOfSections;
- (int64_t)totalNumberOfEntities;
- (void)_loadDataIfNeeded;
- (void)dealloc;
- (void)numberOfSections;
- (void)reloadData;
- (void)setEntityProvider:(id)a3;
- (void)totalNumberOfEntities;
@end

@implementation SKUIDynamicPageSectionIndexMapper

- (void)dealloc
{
  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (sectionIndexToEntityRange)
  {
    free(sectionIndexToEntityRange);
    self->_sectionIndexToEntityRange = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIDynamicPageSectionIndexMapper;
  [(SKUIDynamicPageSectionIndexMapper *)&v4 dealloc];
}

- (int64_t)numberOfSections
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIDynamicPageSectionIndexMapper *)v3 numberOfSections];
      }
    }
  }
  [(SKUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  return self->_numberOfSections;
}

- (void)setEntityProvider:(id)a3
{
  uint64_t v5 = (SKUIEntityProviding *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIDynamicPageSectionIndexMapper setEntityProvider:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_entityProvider != v5)
  {
    objc_storeStrong((id *)&self->_entityProvider, a3);
    *(unsigned char *)&self->_entityProviderFlags = *(unsigned char *)&self->_entityProviderFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    self->_numberOfSections = -1;
  }
}

- (int64_t)totalNumberOfEntities
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIDynamicPageSectionIndexMapper *)v3 totalNumberOfEntities];
      }
    }
  }
  [(SKUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  int64_t numberOfSections = self->_numberOfSections;
  if (numberOfSections >= 1 && (sectionIndexToEntityRange = self->_sectionIndexToEntityRange) != 0) {
    return sectionIndexToEntityRange[numberOfSections - 1].length
  }
         + sectionIndexToEntityRange[numberOfSections - 1].location;
  else {
    return 0;
  }
}

- (id)entityIndexPathForGlobalIndex:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(SKUIDynamicPageSectionIndexMapper *)self getItem:&v16 section:&v15 forGlobalIndex:a3])
  {
    uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:v15];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)getItem:(unint64_t *)a3 section:(unint64_t *)a4 forGlobalIndex:(int64_t)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIDynamicPageSectionIndexMapper getItem:section:forGlobalIndex:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  [(SKUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  int64_t numberOfSections = self->_numberOfSections;
  BOOL v18 = numberOfSections < 1;
  int64_t v19 = numberOfSections - 1;
  if (v18) {
    return 0;
  }
  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (!sectionIndexToEntityRange) {
    return 0;
  }
  int64_t v21 = 0;
  while (1)
  {
    uint64_t v22 = v19 + v21;
    if (v19 + v21 < 0 != __OFADD__(v19, v21)) {
      ++v22;
    }
    unint64_t v23 = v22 >> 1;
    v24 = &sectionIndexToEntityRange[v23];
    unint64_t location = v24->location;
    unint64_t length = v24->length;
    BOOL v28 = a5 >= v24->location;
    unint64_t v27 = a5 - v24->location;
    BOOL v28 = !v28 || v27 >= length;
    if (!v28) {
      break;
    }
    if (a5 < location) {
      int64_t v19 = v23 - 1;
    }
    else {
      int64_t v21 = v23 + 1;
    }
    if (v19 < v21) {
      return 0;
    }
  }
  if (a3) {
    *a3 = v27;
  }
  if (a4) {
    *a4 = v23;
  }
  return 1;
}

- (int64_t)globalIndexForEntityIndexPath:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDynamicPageSectionIndexMapper globalIndexForEntityIndexPath:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  int64_t v13 = [v4 section];
  int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 < self->_numberOfSections)
  {
    uint64_t v15 = &self->_sectionIndexToEntityRange[v13];
    NSUInteger location = v15->location;
    NSUInteger length = v15->length;
    unint64_t v18 = [v4 item];
    if (v18 < length) {
      int64_t v14 = v18 + location;
    }
  }

  return v14;
}

- (_NSRange)rangeForSectionAtIndex:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDynamicPageSectionIndexMapper rangeForSectionAtIndex:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(SKUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  NSUInteger length = 0;
  int64_t numberOfSections = self->_numberOfSections;
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  if (numberOfSections > a3 && (a3 & 0x8000000000000000) == 0 && numberOfSections >= 1)
  {
    uint64_t v16 = &self->_sectionIndexToEntityRange[a3];
    NSUInteger location = v16->location;
    NSUInteger length = v16->length;
  }
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)reloadData
{
  self->_int64_t numberOfSections = -1;
}

- (void)_loadDataIfNeeded
{
  if (self->_numberOfSections < 0)
  {
    sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
    if (sectionIndexToEntityRange) {
      free(sectionIndexToEntityRange);
    }
    if (*(unsigned char *)&self->_entityProviderFlags)
    {
      uint64_t v4 = [(SKUIEntityProviding *)self->_entityProvider numberOfSections];
      self->_sectionIndexToEntityRange = (_NSRange *)malloc_type_calloc(v4, 0x10uLL, 0x1000040451B5BE8uLL);
      if (v4 < 1)
      {
LABEL_9:
        self->_int64_t numberOfSections = v4;
        return;
      }
    }
    else
    {
      uint64_t v4 = 1;
      self->_sectionIndexToEntityRange = (_NSRange *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    }
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    NSUInteger v7 = 0;
    do
    {
      uint64_t v8 = [(SKUIEntityProviding *)self->_entityProvider numberOfEntitiesInSection:v6];
      uint64_t v9 = &self->_sectionIndexToEntityRange[v5];
      v9->NSUInteger location = v7;
      v9->NSUInteger length = v8;
      v7 += v8;
      ++v6;
      ++v5;
    }
    while (v4 != v6);
    goto LABEL_9;
  }
}

- (SKUIEntityProviding)entityProvider
{
  return self->_entityProvider;
}

- (void).cxx_destruct
{
}

- (void)numberOfSections
{
}

- (void)setEntityProvider:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)totalNumberOfEntities
{
}

- (void)entityIndexPathForGlobalIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getItem:(uint64_t)a3 section:(uint64_t)a4 forGlobalIndex:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)globalIndexForEntityIndexPath:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)rangeForSectionAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end