@interface CMIndexingState
- (CMIndexingState)init;
- (CSSearchableItemAttributeSet)searchableAttributes;
- (NSMutableDictionary)metadata;
- (NSMutableString)textContent;
- (void)setMetadata:(id)a3;
- (void)setSearchableAttributes:(id)a3;
- (void)setTextContent:(id)a3;
@end

@implementation CMIndexingState

- (CMIndexingState)init
{
  v10.receiver = self;
  v10.super_class = (Class)CMIndexingState;
  v2 = [(CMState *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    metadata = v2->_metadata;
    v2->_metadata = v3;

    v5 = (CSSearchableItemAttributeSet *)objc_alloc_init(MEMORY[0x263F02AE8]);
    searchableAttributes = v2->_searchableAttributes;
    v2->_searchableAttributes = v5;

    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    textContent = v2->_textContent;
    v2->_textContent = v7;
  }
  return v2;
}

- (CSSearchableItemAttributeSet)searchableAttributes
{
  [(CSSearchableItemAttributeSet *)self->_searchableAttributes setTextContent:self->_textContent];
  searchableAttributes = self->_searchableAttributes;
  return searchableAttributes;
}

- (NSMutableDictionary)metadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetadata:(id)a3
{
}

- (void)setSearchableAttributes:(id)a3
{
}

- (NSMutableString)textContent
{
  return (NSMutableString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTextContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_searchableAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end