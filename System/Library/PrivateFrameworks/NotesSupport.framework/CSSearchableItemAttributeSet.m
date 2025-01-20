@interface CSSearchableItemAttributeSet
@end

@implementation CSSearchableItemAttributeSet

uint64_t __67__CSSearchableItemAttributeSet_IC__ic_customAttributeKeyDictionary__block_invoke()
{
  ic_customAttributeKeyDictionary_sCustomAttributeKeyDictionary = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

uint64_t __68__CSSearchableItemAttributeSet_IC__ic_dataSourceIdentifierCustomKey__block_invoke()
{
  ic_dataSourceIdentifierCustomKey_sDataSourceIdentifierCustomKey = [objc_alloc(MEMORY[0x263F02A38]) initWithKeyName:@"DataSourceIdentifier" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  return MEMORY[0x270F9A758]();
}

@end