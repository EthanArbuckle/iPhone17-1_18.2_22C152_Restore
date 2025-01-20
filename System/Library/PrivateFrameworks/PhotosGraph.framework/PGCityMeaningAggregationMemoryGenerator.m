@interface PGCityMeaningAggregationMemoryGenerator
+ (id)requiredFeatureRelation;
+ (id)supportedMeaningLabels;
- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3;
@end

@implementation PGCityMeaningAggregationMemoryGenerator

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode cityOfMoment];
}

+ (id)supportedMeaningLabels
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Entertainment";
  v4[1] = @"Performance";
  v4[2] = @"SportEvent";
  v4[3] = @"NightOut";
  v4[4] = @"Lunch";
  v4[5] = @"Dinner";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 11008;
  }
  int v3 = a3;
  if (a3 == 3) {
    return 11009;
  }
  v5 = [(PGMemoryGenerator *)self loggingConnection];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_error_impl(&dword_1D1805000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

@end