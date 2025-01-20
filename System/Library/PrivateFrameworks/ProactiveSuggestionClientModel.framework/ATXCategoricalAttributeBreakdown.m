@interface ATXCategoricalAttributeBreakdown
- (ATXCategoricalAttributeBreakdown)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXDeviceLevelMetricsCategoricalAttributeBreakdown:(id)a3;
- (double)normalizedCountForCategory:(id)a3;
- (id)allCategories;
- (unint64_t)countForCategory:(id)a3;
- (unint64_t)hash;
- (void)incrementCountForCategory:(id)a3 by:(unint64_t)a4;
@end

@implementation ATXCategoricalAttributeBreakdown

- (ATXCategoricalAttributeBreakdown)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXCategoricalAttributeBreakdown;
  v2 = [(ATXCategoricalAttributeBreakdown *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    counts = v2->_counts;
    v2->_counts = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)allCategories
{
  return (id)[(NSMutableDictionary *)self->_counts allKeys];
}

- (unint64_t)countForCategory:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_counts objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)normalizedCountForCategory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableDictionary *)self->_counts allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v9 = v9 + (double)(unint64_t)[*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);

    double v11 = 0.0;
    if (v9 != 0.0) {
      double v11 = (double)[(ATXCategoricalAttributeBreakdown *)self countForCategory:v4] / v9;
    }
  }
  else
  {

    double v11 = 0.0;
  }

  return v11;
}

- (void)incrementCountForCategory:(id)a3 by:(unint64_t)a4
{
  counts = self->_counts;
  id v7 = a3;
  uint64_t v8 = [(NSMutableDictionary *)counts objectForKeyedSubscript:v7];
  double v9 = NSNumber;
  id v11 = v8;
  if (v8) {
    a4 += [v8 unsignedIntegerValue];
  }
  v10 = [v9 numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)self->_counts setObject:v10 forKeyedSubscript:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCategoricalAttributeBreakdown *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCategoricalAttributeBreakdown *)self isEqualToATXDeviceLevelMetricsCategoricalAttributeBreakdown:v5];

  return v6;
}

- (BOOL)isEqualToATXDeviceLevelMetricsCategoricalAttributeBreakdown:(id)a3
{
  id v4 = self->_counts;
  v5 = v4;
  if (v4 == *((NSMutableDictionary **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableDictionary isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_counts hash];
}

- (void).cxx_destruct
{
}

@end