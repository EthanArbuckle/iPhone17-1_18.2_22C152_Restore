@interface MKPerformanceData
- (MKPerformanceData)initWithDictionary:(id)a3;
- (NSArray)dataClasses;
- (void)setDataClasses:(id)a3;
@end

@implementation MKPerformanceData

- (MKPerformanceData)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MKPerformanceData;
  v5 = [(MKPerformanceData *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"data_classes"];
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            v15 = [MKDataClassMetrics alloc];
            v16 = -[MKDataClassMetrics initWithDictionary:](v15, "initWithDictionary:", v14, (void)v19);
            [v8 addObject:v16];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v17 = [v8 sortedArrayUsingComparator:&__block_literal_global];
      [(MKPerformanceData *)v5 setDataClasses:v17];
    }
    else
    {
      v9 = +[MKLog log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MKPerformanceData initWithDictionary:]((uint64_t)v5, v9);
      }
    }
  }
  return v5;
}

uint64_t __40__MKPerformanceData_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)dataClasses
{
  return self->_dataClasses;
}

- (void)setDataClasses:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@: Invalid dictionary; missing 'data_classes' key.",
    (uint8_t *)&v2,
    0xCu);
}

@end