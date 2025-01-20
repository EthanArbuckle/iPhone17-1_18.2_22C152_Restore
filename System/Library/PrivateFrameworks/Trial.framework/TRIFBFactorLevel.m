@interface TRIFBFactorLevel
- (BOOL)hasCacheKey;
- (BOOL)hasNamespaceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSArray)metadata;
- (NSData)aliasAsData;
- (NSData)factorIdAsData;
- (NSData)factorNamespaceNameAsData;
- (NSData)levelAsStringValData;
- (NSData)nameAsData;
- (NSDictionary)metadataAsDict;
- (NSString)alias;
- (NSString)factorId;
- (NSString)factorNamespaceName;
- (NSString)levelAsStringVal;
- (NSString)name;
- (TRIFBBoxedBool)levelAsBoolVal;
- (TRIFBBoxedDouble)levelAsDoubleVal;
- (TRIFBBoxedInt64)levelAsInt64Val;
- (TRIFBFactorLevel)initWithBufRef:(id)a3 cppPointer:(const FactorLevel *)a4;
- (TRIFBMobileAssetReference)levelAsMaRefVal;
- (TRIFBTrialManagedAsset)levelAsTrialAssetVal;
- (const)aliasAsCString;
- (const)factorIdAsCString;
- (const)factorNamespaceNameAsCString;
- (const)levelAsStringValCString;
- (const)nameAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
- (unsigned)cacheKey;
- (unsigned)levelType;
- (unsigned)namespaceId;
@end

@implementation TRIFBFactorLevel

- (NSString)name
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3000, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)nameAsCString
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 5u && (uint64_t v6 = *(unsigned __int16 *)v5[4].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3006, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)nameAsData
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3012, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (unsigned)levelType
{
  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return ptr[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (TRIFBBoxedBool)levelAsBoolVal
{
  if ([(TRIFBFactorLevel *)self levelType] != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3029, @"Accessed union field \"TRIFBFactorLevel.levelAsBoolVal\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 1) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    uint64_t v9 = (uint64_t)&ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3031, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    uint64_t v9 = 0;
  }
  uint64_t v11 = -[TRIFBImmutableBoxedBool initWithBufRef:cppPointer:]([TRIFBImmutableBoxedBool alloc], self->_br, v9);
  return (TRIFBBoxedBool *)v11;
}

- (NSString)levelAsStringVal
{
  if ([(TRIFBFactorLevel *)self levelType] != 2)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3039, @"Accessed union field \"TRIFBFactorLevel.levelAsStringVal\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3041, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  v5 = (void *)[[NSString alloc] initWithUTF8String:&v4[4]];
  if (!v5)
  {
    id v9 = [NSString alloc];
    id v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v9 initWithFormat:@"%@ unable to decode null-terminated string as UTF-8", v10];

    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F4D890] reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  return (NSString *)v5;
}

- (const)levelAsStringValCString
{
  if ([(TRIFBFactorLevel *)self levelType] != 2)
  {
    unsigned int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3057, @"Accessed union field \"TRIFBFactorLevel.levelAsStringValCString\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3059, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  return (const char *)&v4[4];
}

- (NSData)levelAsStringValData
{
  if ([(TRIFBFactorLevel *)self levelType] != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3066, @"Accessed union field \"TRIFBFactorLevel.levelAsStringValData\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  uint64_t v4 = FactorLevel::level_as_string_val((FactorLevel *)self->_ptr);
  if (!v4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3068, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];
  }
  v5 = v4 + 4;
  size_t v6 = strlen((const char *)&v4[4]);
  BOOL v7 = (void *)MEMORY[0x19F3AD060]();
  id v8 = [(AFBBufRef *)self->_br data];
  id v9 = &v5[-[v8 bytes]];

  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = objc_msgSend(v10, "subdataWithRange:", v9, v6);

  return (NSData *)v11;
}

- (TRIFBBoxedInt64)levelAsInt64Val
{
  if ([(TRIFBFactorLevel *)self levelType] != 3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3079, @"Accessed union field \"TRIFBFactorLevel.levelAsInt64Val\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 3) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    uint64_t v9 = (uint64_t)&ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3081, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    uint64_t v9 = 0;
  }
  uint64_t v11 = -[TRIFBImmutableBoxedInt64 initWithBufRef:cppPointer:]([TRIFBImmutableBoxedInt64 alloc], self->_br, v9);
  return (TRIFBBoxedInt64 *)v11;
}

- (TRIFBBoxedDouble)levelAsDoubleVal
{
  if ([(TRIFBFactorLevel *)self levelType] != 4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3089, @"Accessed union field \"TRIFBFactorLevel.levelAsDoubleVal\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 4) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    uint64_t v9 = (uint64_t)&ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3091, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    uint64_t v9 = 0;
  }
  uint64_t v11 = -[TRIFBImmutableBoxedDouble initWithBufRef:cppPointer:]([TRIFBImmutableBoxedDouble alloc], self->_br, v9);
  return (TRIFBBoxedDouble *)v11;
}

- (TRIFBTrialManagedAsset)levelAsTrialAssetVal
{
  if ([(TRIFBFactorLevel *)self levelType] != 5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3099, @"Accessed union field \"TRIFBFactorLevel.levelAsTrialAssetVal\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 5) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    uint64_t v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3101, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    uint64_t v9 = 0;
  }
  uint64_t v11 = [[TRIFBTrialManagedAsset alloc] initWithBufRef:self->_br cppPointer:v9];
  return v11;
}

- (TRIFBMobileAssetReference)levelAsMaRefVal
{
  if ([(TRIFBFactorLevel *)self levelType] != 6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3109, @"Accessed union field \"TRIFBFactorLevel.levelAsMaRefVal\", but the value stored in the union does not match this type." object file lineNumber description];
  }
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  unsigned int v6 = *(unsigned __int16 *)v5->var0;
  if (v6 >= 7
    && *(_WORD *)v5[6].var0
    && (v6 >= 9 ? (BOOL v7 = ptr[*(unsigned __int16 *)v5[6].var0].var0[0] == 6) : (BOOL v7 = 0),
        v7 && (uint64_t v8 = *(unsigned __int16 *)v5[8].var0) != 0))
  {
    uint64_t v9 = &ptr[v8 + *(unsigned int *)ptr[v8].var0];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3111, @"Invalid parameter not satisfying: %@", @"nested" object file lineNumber description];

    uint64_t v9 = 0;
  }
  uint64_t v11 = [[TRIFBMobileAssetReference alloc] initWithBufRef:self->_br cppPointer:v9];
  return v11;
}

- (NSArray)metadata
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (uint64_t v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3118, @"Invalid parameter not satisfying: %@", @"vec" object file lineNumber description];

    var0 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__TRIFBFactorLevel_metadata__block_invoke;
  v12[3] = &unk_1E596A5F0;
  v12[4] = self;
  v12[5] = var0;
  uint64_t v9 = (void *)MEMORY[0x19F3AD290](v12);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4D898]) initWithBufRef:self->_br count:*var0 objectAtIndex:v9];

  return (NSArray *)v10;
}

TRIFBFactorMetadataKeyValue *__28__TRIFBFactorLevel_metadata__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = [TRIFBFactorMetadataKeyValue alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  uint64_t v6 = [(TRIFBFactorMetadataKeyValue *)v4 initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)&v5[a2 + 1] + v5[a2 + 1]];
  return v6;
}

- (NSDictionary)metadataAsDict
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 0xBu && (uint64_t v6 = *(unsigned __int16 *)v5[10].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3131, @"Invalid parameter not satisfying: %@", @"vec" object file lineNumber description];

    var0 = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__TRIFBFactorLevel_metadataAsDict__block_invoke;
  v16[3] = &unk_1E596A618;
  v16[4] = self;
  v16[5] = var0;
  uint64_t v9 = (void *)MEMORY[0x19F3AD290](v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__TRIFBFactorLevel_metadataAsDict__block_invoke_2;
  v15[3] = &unk_1E596A5F0;
  v15[4] = self;
  v15[5] = var0;
  id v10 = (void *)MEMORY[0x19F3AD290](v15);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34__TRIFBFactorLevel_metadataAsDict__block_invoke_3;
  v14[3] = &unk_1E596A640;
  v14[4] = self;
  v14[5] = var0;
  uint64_t v11 = (void *)MEMORY[0x19F3AD290](v14);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F4D8B0]) initWithBufRef:self->_br count:*var0 keyClass:objc_opt_class() keyAtIndex:v9 tableAtIndex:v10 objectForValidKey:v11];

  return (NSDictionary *)v12;
}

__CFString *__34__TRIFBFactorLevel_metadataAsDict__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 40);
  if (*v2 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  v3 = &v2[a2];
  uint64_t v4 = *(AFBBufRef **)(*(void *)(a1 + 32) + 8);
  v5 = (int *)((char *)v3 + v3[1] + 4);
  uint64_t v6 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v6 >= 5u && (uint64_t v7 = v6[2]) != 0) {
    uint64_t v8 = (char *)v5 + v7 + *(unsigned int *)((char *)v5 + v7);
  }
  else {
    uint64_t v8 = 0;
  }
  return makeNSString(&cfstr_Enumeratekeysa.isa, v4, v8 + 4);
}

TRIFBFactorMetadataKeyValue *__34__TRIFBFactorLevel_metadataAsDict__block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = [TRIFBFactorMetadataKeyValue alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2) {
    __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
  }
  uint64_t v6 = [(TRIFBFactorMetadataKeyValue *)v4 initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)&v5[a2 + 1] + v5[a2 + 1]];
  return v6;
}

TRIFBFactorMetadataKeyValue *__34__TRIFBFactorLevel_metadataAsDict__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x19F3AD060]();
  id v5 = v3;
  uint64_t v6 = [v5 UTF8String];
  if (v6
    && (uint64_t v7 = *(unsigned int **)(a1 + 40),
        uint64_t __key = v6,
        (uint64_t v8 = (unsigned int *)bsearch(&__key, v7 + 1, *v7, 4uLL, (int (__cdecl *)(const void *, const void *))apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>::KeyCompare<char const*>)) != 0))
  {
    uint64_t v9 = [[TRIFBFactorMetadataKeyValue alloc] initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)v8 + *v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)hasCacheKey
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xDu && *(_WORD *)v2[12].var0 != 0;
}

- (unsigned)cacheKey
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0) {
    return *(_DWORD *)ptr[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)alias
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0)
  {
    uint64_t v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NSString *)v8;
}

- (const)aliasAsCString
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)aliasAsData
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0)
  {
    uint64_t v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    uint64_t v8 = (void *)MEMORY[0x19F3AD060]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    id v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (NSString)factorNamespaceName
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0)
  {
    uint64_t v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NSString *)v8;
}

- (const)factorNamespaceNameAsCString
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)factorNamespaceNameAsData
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0)
  {
    uint64_t v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    uint64_t v8 = (void *)MEMORY[0x19F3AD060]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    id v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (NSString)factorId
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0)
  {
    uint64_t v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = makeNSString(v7, self->_br, (const char *)&v6[4]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return (NSString *)v8;
}

- (const)factorIdAsCString
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0) {
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  }
  else {
    return 0;
  }
}

- (NSData)factorIdAsData
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0)
  {
    uint64_t v6 = &ptr[v4];
    uint64_t v7 = *(unsigned int *)ptr[v4].var0;
    uint64_t v8 = (void *)MEMORY[0x19F3AD060]();
    id v9 = [(AFBBufRef *)self->_br data];
    var0 = (unsigned int *)v6[v7].var0;
    uint64_t v11 = (uint64_t)var0 - [v9 bytes] + 4;

    id v12 = [(AFBBufRef *)self->_br data];
    v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (BOOL)hasNamespaceId
{
  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0x15u && *(_WORD *)v2[20].var0 != 0;
}

- (unsigned)namespaceId
{
  ptr = self->_ptr;
  id v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (uint64_t v4 = *(unsigned __int16 *)v3[20].var0) != 0) {
    return *(_DWORD *)ptr[v4].var0;
  }
  else {
    return 0;
  }
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  id v3 = [(TRIFBFactorLevel *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  uint64_t v8 = a4;
  if (!v7)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3247, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  context = (void *)MEMORY[0x19F3AD060]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[8] == 1)
  {
    uint64_t v11 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
    goto LABEL_13;
  }
  if (v8[8])
  {
    uint64_t v11 = 0;
  }
  else
  {
LABEL_6:
    id v9 = (void *)MEMORY[0x19F3AD060]();
    id v10 = [(TRIFBFactorLevel *)self nameAsCString];
    if (v10)
    {
      uint64_t v11 = [v7 createStringWithCString:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (!v8) {
      goto LABEL_15;
    }
  }
LABEL_13:
  if (v8[17] == 1)
  {
    v14 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[17])
    {
LABEL_15:
      switch([(TRIFBFactorLevel *)self levelType])
      {
        case 1u:
          id v12 = [(TRIFBFactorLevel *)self levelAsBoolVal];
          uint64_t v13 = [v7 trifbCreateBoxedBoolFromBoxedBool:v12];
          goto LABEL_27;
        case 2u:
          v15 = (void *)MEMORY[0x19F3AD060]();
          v14 = objc_msgSend(v7, "createStringWithCString:", -[TRIFBFactorLevel levelAsStringValCString](self, "levelAsStringValCString"));
          goto LABEL_24;
        case 3u:
          id v12 = [(TRIFBFactorLevel *)self levelAsInt64Val];
          uint64_t v13 = [v7 trifbCreateBoxedInt64FromBoxedInt64:v12];
          goto LABEL_27;
        case 4u:
          id v12 = [(TRIFBFactorLevel *)self levelAsDoubleVal];
          uint64_t v13 = [v7 trifbCreateBoxedDoubleFromBoxedDouble:v12];
          goto LABEL_27;
        case 5u:
          id v12 = [(TRIFBFactorLevel *)self levelAsTrialAssetVal];
          uint64_t v13 = [v12 deepCopyUsingBufferBuilder:v7];
          goto LABEL_27;
        case 6u:
          id v12 = [(TRIFBFactorLevel *)self levelAsMaRefVal];
          uint64_t v13 = [v12 deepCopyUsingBufferBuilder:v7];
LABEL_27:
          v14 = (void *)v13;

          if (v8) {
            goto LABEL_28;
          }
          goto LABEL_30;
        default:
          v14 = 0;
LABEL_24:
          if (!v8) {
            goto LABEL_30;
          }
          goto LABEL_28;
      }
    }
    v14 = 0;
  }
LABEL_28:
  if (v8[24] == 1)
  {
    v20 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 7)];
  }
  else if (v8[24])
  {
    v20 = 0;
  }
  else
  {
LABEL_30:
    v16 = [(TRIFBFactorLevel *)self metadata];
    if (v16)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke;
      v50[3] = &unk_1E596A668;
      id v18 = v17;
      id v51 = v18;
      id v19 = v7;
      id v52 = v19;
      [v16 enumerateObjectsUsingBlock:v50];
      v20 = [v19 trifbCreateSortedVectorOfFactorMetadataKeyValueWithOffsets:v18];
    }
    else
    {
      v20 = 0;
    }

    if (!v8)
    {
LABEL_38:
      v21 = (void *)MEMORY[0x19F3AD060]();
      v22 = [(TRIFBFactorLevel *)self aliasAsCString];
      if (v22)
      {
        v23 = [v7 createStringWithCString:v22];
      }
      else
      {
        v23 = 0;
      }
      if (!v8) {
        goto LABEL_46;
      }
      goto LABEL_44;
    }
  }
  if (v8[40] == 1)
  {
    v23 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 11)];
  }
  else
  {
    if (!v8[40]) {
      goto LABEL_38;
    }
    v23 = 0;
  }
LABEL_44:
  if (v8[48] == 1)
  {
    v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 13)];
    goto LABEL_52;
  }
  if (v8[48])
  {
    v26 = 0;
    goto LABEL_52;
  }
LABEL_46:
  v24 = (void *)MEMORY[0x19F3AD060]();
  v25 = [(TRIFBFactorLevel *)self factorNamespaceNameAsCString];
  if (v25)
  {
    v26 = [v7 createStringWithCString:v25];
  }
  else
  {
    v26 = 0;
  }
  if (!v8) {
    goto LABEL_54;
  }
LABEL_52:
  if (v8[56] == 1)
  {
    v29 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 15)];
  }
  else
  {
    if (!v8[56])
    {
LABEL_54:
      v27 = (void *)MEMORY[0x19F3AD060]();
      v28 = [(TRIFBFactorLevel *)self factorIdAsCString];
      if (v28)
      {
        v29 = [v7 createStringWithCString:v28];
      }
      else
      {
        v29 = 0;
      }
      goto LABEL_60;
    }
    v29 = 0;
  }
LABEL_60:
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v41[3] = &unk_1E596A690;
  id v30 = v11;
  id v42 = v30;
  id v31 = v14;
  id v43 = v31;
  v32 = v8;
  id v44 = v32;
  v45 = self;
  id v33 = v20;
  id v46 = v33;
  id v34 = v23;
  id v47 = v34;
  id v35 = v26;
  id v48 = v35;
  id v49 = v29;
  id v36 = v29;
  v37 = [v7 trifbCreateFactorLevelUsingBlock:v41];

  return v37;
}

void __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 deepCopyUsingBufferBuilder:*(void *)(a1 + 40)];
  objc_msgSend(v2, "addObject:");
}

void __55__TRIFBFactorLevel_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v9, "setName:");
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 && *(unsigned char *)(v3 + 17) == 1) {
      int v4 = *(unsigned __int8 *)(v3 + 16);
    }
    else {
      int v4 = [*(id *)(a1 + 56) levelType];
    }
    switch(v4)
    {
      case 1:
        [v9 setLevelWithBoolVal:*(void *)(a1 + 40)];
        break;
      case 2:
        [v9 setLevelWithStringVal:*(void *)(a1 + 40)];
        break;
      case 3:
        [v9 setLevelWithInt64Val:*(void *)(a1 + 40)];
        break;
      case 4:
        [v9 setLevelWithDoubleVal:*(void *)(a1 + 40)];
        break;
      case 5:
        [v9 setLevelWithTrialAssetVal:*(void *)(a1 + 40)];
        break;
      case 6:
        [v9 setLevelWithMaRefVal:*(void *)(a1 + 40)];
        break;
      default:
        break;
    }
  }
  if (*(void *)(a1 + 64)) {
    objc_msgSend(v9, "setMetadata:");
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    if (*(unsigned char *)(v5 + 32) == 1)
    {
      uint64_t v6 = *(unsigned int *)(v5 + 36);
      goto LABEL_22;
    }
    if (*(unsigned char *)(v5 + 32)) {
      goto LABEL_23;
    }
  }
  uint64_t v6 = [*(id *)(a1 + 56) cacheKey];
LABEL_22:
  [v9 setCacheKey:v6];
LABEL_23:
  if (*(void *)(a1 + 72)) {
    objc_msgSend(v9, "setAlias:");
  }
  if (*(void *)(a1 + 80)) {
    objc_msgSend(v9, "setFactorNamespaceName:");
  }
  if (*(void *)(a1 + 88)) {
    objc_msgSend(v9, "setFactorId:");
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    if (*(unsigned char *)(v7 + 64) == 1)
    {
      uint64_t v8 = *(unsigned int *)(v7 + 68);
      goto LABEL_34;
    }
    if (*(unsigned char *)(v7 + 64)) {
      goto LABEL_35;
    }
  }
  uint64_t v8 = [*(id *)(a1 + 56) namespaceId];
LABEL_34:
  [v9 setNamespaceId:v8];
LABEL_35:
}

- (TRIFBFactorLevel)initWithBufRef:(id)a3 cppPointer:(const FactorLevel *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBFactorLevel;
  uint64_t v8 = [(TRIFBFactorLevel *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(TRIFBFactorLevel *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBFactorLevel *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    v14 = (FactorLevel *)v13;
  }
  else {
    v14 = (FactorLevel *)&emptyCArrayStorage;
  }
  unint64_t v15 = [v12 length];
  v24 = v14;
  unint64_t v25 = v15;
  LODWORD(v26) = 0;
  HIDWORD(v26) = a5;
  LODWORD(v27) = 0;
  HIDWORD(v27) = a6;
  uint64_t v28 = 0;
  LOBYTE(v29) = 1;
  if (v15 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  if (v15 >= 5
    && ((unint64_t v16 = *(unsigned int *)v14->var0, (int)v16 >= 1) ? (v17 = v15 - 1 >= v16) : (v17 = 0),
        v17 && FactorLevel::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    uint64_t v18 = *(unsigned int *)v14->var0;
    id v19 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v20 = objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = [(TRIFBFactorLevel *)self initWithBufRef:v20 cppPointer:&v14[v18]];

    v21 = self;
    if (a4)
    {
      if ([(TRIFBFactorLevel *)self verifyUTF8Fields]) {
        v21 = self;
      }
      else {
        v21 = 0;
      }
    }
    v22 = v21;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)verifyUTF8Fields
{
  int v3 = [(TRIFBFactorLevel *)self levelType];
  if (v3 == 6)
  {
    int v4 = [(TRIFBFactorLevel *)self levelAsMaRefVal];
    char v5 = [v4 verifyUTF8Fields];
  }
  else
  {
    if (v3 != 5)
    {
      if (v3 == 2 && FactorLevel::level_as_string_val((FactorLevel *)self->_ptr) && (AFBIsValidUTF8() & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    int v4 = [(TRIFBFactorLevel *)self levelAsTrialAssetVal];
    char v5 = [v4 verifyUTF8Fields];
  }
  char v6 = v5;

  if ((v6 & 1) == 0)
  {
LABEL_17:
    LOBYTE(valid) = 0;
    return valid;
  }
LABEL_10:
  id v7 = [(TRIFBFactorLevel *)self metadata];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __36__TRIFBFactorLevel_verifyUTF8Fields__block_invoke;
    v19[3] = &unk_1E596A6B8;
    v19[4] = &v20;
    [v7 enumerateObjectsUsingBlock:v19];
    int v9 = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    if (!v9)
    {

      goto LABEL_17;
    }
  }

  ptr = self->_ptr;
  uint64_t v11 = *(int *)ptr->var0;
  unsigned int v12 = *(unsigned __int16 *)ptr[-v11].var0;
  if (v12 < 5) {
    goto LABEL_30;
  }
  if (!*(_WORD *)ptr[-v11 + 4].var0)
  {
    uint64_t v15 = -v11;
LABEL_19:
    if (v12 >= 0xF)
    {
      if (*(_WORD *)ptr[v15 + 14].var0)
      {
        int valid = AFBIsValidUTF8();
        if (!valid) {
          return valid;
        }
        ptr = self->_ptr;
        uint64_t v16 = *(int *)ptr->var0;
        uint64_t v15 = -v16;
        unsigned int v12 = *(unsigned __int16 *)ptr[-v16].var0;
      }
      if (v12 >= 0x11)
      {
        if (*(_WORD *)ptr[v15 + 16].var0)
        {
          int valid = AFBIsValidUTF8();
          if (!valid) {
            return valid;
          }
          ptr = self->_ptr;
          uint64_t v17 = *(int *)ptr->var0;
          uint64_t v15 = -v17;
          unsigned int v12 = *(unsigned __int16 *)ptr[-v17].var0;
        }
        if (v12 >= 0x13 && *(_WORD *)ptr[v15 + 18].var0)
        {
          LOBYTE(valid) = AFBIsValidUTF8();
          return valid;
        }
      }
    }
LABEL_30:
    LOBYTE(valid) = 1;
    return valid;
  }
  int valid = AFBIsValidUTF8();
  if (valid)
  {
    ptr = self->_ptr;
    uint64_t v14 = *(int *)ptr->var0;
    uint64_t v15 = -v14;
    unsigned int v12 = *(unsigned __int16 *)ptr[-v14].var0;
    goto LABEL_19;
  }
  return valid;
}

uint64_t __36__TRIFBFactorLevel_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
  int v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  int v4 = [(TRIFBFactorLevel *)self name];
  uint64_t v5 = [v4 hash];

  unsigned int v6 = [(TRIFBFactorLevel *)self levelType];
  id v7 = [(TRIFBFactorLevel *)self metadata];
  uint64_t v8 = [v7 hash];

  unsigned int v9 = [(TRIFBFactorLevel *)self cacheKey];
  id v10 = [(TRIFBFactorLevel *)self alias];
  uint64_t v11 = [v10 hash];

  unsigned int v12 = [(TRIFBFactorLevel *)self factorNamespaceName];
  uint64_t v13 = [v12 hash];

  uint64_t v14 = [(TRIFBFactorLevel *)self factorId];
  uint64_t v15 = [v14 hash] + 37 * (v13 + 37 * (v11 + 37 * (37 * (v8 + 37 * (37 * v5 + v6)) + v9)));

  unint64_t v16 = 37 * v15 + [(TRIFBFactorLevel *)self namespaceId];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (void *)MEMORY[0x19F3AD060]();
      int v8 = [(TRIFBFactorLevel *)self levelType];
      if (v8 == [v6 levelType])
      {
        switch([(TRIFBFactorLevel *)self levelType])
        {
          case 1u:
            uint64_t v9 = [(TRIFBFactorLevel *)self levelAsBoolVal];
            uint64_t v10 = [v6 levelAsBoolVal];
            if (!(v9 | v10)) {
              goto LABEL_19;
            }
            goto LABEL_18;
          case 2u:
            uint64_t v9 = [(TRIFBFactorLevel *)self levelAsStringVal];
            uint64_t v10 = [v6 levelAsStringVal];
            if (v9 | v10) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 3u:
            uint64_t v9 = [(TRIFBFactorLevel *)self levelAsInt64Val];
            uint64_t v10 = [v6 levelAsInt64Val];
            if (v9 | v10) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 4u:
            uint64_t v9 = [(TRIFBFactorLevel *)self levelAsDoubleVal];
            uint64_t v10 = [v6 levelAsDoubleVal];
            if (v9 | v10) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 5u:
            uint64_t v9 = [(TRIFBFactorLevel *)self levelAsTrialAssetVal];
            uint64_t v10 = [v6 levelAsTrialAssetVal];
            if (v9 | v10) {
              goto LABEL_18;
            }
            goto LABEL_19;
          case 6u:
            uint64_t v9 = [(TRIFBFactorLevel *)self levelAsMaRefVal];
            uint64_t v10 = [v6 levelAsMaRefVal];
            if (!(v9 | v10)) {
              goto LABEL_19;
            }
LABEL_18:
            char v12 = [(id)v9 isEqual:v10];

            if ((v12 & 1) == 0) {
              goto LABEL_31;
            }
LABEL_19:
            uint64_t v13 = [(TRIFBFactorLevel *)self name];
            uint64_t v14 = [v6 name];
            if (v13 | v14)
            {
              int v15 = [(id)v13 isEqual:v14];

              if (!v15) {
                goto LABEL_31;
              }
            }
            uint64_t v16 = [(TRIFBFactorLevel *)self metadata];
            uint64_t v17 = [v6 metadata];
            if (v16 | v17)
            {
              int v18 = [(id)v16 isEqual:v17];

              if (!v18) {
                goto LABEL_31;
              }
            }
            unsigned int v19 = [(TRIFBFactorLevel *)self cacheKey];
            if (v19 != [v6 cacheKey]) {
              goto LABEL_31;
            }
            uint64_t v20 = [(TRIFBFactorLevel *)self alias];
            uint64_t v21 = [v6 alias];
            if (v20 | v21)
            {
              int v22 = [(id)v20 isEqual:v21];

              if (!v22) {
                goto LABEL_31;
              }
            }
            uint64_t v23 = [(TRIFBFactorLevel *)self factorNamespaceName];
            uint64_t v24 = [v6 factorNamespaceName];
            if (v23 | v24)
            {
              int v25 = [(id)v23 isEqual:v24];

              if (!v25) {
                goto LABEL_31;
              }
            }
            uint64_t v26 = [(TRIFBFactorLevel *)self factorId];
            uint64_t v27 = [v6 factorId];
            if (v26 | v27)
            {
              int v28 = [(id)v26 isEqual:v27];

              if (!v28) {
                goto LABEL_31;
              }
            }
            unsigned int v29 = [(TRIFBFactorLevel *)self namespaceId];
            BOOL v11 = v29 == [v6 namespaceId];
            break;
          default:
            goto LABEL_19;
        }
      }
      else
      {
LABEL_31:
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end