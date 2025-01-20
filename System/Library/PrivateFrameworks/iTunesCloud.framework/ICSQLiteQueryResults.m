@interface ICSQLiteQueryResults
- (ICSQLiteQueryResults)initWithStatement:(id)a3;
- (NSNumber)firstNumberValue;
- (NSString)firstStringValue;
- (int)clearBindings;
- (int64_t)firstInt64Value;
- (void)bindData:(id)a3 atPosition:(int)a4;
- (void)bindDataCopy:(id)a3 atPosition:(int)a4;
- (void)bindDouble:(double)a3 atPosition:(int)a4;
- (void)bindFloat:(float)a3 atPosition:(int)a4;
- (void)bindInt64:(int64_t)a3 atPosition:(int)a4;
- (void)bindInt:(int)a3 atPosition:(int)a4;
- (void)bindNullAtPosition:(int)a3;
- (void)bindNumber:(id)a3 atPosition:(int)a4;
- (void)bindString:(id)a3 atPosition:(int)a4;
- (void)bindStringCopy:(id)a3 atPosition:(int)a4;
- (void)enumerateRowsUsingBlock:(id)a3;
@end

@implementation ICSQLiteQueryResults

- (void).cxx_destruct
{
}

- (int)clearBindings
{
  return [(ICSQLiteStatement *)self->_statement clearBindings];
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
}

- (void)bindNullAtPosition:(int)a3
{
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
}

- (NSString)firstStringValue
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__28524;
  v9 = __Block_byref_object_dispose__28525;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__ICSQLiteQueryResults_firstStringValue__block_invoke;
  v4[3] = &unk_1E5ACA838;
  v4[4] = &v5;
  [(ICSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__ICSQLiteQueryResults_firstStringValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v6 = [a2 stringForColumnIndex:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

- (NSNumber)firstNumberValue
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__28524;
  v9 = __Block_byref_object_dispose__28525;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__ICSQLiteQueryResults_firstNumberValue__block_invoke;
  v4[3] = &unk_1E5ACA838;
  v4[4] = &v5;
  [(ICSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __40__ICSQLiteQueryResults_firstNumberValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v6 = [a2 numberForColumnIndex:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

- (int64_t)firstInt64Value
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__ICSQLiteQueryResults_firstInt64Value__block_invoke;
  v4[3] = &unk_1E5ACA838;
  v4[4] = &v5;
  [(ICSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __39__ICSQLiteQueryResults_firstInt64Value__block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v5 = result;
    result = [a2 int64ForColumnIndex:0];
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  *a4 = 1;
  return result;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  v4 = (void (**)(id, ICSQLiteRow *, void, unsigned __int8 *))a3;
  uint64_t v5 = [[ICSQLiteRow alloc] initWithStatement:self->_statement];
  uint64_t v6 = [(ICSQLiteStatement *)self->_statement sqlite3_stmt];
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = (void *)MEMORY[0x1A6240990]();
    unsigned __int8 v14 = 0;
    unsigned int v9 = sqlite3_step(v6);
    if (v9 <= 0x19)
    {
      switch(v9)
      {
        case 0u:
          goto LABEL_7;
        case 5u:
        case 6u:
          if (v7 > 9) {
            goto LABEL_13;
          }
          usleep(0xF4240u);
          ++v7;
          break;
        case 0xAu:
          v13 = [(ICSQLiteStatement *)self->_statement connection];
          [v13 resetAfterIOError];
          goto LABEL_17;
        case 0xBu:
          goto LABEL_15;
        default:
          goto LABEL_12;
      }
      goto LABEL_8;
    }
    if (v9 != 100) {
      break;
    }
LABEL_7:
    v4[2](v4, v5, 0, &v14);
LABEL_8:
    int v10 = v14;
    if (v10) {
      goto LABEL_14;
    }
  }
  if (v9 != 26)
  {
    if (v9 != 101)
    {
LABEL_12:
      v11 = [(ICSQLiteStatement *)self->_statement connection];
      v12 = [v11 currentError];

      ((void (**)(id, ICSQLiteRow *, void *, unsigned __int8 *))v4)[2](v4, 0, v12, &v14);
    }
LABEL_13:
LABEL_14:
    [(ICSQLiteStatement *)self->_statement reset];
    goto LABEL_18;
  }
LABEL_15:
  v13 = [(ICSQLiteStatement *)self->_statement connection];
  [v13 resetAfterCorruptionError];
LABEL_17:

LABEL_18:
}

- (ICSQLiteQueryResults)initWithStatement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteQueryResults;
  uint64_t v6 = [(ICSQLiteQueryResults *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statement, a3);
  }

  return v7;
}

@end