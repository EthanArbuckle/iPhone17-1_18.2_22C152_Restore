@interface TTKFileSource
- (BOOL)parseData:(id)a3;
- (NSDictionary)layouts;
- (NSString)inputMode;
- (float)fileVersion;
- (id)getNextTestCase;
- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5;
- (id)onNewLayoutsFound;
- (int)majorVersion;
- (int)minorVersion;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)parseLayouts:(id)a3;
- (void)reset;
- (void)setOnNewLayoutsFound:(id)a3;
@end

@implementation TTKFileSource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onNewLayoutsFound, 0);
  objc_storeStrong((id *)&self->_test_cases, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setOnNewLayoutsFound:(id)a3
{
}

- (id)onNewLayoutsFound
{
  return self->_onNewLayoutsFound;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (float)fileVersion
{
  return self->_fileVersion;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (NSDictionary)layouts
{
  return self->_layouts;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var0) {
    a3->var2 = a3->var3;
  }
  a3->var0 = 0;
  if (a5)
  {
    do
    {
      id v9 = [(TTKFileSource *)self getNextTestCase];
      unint64_t result = a3->var0;
      if (!v9) {
        break;
      }
      a3->var0 = result + 1;
      a4[result] = v9;
      unint64_t result = a3->var0;
    }
    while (a3->var0 < a5);
  }
  else
  {
    unint64_t result = 0;
  }
  a3->var1 = a4;
  return result;
}

- (id)getNextTestCase
{
  unint64_t test_case_index = self->_test_case_index;
  if ([(NSMutableArray *)self->_test_cases count] <= test_case_index)
  {
    v5 = 0;
  }
  else
  {
    test_cases = self->_test_cases;
    ++self->_test_case_index;
    v5 = -[NSMutableArray objectAtIndex:](test_cases, "objectAtIndex:");
  }
  return v5;
}

- (void)reset
{
  self->_unint64_t test_case_index = 0;
}

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TTKFileSource;
  v11 = [(TTKFileSource *)&v17 init];
  p_isa = (id *)&v11->super.isa;
  if (!v11) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v11->_inputMode, a4);
  objc_storeStrong(p_isa + 3, a5);
  if ([p_isa parseData:v8])
  {
    [p_isa reset];
LABEL_4:
    v13 = p_isa;
    goto LABEL_8;
  }
  v14 = TTKLogFacility();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_error_impl(&dword_23EFD2000, v14, OS_LOG_TYPE_ERROR, "Unable to parse data from input file", v16, 2u);
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (BOOL)parseData:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKey:@"version"];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v7 = [v4 objectForKey:@"major_version"];
    self->_int majorVersion = [v7 intValue];

    int majorVersion = self->_majorVersion;
    BOOL v6 = majorVersion == 2;
    if (majorVersion == 2)
    {
      id v9 = [v4 objectForKey:@"minor_version"];
      self->_minorVersion = [v9 intValue];

      self->_fileVersion = (float)((float)self->_minorVersion / 10.0) + (float)self->_majorVersion;
      if (!self->_inputMode)
      {
        id v10 = [v4 objectForKey:@"input_mode"];
        inputMode = self->_inputMode;
        self->_inputMode = v10;
      }
      if (!self->_layouts) {
        [(TTKFileSource *)self parseLayouts:v4];
      }
      v12 = [MEMORY[0x263EFF980] array];
      test_cases = self->_test_cases;
      self->_test_cases = v12;

      v19 = [v4 objectForKey:@"test_cases"];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v14 = [v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v19);
            }
            v18 = [[TTKTestCase alloc] initWithDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            [(NSMutableArray *)self->_test_cases addObject:v18];
          }
          uint64_t v15 = [v19 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v15);
      }
    }
    else
    {
      v19 = TTKLogFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v22 = self->_majorVersion;
        *(_DWORD *)buf = 67109376;
        int v29 = v22;
        __int16 v30 = 1024;
        int v31 = 2;
        _os_log_error_impl(&dword_23EFD2000, v19, OS_LOG_TYPE_ERROR, "Error: file major version %d incompatible with CURRENT_MAJOR_VERSION_NUMBER %d", buf, 0xEu);
      }
    }
  }
  return v6;
}

- (void)parseLayouts:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v6 = [v4 objectForKey:@"layouts"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[TTKSimpleKeyboardPlane alloc] initWithJsonDictionary:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
        v12 = [(TTKSimpleKeyboardPlane *)v11 name];
        [(NSDictionary *)v5 setObject:v11 forKey:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  layouts = self->_layouts;
  self->_layouts = v5;
}

@end