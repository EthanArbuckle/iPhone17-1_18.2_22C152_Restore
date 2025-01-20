@interface ICCoreDataCoreSpotlightDelegate
- (BOOL)isCheckingObjectConsistency;
- (BOOL)shouldIndexableObjectExistInIndexing:(id)a3;
- (BOOL)shouldPerformConsistencyCheck;
- (id)attributeSetForObject:(id)a3;
- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4 indexingPriority:(unint64_t)a5;
- (unint64_t)indexingPriority;
- (void)dealloc;
- (void)setIndexingPriority:(unint64_t)a3;
- (void)setIsCheckingObjectConsistency:(BOOL)a3;
- (void)startSpotlightIndexing;
- (void)stopSpotlightIndexing;
@end

@implementation ICCoreDataCoreSpotlightDelegate

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4 indexingPriority:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  id result = [(NSCoreDataCoreSpotlightDelegate *)&v7 initForStoreWithDescription:a3 coordinator:a4];
  if (result) {
    *((void *)result + 16) = a5;
  }
  return result;
}

- (void)dealloc
{
  [(ICCoreDataCoreSpotlightDelegate *)self stopSpotlightIndexing];
  v3.receiver = self;
  v3.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  [(NSCoreDataCoreSpotlightDelegate *)&v3 dealloc];
}

- (void)startSpotlightIndexing
{
  v2.receiver = self;
  v2.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  [(NSCoreDataCoreSpotlightDelegate *)&v2 startSpotlightIndexing];
}

- (void)stopSpotlightIndexing
{
  v2.receiver = self;
  v2.super_class = (Class)ICCoreDataCoreSpotlightDelegate;
  [(NSCoreDataCoreSpotlightDelegate *)&v2 stopSpotlightIndexing];
}

- (BOOL)shouldIndexableObjectExistInIndexing:(id)a3
{
  id v3 = a3;
  if ([v3 isDeleted]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isHiddenFromSearch] ^ 1;
  }

  return v4;
}

- (id)attributeSetForObject:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26C15BD40])
  {
    os_log_t v5 = (os_log_t)v4;
    BOOL v6 = [(ICCoreDataCoreSpotlightDelegate *)self shouldIndexableObjectExistInIndexing:v5];
    objc_super v7 = os_log_create("com.apple.notes", "SearchIndexer");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8) {
        -[ICCoreDataCoreSpotlightDelegate attributeSetForObject:](v5);
      }

      v9 = [v5 searchableItemAttributeSet];
      v10 = [v5 searchIndexingIdentifier];
      [v9 setUniqueIdentifier:v10];

      v11 = [MEMORY[0x263EFF910] distantFuture];
      [v9 setExpirationDate:v11];

      v12 = [v5 searchDomainIdentifier];
      [v9 setDomainIdentifier:v12];

      objc_super v7 = [v5 dataSourceIdentifier];
      objc_msgSend(v9, "setIc_dataSourceIdentifier:", v7);
    }
    else
    {
      if (v8) {
        -[ICCoreDataCoreSpotlightDelegate attributeSetForObject:](v5);
      }

      v9 = 0;
    }
  }
  else
  {
    os_log_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICCoreDataCoreSpotlightDelegate attributeSetForObject:](v5);
    }
    v9 = 0;
  }

  return v9;
}

- (unint64_t)indexingPriority
{
  return self->_indexingPriority;
}

- (void)setIndexingPriority:(unint64_t)a3
{
  self->_indexingPriority = a3;
}

- (BOOL)isCheckingObjectConsistency
{
  return self->_isCheckingObjectConsistency;
}

- (void)setIsCheckingObjectConsistency:(BOOL)a3
{
  self->_isCheckingObjectConsistency = a3;
}

- (BOOL)shouldPerformConsistencyCheck
{
  return self->_shouldPerformConsistencyCheck;
}

- (void)attributeSetForObject:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 searchIndexingIdentifier];
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v2, v3, "-attributeSetForObject: need to index ICSearchIndexable: %@", v4, v5, v6, v7, 2u);
}

- (void)attributeSetForObject:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 searchIndexingIdentifier];
  OUTLINED_FUNCTION_0_2(&dword_20C263000, v2, v3, "-attributeSetForObject: NO need to index ICSearchIndexable: %@", v4, v5, v6, v7, 2u);
}

- (void)attributeSetForObject:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "-attributeSetForObject: called with a non-ICSearchIndexable object", v1, 2u);
}

@end