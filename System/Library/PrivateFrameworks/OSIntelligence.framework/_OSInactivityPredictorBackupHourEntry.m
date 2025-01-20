@interface _OSInactivityPredictorBackupHourEntry
+ (BOOL)supportsSecureCoding;
+ (id)descriptionWithHistoryEntries:(id)a3;
- (_OSInactivityPredictorBackupHourEntry)initWithCoder:(id)a3;
- (double)averageDuration;
- (double)stdDev;
- (void)setAverageDuration:(double)a3;
- (void)setStdDev:(double)a3;
@end

@implementation _OSInactivityPredictorBackupHourEntry

+ (id)descriptionWithHistoryEntries:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  v6 = [MEMORY[0x1E4F28E78] string];
  [v6 appendFormat:@"Backup: {\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v3 objectForKeyedSubscript:v12];
        [v6 appendFormat:@"  Hour %@: %@\n", v12, v13, (void)v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v6 appendFormat:@"}"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_OSInactivityPredictorBackupHourEntry)initWithCoder:(id)a3
{
  return 0;
}

- (double)averageDuration
{
  return self->_averageDuration;
}

- (void)setAverageDuration:(double)a3
{
  self->_averageDuration = a3;
}

- (double)stdDev
{
  return self->_stdDev;
}

- (void)setStdDev:(double)a3
{
  self->_stdDev = a3;
}

@end