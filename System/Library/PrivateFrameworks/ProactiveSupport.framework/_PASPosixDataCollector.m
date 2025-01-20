@interface _PASPosixDataCollector
- (id)allData;
- (id)handleData;
@end

@implementation _PASPosixDataCollector

- (void).cxx_destruct
{
}

- (id)allData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_totalBytes)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:self->_totalBytes];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = self->_chunks;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "appendData:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)handleData
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36___PASPosixDataCollector_handleData__block_invoke;
  v4[3] = &unk_1E5AEB3D8;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1A6245320](v4, a2);

  return v2;
}

@end