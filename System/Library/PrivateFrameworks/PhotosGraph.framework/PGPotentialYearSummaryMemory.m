@interface PGPotentialYearSummaryMemory
- (PGPotentialYearSummaryMemory)initWithMomentNodes:(id)a3;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (int64_t)year;
- (unint64_t)memoryCategory;
- (void)setYear:(int64_t)a3;
@end

@implementation PGPotentialYearSummaryMemory

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
}

- (int64_t)year
{
  return self->_year;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  v3 = +[PGGraphYearNodeCollection yearNodesForYear:self->_year inGraph:a3];
  v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)memoryCategory
{
  return 8;
}

- (PGPotentialYearSummaryMemory)initWithMomentNodes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PGPotentialYearSummaryMemory;
  return [(PGPotentialMemory *)&v4 initWithCategory:201 subcategory:0 momentNodes:a3 sourceType:2];
}

@end