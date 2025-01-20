@interface SPEmbeddingResult
+ (id)log;
- (NSData)embeddingData;
- (SPEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5 scale:(float)a6 bias:(float)a7;
- (float)bias;
- (float)scale;
- (id)description;
- (unint64_t)elementCount;
- (unint64_t)elementType;
- (unint64_t)version;
@end

@implementation SPEmbeddingResult

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__SPEmbeddingResult_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;

  return v2;
}

void __24__SPEmbeddingResult_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.spotlightembedding", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

- (SPEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5 scale:(float)a6 bias:(float)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SPEmbeddingResult;
  v14 = [(SPEmbeddingResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_version = a3;
    objc_storeStrong((id *)&v14->_embeddingData, a4);
    v15->_elementType = a5;
    v15->_scale = a6;
    v15->_bias = a7;
  }

  return v15;
}

- (unint64_t)elementCount
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t elementType = self->_elementType;
  if (elementType == 2) {
    return [(NSData *)self->_embeddingData length] >> 2;
  }
  if (elementType == 1) {
    return [(NSData *)self->_embeddingData length] >> 1;
  }
  v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    unint64_t v6 = self->_elementType;
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_25E340000, v5, OS_LOG_TYPE_ERROR, "Embedding has unknown element type (%d); cannot derive count",
      (uint8_t *)v7,
      8u);
  }

  return 0;
}

- (id)description
{
  id v3 = [MEMORY[0x263F089D8] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"elementType: %d, ", self->_elementType];
  [v3 appendFormat:@"elementCount: %d, ", -[SPEmbeddingResult elementCount](self, "elementCount")];
  [v3 appendFormat:@"embeddingData: %@>", self->_embeddingData];

  return v3;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (NSData)embeddingData
{
  return self->_embeddingData;
}

- (unint64_t)version
{
  return self->_version;
}

- (float)scale
{
  return self->_scale;
}

- (float)bias
{
  return self->_bias;
}

- (void).cxx_destruct
{
}

@end