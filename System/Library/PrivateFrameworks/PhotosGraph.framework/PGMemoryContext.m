@interface PGMemoryContext
- (BOOL)futureLookup;
- (NSDate)creationDateOfLastMemory;
- (NSDate)localDate;
- (NSIndexSet)categoriesDeniedForContextual;
- (NSIndexSet)categoriesDeniedForFallback;
- (NSTimeZone)timeZone;
- (PGMemoryContext)initWithFutureLocalDate:(id)a3 timeZone:(id)a4 photoLibrary:(id)a5;
- (PGMemoryContext)initWithLocalDate:(id)a3 timeZone:(id)a4 photoLibrary:(id)a5;
- (PGMemoryContext)initWithMemoryPlanner:(id)a3 photoLibrary:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (unint64_t)numberOfDaysSinceMemoryUpgrade;
- (void)initDeniedCategoriesWithPhotoLibrary:(id)a3;
- (void)setCreationDateOfLastMemory:(id)a3;
- (void)setNumberOfDaysSinceMemoryUpgrade:(unint64_t)a3;
@end

@implementation PGMemoryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesDeniedForFallback, 0);
  objc_storeStrong((id *)&self->_categoriesDeniedForContextual, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_creationDateOfLastMemory, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localDate, 0);
}

- (NSIndexSet)categoriesDeniedForFallback
{
  return self->_categoriesDeniedForFallback;
}

- (NSIndexSet)categoriesDeniedForContextual
{
  return self->_categoriesDeniedForContextual;
}

- (BOOL)futureLookup
{
  return self->_futureLookup;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setNumberOfDaysSinceMemoryUpgrade:(unint64_t)a3
{
  self->_numberOfDaysSinceMemoryUpgrade = a3;
}

- (unint64_t)numberOfDaysSinceMemoryUpgrade
{
  return self->_numberOfDaysSinceMemoryUpgrade;
}

- (void)setCreationDateOfLastMemory:(id)a3
{
}

- (NSDate)creationDateOfLastMemory
{
  return self->_creationDateOfLastMemory;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (PGMemoryContext)initWithFutureLocalDate:(id)a3 timeZone:(id)a4 photoLibrary:(id)a5
{
  result = [(PGMemoryContext *)self initWithLocalDate:a3 timeZone:a4 photoLibrary:a5];
  if (result) {
    result->_futureLookup = 1;
  }
  return result;
}

- (PGMemoryContext)initWithMemoryPlanner:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 configuration];
  v9 = [v8 localDate];
  v10 = [v8 timeZone];
  v11 = [(PGMemoryContext *)self initWithLocalDate:v9 timeZone:v10 photoLibrary:v7];

  if (v11)
  {
    uint64_t v12 = [v6 creationDateOfLastMemory];
    creationDateOfLastMemory = v11->_creationDateOfLastMemory;
    v11->_creationDateOfLastMemory = (NSDate *)v12;

    v11->_numberOfDaysSinceMemoryUpgrade = [v6 numberOfDaysSinceMemoryUpgrade];
  }

  return v11;
}

- (void)initDeniedCategoriesWithPhotoLibrary:(id)a3
{
  v4 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  [(NSIndexSet *)v4 addIndex:8];
  [(NSIndexSet *)v4 addIndex:23];
  [(NSIndexSet *)v4 addIndex:31];
  categoriesDeniedForFallback = self->_categoriesDeniedForFallback;
  self->_categoriesDeniedForFallback = v4;
  v8 = v4;

  id v6 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  [(NSIndexSet *)v6 addIndex:31];
  categoriesDeniedForContextual = self->_categoriesDeniedForContextual;
  self->_categoriesDeniedForContextual = v6;
}

- (PGMemoryContext)initWithLocalDate:(id)a3 timeZone:(id)a4 photoLibrary:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PGMemoryContext;
  uint64_t v12 = [(PGMemoryContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localDate, a3);
    if (v10)
    {
      v14 = (NSTimeZone *)v10;
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    }
    timeZone = v13->_timeZone;
    v13->_timeZone = v14;

    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    v13->_futureLookup = 0;
    [(PGMemoryContext *)v13 initDeniedCategoriesWithPhotoLibrary:v11];
  }

  return v13;
}

@end