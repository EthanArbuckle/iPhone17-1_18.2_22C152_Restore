@interface WBSSQLiteRow
- (BOOL)BOOLAtIndex:(unint64_t)a3;
- (BOOL)_isNullAtIndex:(unint64_t)a3;
- (RawData)uncopiedRawDataAtIndex:(SEL)a3;
- (WBSSQLiteRow)init;
- (WBSSQLiteRow)initWithCurrentRowOfEnumerator:(id)a3;
- (WBSSQLiteRow)initWithStatement:(id)a3;
- (double)doubleAtIndex:(unint64_t)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)debugDictionaryRepresentationWithStatement:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)stringAtIndex:(unint64_t)a3;
- (id)uncopiedDataAtIndex:(unint64_t)a3;
- (int)intAtIndex:(unint64_t)a3;
- (int64_t)int64AtIndex:(unint64_t)a3;
@end

@implementation WBSSQLiteRow

- (WBSSQLiteRow)initWithStatement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSSQLiteRow;
  v5 = [(WBSSQLiteRow *)&v8 init];
  if (v5)
  {
    v5->_handle = (sqlite3_stmt *)[v4 handle];
    v6 = v5;
  }

  return v5;
}

- (WBSSQLiteRow)initWithCurrentRowOfEnumerator:(id)a3
{
  id v4 = [a3 statement];
  v5 = [(WBSSQLiteRow *)self initWithStatement:v4];

  return v5;
}

- (int64_t)int64AtIndex:(unint64_t)a3
{
  return sqlite3_column_int64(self->_handle, a3);
}

- (double)doubleAtIndex:(unint64_t)a3
{
  return sqlite3_column_double(self->_handle, a3);
}

- (id)stringAtIndex:(unint64_t)a3
{
  int v3 = a3;
  if (-[WBSSQLiteRow _isNullAtIndex:](self, "_isNullAtIndex:"))
  {
    v5 = 0;
  }
  else
  {
    handle = self->_handle;
    v7 = sqlite3_column_text(handle, v3);
    int v8 = sqlite3_column_bytes(handle, v3);
    v5 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, v8, 0x8000100u, 0);
  }
  return v5;
}

- (BOOL)_isNullAtIndex:(unint64_t)a3
{
  return sqlite3_column_type(self->_handle, a3) == 5;
}

- (BOOL)BOOLAtIndex:(unint64_t)a3
{
  return [(WBSSQLiteRow *)self intAtIndex:a3] != 0;
}

- (int)intAtIndex:(unint64_t)a3
{
  return sqlite3_column_int(self->_handle, a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  switch(sqlite3_column_type(self->_handle, a3))
  {
    case 1:
      v5 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(self->_handle, a3));
      break;
    case 2:
      v5 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(self->_handle, a3));
      break;
    case 3:
      v5 = [(WBSSQLiteRow *)self stringAtIndex:a3];
      break;
    case 4:
      v5 = [(WBSSQLiteRow *)self dataAtIndex:a3];
      break;
    case 5:
      v5 = [MEMORY[0x1E4F1CA98] null];
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (WBSSQLiteRow)init
{
  return 0;
}

- (id)dataAtIndex:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(WBSSQLiteRow *)self uncopiedRawDataAtIndex:a3];
  int v3 = 0;
  if (!(_BYTE)v5)
  {
    int v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:(int)v7];
  }
  return v3;
}

- (id)uncopiedDataAtIndex:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  [(WBSSQLiteRow *)self uncopiedRawDataAtIndex:a3];
  int v3 = 0;
  if (!(_BYTE)v5)
  {
    int v3 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v6 length:(int)v7 freeWhenDone:0];
  }
  return v3;
}

- (RawData)uncopiedRawDataAtIndex:(SEL)a3
{
  int v4 = a4;
  result = (RawData *)-[WBSSQLiteRow _isNullAtIndex:](self, "_isNullAtIndex:");
  if (result)
  {
    *(void *)&retstr->var0 = 0;
    retstr->var1 = 0;
    *(void *)&retstr->var2 = 0;
    retstr->var0 = 1;
  }
  else
  {
    handle = self->_handle;
    result = (RawData *)sqlite3_column_blob(handle, v4);
    if (result)
    {
      v9 = result;
      result = (RawData *)sqlite3_column_bytes(handle, v4);
      retstr->var0 = 0;
      retstr->var1 = v9;
      retstr->var2 = (int)result;
    }
    else
    {
      *(void *)&retstr->var0 = 0;
      retstr->var1 = 0;
      *(void *)&retstr->var2 = 0;
    }
  }
  return result;
}

- (id)debugDictionaryRepresentationWithStatement:(id)a3
{
  int v4 = [a3 columnNames];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__WBSSQLiteRow_debugDictionaryRepresentationWithStatement___block_invoke;
  v8[3] = &unk_1E6159CF8;
  v8[4] = self;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __59__WBSSQLiteRow_debugDictionaryRepresentationWithStatement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  switch(sqlite3_column_type(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 8), a3))
  {
    case 1:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "int64AtIndex:", a3));
      break;
    case 2:
      id v6 = NSNumber;
      [*(id *)(a1 + 32) doubleAtIndex:a3];
      uint64_t v5 = objc_msgSend(v6, "numberWithDouble:");
      break;
    case 3:
      uint64_t v5 = [*(id *)(a1 + 32) stringAtIndex:a3];
      break;
    case 5:
      uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
      break;
    default:
      uint64_t v5 = [*(id *)(a1 + 32) dataAtIndex:a3];
      break;
  }
  uint64_t v7 = (void *)v5;
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v8];
}

@end