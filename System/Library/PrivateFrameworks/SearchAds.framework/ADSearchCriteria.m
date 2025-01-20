@interface ADSearchCriteria
- (NSString)languageLocale;
- (NSString)searchTerm;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLanguageLocale:(id)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation ADSearchCriteria

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ADSearchCriteria);
  v9 = objc_msgSend_languageLocale(self, v5, v6, v7, v8);
  objc_msgSend_setLanguageLocale_(v4, v10, (uint64_t)v9, v11, v12);

  v17 = objc_msgSend_searchTerm(self, v13, v14, v15, v16);
  objc_msgSend_setSearchTerm_(v4, v18, (uint64_t)v17, v19, v20);

  return v4;
}

- (NSString)languageLocale
{
  return self->_languageLocale;
}

- (void)setLanguageLocale:(id)a3
{
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_languageLocale, 0);
}

@end