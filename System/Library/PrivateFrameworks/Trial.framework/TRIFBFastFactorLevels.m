@interface TRIFBFastFactorLevels
- (BOOL)enumerateNcvsUsingBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSArray)levels;
- (NSArray)ncvs;
- (NSData)namespaceNameAsData;
- (NSData)sourceAsFactorPackIdData;
- (NSData)sourceAsTreatmentIdData;
- (NSDictionary)levelsAsDict;
- (NSString)namespaceName;
- (NSString)sourceAsFactorPackId;
- (NSString)sourceAsTreatmentId;
- (TRIFBFastFactorLevels)initWithBufRef:(id)a3 cppPointer:(const FastFactorLevels *)a4;
- (const)namespaceNameAsCString;
- (const)ncvsAsCArrayWithCount:(unint64_t *)a3;
- (const)sourceAsFactorPackIdCString;
- (const)sourceAsTreatmentIdCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
- (unsigned)sourceType;
@end

@implementation TRIFBFastFactorLevels

- (NSArray)levels
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4134, @"Invalid parameter not satisfying: %@", @"vec" object file lineNumber description];

    var0 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__TRIFBFastFactorLevels_levels__block_invoke;
  v12[3] = &unk_1E596A5F0;
  v12[4] = self;
  v12[5] = var0;
  v9 = (void *)MEMORY[0x19F3AD290](v12);
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v9];

  return (NSArray *)v10;
}

TRIFBFactorLevel *__31__TRIFBFastFactorLevels_levels__block_invoke(uint64_t a1, unsigned int a2)
{
  v4 = [TRIFBFactorLevel alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  uint64_t v6 = [(TRIFBFactorLevel *)v4 initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)&v5[a2 + 1] + v5[a2 + 1]];
  return v6;
}

- (NSDictionary)levelsAsDict
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4147, @"Invalid parameter not satisfying: %@", @"vec" object file lineNumber description];

    var0 = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__TRIFBFastFactorLevels_levelsAsDict__block_invoke;
  v16[3] = &unk_1E596A618;
  v16[4] = self;
  v16[5] = var0;
  v9 = (void *)MEMORY[0x19F3AD290](v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_2;
  v15[3] = &unk_1E596A5F0;
  v15[4] = self;
  v15[5] = var0;
  v10 = (void *)MEMORY[0x19F3AD290](v15);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_3;
  v14[3] = &unk_1E596A640;
  v14[4] = self;
  v14[5] = var0;
  v11 = (void *)MEMORY[0x19F3AD290](v14);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F4D8B0]) initWithBufRef:self->_br count:*var0 keyClass:objc_opt_class() keyAtIndex:v9 tableAtIndex:v10 objectForValidKey:v11];

  return (NSDictionary *)v12;
}

__CFString *__37__TRIFBFastFactorLevels_levelsAsDict__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 40);
  if (*v2 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  v3 = &v2[a2];
  v4 = *(AFBBufRef **)(*(void *)(a1 + 32) + 8);
  v5 = (int *)((char *)v3 + v3[1] + 4);
  uint64_t v6 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v6 >= 5u && (uint64_t v7 = v6[2]) != 0) {
    v8 = (char *)v5 + v7 + *(unsigned int *)((char *)v5 + v7);
  }
  else {
    v8 = 0;
  }
  return makeNSString(&cfstr_Enumeratekeysa.isa, v4, v8 + 4);
}

TRIFBFactorLevel *__37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_2(uint64_t a1, unsigned int a2)
{
  v4 = [TRIFBFactorLevel alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  uint64_t v6 = [(TRIFBFactorLevel *)v4 initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)&v5[a2 + 1] + v5[a2 + 1]];
  return v6;
}

TRIFBFactorLevel *__37__TRIFBFastFactorLevels_levelsAsDict__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x19F3AD060]();
  id v5 = v3;
  uint64_t v6 = [v5 UTF8String];
  if (v6
    && (uint64_t v7 = *(unsigned int **)(a1 + 40),
        uint64_t __key = v6,
        (v8 = (unsigned int *)bsearch(&__key, v7 + 1, *v7, 4uLL, (int (__cdecl *)(const void *, const void *))apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorLevel>>::KeyCompare<char const*>)) != 0))
  {
    v9 = [[TRIFBFactorLevel alloc] initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)v8 + *v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unsigned)sourceType
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return ptr[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (NSString)sourceAsTreatmentId
{
  if ([(TRIFBFastFactorLevels *)self sourceType] != 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4186, @"Accessed union field \"TRIFBFastFactorLevels.sourceAsTreatmentId\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr);
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4188, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  id v5 = (void *)[[NSString alloc] initWithUTF8String:&v4[4]];
  if (!v5)
  {
    id v9 = [NSString alloc];
    v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v9 initWithFormat:@"%@ unable to decode null-terminated string as UTF-8", v10];

    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F4D890] reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  return (NSString *)v5;
}

- (const)sourceAsTreatmentIdCString
{
  if ([(TRIFBFastFactorLevels *)self sourceType] != 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4204, @"Accessed union field \"TRIFBFastFactorLevels.sourceAsTreatmentIdCString\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr);
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4206, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  return (const char *)&v4[4];
}

- (NSData)sourceAsTreatmentIdData
{
  if ([(TRIFBFastFactorLevels *)self sourceType] != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4213, @"Accessed union field \"TRIFBFastFactorLevels.sourceAsTreatmentIdData\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr);
  if (!v4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4215, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  id v5 = v4 + 4;
  size_t v6 = strlen((const char *)&v4[4]);
  uint64_t v7 = (void *)MEMORY[0x19F3AD060]();
  id v8 = [(AFBBufRef *)self->_br data];
  id v9 = &v5[-[v8 bytes]];

  v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = objc_msgSend(v10, "subdataWithRange:", v9, v6);

  return (NSData *)v11;
}

- (NSString)sourceAsFactorPackId
{
  if ([(TRIFBFastFactorLevels *)self sourceType] != 2)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4226, @"Accessed union field \"TRIFBFastFactorLevels.sourceAsFactorPackId\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4228, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  id v5 = (void *)[[NSString alloc] initWithUTF8String:&v4[4]];
  if (!v5)
  {
    id v9 = [NSString alloc];
    v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v9 initWithFormat:@"%@ unable to decode null-terminated string as UTF-8", v10];

    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F4D890] reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  return (NSString *)v5;
}

- (const)sourceAsFactorPackIdCString
{
  if ([(TRIFBFastFactorLevels *)self sourceType] != 2)
  {
    size_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4244, @"Accessed union field \"TRIFBFastFactorLevels.sourceAsFactorPackIdCString\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4246, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  return (const char *)&v4[4];
}

- (NSData)sourceAsFactorPackIdData
{
  if ([(TRIFBFastFactorLevels *)self sourceType] != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4253, @"Accessed union field \"TRIFBFastFactorLevels.sourceAsFactorPackIdData\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4255, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  id v5 = v4 + 4;
  size_t v6 = strlen((const char *)&v4[4]);
  uint64_t v7 = (void *)MEMORY[0x19F3AD060]();
  id v8 = [(AFBBufRef *)self->_br data];
  id v9 = &v5[-[v8 bytes]];

  v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = objc_msgSend(v10, "subdataWithRange:", v9, v6);

  return (NSData *)v11;
}

- (NSString)namespaceName
{
  ptr = self->_ptr;
  id v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (uint64_t v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    uint64_t v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4265, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    uint64_t v7 = 0;
  }
  NSStringFromSelector(a2);
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)namespaceNameAsCString
{
  ptr = self->_ptr;
  id v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (uint64_t v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    uint64_t v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4271, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    uint64_t v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)namespaceNameAsData
{
  ptr = self->_ptr;
  id v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (uint64_t v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4277, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  id v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  id v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (NSArray)ncvs
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__TRIFBFastFactorLevels_ncvs__block_invoke;
    v10[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
    v10[4] = var0;
    uint64_t v7 = (void *)MEMORY[0x19F3AD290](v10, a2);
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v7];
  }
  else
  {
    id v8 = 0;
  }
  return (NSArray *)v8;
}

id __29__TRIFBFastFactorLevels_ncvs__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  id v3 = (void *)[objc_alloc(NSNumber) initWithLongLong:v2[a2 + 1]];
  return v3;
}

- (const)ncvsAsCArrayWithCount:(unint64_t *)a3
{
  if (a3) {
    *a3 = 0;
  }
  ptr = self->_ptr;
  uint64_t v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 0xDu) {
    return 0;
  }
  uint64_t v5 = *(unsigned __int16 *)v4[12].var0;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  unint64_t v7 = *(unsigned int *)v6->var0;
  if (a3) {
    *a3 = v7;
  }
  var0 = (const unsigned int *)v6[4].var0;
  if (v7) {
    return var0;
  }
  else {
    return (const unsigned int *)&emptyCArrayStorage;
  }
}

- (BOOL)enumerateNcvsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  uint64_t v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0)
  {
    id v8 = &ptr[v7];
    uint64_t v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      unint64_t v10 = 0;
      uint64_t v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        uint64_t v12 = MEMORY[0x19F3AD060]();
        unsigned __int8 v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0) {
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        }
        v13 = (void *)v12;
        v4[2](v4, *(unsigned int *)(v11 + 4 * v10), v10, &v17);
        int v14 = v17;
        if (v14) {
          break;
        }
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  id v3 = [(TRIFBFastFactorLevels *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4329, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  uint64_t v9 = (void *)MEMORY[0x19F3AD060]();
  if (!v8)
  {
LABEL_6:
    unint64_t v10 = [(TRIFBFastFactorLevels *)self levels];
    if (v10)
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke;
      v39[3] = &unk_1E596A728;
      id v12 = v11;
      id v40 = v12;
      id v13 = v7;
      id v41 = v13;
      [v10 enumerateObjectsUsingBlock:v39];
      int v14 = [v13 trifbCreateSortedVectorOfFactorLevelWithOffsets:v12];
    }
    else
    {
      int v14 = 0;
    }

    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v8[8] == 1)
  {
    int v14 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
  }
  else
  {
    if (!v8[8]) {
      goto LABEL_6;
    }
    int v14 = 0;
  }
LABEL_13:
  if (v8[17] == 1)
  {
    unsigned __int8 v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
    goto LABEL_24;
  }
  if (v8[17])
  {
    unsigned __int8 v17 = 0;
    goto LABEL_24;
  }
LABEL_15:
  int v15 = [(TRIFBFastFactorLevels *)self sourceType];
  if (v15 == 1)
  {
    v18 = (void *)MEMORY[0x19F3AD060]();
    unsigned __int8 v17 = objc_msgSend(v7, "createStringWithCString:", -[TRIFBFastFactorLevels sourceAsTreatmentIdCString](self, "sourceAsTreatmentIdCString"));
LABEL_21:
    if (!v8) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if (v15 == 2)
  {
    v16 = (void *)MEMORY[0x19F3AD060]();
    unsigned __int8 v17 = objc_msgSend(v7, "createStringWithCString:", -[TRIFBFastFactorLevels sourceAsFactorPackIdCString](self, "sourceAsFactorPackIdCString"));
    goto LABEL_21;
  }
  unsigned __int8 v17 = 0;
  if (!v8) {
    goto LABEL_26;
  }
LABEL_24:
  if (v8[24] == 1)
  {
    v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 7)];
    goto LABEL_32;
  }
  if (v8[24])
  {
    v21 = 0;
    goto LABEL_32;
  }
LABEL_26:
  v19 = (void *)MEMORY[0x19F3AD060]();
  v20 = [(TRIFBFastFactorLevels *)self namespaceNameAsCString];
  if (v20)
  {
    v21 = [v7 createStringWithCString:v20];
  }
  else
  {
    v21 = 0;
  }
  if (!v8) {
    goto LABEL_34;
  }
LABEL_32:
  if (v8[32] == 1)
  {
    v23 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 9)];
  }
  else
  {
    if (!v8[32])
    {
LABEL_34:
      v22 = [(TRIFBFastFactorLevels *)self ncvs];
      if (v22)
      {
        v23 = [v7 createVectorOfUInt32WithArray:v22];
      }
      else
      {
        v23 = 0;
      }

      goto LABEL_40;
    }
    v23 = 0;
  }
LABEL_40:
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v32[3] = &unk_1E596A750;
  id v24 = v14;
  id v33 = v24;
  id v25 = v17;
  id v34 = v25;
  v26 = v8;
  id v35 = v26;
  v36 = self;
  id v27 = v21;
  id v37 = v27;
  id v38 = v23;
  id v28 = v23;
  v29 = [v7 trifbCreateFastFactorLevelsUsingBlock:v32];

  return v29;
}

void __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 deepCopyUsingBufferBuilder:*(void *)(a1 + 40)];
  objc_msgSend(v2, "addObject:");
}

void __60__TRIFBFastFactorLevels_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "setLevels:");
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 && *(unsigned char *)(v3 + 17) == 1) {
      int v4 = *(unsigned __int8 *)(v3 + 16);
    }
    else {
      int v4 = [*(id *)(a1 + 56) sourceType];
    }
    if (v4 == 1)
    {
      [v5 setSourceWithTreatmentId:*(void *)(a1 + 40)];
    }
    else if (v4 == 2)
    {
      [v5 setSourceWithFactorPackId:*(void *)(a1 + 40)];
    }
  }
  if (*(void *)(a1 + 64)) {
    objc_msgSend(v5, "setNamespaceName:");
  }
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v5, "setNcvs:");
  }
}

- (TRIFBFastFactorLevels)initWithBufRef:(id)a3 cppPointer:(const FastFactorLevels *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBFastFactorLevels;
  id v8 = [(TRIFBFastFactorLevels *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(TRIFBFastFactorLevels *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBFastFactorLevels *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    int v14 = (const unsigned __int8 *)v13;
  }
  else {
    int v14 = (const unsigned __int8 *)&emptyCArrayStorage;
  }
  unint64_t v15 = [v12 length];
  v42 = (apple::aiml::flatbuffers2::Table *)v14;
  unint64_t v43 = v15;
  int v44 = 0;
  unsigned int v45 = a5;
  int v46 = 0;
  unsigned int v47 = a6;
  uint64_t v48 = 0;
  char v49 = 1;
  if (v15 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  if (v15 < 5) {
    goto LABEL_51;
  }
  unint64_t v16 = *(unsigned int *)v14;
  if ((int)v16 < 1 || v15 - 1 < v16) {
    goto LABEL_51;
  }
  v18 = (apple::aiml::flatbuffers2::Table *)&v14[v16];
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v42, &v14[v16])
    || !apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 4u))
  {
    goto LABEL_51;
  }
  uint64_t v19 = *(int *)v18;
  uint64_t v20 = -v19;
  v21 = (unsigned __int16 *)((char *)v18 - v19);
  if (*v21 >= 5u)
  {
    uint64_t v22 = v21[2];
    if (v22)
    {
      if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v42, (const unsigned __int8 *)v18 + v22 + *(unsigned int *)((char *)v18 + v22), 4uLL, 0))goto LABEL_51; {
      uint64_t v23 = *(int *)v18;
      }
      uint64_t v20 = -v23;
      id v24 = (unsigned __int16 *)((char *)v18 - v23);
      if (*v24 >= 5u)
      {
        uint64_t v25 = v24[2];
        if (v25)
        {
          v26 = (FactorLevel *)v18 + v25 + *(unsigned int *)((char *)v18 + v25);
          if (*(_DWORD *)v26->var0)
          {
            unint64_t v27 = 0;
            id v28 = v26 + 4;
            while (FactorLevel::Verify(&v28[*(unsigned int *)v28->var0], (apple::aiml::flatbuffers2::Verifier *)&v42))
            {
              ++v27;
              v28 += 4;
              if (v27 >= *(unsigned int *)v26->var0)
              {
                uint64_t v20 = -(uint64_t)*(int *)v18;
                goto LABEL_23;
              }
            }
            goto LABEL_51;
          }
        }
      }
    }
  }
LABEL_23:
  v29 = (char *)v18 + v20;
  unsigned int v30 = *(unsigned __int16 *)((char *)v18 + v20);
  if (v30 >= 7)
  {
    if (*((_WORD *)v29 + 3))
    {
      v31 = 0;
      if (v43 < 2 || v43 - 1 < (apple::aiml::flatbuffers2::Table *)((char *)v18 + *((unsigned __int16 *)v29 + 3)) - v42) {
        goto LABEL_52;
      }
    }
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 8u))
  {
LABEL_51:
    v31 = 0;
    goto LABEL_52;
  }
  if (v30 >= 9)
  {
    if (*((_WORD *)v29 + 4))
    {
      v32 = (const unsigned __int8 *)v18
          + *((unsigned __int16 *)v29 + 4)
          + *(unsigned int *)((char *)v18 + *((unsigned __int16 *)v29 + 4));
LABEL_33:
      if (!*((_WORD *)v29 + 3)
        || *((unsigned __int8 *)v18 + *((unsigned __int16 *)v29 + 3)) - 1 > 1
        || apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v42, v32))
      {
        goto LABEL_36;
      }
      goto LABEL_51;
    }
LABEL_32:
    v32 = 0;
    goto LABEL_33;
  }
  if (v30 >= 7) {
    goto LABEL_32;
  }
LABEL_36:
  if (!apple::aiml::flatbuffers2::Table::VerifyOffsetRequired(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 0xAu))goto LABEL_51; {
  id v33 = (unsigned __int16 *)((char *)v18 - *(int *)v18);
  }
  if (*v33 >= 0xBu && (uint64_t v34 = v33[5]) != 0) {
    id v35 = (const unsigned __int8 *)v18 + v34 + *(unsigned int *)((char *)v18 + v34);
  }
  else {
    id v35 = 0;
  }
  if (!apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v42, v35)) {
    goto LABEL_51;
  }
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v18, (const apple::aiml::flatbuffers2::Verifier *)&v42, 0xCu)) {
    goto LABEL_51;
  }
  v36 = (unsigned __int16 *)((char *)v18 - *(int *)v18);
  if (*v36 >= 0xDu)
  {
    uint64_t v37 = v36[6];
    if (v37)
    {
      if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v42, (const unsigned __int8 *)v18 + v37 + *(unsigned int *)((char *)v18 + v37), 4uLL, 0))goto LABEL_51; {
    }
      }
  }
  --v44;
  uint64_t v38 = *(unsigned int *)v14;
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F4D8A0]) initWithData:v12];
  self = [(TRIFBFastFactorLevels *)self initWithBufRef:v39 cppPointer:&v14[v38]];

  id v40 = self;
  if (a4)
  {
    if ([(TRIFBFastFactorLevels *)self verifyUTF8Fields]) {
      id v40 = self;
    }
    else {
      id v40 = 0;
    }
  }
  v31 = v40;

LABEL_52:

  return v31;
}

- (BOOL)verifyUTF8Fields
{
  uint64_t v3 = [(TRIFBFastFactorLevels *)self levels];
  int v4 = v3;
  if (v3)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__TRIFBFastFactorLevels_verifyUTF8Fields__block_invoke;
    v10[3] = &unk_1E596A778;
    v10[4] = &v11;
    [v3 enumerateObjectsUsingBlock:v10];
    int v5 = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {

LABEL_15:
      LOBYTE(valid) = 0;
      return valid;
    }
  }

  int v6 = [(TRIFBFastFactorLevels *)self sourceType];
  if (v6 == 2)
  {
    if (FactorLevel::level_as_string_val((FactorLevel *)self->_ptr))
    {
      int valid = AFBIsValidUTF8();
      if (!valid) {
        return valid;
      }
    }
  }
  else if (v6 == 1 {
         && FastFactorLevels::source_as_treatment_id((FastFactorLevels *)self->_ptr)
  }
         && (AFBIsValidUTF8() & 1) == 0)
  {
    goto LABEL_15;
  }
  id v8 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v8->var0 >= 0xBu && *(_WORD *)v8[10].var0) {
    LOBYTE(valid) = AFBIsValidUTF8();
  }
  else {
    LOBYTE(valid) = 1;
  }
  return valid;
}

uint64_t __41__TRIFBFastFactorLevels_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 verifyUTF8Fields];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  int v4 = [(TRIFBFastFactorLevels *)self levels];
  uint64_t v5 = [v4 hash];

  unsigned int v6 = [(TRIFBFastFactorLevels *)self sourceType];
  id v7 = [(TRIFBFastFactorLevels *)self namespaceName];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(TRIFBFastFactorLevels *)self ncvs];
  unint64_t v10 = [v9 hash] + 37 * (v8 + 37 * (37 * v5 + v6));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v12 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v7 = (void *)MEMORY[0x19F3AD060]();
    int v8 = [(TRIFBFastFactorLevels *)self sourceType];
    if (v8 != [v6 sourceType]) {
      goto LABEL_18;
    }
    int v9 = [(TRIFBFastFactorLevels *)self sourceType];
    if (v9 == 2)
    {
      uint64_t v10 = [(TRIFBFastFactorLevels *)self sourceAsFactorPackId];
      uint64_t v11 = [v6 sourceAsFactorPackId];
      if (v10 | v11) {
        goto LABEL_11;
      }
    }
    else if (v9 == 1)
    {
      uint64_t v10 = [(TRIFBFastFactorLevels *)self sourceAsTreatmentId];
      uint64_t v11 = [v6 sourceAsTreatmentId];
      if (v10 | v11)
      {
LABEL_11:
        char v13 = [(id)v10 isEqual:v11];

        if ((v13 & 1) == 0) {
          goto LABEL_18;
        }
      }
    }
    uint64_t v14 = [(TRIFBFastFactorLevels *)self levels];
    uint64_t v15 = [v6 levels];
    if (!(v14 | v15)
      || (int v16 = [(id)v14 isEqual:v15], (id)v15, (id)v14, v16))
    {
      uint64_t v17 = [(TRIFBFastFactorLevels *)self namespaceName];
      uint64_t v18 = [v6 namespaceName];
      if (!(v17 | v18)
        || (int v19 = [(id)v17 isEqual:v18], (id)v18, (id)v17, v19))
      {
        uint64_t v20 = [(TRIFBFastFactorLevels *)self ncvs];
        uint64_t v21 = [v6 ncvs];
        if (v20 | v21) {
          char v12 = [(id)v20 isEqual:v21];
        }
        else {
          char v12 = 1;
        }

        goto LABEL_21;
      }
    }
LABEL_18:
    char v12 = 0;
LABEL_21:
    goto LABEL_22;
  }
  char v12 = 0;
LABEL_23:

  return v12;
}

- (void).cxx_destruct
{
}

@end