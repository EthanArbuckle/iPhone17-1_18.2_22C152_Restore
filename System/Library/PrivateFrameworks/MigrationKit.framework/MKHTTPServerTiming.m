@interface MKHTTPServerTiming
- (double)import;
- (double)response;
- (id)value;
- (void)setImport:(double)a3;
- (void)setResponse:(double)a3;
@end

@implementation MKHTTPServerTiming

- (id)value
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_response > 0.0)
  {
    v3 = [[MKHTTPServerTimingMetric alloc] initWithDuration:self->_response];
    [v18 setObject:v3 forKeyedSubscript:@"response"];
  }
  if (self->_import > 0.0)
  {
    v4 = [[MKHTTPServerTimingMetric alloc] initWithDuration:self->_import];
    [v18 setObject:v4 forKeyedSubscript:@"import"];
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v18 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v23[0] = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        v12 = objc_msgSend(v18, "objectForKeyedSubscript:");
        v13 = [v12 value];
        v23[1] = v13;
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
        v8 = [v14 componentsJoinedByString:@";"];

        [v5 addObject:v8];
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  v15 = [v5 componentsJoinedByString:@", "];

  return v15;
}

- (double)import
{
  return self->_import;
}

- (void)setImport:(double)a3
{
  self->_import = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

@end