@interface SFSearchEngineControllerWrapper
- (NSArray)currentSearchEngineNames;
- (NSString)defaultSearchEngineName;
- (NSString)privateSearchEngineName;
- (SFSearchEngineControllerWrapper)init;
- (void)setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4;
@end

@implementation SFSearchEngineControllerWrapper

- (SFSearchEngineControllerWrapper)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFSearchEngineControllerWrapper;
  v2 = [(SFSearchEngineControllerWrapper *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)get_SFSearchEngineControllerClass_softClass;
    uint64_t v14 = get_SFSearchEngineControllerClass_softClass;
    if (!get_SFSearchEngineControllerClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __get_SFSearchEngineControllerClass_block_invoke;
      v10[3] = &unk_1E54EA8A0;
      v10[4] = &v11;
      __get_SFSearchEngineControllerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    v5 = (_SFSearchEngineController *)objc_alloc_init(v4);
    searchEngineController = v2->_searchEngineController;
    v2->_searchEngineController = v5;

    v7 = v2;
  }

  return v2;
}

- (void)setDefaultSearchEngine:(id)a3 forPrivateBrowsing:(BOOL)a4
{
}

- (NSArray)currentSearchEngineNames
{
  return (NSArray *)[(_SFSearchEngineController *)self->_searchEngineController searchEngineNames];
}

- (NSString)defaultSearchEngineName
{
  return (NSString *)[(_SFSearchEngineController *)self->_searchEngineController defaultSearchEngineNameForPrivateBrowsing:0];
}

- (NSString)privateSearchEngineName
{
  return (NSString *)[(_SFSearchEngineController *)self->_searchEngineController defaultSearchEngineNameForPrivateBrowsing:1];
}

- (void).cxx_destruct
{
}

@end