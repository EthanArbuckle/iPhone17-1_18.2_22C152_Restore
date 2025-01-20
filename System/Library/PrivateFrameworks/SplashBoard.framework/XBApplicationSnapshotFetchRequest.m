@interface XBApplicationSnapshotFetchRequest
+ (id)fetchRequest;
- (NSArray)NSSortDescriptors;
- (NSArray)sortDescriptors;
- (NSString)description;
- (XBApplicationSnapshotGenerationContext)fallbackGenerationContext;
- (XBApplicationSnapshotPredicate)predicate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setFallbackGenerationContext:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation XBApplicationSnapshotFetchRequest

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (XBApplicationSnapshotPredicate)predicate
{
  return self->_predicate;
}

- (XBApplicationSnapshotGenerationContext)fallbackGenerationContext
{
  return self->_fallbackGenerationContext;
}

- (NSArray)NSSortDescriptors
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_sortDescriptors, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_sortDescriptors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "NSSortDescriptor", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (void)setFallbackGenerationContext:(id)a3
{
}

+ (id)fetchRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackGenerationContext, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotFetchRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(XBApplicationSnapshotFetchRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F3F658] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(XBApplicationSnapshotFetchRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(XBApplicationSnapshotFetchRequest *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__XBApplicationSnapshotFetchRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2646A5BC0;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __75__XBApplicationSnapshotFetchRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"predicate" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"sortDescriptors" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"fallbackGenerationContext" skipIfNil:1];
}

@end