@interface PGUpNextMemoriesGenerationResult
- (NSArray)memoryLocalIdentifiers;
- (NSDictionary)dictionaryRepresentation;
- (NSString)debugInfo;
- (PGUpNextMemoriesGenerationResult)initWithMemoryLocalIdentifiers:(id)a3 debugInfo:(id)a4;
@end

@implementation PGUpNextMemoriesGenerationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_memoryLocalIdentifiers, 0);
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (NSArray)memoryLocalIdentifiers
{
  return self->_memoryLocalIdentifiers;
}

- (NSDictionary)dictionaryRepresentation
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F8B1A0];
  v6[0] = *MEMORY[0x1E4F8B1A8];
  v6[1] = v2;
  debugInfo = self->_debugInfo;
  v7[0] = self->_memoryLocalIdentifiers;
  v7[1] = debugInfo;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  return (NSDictionary *)v4;
}

- (PGUpNextMemoriesGenerationResult)initWithMemoryLocalIdentifiers:(id)a3 debugInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGUpNextMemoriesGenerationResult;
  v9 = [(PGUpNextMemoriesGenerationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memoryLocalIdentifiers, a3);
    objc_storeStrong((id *)&v10->_debugInfo, a4);
  }

  return v10;
}

@end