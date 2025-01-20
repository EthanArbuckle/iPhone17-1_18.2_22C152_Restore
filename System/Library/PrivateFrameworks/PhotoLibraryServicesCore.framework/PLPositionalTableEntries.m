@interface PLPositionalTableEntries
- (NSIndexSet)readIndexes;
- (PLPositionalTableEntries)initWithBuffers:(void *)a3 forIndexes:(id)a4 entryLength:(unint64_t)a5;
- (unint64_t)entryLength;
- (void)dealloc;
- (void)enumerateIndexes:(id)a3;
@end

@implementation PLPositionalTableEntries

- (void).cxx_destruct
{
}

- (NSIndexSet)readIndexes
{
  return self->_readIndexes;
}

- (unint64_t)entryLength
{
  return self->_entryLength;
}

- (void)enumerateIndexes:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLPositionalTable.m", 73, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  readIndexes = self->_readIndexes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PLPositionalTableEntries_enumerateIndexes___block_invoke;
  v9[3] = &unk_1E58A1880;
  v9[4] = self;
  v11 = v13;
  id v7 = v5;
  id v10 = v7;
  v12 = v14;
  [(NSIndexSet *)readIndexes enumerateRangesUsingBlock:v9];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
}

void __45__PLPositionalTableEntries_enumerateIndexes___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(v8 + 16) + 8 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v14 = __45__PLPositionalTableEntries_enumerateIndexes___block_invoke_2;
  char v15 = &unk_1E58A1858;
  uint64_t v20 = a3;
  uint64_t v21 = v9;
  unint64_t v19 = a2;
  uint64_t v16 = v8;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 56);
  id v17 = v10;
  uint64_t v18 = v11;
  char v22 = 0;
  if (v6 < v6 + a3)
  {
    uint64_t v12 = a3 - 1;
    do
    {
      v14((uint64_t)v13, v6, &v22);
      if (!v12) {
        break;
      }
      ++v6;
      --v12;
    }
    while (!v22);
    uint64_t v11 = *(void *)(a1 + 56);
  }
  if (*(unsigned char *)(*(void *)(v11 + 8) + 24)) {
    *a4 = 1;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __45__PLPositionalTableEntries_enumerateIndexes___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_buffers)
  {
    uint64_t v3 = [(NSIndexSet *)self->_readIndexes rangeCount];
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
        free(self->_buffers[i]);
    }
    free(self->_buffers);
  }
  v6.receiver = self;
  v6.super_class = (Class)PLPositionalTableEntries;
  [(PLPositionalTableEntries *)&v6 dealloc];
}

- (PLPositionalTableEntries)initWithBuffers:(void *)a3 forIndexes:(id)a4 entryLength:(unint64_t)a5
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLPositionalTableEntries;
  uint64_t v11 = [(PLPositionalTableEntries *)&v17 init];
  if (!v11) {
    goto LABEL_8;
  }
  if (v10)
  {
    if (a5) {
      goto LABEL_4;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, v11, @"PLPositionalTable.m", 47, @"Invalid parameter not satisfying: %@", @"indexes" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
  }
  char v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, v11, @"PLPositionalTable.m", 48, @"Invalid parameter not satisfying: %@", @"entryLength > 0" object file lineNumber description];

LABEL_4:
  uint64_t v12 = [v10 count];
  if (!a3 && v12)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v11, @"PLPositionalTable.m", 49, @"Invalid parameter not satisfying: %@", @"indexes.count == 0 || buffers != NULL" object file lineNumber description];
  }
  objc_storeStrong((id *)&v11->_readIndexes, a4);
  v11->_entryLength = a5;
  v11->_buffers = (void **)a3;
LABEL_8:

  return v11;
}

@end