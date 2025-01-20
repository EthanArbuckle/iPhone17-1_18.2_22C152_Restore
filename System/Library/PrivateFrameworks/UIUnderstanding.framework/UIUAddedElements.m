@interface UIUAddedElements
- (AddedElementsCompat)underlyingObject;
- (NSArray)results;
- (NSString)groupID;
- (UIUAddedElements)initWithContents:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation UIUAddedElements

- (UIUAddedElements)initWithContents:(id)a3
{
  v4 = (AddedElementsCompat *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UIUAddedElements;
  v5 = [(UIUAddedElements *)&v8 init];
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (NSArray)results
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(UIUAddedElements *)self underlyingObject];
  v5 = [v4 dedupeElements];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [[UIUDedupeElement alloc] initWithContents:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSString)groupID
{
  v2 = [(UIUAddedElements *)self underlyingObject];
  v3 = [v2 groupID];

  return (NSString *)v3;
}

- (void)setResults:(id)a3
{
}

- (void)setGroupID:(id)a3
{
}

- (AddedElementsCompat)underlyingObject
{
  return (AddedElementsCompat *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end