@interface STStorage
- (STStorage)init;
- (STStorage)initWithCStorage:(_Storage *)a3;
- (id)getChildrenInfo;
- (id)getInfo;
- (id)openStorage:(id)a3 withMode:(int)a4;
- (id)openStream:(id)a3 withMode:(int)a4;
- (int)getChildType:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setClass:(id)a3;
@end

@implementation STStorage

- (STStorage)init
{
  return [(STStorage *)self initWithCStorage:0];
}

- (STStorage)initWithCStorage:(_Storage *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStorage;
  v4 = [(STSStgObject *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->m_pCStorage = a3;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  [(STStorage *)self close];
  v3.receiver = self;
  v3.super_class = (Class)STStorage;
  [(STStorage *)&v3 dealloc];
}

- (void)close
{
  p_m_pCStorage = &self->m_pCStorage;
  if (*p_m_pCStorage) {
    closeStorage((uint64_t)p_m_pCStorage);
  }
}

- (id)openStream:(id)a3 withMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v13 = 0;
  int v7 = StgModeFromSTStgMode(v4);
  if (v7 == 1)
  {
    uint64_t v8 = createStream((uint64_t)self->m_pCStorage, (unsigned __int16 *)[v6 cWideString], &v13);
    goto LABEL_5;
  }
  if (!v7)
  {
    uint64_t v8 = openStream((uint64_t)self->m_pCStorage, (const unsigned __int16 *)[v6 cWideString], &v13);
LABEL_5:
    uint64_t v9 = v8;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:
  +[STSStgObject throwIfError:v9];
  v10 = [STStream alloc];
  v11 = [(STStream *)v10 initWithCStream:v13];
  if (!v11) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Structured Storage library memory failure"];
  }

  return v11;
}

- (id)openStorage:(id)a3 withMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v13 = 0;
  int v7 = StgModeFromSTStgMode(v4);
  if (v7 == 1)
  {
    uint64_t v8 = createStorage((uint64_t)self->m_pCStorage, (unsigned __int16 *)[v6 cWideString], &v13);
    goto LABEL_5;
  }
  if (!v7)
  {
    uint64_t v8 = openStorage((uint64_t)self->m_pCStorage, (const unsigned __int16 *)[v6 cWideString], &v13);
LABEL_5:
    uint64_t v9 = v8;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:
  +[STSStgObject throwIfError:v9];
  v10 = [STStorage alloc];
  v11 = [(STStorage *)v10 initWithCStorage:v13];
  if (!v11) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Structured Storage library memory failure"];
  }

  return v11;
}

- (id)getInfo
{
  int v7 = 0;
  getStorageInfo((uint64_t)self->m_pCStorage, (uint64_t **)&v7);
  +[STSStgObject throwIfError:v2];
  objc_super v3 = [STStgInfo alloc];
  uint64_t v4 = [(STStgInfo *)v3 initWithStgInfo:v7];
  uint64_t v5 = freeInfo((void **)v7, 1u);
  free(v7);
  +[STSStgObject throwIfError:v5];
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Structured Storage library memory failure"];
  }
  return v4;
}

- (id)getChildrenInfo
{
  v11 = 0;
  int v10 = 0;
  +[STSStgObject throwIfError:getChildrenInfo((uint64_t)self->m_pCStorage, &v11, (unsigned int *)&v10)];
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  objc_super v3 = (uint64_t *)MEMORY[0x263EFF570];
  if (!v2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Structured Storage library memory failure"];
  }
  if (v10 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = *v3;
    do
    {
      int v7 = [STStgInfo alloc];
      uint64_t v8 = [(STStgInfo *)v7 initWithStgInfo:&v11[v4]];
      if (!v8) {
        [MEMORY[0x263EFF940] raise:v6 format:@"Structured Storage library memory failure"];
      }
      [v2 addObject:v8];

      ++v5;
      v4 += 8;
    }
    while (v5 < v10);
  }
  return v2;
}

- (int)getChildType:(id)a3
{
  unsigned int ChildType = getChildType((uint64_t)self->m_pCStorage, (const unsigned __int16 *)[a3 cWideString]);
  if (ChildType >= 3) {
    return -1;
  }
  else {
    return ChildType - 1;
  }
}

- (void)setClass:(id)a3
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  $DF246ECBFA7C13B1931CDA33BA2B4196 v3 = a3;
  +[STSStgObject throwIfError:storageSetClass((uint64_t)self->m_pCStorage, &v3)];
}

@end