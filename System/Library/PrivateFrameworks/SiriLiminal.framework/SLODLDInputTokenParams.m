@interface SLODLDInputTokenParams
- (NSArray)shape;
- (NSMutableArray)mlAttnMask;
- (NSMutableArray)mlInputIds;
- (NSMutableArray)mlPadMask;
- (NSMutableArray)mlTypeIds;
- (SLODLDInputTokenParams)initWithShape:(id)a3;
- (void)_initWithDefaults;
- (void)populateWithTokens:(id)a3 error:(id *)a4;
- (void)setMlAttnMask:(id)a3;
- (void)setMlInputIds:(id)a3;
- (void)setMlPadMask:(id)a3;
- (void)setMlTypeIds:(id)a3;
- (void)setShape:(id)a3;
@end

@implementation SLODLDInputTokenParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_mlPadMask, 0);
  objc_storeStrong((id *)&self->_mlAttnMask, 0);
  objc_storeStrong((id *)&self->_mlTypeIds, 0);
  objc_storeStrong((id *)&self->_mlInputIds, 0);
}

- (void)setShape:(id)a3
{
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setMlPadMask:(id)a3
{
}

- (NSMutableArray)mlPadMask
{
  return self->_mlPadMask;
}

- (void)setMlAttnMask:(id)a3
{
}

- (NSMutableArray)mlAttnMask
{
  return self->_mlAttnMask;
}

- (void)setMlTypeIds:(id)a3
{
}

- (NSMutableArray)mlTypeIds
{
  return self->_mlTypeIds;
}

- (void)setMlInputIds:(id)a3
{
}

- (NSMutableArray)mlInputIds
{
  return self->_mlInputIds;
}

- (void)populateWithTokens:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  shape = self->_shape;
  if (shape)
  {
    if ([(NSArray *)shape count] > 1)
    {
      v13 = [(NSArray *)self->_shape objectAtIndexedSubscript:1];
      unint64_t v14 = [v13 unsignedIntegerValue];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __51__SLODLDInputTokenParams_populateWithTokens_error___block_invoke;
      v17[3] = &unk_2644FFD38;
      v17[4] = self;
      v17[5] = v14;
      [v6 enumerateObjectsUsingBlock:v17];
      unint64_t v15 = [v6 count];
      if (v15 < v14)
      {
        unint64_t v16 = v15;
        do
        {
          [(NSMutableArray *)self->_mlInputIds setObject:&unk_26D0A23E8 atIndexedSubscript:v16];
          [(NSMutableArray *)self->_mlTypeIds setObject:&unk_26D0A23E8 atIndexedSubscript:v16];
          [(NSMutableArray *)self->_mlAttnMask setObject:&unk_26D0A23E8 atIndexedSubscript:v16];
          [(NSMutableArray *)self->_mlPadMask setObject:&unk_26D0A23F8 atIndexedSubscript:v16++];
        }
        while (v14 != v16);
      }
    }
    else if (a4)
    {
      id v8 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v18 = *MEMORY[0x263F08320];
      v19 = @"Index in toeken shape is not valid";
      v9 = NSDictionary;
      v10 = &v19;
      v11 = &v18;
LABEL_7:
      v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
      *a4 = (id)[v8 initWithDomain:@"com.apple.sl" code:116 userInfo:v12];
    }
  }
  else if (a4)
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"Toekn shape not initialized";
    v9 = NSDictionary;
    v10 = (__CFString **)v21;
    v11 = &v20;
    goto LABEL_7;
  }
}

uint64_t __51__SLODLDInputTokenParams_populateWithTokens_error___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v5 = result;
    [*(id *)(*(void *)(result + 32) + 8) setObject:a2 atIndexedSubscript:a3];
    [*(id *)(*(void *)(v5 + 32) + 16) setObject:&unk_26D0A23F8 atIndexedSubscript:a3];
    [*(id *)(*(void *)(v5 + 32) + 24) setObject:&unk_26D0A23F8 atIndexedSubscript:a3];
    id v6 = *(void **)(*(void *)(v5 + 32) + 32);
    return [v6 setObject:&unk_26D0A23E8 atIndexedSubscript:a3];
  }
  return result;
}

- (void)_initWithDefaults
{
  v3 = [(NSArray *)self->_shape objectAtIndexedSubscript:1];
  uint64_t v4 = [v3 unsignedIntegerValue];

  uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  mlInputIds = self->_mlInputIds;
  self->_mlInputIds = v5;

  v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  mlTypeIds = self->_mlTypeIds;
  self->_mlTypeIds = v7;

  v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  mlAttnMask = self->_mlAttnMask;
  self->_mlAttnMask = v9;

  v11 = [MEMORY[0x263EFF980] arrayWithCapacity:v4];
  mlPadMask = self->_mlPadMask;
  self->_mlPadMask = v11;

  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      [(NSMutableArray *)self->_mlInputIds setObject:&unk_26D0A23E8 atIndexedSubscript:i];
      [(NSMutableArray *)self->_mlTypeIds setObject:&unk_26D0A23E8 atIndexedSubscript:i];
      [(NSMutableArray *)self->_mlAttnMask setObject:&unk_26D0A23E8 atIndexedSubscript:i];
      [(NSMutableArray *)self->_mlPadMask setObject:&unk_26D0A23F8 atIndexedSubscript:i];
    }
  }
}

- (SLODLDInputTokenParams)initWithShape:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLODLDInputTokenParams;
  id v6 = [(SLODLDInputTokenParams *)&v12 init];
  if (!v6) {
    goto LABEL_4;
  }
  if ([v5 count] == 2)
  {
    objc_storeStrong((id *)&v6->_shape, a3);
    [(SLODLDInputTokenParams *)v6 _initWithDefaults];
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  id v8 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v10 = v8;
    uint64_t v11 = [v5 count];
    *(_DWORD *)buf = 136315394;
    unint64_t v14 = "-[SLODLDInputTokenParams initWithShape:]";
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    _os_log_error_impl(&dword_21EFF4000, v10, OS_LOG_TYPE_ERROR, "%s Expected 2D array, got %lu, not running model", buf, 0x16u);
  }
  v7 = 0;
LABEL_8:

  return v7;
}

@end