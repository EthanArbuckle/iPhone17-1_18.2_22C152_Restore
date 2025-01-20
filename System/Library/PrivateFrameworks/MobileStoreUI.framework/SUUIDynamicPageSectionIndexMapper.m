@interface SUUIDynamicPageSectionIndexMapper
- (BOOL)getItem:(unint64_t *)a3 section:(unint64_t *)a4 forGlobalIndex:(int64_t)a5;
- (SUUIEntityProviding)entityProvider;
- (_NSRange)rangeForSectionAtIndex:(int64_t)a3;
- (id)entityIndexPathForGlobalIndex:(int64_t)a3;
- (int64_t)globalIndexForEntityIndexPath:(id)a3;
- (int64_t)numberOfSections;
- (int64_t)totalNumberOfEntities;
- (void)_loadDataIfNeeded;
- (void)dealloc;
- (void)reloadData;
- (void)setEntityProvider:(id)a3;
@end

@implementation SUUIDynamicPageSectionIndexMapper

- (void)dealloc
{
  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (sectionIndexToEntityRange)
  {
    free(sectionIndexToEntityRange);
    self->_sectionIndexToEntityRange = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicPageSectionIndexMapper;
  [(SUUIDynamicPageSectionIndexMapper *)&v4 dealloc];
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (void)setEntityProvider:(id)a3
{
  v5 = (SUUIEntityProviding *)a3;
  uint64_t p_entityProvider = (uint64_t)&self->_entityProvider;
  if (self->_entityProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_entityProvider, a3);
    uint64_t p_entityProvider = objc_opt_respondsToSelector();
    v5 = v7;
    *(unsigned char *)&self->_entityProviderFlags = *(unsigned char *)&self->_entityProviderFlags & 0xFE | p_entityProvider & 1;
    self->_numberOfSections = -1;
  }
  MEMORY[0x270F9A758](p_entityProvider, v5);
}

- (int64_t)totalNumberOfEntities
{
  [(SUUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
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
  [(SUUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(SUUIDynamicPageSectionIndexMapper *)self getItem:&v8 section:&v7 forGlobalIndex:a3])
  {
    v5 = [MEMORY[0x263F088C8] indexPathForItem:v8 inSection:v7];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)getItem:(unint64_t *)a3 section:(unint64_t *)a4 forGlobalIndex:(int64_t)a5
{
  [(SUUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  int64_t numberOfSections = self->_numberOfSections;
  BOOL v10 = numberOfSections < 1;
  int64_t v11 = numberOfSections - 1;
  if (v10) {
    return 0;
  }
  sectionIndexToEntityRange = self->_sectionIndexToEntityRange;
  if (!sectionIndexToEntityRange) {
    return 0;
  }
  int64_t v13 = 0;
  while (1)
  {
    uint64_t v14 = v11 + v13;
    if (v11 + v13 < 0 != __OFADD__(v11, v13)) {
      ++v14;
    }
    unint64_t v15 = v14 >> 1;
    v16 = &sectionIndexToEntityRange[v15];
    unint64_t location = v16->location;
    unint64_t length = v16->length;
    BOOL v20 = a5 >= v16->location;
    unint64_t v19 = a5 - v16->location;
    BOOL v20 = !v20 || v19 >= length;
    if (!v20) {
      break;
    }
    if (a5 < location) {
      int64_t v11 = v15 - 1;
    }
    else {
      int64_t v13 = v15 + 1;
    }
    if (v11 < v13) {
      return 0;
    }
  }
  if (a3) {
    *a3 = v19;
  }
  if (a4) {
    *a4 = v15;
  }
  return 1;
}

- (int64_t)globalIndexForEntityIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 section];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 < self->_numberOfSections)
  {
    uint64_t v7 = &self->_sectionIndexToEntityRange[v5];
    NSUInteger location = v7->location;
    NSUInteger length = v7->length;
    unint64_t v10 = [v4 item];
    if (v10 < length) {
      int64_t v6 = v10 + location;
    }
  }

  return v6;
}

- (_NSRange)rangeForSectionAtIndex:(int64_t)a3
{
  [(SUUIDynamicPageSectionIndexMapper *)self _loadDataIfNeeded];
  NSUInteger length = 0;
  int64_t numberOfSections = self->_numberOfSections;
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  if (numberOfSections > a3 && (a3 & 0x8000000000000000) == 0 && numberOfSections >= 1)
  {
    uint64_t v8 = &self->_sectionIndexToEntityRange[a3];
    NSUInteger location = v8->location;
    NSUInteger length = v8->length;
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
      uint64_t v4 = [(SUUIEntityProviding *)self->_entityProvider numberOfSections];
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
      uint64_t v8 = [(SUUIEntityProviding *)self->_entityProvider numberOfEntitiesInSection:v6];
      v9 = &self->_sectionIndexToEntityRange[v5];
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

- (SUUIEntityProviding)entityProvider
{
  return self->_entityProvider;
}

- (void).cxx_destruct
{
}

@end