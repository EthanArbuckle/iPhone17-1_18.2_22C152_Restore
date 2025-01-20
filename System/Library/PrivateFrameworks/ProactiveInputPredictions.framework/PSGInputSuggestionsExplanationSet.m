@interface PSGInputSuggestionsExplanationSet
+ (BOOL)supportsSecureCoding;
+ (id)_stringFromExplanation:(unsigned __int8)a3;
+ (id)stringFromExplanationCode:(unsigned int)a3;
- (BOOL)hasContactsServingError;
- (BOOL)hasPETLoggingData;
- (BOOL)hasTriggeringXPCTimeout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExplanationSet:(id)a3;
- (PSGInputSuggestionsExplanationSet)init;
- (PSGInputSuggestionsExplanationSet)initWithCoder:(id)a3;
- (PSGInputSuggestionsExplanationSet)initWithSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)_pushExplanationCode:(unsigned __int16)a3 namespaceId:(unsigned __int16)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateExplanationCodeWithBlock:(id)a3;
- (void)pushInternalExplanationCode:(unsigned int)a3;
- (void)pushPortraitExplanationCode:(unsigned __int8)a3;
@end

@implementation PSGInputSuggestionsExplanationSet

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", @"<PSGInputSuggestionsExplanationSet: (");
  lock = self->_lock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__PSGInputSuggestionsExplanationSet_description__block_invoke;
  v7[3] = &unk_263FCF9D0;
  id v5 = v3;
  id v8 = v5;
  [(_PASLock *)lock runWithLockAcquired:v7];
  [v5 appendString:@">"]);

  return v5;
}

void __48__PSGInputSuggestionsExplanationSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a2 + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        v9 = +[PSGInputSuggestionsExplanationSet stringFromExplanationCode:](PSGInputSuggestionsExplanationSet, "stringFromExplanationCode:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "unsignedIntegerValue", (void)v10));
        [v8 appendString:v9];

        [*(id *)(a1 + 32) appendString:@"; "];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (unint64_t)hash
{
  v2 = [(_PASLock *)self->_lock unsafeGuardedData];
  id v3 = v2[1];

  if ([v3 count])
  {
    uint64_t v4 = [v3 allObjects];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    unint64_t v6 = [v5 hash];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PSGInputSuggestionsExplanationSet *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGInputSuggestionsExplanationSet *)self isEqualToExplanationSet:v5];

  return v6;
}

- (BOOL)isEqualToExplanationSet:(id)a3
{
  if (!a3) {
    return 0;
  }
  lock = self->_lock;
  uint64_t v4 = a3;
  uint64_t v5 = [(_PASLock *)lock unsafeGuardedData];
  BOOL v6 = (void *)v5[1];
  uint64_t v7 = (void *)v4[1];

  id v8 = [v7 unsafeGuardedData];
  LOBYTE(v6) = [v6 isEqualToSet:v8[1]];

  return (char)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [PSGInputSuggestionsExplanationSet alloc];
  BOOL v6 = [(_PASLock *)self->_lock unsafeGuardedData];
  uint64_t v7 = (void *)[v6[1] copyWithZone:a3];
  id v8 = [(PSGInputSuggestionsExplanationSet *)v5 initWithSet:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  lock = self->_lock;
  id v4 = a3;
  uint64_t v5 = [(_PASLock *)lock unsafeGuardedData];
  [v4 encodeObject:v5[1] forKey:@"set"];
}

- (PSGInputSuggestionsExplanationSet)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x2105116B0]();
  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"set"];

  if (v9)
  {
    self = [(PSGInputSuggestionsExplanationSet *)self initWithSet:v9];
    long long v10 = self;
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (BOOL)hasTriggeringXPCTimeout
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__PSGInputSuggestionsExplanationSet_hasTriggeringXPCTimeout__block_invoke;
  v5[3] = &unk_263FCF980;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__PSGInputSuggestionsExplanationSet_hasTriggeringXPCTimeout__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 8) containsObject:&unk_26BE132E8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)hasContactsServingError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke;
  v5[3] = &unk_263FCF980;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke_2;
  v4[3] = &unk_263FCF9A8;
  v4[4] = *(void *)(a1 + 32);
  return [v2 enumerateObjectsUsingBlock:v4];
}

void __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = [a2 unsignedIntegerValue];
  unsigned __int16 v6 = v5;
  int v7 = HIWORD(v5);
  if (HIWORD(v5) != 1)
  {
    if (HIWORD(v5) || (unsigned __int16)v5 != 1) {
      goto LABEL_8;
    }
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_8;
  }
  if ((unsigned __int16)v5 <= 0x31u && ((1 << v5) & 0x2000000005880) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v8 = psg_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109376;
      v9[1] = v7;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl(&dword_20A02A000, v8, OS_LOG_TYPE_INFO, "hasContactsServingError => YES due to expCode (%d, %d)", (uint8_t *)v9, 0xEu);
    }

    *a3 = 1;
  }
}

- (BOOL)hasPETLoggingData
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke;
  v5[3] = &unk_263FCF980;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke_2;
  v4[3] = &unk_263FCF9A8;
  v4[4] = *(void *)(a1 + 32);
  return [v2 enumerateObjectsUsingBlock:v4];
}

uint64_t __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 unsignedIntegerValue];
  if ((result - 1) <= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    if (a3) {
      *a3 = 1;
    }
  }
  return result;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__PSGInputSuggestionsExplanationSet_count__block_invoke;
  v5[3] = &unk_263FCF980;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PSGInputSuggestionsExplanationSet_count__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a2 + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)enumerateExplanationCodeWithBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke;
  v7[3] = &unk_263FCF958;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke_2;
  v3[3] = &unk_263FCF930;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

uint64_t __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntegerValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (void)pushPortraitExplanationCode:(unsigned __int8)a3
{
}

- (void)pushInternalExplanationCode:(unsigned int)a3
{
}

- (void)_pushExplanationCode:(unsigned __int16)a3 namespaceId:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a4 < 2u)
  {
    lock = self->_lock;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__PSGInputSuggestionsExplanationSet__pushExplanationCode_namespaceId___block_invoke;
    v7[3] = &__block_descriptor_36_e54_v16__0__PSGInputSuggestionsExplanationSetGuardedData_8l;
    int v8 = a3 | (a4 << 16);
    [(_PASLock *)lock runWithLockAcquired:v7];
  }
  else
  {
    int v5 = psg_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v4;
      _os_log_fault_impl(&dword_20A02A000, v5, OS_LOG_TYPE_FAULT, "Unexpcted namespace id: %d", buf, 8u);
    }
  }
}

void __70__PSGInputSuggestionsExplanationSet__pushExplanationCode_namespaceId___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 8);
  id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  [v2 addObject:v3];
}

- (PSGInputSuggestionsExplanationSet)initWithSet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSGInputSuggestionsExplanationSet;
  id v6 = [(PSGInputSuggestionsExplanationSet *)&v11 init];
  if (v6)
  {
    int v7 = (id *)objc_opt_new();
    objc_storeStrong(v7 + 1, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F61E70]) initWithGuardedData:v7];
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v8;
  }
  return v6;
}

- (PSGInputSuggestionsExplanationSet)init
{
  id v3 = objc_opt_new();
  int v4 = [(PSGInputSuggestionsExplanationSet *)self initWithSet:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringFromExplanationCode:(unsigned int)a3
{
  if (HIWORD(a3) == 1)
  {
    id v3 = [MEMORY[0x263F5D4D8] stringFromExplanation:a3];
  }
  else if (HIWORD(a3))
  {
    id v3 = @"Unknown";
  }
  else
  {
    id v3 = [a1 _stringFromExplanation:a3];
  }
  return v3;
}

+ (id)_stringFromExplanation:(unsigned __int8)a3
{
  if (a3 > 7u) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_263FCF9F0 + a3);
  }
}

@end