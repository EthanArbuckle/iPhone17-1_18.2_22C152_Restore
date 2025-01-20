@interface PGTriggeredMemory
- (BOOL)generatedWithFallbackRequirements;
- (NSArray)blockableFeatures;
- (NSDate)creationDate;
- (NSDictionary)validityIntervalByTriggerType;
- (NSIndexSet)triggerTypes;
- (NSString)description;
- (NSString)uniqueMemoryIdentifier;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMomentNodeCollection)memoryMomentNodes;
- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 generatedWithFallbackRequirements:(BOOL)a10;
- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 photosGraphVersion:(int64_t)a10;
- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 photosGraphVersion:(int64_t)a10 generatedWithFallbackRequirements:(BOOL)a11;
- (PGTriggeredMemory)initWithMemoryNode:(id)a3 validityIntervalByTriggerType:(id)a4 creationDate:(id)a5;
- (double)electionScore;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (int64_t)photosGraphVersion;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
- (void)setBlockableFeatures:(id)a3;
- (void)setElectionScore:(double)a3;
@end

@implementation PGTriggeredMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockableFeatures, 0);
  objc_storeStrong((id *)&self->_validityIntervalByTriggerType, 0);
  objc_storeStrong((id *)&self->_uniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
  objc_storeStrong((id *)&self->_triggerTypes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_memoryMomentNodes, 0);
}

- (int64_t)photosGraphVersion
{
  return self->_photosGraphVersion;
}

- (void)setElectionScore:(double)a3
{
  self->_electionScore = a3;
}

- (double)electionScore
{
  return self->_electionScore;
}

- (void)setBlockableFeatures:(id)a3
{
}

- (NSArray)blockableFeatures
{
  return self->_blockableFeatures;
}

- (NSDictionary)validityIntervalByTriggerType
{
  return self->_validityIntervalByTriggerType;
}

- (NSString)uniqueMemoryIdentifier
{
  return self->_uniqueMemoryIdentifier;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return self->_memoryFeatureNodes;
}

- (NSIndexSet)triggerTypes
{
  return self->_triggerTypes;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  return self->_memoryMomentNodes;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  return self->_memoryFeatureNodes;
}

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGTriggeredMemory;
  v4 = [(PGTriggeredMemory *)&v11 description];
  v5 = +[PGGraphBuilder memoryLabelForCategory:[(PGTriggeredMemory *)self memoryCategory]];
  v6 = [(PGTriggeredMemory *)self memoryFeatureNodes];
  v7 = [(PGTriggeredMemory *)self triggerTypes];
  v8 = [(PGTriggeredMemory *)self creationDate];
  v9 = [v3 stringWithFormat:@"%@ memoryCategory: %@, features: %@, triggerTypes: %@, creationDate: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (PGTriggeredMemory)initWithMemoryNode:(id)a3 validityIntervalByTriggerType:(id)a4 creationDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 memoryCategory];
  uint64_t v11 = [v9 memoryCategorySubcategory];
  v12 = [v9 memoryMomentNodes];
  v13 = [v9 memoryFeatureNodes];
  v14 = [v9 uniqueMemoryIdentifier];
  uint64_t v15 = PLPhotosGraphVersionFromAlgorithmsVersions();
  char v16 = [v9 generatedWithFallbackRequirements];

  LOBYTE(v19) = v16;
  v17 = [(PGTriggeredMemory *)self initWithMemoryCategory:v10 memoryCategorySubcategory:v11 memoryMomentNodes:v12 memoryFeatureNodes:v13 validityIntervalByTriggerType:v8 creationDate:v7 uniqueMemoryIdentifier:v14 photosGraphVersion:v15 generatedWithFallbackRequirements:v19];

  return v17;
}

- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 generatedWithFallbackRequirements:(BOOL)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  LOBYTE(v24) = a10;
  v22 = [(PGTriggeredMemory *)self initWithMemoryCategory:a3 memoryCategorySubcategory:a4 memoryMomentNodes:v21 memoryFeatureNodes:v20 validityIntervalByTriggerType:v19 creationDate:v18 uniqueMemoryIdentifier:v17 photosGraphVersion:PLPhotosGraphVersionFromAlgorithmsVersions() generatedWithFallbackRequirements:v24];

  return v22;
}

- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 photosGraphVersion:(int64_t)a10
{
  LOBYTE(v11) = 0;
  return [(PGTriggeredMemory *)self initWithMemoryCategory:a3 memoryCategorySubcategory:a4 memoryMomentNodes:a5 memoryFeatureNodes:a6 validityIntervalByTriggerType:a7 creationDate:a8 uniqueMemoryIdentifier:a9 photosGraphVersion:a10 generatedWithFallbackRequirements:v11];
}

- (PGTriggeredMemory)initWithMemoryCategory:(unint64_t)a3 memoryCategorySubcategory:(unint64_t)a4 memoryMomentNodes:(id)a5 memoryFeatureNodes:(id)a6 validityIntervalByTriggerType:(id)a7 creationDate:(id)a8 uniqueMemoryIdentifier:(id)a9 photosGraphVersion:(int64_t)a10 generatedWithFallbackRequirements:(BOOL)a11
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v34 = a8;
  id v33 = a9;
  v39.receiver = self;
  v39.super_class = (Class)PGTriggeredMemory;
  id v20 = [(PGTriggeredMemory *)&v39 init];
  id v21 = v20;
  if (v20)
  {
    id v31 = v17;
    v20->_memoryCategory = a3;
    v20->_memoryCategorySubcategory = a4;
    objc_storeStrong((id *)&v20->_memoryMomentNodes, a5);
    objc_storeStrong((id *)&v21->_memoryFeatureNodes, a6);
    objc_storeStrong((id *)&v21->_creationDate, a8);
    objc_storeStrong((id *)&v21->_validityIntervalByTriggerType, a7);
    objc_storeStrong((id *)&v21->_uniqueMemoryIdentifier, a9);
    v21->_photosGraphVersion = a10;
    v21->_generatedWithFallbackRequirements = a11;
    v22 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v23 = v19;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
    id v25 = v19;
    if (v24)
    {
      uint64_t v26 = v24;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v23);
          }
          -[NSIndexSet addIndex:](v22, "addIndex:", [*(id *)(*((void *)&v35 + 1) + 8 * i) unsignedIntegerValue]);
        }
        uint64_t v26 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v26);
    }

    triggerTypes = v21->_triggerTypes;
    v21->_triggerTypes = v22;

    id v19 = v25;
    id v17 = v31;
  }

  return v21;
}

@end