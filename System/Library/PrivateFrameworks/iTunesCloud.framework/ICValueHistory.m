@interface ICValueHistory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICValueHistory)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstValueAfterOrEqualToTimestamp:(unint64_t)a3;
- (id)firstValueBeforeOrEqualToTimestamp:(unint64_t)a3;
- (id)firstValueBeforeTimestamp:(unint64_t)a3;
- (id)lastValue;
- (id)lastValueAndTimestamp:(unint64_t *)a3;
- (int64_t)count;
- (unint64_t)hash;
- (void)addValue:(id)a3 timestamp:(unint64_t)a4;
- (void)addValuesFromHistory:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesUsingBlock:(id)a3;
- (void)removeAllValues;
- (void)removeValuesBeforeTimestamp:(unint64_t)a3;
@end

@implementation ICValueHistory

- (void).cxx_destruct
{
}

- (id)firstValueBeforeTimestamp:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17109;
  v11 = __Block_byref_object_dispose__17110;
  id v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__ICValueHistory_firstValueBeforeTimestamp___block_invoke;
  v6[3] = &unk_1E5AC9408;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSMutableArray *)items enumerateObjectsWithOptions:2 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)firstValueAfterOrEqualToTimestamp:(unint64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17109;
  v11 = __Block_byref_object_dispose__17110;
  id v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__ICValueHistory_firstValueAfterOrEqualToTimestamp___block_invoke;
  v6[3] = &unk_1E5AC9408;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSMutableArray *)items enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)addValuesFromHistory:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__ICValueHistory_addValuesFromHistory___block_invoke;
  v3[3] = &unk_1E5AC93B8;
  v3[4] = self;
  [a3 enumerateValuesUsingBlock:v3];
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4 = a3;
  items = self->_items;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICValueHistory_enumerateValuesUsingBlock___block_invoke;
  v7[3] = &unk_1E5AC93E0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)items enumerateObjectsUsingBlock:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSMutableArray *)self->_items mutableCopyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

void __44__ICValueHistory_enumerateValuesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v9 = [v7 value];
  uint64_t v8 = [v7 timestamp];

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v9, v8, a3, a4);
}

- (void)addValue:(id)a3 timestamp:(unint64_t)a4
{
  id v18 = a3;
  uint64_t v6 = [[_ICValueHistoryItem alloc] initWithValue:v18 timestamp:a4];
  uint64_t v7 = [(NSMutableArray *)self->_items count];
  if (!v7)
  {
    items = self->_items;
    if (!items)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v14 = self->_items;
      self->_items = v13;

      items = self->_items;
    }
    [(NSMutableArray *)items addObject:v6];
    goto LABEL_15;
  }
  uint64_t v8 = v7 - 1;
  if (v7 < 1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v9 = [(NSMutableArray *)self->_items objectAtIndex:v8];
    unint64_t v10 = [v9 timestamp];

    if (v10 == a4)
    {
      [(NSMutableArray *)self->_items replaceObjectAtIndex:v8 withObject:v6];
      goto LABEL_8;
    }
    if (v10 < a4)
    {
      uint64_t v15 = v8 + 1;
      v16 = self->_items;
      v17 = v6;
      goto LABEL_14;
    }
    if (!v8) {
      break;
    }
LABEL_8:
    unint64_t v11 = v8-- + 1;
    if (v11 <= 1) {
      goto LABEL_15;
    }
  }
  v16 = self->_items;
  v17 = v6;
  uint64_t v15 = 0;
LABEL_14:
  [(NSMutableArray *)v16 insertObject:v17 atIndex:v15];
LABEL_15:
}

void __52__ICValueHistory_firstValueAfterOrEqualToTimestamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ((unint64_t)[v9 timestamp] >= *(void *)(a1 + 40))
  {
    uint64_t v6 = [v9 value];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

void __44__ICValueHistory_firstValueBeforeTimestamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ((unint64_t)[v9 timestamp] < *(void *)(a1 + 40))
  {
    uint64_t v6 = [v9 value];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

uint64_t __39__ICValueHistory_addValuesFromHistory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addValue:a2 timestamp:a3];
}

- (ICValueHistory)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICValueHistory;
  v5 = [(ICValueHistory *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSMutableArray *)v9;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    items = self->_items;
    id v6 = (NSMutableArray *)v4[1];
    if (items == v6)
    {
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      if (items && v6) {
        char v7 = -[NSMutableArray isEqual:](items, "isEqual:");
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_items hash];
}

- (void)removeValuesBeforeTimestamp:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_items count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      char v7 = [(NSMutableArray *)self->_items objectAtIndex:v6 - 2];
      unint64_t v8 = [v7 timestamp];

      if (v8 < a3) {
        [(NSMutableArray *)self->_items removeObjectAtIndex:v6 - 2];
      }
      --v6;
    }
    while (v6 > 1);
  }
}

- (void)removeAllValues
{
  self->_items = 0;
  MEMORY[0x1F41817F8]();
}

- (id)lastValueAndTimestamp:(unint64_t *)a3
{
  id v4 = [(NSMutableArray *)self->_items lastObject];
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 value];
    if (a3) {
      *a3 = [v5 timestamp];
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)lastValue
{
  v2 = [(NSMutableArray *)self->_items lastObject];
  v3 = [v2 value];

  return v3;
}

- (id)firstValueBeforeOrEqualToTimestamp:(unint64_t)a3
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = __Block_byref_object_copy__17109;
  unint64_t v11 = __Block_byref_object_dispose__17110;
  id v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ICValueHistory_firstValueBeforeOrEqualToTimestamp___block_invoke;
  v6[3] = &unk_1E5AC9408;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSMutableArray *)items enumerateObjectsWithOptions:2 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__ICValueHistory_firstValueBeforeOrEqualToTimestamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ((unint64_t)[v9 timestamp] <= *(void *)(a1 + 40))
  {
    uint64_t v6 = [v9 value];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (int64_t)count
{
  return [(NSMutableArray *)self->_items count];
}

@end