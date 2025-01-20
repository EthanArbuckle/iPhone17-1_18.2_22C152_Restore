@interface _HVNSStringEncodingEnumerator
- (_HVNSStringEncodingEnumerator)initWithString:(id)a3 encoding:(unint64_t)a4 nullTerminated:(BOOL)a5;
- (id)nextObject;
- (id)nullTerminationIfNeeded;
@end

@implementation _HVNSStringEncodingEnumerator

- (void).cxx_destruct
{
}

- (id)nextObject
{
  uint64_t v2 = MEMORY[0x270FA5388](self, a2);
  uint64_t v3 = v2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (void *)(v2 + 24);
  if (!*(void *)(v2 + 32))
  {
    id v5 = [(id)v2 nullTerminationIfNeeded];
LABEL_7:
    v6 = v5;
    goto LABEL_16;
  }
  if (*(unsigned char *)(v2 + 40))
  {
    *(unsigned char *)(v2 + 40) = 0;
    if (bomData__pasOnceToken3 != -1) {
      dispatch_once(&bomData__pasOnceToken3, &__block_literal_global_38);
    }
    id v5 = (id)bomData__pasExprOnceResult;
    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x22A6667F0]();
  bzero(v14, 0x1000uLL);
  unint64_t v13 = 0;
  long long v12 = 0uLL;
  if (objc_msgSend(*(id *)(v3 + 8), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v14, 4096, &v13, *(void *)(v3 + 16), 0, *v4, v4[1], &v12))
  {
    if (!*((void *)&v12 + 1))
    {
      unint64_t v8 = v13;
      if (v13 <= 0xFFF)
      {
        if (*(unsigned char *)(v3 + 41))
        {
          *(unsigned char *)(v3 + 41) = 0;
          unint64_t v13 = v8 + 1;
          v14[v8] = 0;
        }
      }
    }
    *(_OWORD *)v4 = v12;
    id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v10 = [v9 initWithBytes:v14 length:v13];
  }
  else
  {
    uint64_t v10 = [(id)v3 nullTerminationIfNeeded];
  }
  v6 = (void *)v10;
LABEL_16:

  return v6;
}

- (id)nullTerminationIfNeeded
{
  if (self->_needsNullTermination)
  {
    self->_needsNullTermination = 0;
    uint64_t v2 = nullByteData();
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (_HVNSStringEncodingEnumerator)initWithString:(id)a3 encoding:(unint64_t)a4 nullTerminated:(BOOL)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HVNSStringEncodingEnumerator;
  uint64_t v10 = [(_HVNSStringEncodingEnumerator *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    v11->_encoding = a4;
    uint64_t v12 = [v9 length];
    v11->_remaining.location = 0;
    v11->_remaining.length = v12;
    v11->_needsBOM = a4 == 10;
    v11->_needsNullTermination = a5;
  }

  return v11;
}

@end