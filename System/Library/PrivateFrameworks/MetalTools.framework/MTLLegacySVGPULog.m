@interface MTLLegacySVGPULog
- (MTLFunction)function;
- (MTLFunctionLogDebugLocation)debugLocation;
- (MTLLegacySVImageData)image;
- (NSArray)errorStackTrace;
- (NSString)encoderLabel;
- (NSString)locationDescription;
- (NSString)pipelineIdentifier;
- (unint64_t)callIndex;
- (unint64_t)type;
- (void)dealloc;
- (void)setCallIndex:(unint64_t)a3;
- (void)setDebugLocation:(id)a3;
- (void)setEncoderLabel:(id)a3;
- (void)setErrorStackTrace:(id)a3;
- (void)setFunction:(id)a3;
- (void)setImage:(id)a3;
- (void)setPipelineIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MTLLegacySVGPULog

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVGPULog;
  [(MTLLegacySVGPULog *)&v3 dealloc];
}

- (NSString)locationDescription
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v19, [(MTLLegacySVGPULog *)self function]);
  uint64_t v17 = v19[1];
  v18 = NSString;
  v16 = [(MTLLegacySVGPULog *)self pipelineIdentifier];
  v15 = [(MTLLegacySVGPULog *)self encoderLabel];
  uint64_t v3 = v19[2];
  unint64_t v4 = [(MTLLegacySVGPULog *)self callIndex];
  v5 = [(MTLLegacySVGPULog *)self errorStackTrace];
  if (v5)
  {
    v6 = (__CFString *)(id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26EF29A78];
    context = (void *)MEMORY[0x23ECD5710]();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v11, "URL"), "standardizedURL"))
          {
            -[__CFString appendFormat:](v6, "appendFormat:", @"\t* frame #%d: %@\n", v8, [v11 description]);
            uint64_t v8 = (v8 + 1);
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v6 = 0;
  }
  v12 = &stru_26EF29A78;
  if (v6) {
    v12 = v6;
  }
  return (NSString *)[v18 stringWithFormat:@"%@ %@ encoder: \"%@\", %@: %lu\n%@\n", v17, v16, v15, v3, v4, v12];
}

- (MTLLegacySVImageData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSArray)errorStackTrace
{
  return self->_errorStackTrace;
}

- (void)setErrorStackTrace:(id)a3
{
}

- (unint64_t)callIndex
{
  return self->_callIndex;
}

- (void)setCallIndex:(unint64_t)a3
{
  self->_callIndex = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)encoderLabel
{
  return self->_encoderLabel;
}

- (void)setEncoderLabel:(id)a3
{
}

- (MTLFunction)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
}

- (MTLFunctionLogDebugLocation)debugLocation
{
  return self->_debugLocation;
}

- (void)setDebugLocation:(id)a3
{
}

- (NSString)pipelineIdentifier
{
  return self->_pipelineIdentifier;
}

- (void)setPipelineIdentifier:(id)a3
{
}

@end