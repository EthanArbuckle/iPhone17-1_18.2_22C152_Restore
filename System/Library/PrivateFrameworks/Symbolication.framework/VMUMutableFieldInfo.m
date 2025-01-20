@interface VMUMutableFieldInfo
- (BOOL)replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5;
- (void)addSubField:(id)a3;
- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3 parentOffset:(unsigned int)a4;
- (void)setFlags:(unsigned int)a3;
- (void)setIsByref:(BOOL)a3;
- (void)setIsCapture:(BOOL)a3;
- (void)setIvarName:(id)a3;
- (void)setKind:(unsigned int)a3;
- (void)setOffset:(unsigned int)a3;
- (void)setScanType:(unsigned int)a3;
- (void)setScannableSize:(unsigned int)a3;
- (void)setSize:(unsigned int)a3;
- (void)setStride:(unsigned int)a3;
@end

@implementation VMUMutableFieldInfo

- (void)setIvarName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setIvarName:a3];
}

- (void)setScanType:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setScanType:*(void *)&a3];
}

- (void)setOffset:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setOffset:*(void *)&a3];
}

- (void)setSize:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setSize:*(void *)&a3];
}

- (void)setKind:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setKind:*(void *)&a3];
}

- (void)setIsByref:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setFlags:[(VMUFieldInfo *)self flags] | 2];
}

- (void)setIsCapture:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setFlags:[(VMUFieldInfo *)self flags] | 1];
}

- (void)setFlags:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setFlags:*(void *)&a3];
}

- (void)setScannableSize:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setScannableSize:*(void *)&a3];
}

- (void)setStride:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUMutableFieldInfo;
  [(VMUFieldInfo *)&v3 _setStride:*(void *)&a3];
}

- (void)mutateTypeFieldsRecursivelyWithBlock:(id)a3 parentOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = [(VMUFieldInfo *)self subFieldArray];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [(VMUFieldInfo *)self subFieldArray];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void (*)(void *, id, uint64_t))v6[2];
          id v14 = *(id *)(*((void *)&v15 + 1) + 8 * v12);
          v13(v6, v14, v4);
          [v14 mutateTypeFieldsRecursivelyWithBlock:v6 parentOffset:[v14 offset] + v4];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (BOOL)replaceFieldRecursively:(id)a3 atOffset:(unsigned int)a4 withField:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(VMUFieldInfo *)self subFieldArray];
  uint64_t v11 = [v10 count];
  if (v11)
  {
    unint64_t v12 = v11;
    v13 = [v10 objectAtIndexedSubscript:0];
    unsigned int v14 = [v13 offset];
    if (a4 - (unint64_t)v14 < [v13 size])
    {
      unint64_t v15 = 0;
      BOOL v16 = 1;
LABEL_8:
      uint64_t v18 = a4 - v14;
      if (v18 || ![v13 isEqual:v8])
      {
        v19 = [v13 subFieldArray];

        if (!v19 || ([v13 replaceFieldRecursively:v8 atOffset:v18 withField:v9] & 1) == 0)
        {
          LOBYTE(a4) = 0;
          goto LABEL_16;
        }
      }
      else
      {
        [v10 setObject:v9 atIndexedSubscript:v15];
      }
      LOBYTE(a4) = 1;
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v17 = 1;
    while (1)
    {

      if (v12 == v17) {
        break;
      }
      v13 = [v10 objectAtIndexedSubscript:v17];
      unsigned int v14 = [v13 offset];
      ++v17;
      if (a4 - (unint64_t)v14 < [v13 size])
      {
        unint64_t v15 = v17 - 1;
        BOOL v16 = v15 < v12;
        goto LABEL_8;
      }
    }
  }
  BOOL v16 = 0;
LABEL_17:

  return v16 & a4;
}

- (void)addSubField:(id)a3
{
  id v4 = a3;
  v5 = [(VMUFieldInfo *)self subFieldArray];

  if (!v5) {
    [(VMUFieldInfo *)self initializeSubFieldArray];
  }
  id v6 = [(VMUFieldInfo *)self subFieldArray];
  [v6 addObject:v4];
}

@end