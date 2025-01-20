@interface TTKFileSink
- (id)generateData;
- (id)generateLayouts;
- (id)generateTestCases;
- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5;
- (void)addLayouts:(id)a3;
- (void)close;
- (void)pushNextTestCase:(id)a3;
@end

@implementation TTKFileSink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCases, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

- (void)close
{
  v3 = (void *)MEMORY[0x2455C2B00](self, a2);
  v4 = [MEMORY[0x263EFF9E0] outputStreamToFileAtPath:self->_fileName append:0];
  [v4 open];
  if ([v4 streamStatus] == 7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_23EFD2000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error opening JSON from a file", buf, 2u);
    }
    [v4 close];
  }
  else
  {
    v5 = [(TTKFileSink *)self generateData];
    uint64_t v6 = 0;
    if (![MEMORY[0x263F08900] writeJSONObject:v5 toStream:v4 options:1 error:&v6]) {
      NSLog(&cfstr_ErrorWritingJs.isa);
    }
    [v4 close];
  }
}

- (id)generateData
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:2];
  [v3 setObject:v4 forKeyedSubscript:@"major_version"];

  v5 = [NSNumber numberWithInt:0];
  [v3 setObject:v5 forKeyedSubscript:@"minor_version"];

  [v3 setObject:self->_inputMode forKeyedSubscript:@"input_mode"];
  if (self->_layouts)
  {
    uint64_t v6 = [(TTKFileSink *)self generateLayouts];
    [v3 setObject:v6 forKeyedSubscript:@"layouts"];
  }
  if (self->_testCases)
  {
    v7 = [(TTKFileSink *)self generateTestCases];
    [v3 setObject:v7 forKeyedSubscript:@"test_cases"];
  }
  return v3;
}

- (id)generateTestCases
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_testCases;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "toJsonDictionary", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)generateLayouts
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_layouts;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[NSDictionary objectForKey:](self->_layouts, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        v10 = [v9 toJsonDictionary];
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)pushNextTestCase:(id)a3
{
}

- (void)addLayouts:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  layouts = self->_layouts;
  id v6 = a3;
  uint64_t v7 = [v4 dictionaryWithDictionary:layouts];
  [(NSDictionary *)v7 addEntriesFromDictionary:v6];

  v8 = self->_layouts;
  self->_layouts = v7;
}

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TTKFileSink;
  long long v12 = [(TTKFileSink *)&v17 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileName, a3);
    objc_storeStrong((id *)&v13->_inputMode, a4);
    objc_storeStrong((id *)&v13->_layouts, a5);
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    testCases = v13->_testCases;
    v13->_testCases = (NSMutableArray *)v14;
  }
  return v13;
}

@end