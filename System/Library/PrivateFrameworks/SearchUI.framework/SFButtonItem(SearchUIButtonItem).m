@interface SFButtonItem(SearchUIButtonItem)
- (uint64_t)_searchUIButtonItemGeneratorClass;
- (void)_searchUIButtonItemGeneratorClass;
@end

@implementation SFButtonItem(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  v2 = SearchUIGeneralLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(SFButtonItem(SearchUIButtonItem) *)a1 _searchUIButtonItemGeneratorClass];
  }

  return 0;
}

- (void)_searchUIButtonItemGeneratorClass
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Unsupported buttonItem: %@", (uint8_t *)&v5, 0xCu);
}

@end