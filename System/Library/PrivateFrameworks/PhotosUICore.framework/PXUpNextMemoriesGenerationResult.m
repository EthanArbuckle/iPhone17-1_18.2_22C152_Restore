@interface PXUpNextMemoriesGenerationResult
- (NSString)debugInfo;
- (PHFetchResult)memories;
- (PXUpNextMemoriesGenerationResult)initWithMemories:(id)a3 debugInfo:(id)a4;
@end

@implementation PXUpNextMemoriesGenerationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_memories, 0);
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (PHFetchResult)memories
{
  return self->_memories;
}

- (PXUpNextMemoriesGenerationResult)initWithMemories:(id)a3 debugInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXUpNextMemoriesGenerationResult;
  v9 = [(PXUpNextMemoriesGenerationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memories, a3);
    objc_storeStrong((id *)&v10->_debugInfo, a4);
  }

  return v10;
}

@end