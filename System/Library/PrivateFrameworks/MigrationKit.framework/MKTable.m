@interface MKTable
- (MKTable)init;
- (NSMutableArray)columns;
- (NSMutableArray)rows;
- (void)addRow:(id)a3;
- (void)setColumns:(id)a3;
- (void)setRows:(id)a3;
- (void)writeToDisk:(id)a3;
- (void)writeToLog;
@end

@implementation MKTable

- (MKTable)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKTable;
  v2 = [(MKTable *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(MKTable *)v2 setRows:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(MKTable *)v2 setColumns:v4];
  }
  return v2;
}

- (void)addRow:(id)a3
{
  id v14 = a3;
  id v4 = [(MKTable *)self columns];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v14 totalColumns];

  if (v5 < v6)
  {
    do
    {
      v7 = [(MKTable *)self columns];
      v8 = objc_alloc_init(MKTableColumn);
      [v7 addObject:v8];

      v9 = [(MKTable *)self columns];
      unint64_t v10 = [v9 count];
      unint64_t v11 = [v14 totalColumns];
    }
    while (v10 < v11);
  }
  v12 = [(MKTable *)self columns];
  [v14 adjustColumnsToFit:v12];

  v13 = [(MKTable *)self rows];
  [v13 addObject:v14];
}

- (void)writeToLog
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(MKTable *)self rows];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 138412290;
    long long v13 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        unint64_t v10 = +[MKLog log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          unint64_t v11 = [(MKTable *)self columns];
          v12 = [v9 asciiRepresentationUsingColumns:v11];
          *(_DWORD *)buf = v13;
          v19 = v12;
          _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)writeToDisk:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(MKTable *)self rows];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v10) csvRepresentation];
        v12 = (void *)v11;
        if (v11) {
          [v5 appendFormat:@"%@\n", v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  id v17 = 0;
  int v13 = [v5 writeToFile:v4 atomically:0 encoding:4 error:&v17];
  id v14 = v17;
  long long v15 = +[MKLog log];
  long long v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = self;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22BFAC000, v16, OS_LOG_TYPE_INFO, "%@: Wrote table to disk at %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    [(MKTable *)(uint64_t)self writeToDisk:v16];
  }
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (NSMutableArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

- (void)writeToDisk:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "%@: Failed to write table to disk: %@", (uint8_t *)&v3, 0x16u);
}

@end