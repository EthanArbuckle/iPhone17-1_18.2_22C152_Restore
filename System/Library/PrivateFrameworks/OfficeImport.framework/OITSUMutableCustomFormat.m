@interface OITSUMutableCustomFormat
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation OITSUMutableCustomFormat

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = +[OITSUCustomFormat allocWithZone:a3];
  v5 = [(OITSUCustomFormat *)self formatName];
  uint64_t v6 = [(OITSUCustomFormat *)self formatType];
  v7 = [(OITSUCustomFormat *)self defaultFormatData];
  v8 = [(OITSUCustomFormat *)v4 initWithName:v5 formatType:v6 data:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(OITSUCustomFormat *)self conditionList];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 conditionType];
        [v14 conditionValue];
        double v17 = v16;
        v18 = [v14 data];
        [(OITSUCustomFormat *)v8 p_addConditionOfType:v15 value:v18 data:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

@end