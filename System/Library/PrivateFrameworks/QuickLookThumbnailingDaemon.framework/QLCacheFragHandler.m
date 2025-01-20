@interface QLCacheFragHandler
+ (void)initialize;
- (BOOL)canFindHoleForLen:(unint64_t)a3;
- (BOOL)checkConsistency;
- (BOOL)checkHolesLenConsistency;
- (BOOL)isDirty;
- (BOOL)save;
- (QLCacheFragHandler)initWithCacheThread:(id)a3;
- (QLCacheFragHandler)initWithDictionary:(id)a3 cacheThread:(id)a4;
- (QLCacheFragHandler)initWithFilePath:(id)a3 cacheThread:(id)a4;
- (QLCacheFragHandler)initWithHolePositions:(id)a3 holeLengths:(id)a4 totalLength:(int64_t)a5 holesLength:(int64_t)a6 cacheThread:(id)a7;
- (_QLCacheThread)cacheThread;
- (float)frag;
- (id)dataToSave;
- (id)lastHole;
- (id)orderedByStart;
- (unint64_t)allocateSpaceForLength:(unint64_t)a3 added:(BOOL *)a4;
- (unint64_t)totalLen;
- (void)_insertHoleInRanks:(id)a3;
- (void)_removeHoleFromRanks:(id)a3;
- (void)assertSpaceIsRetainedAtPos:(unint64_t)a3 withLen:(unint64_t)a4;
- (void)clear;
- (void)compact;
- (void)releaseSpaceAtPos:(unint64_t)a3 withLen:(unint64_t)a4;
- (void)save;
- (void)setCacheThread:(id)a3;
- (void)truncateFromPosition:(unint64_t)a3;
- (void)truncateUselessSpaceAtEndOfFile;
@end

@implementation QLCacheFragHandler

- (unint64_t)totalLen
{
  return self->_totalLen;
}

- (BOOL)save
{
  if (!self->_isDirty) {
    return 1;
  }
  if (self->_needsCompact)
  {
    v3 = _log_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(QLCacheFragHandler *)v3 save];
    }

    [(QLCacheFragHandler *)self compact];
    v11 = _log_1();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(QLCacheFragHandler *)v11 save];
    }
  }
  v19 = [(QLCacheFragHandler *)self dataToSave];
  id v25 = 0;
  v20 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v19 format:200 options:0 error:&v25];
  id v21 = v25;
  if (v20)
  {
    char v22 = [v20 writeToFile:self->_path atomically:1];
  }
  else
  {
    v23 = _log_1();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      [(QLCacheFragHandler *)(uint64_t)v21 save];
    }

    char v22 = 0;
  }
  self->_isDirty = 0;

  return v22;
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___QLCacheFragHandler;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_0);
  }
}

uint64_t __32__QLCacheFragHandler_initialize__block_invoke()
{
  uint64_t result = QLCacheInDebugMode();
  _debugCacheFragHandler = result;
  return result;
}

- (QLCacheFragHandler)initWithHolePositions:(id)a3 holeLengths:(id)a4 totalLength:(int64_t)a5 holesLength:(int64_t)a6 cacheThread:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v32.receiver = self;
  v32.super_class = (Class)QLCacheFragHandler;
  uint64_t v15 = [(QLCacheFragHandler *)&v32 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_cacheThread, v14);
    int v17 = 20;
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    do
    {
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
      [v18 addObject:v19];

      --v17;
    }
    while (v17);
    objc_storeStrong((id *)&v16->_sizeRanks, v18);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedByStart = v16->_orderedByStart;
    v16->_orderedByStart = v20;

    if (v12 && v13)
    {
      id v30 = v14;
      int64_t v31 = a6;
      uint64_t v22 = [v12 count];
      if (v22)
      {
        uint64_t v23 = v22;
        for (uint64_t i = 0; i != v23; ++i)
        {
          id v25 = [v12 objectAtIndex:i];
          uint64_t v26 = [v25 integerValue];
          v27 = [v13 objectAtIndex:i];
          v28 = +[QLCacheHole holeWithLocation:length:](QLCacheHole, "holeWithLocation:length:", v26, [v27 integerValue]);

          [(NSMutableArray *)v16->_orderedByStart addObject:v28];
          [(QLCacheFragHandler *)v16 _insertHoleInRanks:v28];
        }
      }
      id v14 = v30;
      v16->_totalLen = a5;
      v16->_holesLen = v31;
      v16->_isDirty = 0;
    }
    else
    {
      v16->_totalLen = 0;
      v16->_holesLen = 0;
      v16->_isDirty = 1;
    }
  }
  return v16;
}

- (QLCacheFragHandler)initWithFilePath:(id)a3 cacheThread:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  uint64_t v9 = [v7 dictionaryWithContentsOfFile:v6];
  uint64_t v10 = [(QLCacheFragHandler *)self initWithDictionary:v9 cacheThread:v8];

  if (v10)
  {
    uint64_t v11 = [v6 copy];
    path = v10->_path;
    v10->_path = (NSString *)v11;
  }
  return v10;
}

- (QLCacheFragHandler)initWithDictionary:(id)a3 cacheThread:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    a3 = [v7 objectForKey:@"orderedHolesPos"];
    id v8 = [v7 objectForKey:@"orderedHolesLen"];
    uint64_t v9 = [v7 objectForKey:@"totalLen"];
    uint64_t v10 = [v9 longLongValue];

    uint64_t v11 = [v7 objectForKey:@"holesLen"];

    uint64_t v12 = [v11 longLongValue];
  }
  else
  {
    id v8 = 0;
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  id v13 = [(QLCacheFragHandler *)self initWithHolePositions:a3 holeLengths:v8 totalLength:v10 holesLength:v12 cacheThread:v6];

  return v13;
}

- (QLCacheFragHandler)initWithCacheThread:(id)a3
{
  uint64_t result = [(QLCacheFragHandler *)self initWithHolePositions:0 holeLengths:0 totalLength:0 holesLength:0 cacheThread:a3];
  if (result) {
    result->_isDirty = 0;
  }
  return result;
}

- (void)_removeHoleFromRanks:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [v11 length];
  unint64_t v5 = 0;
  if (v4)
  {
    do
    {
      ++v5;
      BOOL v6 = v4 > 1;
      v4 >>= 1;
    }
    while (v6);
  }
  if (v5 >= 0x13) {
    uint64_t v7 = 19;
  }
  else {
    uint64_t v7 = v5;
  }
  id v8 = [(NSArray *)self->_sizeRanks objectAtIndexedSubscript:v7];
  uint64_t v9 = v8;
  if (_debugCacheFragHandler)
  {
    uint64_t v10 = [v8 indexOfObject:v11];
    if (v10 + 1 < (unint64_t)[v9 count]) {
      objc_msgSend(v9, "indexOfObject:inRange:", v11, v10 + 1, objc_msgSend(v9, "count") + ~v10);
    }
  }
  [v9 removeObject:v11];
}

- (void)_insertHoleInRanks:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 length];
  unint64_t v5 = v4;
  unint64_t v6 = 0;
  if (v4)
  {
    unint64_t v7 = v4;
    do
    {
      ++v6;
      BOOL v8 = v7 > 1;
      v7 >>= 1;
    }
    while (v8);
  }
  if (v6 >= 0x13) {
    uint64_t v9 = 19;
  }
  else {
    uint64_t v9 = v6;
  }
  uint64_t v10 = [(NSArray *)self->_sizeRanks objectAtIndexedSubscript:v9];
  uint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    while (1)
    {
      id v14 = [v10 objectAtIndex:v13];
      unint64_t v15 = [v14 length];

      if (v5 >= v15) {
        break;
      }
      if (v12 == ++v13)
      {
        uint64_t v13 = v12;
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v10 insertObject:v16 atIndex:v13];
}

- (void)clear
{
  for (uint64_t i = 0; i != 20; ++i)
  {
    uint64_t v4 = [(NSArray *)self->_sizeRanks objectAtIndexedSubscript:i];
    [v4 removeAllObjects];
  }
  [(NSMutableArray *)self->_orderedByStart removeAllObjects];
  self->_totalLen = 0;
  self->_holesLen = 0;
  self->_isDirty = 1;
}

- (unint64_t)allocateSpaceForLength:(unint64_t)a3 added:(BOOL *)a4
{
  unint64_t v7 = 0;
  if (a3)
  {
    unint64_t v8 = a3;
    do
    {
      ++v7;
      BOOL v9 = v8 > 1;
      v8 >>= 1;
    }
    while (v9);
  }
  uint64_t v10 = 0;
  if (v7 >= 0x13) {
    unint64_t v11 = 19;
  }
  else {
    unint64_t v11 = v7;
  }
  while (1)
  {
    uint64_t v12 = v10;
    uint64_t v10 = [(NSArray *)self->_sizeRanks objectAtIndexedSubscript:v11];

    uint64_t v13 = [v10 count];
    if (v13)
    {
      uint64_t v14 = v13;
      unint64_t v15 = [v10 objectAtIndexedSubscript:0];
      unint64_t v16 = [v15 length];

      if (v16 >= a3) {
        break;
      }
    }
    if (v11++ >= 0x13)
    {
      unint64_t totalLen = 0;
      BOOL v19 = 1;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  uint64_t v21 = v14 - 1;
  uint64_t v22 = [v10 objectAtIndex:v14 - 1];
  unint64_t v23 = [v22 length];

  if (v23 <= a3)
  {
    if (v21 < 2)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 0;
      do
      {
        uint64_t v25 = v21 + v24;
        if (v21 + v24 < 0 != __OFADD__(v21, v24)) {
          ++v25;
        }
        uint64_t v26 = (int)(v25 >> 1);
        v27 = [v10 objectAtIndex:v26];
        unint64_t v28 = [v27 length];

        if (v28 <= a3) {
          uint64_t v29 = v26;
        }
        else {
          uint64_t v29 = v21;
        }
        if (v28 < a3)
        {
          uint64_t v21 = v26;
        }
        else
        {
          uint64_t v24 = v26;
          uint64_t v21 = v29;
        }
      }
      while (v21 - v24 > 1);
    }
    id v30 = [v10 objectAtIndex:v24];
    [v30 length];

    int64_t v31 = [v10 objectAtIndex:v21];
    unint64_t v32 = [v31 length];

    if (v32 < a3) {
      uint64_t v21 = v24;
    }
  }
  v33 = [v10 objectAtIndex:v21];
  [v10 removeObject:v33];
  unint64_t v34 = [v33 length];
  unint64_t totalLen = [v33 location];
  if (v34 <= a3)
  {
    [(NSMutableArray *)self->_orderedByStart removeObject:v33];
  }
  else
  {
    objc_msgSend(v33, "setLocation:length:", totalLen + a3, objc_msgSend(v33, "length") - a3);
    [(QLCacheFragHandler *)self _insertHoleInRanks:v33];
  }

  BOOL v19 = 0;
  if (a4) {
LABEL_12:
  }
    *a4 = v19;
LABEL_13:
  if (v19)
  {
    unint64_t totalLen = self->_totalLen;
    self->_unint64_t totalLen = totalLen + a3;
  }
  else
  {
    self->_holesLen -= a3;
  }
  self->_isDirty = 1;
  if (_debugCacheFragHandler)
  {
    [(QLCacheFragHandler *)self assertSpaceIsRetainedAtPos:totalLen withLen:a3];
    [(QLCacheFragHandler *)self checkHolesLenConsistency];
  }

  return totalLen;
}

- (void)releaseSpaceAtPos:(unint64_t)a3 withLen:(unint64_t)a4
{
  if (_debugCacheFragHandler) {
    [(QLCacheFragHandler *)self assertSpaceIsRetainedAtPos:a3 withLen:a4];
  }
  uint64_t v7 = [(NSMutableArray *)self->_orderedByStart count];
  uint64_t v8 = v7;
  if (v7 < 1)
  {
    unint64_t v10 = v7;
    if (!v7) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = v7;
    do
    {
      uint64_t v11 = v10 + v9;
      if ((uint64_t)(v10 + v9) < 0 != __OFADD__(v10, v9)) {
        ++v11;
      }
      uint64_t v12 = v11 >> 1;
      uint64_t v13 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:v11 >> 1];
      unint64_t v14 = [v13 location];

      if (v14 <= a3) {
        uint64_t v15 = v12 + 1;
      }
      else {
        uint64_t v15 = v9;
      }
      if (v14 > a3) {
        unint64_t v16 = v12;
      }
      else {
        unint64_t v16 = v12 + 1;
      }
      if (v14 < a3) {
        uint64_t v9 = v12 + 1;
      }
      else {
        uint64_t v9 = v15;
      }
      if (v14 >= a3) {
        unint64_t v10 = v16;
      }
    }
    while ((uint64_t)v10 > v9);
    if (!v10) {
      goto LABEL_25;
    }
  }
  id v27 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:v10 - 1];
  uint64_t v17 = [v27 location];
  if ([v27 length] + v17 == a3)
  {
    uint64_t v18 = v27;
    goto LABEL_26;
  }

LABEL_25:
  uint64_t v18 = 0;
LABEL_26:
  if (v8) {
    BOOL v19 = v10 >= v8 - 1;
  }
  else {
    BOOL v19 = 1;
  }
  id v28 = v18;
  if (v19)
  {
    unint64_t v23 = 0;
    if (!v18) {
      goto LABEL_37;
    }
LABEL_32:
    id v20 = v18;
    [(QLCacheFragHandler *)self _removeHoleFromRanks:v20];
    uint64_t v21 = [v20 location];
    unint64_t v22 = [v20 length] + a4;
    if (v23)
    {
      objc_msgSend(v20, "setLocation:length:", v21, v22 + objc_msgSend(v23, "length"));
      [(QLCacheFragHandler *)self _removeHoleFromRanks:v23];
      [(NSMutableArray *)self->_orderedByStart removeObject:v23];
LABEL_41:
      [(QLCacheFragHandler *)self _insertHoleInRanks:v20];
      goto LABEL_42;
    }
    uint64_t v25 = v20;
    unint64_t v26 = v21;
    unint64_t v24 = v22;
LABEL_40:
    [v25 setLocation:v26 length:v24];
    goto LABEL_41;
  }
  unint64_t v23 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:v10];
  if (a4 + a3 != [v23 location])
  {

    unint64_t v23 = 0;
  }
  uint64_t v18 = v28;
  if (v28) {
    goto LABEL_32;
  }
LABEL_37:
  if (v23)
  {
    id v20 = v23;
    [(QLCacheFragHandler *)self _removeHoleFromRanks:v20];
    unint64_t v24 = [v20 length] + a4;
    uint64_t v25 = v20;
    unint64_t v26 = a3;
    goto LABEL_40;
  }
  id v20 = +[QLCacheHole holeWithLocation:a3 length:a4];
  self->_needsCompact = 1;
  [(QLCacheFragHandler *)self _insertHoleInRanks:v20];
  [(NSMutableArray *)self->_orderedByStart insertObject:v20 atIndex:v10];
LABEL_42:
  self->_holesLen += a4;
  if (_debugCacheFragHandler) {
    [(QLCacheFragHandler *)self checkHolesLenConsistency];
  }
  self->_isDirty = 1;
}

- (BOOL)canFindHoleForLen:(unint64_t)a3
{
  unint64_t v5 = 0;
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      ++v5;
      BOOL v7 = v6 > 1;
      v6 >>= 1;
    }
    while (v7);
  }
  uint64_t v8 = 0;
  if (v5 >= 0x13) {
    unint64_t v9 = 19;
  }
  else {
    unint64_t v9 = v5;
  }
  BOOL v10 = 1;
  do
  {
    uint64_t v11 = v8;
    uint64_t v8 = [(NSArray *)self->_sizeRanks objectAtIndexedSubscript:v9];

    if ([v8 count])
    {
      uint64_t v12 = [v8 objectAtIndex:0];
      unint64_t v13 = [v12 length];

      if (v13 >= a3) {
        break;
      }
    }
    BOOL v10 = v9++ < 0x13;
  }
  while (v9 != 20);

  return v10;
}

- (id)lastHole
{
  v3 = (void *)[(NSMutableArray *)self->_orderedByStart count];
  if (v3)
  {
    v3 = [(NSMutableArray *)self->_orderedByStart lastObject];
  }
  return v3;
}

- (void)truncateUselessSpaceAtEndOfFile
{
  v3 = [(NSMutableArray *)self->_orderedByStart lastObject];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [v3 location];
    uint64_t v5 = [v6 length] + v4;
    v3 = v6;
    if (v5 == self->_totalLen)
    {
      -[QLCacheFragHandler truncateFromPosition:](self, "truncateFromPosition:", [v6 location]);
      v3 = v6;
    }
  }
}

- (void)truncateFromPosition:(unint64_t)a3
{
  if (self->_totalLen > a3)
  {
    uint64_t v5 = [(NSMutableArray *)self->_orderedByStart count];
    if (v5 - 1 >= 0)
    {
      uint64_t v6 = v5;
      while (1)
      {
        BOOL v7 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:--v6];
        if ([v7 location] < a3) {
          break;
        }
        self->_holesLen -= [v7 length];
        self->_isDirty = 1;
        [(NSMutableArray *)self->_orderedByStart removeObject:v7];
        [(QLCacheFragHandler *)self _removeHoleFromRanks:v7];

        if (v6 <= 0) {
          goto LABEL_8;
        }
      }
    }
LABEL_8:
    self->_unint64_t totalLen = a3;
  }
}

- (float)frag
{
  unint64_t totalLen = self->_totalLen;
  if (totalLen) {
    return (float)self->_holesLen / (float)totalLen;
  }
  else {
    return 0.0;
  }
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (id)dataToSave
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_orderedByStart, "count"));
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_orderedByStart, "count"));
  uint64_t v6 = [(NSMutableArray *)self->_orderedByStart count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      unint64_t v9 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:i];
      BOOL v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "location"));
      [v4 addObject:v10];

      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "length"));
      [v5 addObject:v11];
    }
  }
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:self->_totalLen];
  [v3 setObject:v12 forKey:@"totalLen"];

  unint64_t v13 = [NSNumber numberWithUnsignedLongLong:self->_holesLen];
  [v3 setObject:v13 forKey:@"holesLen"];

  [v3 setObject:v4 forKey:@"orderedHolesPos"];
  [v3 setObject:v5 forKey:@"orderedHolesLen"];

  return v3;
}

- (void)compact
{
}

- (BOOL)checkHolesLenConsistency
{
  uint64_t v3 = [(NSMutableArray *)self->_orderedByStart count];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:v5];
      v6 += [v7 length];

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6 == self->_holesLen;
}

- (BOOL)checkConsistency
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_orderedByStart count];
  if (!v3) {
    return 1;
  }
  uint64_t v5 = v3;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  BOOL v8 = 1;
  *(void *)&long long v4 = 138412546;
  long long v13 = v4;
  do
  {
    unint64_t v9 = -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v6, v13);
    if ([v9 location] < v7)
    {
      BOOL v10 = _log_1();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        uint64_t v15 = v9;
        __int16 v16 = 2048;
        unint64_t v17 = v7;
        _os_log_error_impl(&dword_1DDC5E000, v10, OS_LOG_TYPE_ERROR, "inconsistency in cache frag handler: bad hole: %@ after offset : %llu", buf, 0x16u);
      }

      BOOL v8 = 0;
    }
    uint64_t v11 = [v9 location];
    unint64_t v7 = [v9 length] + v11;

    ++v6;
  }
  while (v5 != v6);
  return v8;
}

- (void)assertSpaceIsRetainedAtPos:(unint64_t)a3 withLen:(unint64_t)a4
{
  uint64_t v6 = (char *)[(NSMutableArray *)self->_orderedByStart count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    id v9 = 0;
    while (1)
    {
      BOOL v10 = v9;
      uint64_t v11 = [(NSMutableArray *)self->_orderedByStart objectAtIndex:v8];

      if ([v11 location] > a3) {
        break;
      }
      ++v8;
      id v9 = v11;
      if (v7 == (char *)v8)
      {
        unint64_t v8 = (unint64_t)v7;
        break;
      }
    }
    if (v8)
    {
      [(NSMutableArray *)self->_orderedByStart objectAtIndex:v8 - 1];
    }
    if (v8 < (unint64_t)(v7 - 1))
    {
      [(NSMutableArray *)self->_orderedByStart objectAtIndex:v8];
    }
    uint64_t v6 = v11;
  }
}

- (id)orderedByStart
{
  return self->_orderedByStart;
}

- (_QLCacheThread)cacheThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheThread);
  return (_QLCacheThread *)WeakRetained;
}

- (void)setCacheThread:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheThread);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_orderedByStart, 0);
  objc_storeStrong((id *)&self->_sizeRanks, 0);
}

- (void)save
{
}

@end