@interface _NTKBundleBlockComplicationLoader
- (BOOL)isEqual:(id)a3;
- (id)block;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_loadClassesUsingBlock:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation _NTKBundleBlockComplicationLoader

- (void)_loadClassesUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  block = (void (**)(id))self->_block;
  if (block)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = block[2](block);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_NTKBundleBlockComplicationLoader *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id block = self->_block;
      v6 = v4;
      uint64_t v7 = _Block_copy(block);
      id v8 = v6->_block;

      uint64_t v9 = _Block_copy(v8);
      char v10 = NTKEqualObjects(v7, v9);
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setBlock:self->_block];
  return v4;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end