@interface SDTrace
+ (void)initialize;
- (NSString)title;
- (SDTrace)init;
- (SDTrace)initWithTitle:(id)a3;
- (id)description;
- (id)items;
- (int)current;
- (int64_t)addLabel:(id)a3 identifier:(int64_t)a4 duration:(double)a5 string:(id)a6 data:(id)a7;
- (void)setTitle:(id)a3;
@end

@implementation SDTrace

void __52__SDTrace_addLabel_identifier_duration_string_data___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 264) + 1;
  *(_DWORD *)(v2 + 264) = v3;
  uint64_t v4 = v3 & 0x1F;
  v5 = *(void **)(*(void *)(a1 + 32) + 8 * v4 + 8);
  if (!v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void *)(a1 + 32) + 8 * v4;
    v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    v5 = *(void **)(*(void *)(a1 + 32) + 8 * v4 + 8);
  }
  id v10 = v5;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v10, "setStartTime:");
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9 == -1) {
    uint64_t v9 = *(int *)(*(void *)(a1 + 32) + 264) + 1;
  }
  [v10 setIdentifier:v9];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v10 identifier];
  [v10 setLabel:*(void *)(a1 + 40)];
  [v10 setDuration:*(double *)(a1 + 80)];
  [v10 setString:*(void *)(a1 + 48)];
  [v10 setData:*(void *)(a1 + 56)];
}

- (int64_t)addLabel:(id)a3 identifier:(int64_t)a4 duration:(double)a5 string:(id)a6 data:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v15 = _trace_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SDTrace_addLabel_identifier_duration_string_data___block_invoke;
  block[3] = &unk_264506688;
  v25 = &v28;
  int64_t v26 = a4;
  block[4] = self;
  id v22 = v12;
  double v27 = a5;
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(v15, block);
  int64_t v19 = v29[3];

  _Block_object_dispose(&v28, 8);
  return v19;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v2 = dispatch_queue_create("trace queue", v4);
    int v3 = (void *)_trace_queue;
    _trace_queue = (uint64_t)v2;
  }
}

- (SDTrace)init
{
  return [(SDTrace *)self initWithTitle:0];
}

- (SDTrace)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDTrace;
  uint64_t v6 = [(SDTrace *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_title, a3);
    v7->_current = -1;
    *(_OWORD *)v7->_items = 0u;
    *(_OWORD *)&v7->_items[2] = 0u;
    *(_OWORD *)&v7->_items[4] = 0u;
    *(_OWORD *)&v7->_items[6] = 0u;
    *(_OWORD *)&v7->_items[8] = 0u;
    *(_OWORD *)&v7->_items[10] = 0u;
    *(_OWORD *)&v7->_items[12] = 0u;
    *(_OWORD *)&v7->_items[14] = 0u;
    *(_OWORD *)&v7->_items[16] = 0u;
    *(_OWORD *)&v7->_items[18] = 0u;
    *(_OWORD *)&v7->_items[20] = 0u;
    *(_OWORD *)&v7->_items[22] = 0u;
    *(_OWORD *)&v7->_items[24] = 0u;
    *(_OWORD *)&v7->_items[26] = 0u;
    *(_OWORD *)&v7->_items[28] = 0u;
    *(_OWORD *)&v7->_items[30] = 0u;
  }

  return v7;
}

- (id)items
{
  int v3 = [MEMORY[0x263EFF980] arrayWithCapacity:32];
  uint64_t v4 = _trace_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __16__SDTrace_items__block_invoke;
  v9[3] = &unk_2645065E8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __16__SDTrace_items__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 8 * ((*(_DWORD *)(v3 + 264) + 1) & 0x1F) + 8)) {
    char v4 = (*(_DWORD *)(v3 + 264) + 1) & 0x1F;
  }
  else {
    char v4 = 0;
  }
  do
  {
    id v5 = *(id *)(*(void *)(a1 + 32) + 8 * ((v4 + (_BYTE)v2) & 0x1F) + 8);
    if (!v5) {
      break;
    }
    uint64_t v6 = v5;
    id v7 = *(void **)(a1 + 40);
    v8 = (void *)[v5 copy];
    [v7 addObject:v8];

    ++v2;
  }
  while (v2 != 32);
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  char v4 = [(SDTrace *)self title];
  id v5 = [v3 stringWithFormat:@"Trace %@ (%d)\n", v4, -[SDTrace current](self, "current") + 1];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(SDTrace *)self items];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) description];
        [v5 appendFormat:@"%@\n", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int)current
{
  return self->_current;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  uint64_t v3 = 256;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end