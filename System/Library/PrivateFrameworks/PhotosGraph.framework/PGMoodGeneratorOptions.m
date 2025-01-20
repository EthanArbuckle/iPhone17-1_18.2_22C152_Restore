@interface PGMoodGeneratorOptions
- (NSArray)moodHistory;
- (NSArray)prefetchedAssets;
- (NSDate)referenceDate;
- (NSDictionary)sceneIdentifiersByMomentNodeIdentifier;
- (NSSet)momentIDs;
- (PGMoodGenerationContext)moodGenerationContext;
- (unint64_t)memoryCategory;
- (unint64_t)memorySubcategory;
- (void)setMemoryCategory:(unint64_t)a3;
- (void)setMemorySubcategory:(unint64_t)a3;
- (void)setMomentIDs:(id)a3;
- (void)setMoodGenerationContext:(id)a3;
- (void)setMoodHistory:(id)a3;
- (void)setPrefetchedAssets:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setSceneIdentifiersByMomentNodeIdentifier:(id)a3;
@end

@implementation PGMoodGeneratorOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moodGenerationContext, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersByMomentNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_prefetchedAssets, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_momentIDs, 0);
  objc_storeStrong((id *)&self->_moodHistory, 0);
}

- (void)setMoodGenerationContext:(id)a3
{
}

- (PGMoodGenerationContext)moodGenerationContext
{
  return self->_moodGenerationContext;
}

- (void)setSceneIdentifiersByMomentNodeIdentifier:(id)a3
{
}

- (NSDictionary)sceneIdentifiersByMomentNodeIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPrefetchedAssets:(id)a3
{
}

- (NSArray)prefetchedAssets
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReferenceDate:(id)a3
{
}

- (NSDate)referenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMomentIDs:(id)a3
{
}

- (NSSet)momentIDs
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMoodHistory:(id)a3
{
}

- (NSArray)moodHistory
{
  return self->_moodHistory;
}

- (void)setMemorySubcategory:(unint64_t)a3
{
  self->_memorySubcategory = a3;
}

- (unint64_t)memorySubcategory
{
  return self->_memorySubcategory;
}

- (void)setMemoryCategory:(unint64_t)a3
{
  self->_memoryCategory = a3;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

@end