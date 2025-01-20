@interface PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort
- (NSArray)memoryNodesWithLocalMemoryLastEnrichmentDate;
- (NSArray)memoryNodesWithoutLocalMemory;
- (NSArray)memoryNodesWithoutLocalMemoryLastEnrichmentDate;
- (PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort)init;
- (void)setMemoryNodesWithLocalMemoryLastEnrichmentDate:(id)a3;
- (void)setMemoryNodesWithoutLocalMemory:(id)a3;
- (void)setMemoryNodesWithoutLocalMemoryLastEnrichmentDate:(id)a3;
@end

@implementation PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNodesWithLocalMemoryLastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_memoryNodesWithoutLocalMemoryLastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_memoryNodesWithoutLocalMemory, 0);
}

- (void)setMemoryNodesWithLocalMemoryLastEnrichmentDate:(id)a3
{
}

- (NSArray)memoryNodesWithLocalMemoryLastEnrichmentDate
{
  return self->_memoryNodesWithLocalMemoryLastEnrichmentDate;
}

- (void)setMemoryNodesWithoutLocalMemoryLastEnrichmentDate:(id)a3
{
}

- (NSArray)memoryNodesWithoutLocalMemoryLastEnrichmentDate
{
  return self->_memoryNodesWithoutLocalMemoryLastEnrichmentDate;
}

- (void)setMemoryNodesWithoutLocalMemory:(id)a3
{
}

- (NSArray)memoryNodesWithoutLocalMemory
{
  return self->_memoryNodesWithoutLocalMemory;
}

- (PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort)init
{
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort;
  v2 = [(PGGraphMemoriesEnrichmentProcessorMemoryNodesToSort *)&v9 init];
  v3 = v2;
  if (v2)
  {
    memoryNodesWithoutLocalMemory = v2->_memoryNodesWithoutLocalMemory;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_memoryNodesWithoutLocalMemory = (NSArray *)MEMORY[0x1E4F1CBF0];

    memoryNodesWithoutLocalMemoryLastEnrichmentDate = v3->_memoryNodesWithoutLocalMemoryLastEnrichmentDate;
    v3->_memoryNodesWithoutLocalMemoryLastEnrichmentDate = v5;

    memoryNodesWithLocalMemoryLastEnrichmentDate = v3->_memoryNodesWithLocalMemoryLastEnrichmentDate;
    v3->_memoryNodesWithLocalMemoryLastEnrichmentDate = v5;
  }
  return v3;
}

@end