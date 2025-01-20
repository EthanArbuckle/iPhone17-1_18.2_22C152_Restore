@interface TRIFBFactorMetadataKeyValue
- (BOOL)isEqual:(id)a3;
- (BOOL)verifyUTF8Fields;
- (NSData)keyAsData;
- (NSData)valAsData;
- (NSString)key;
- (NSString)val;
- (TRIFBFactorMetadataKeyValue)initWithBufRef:(id)a3 cppPointer:(const FactorMetadataKeyValue *)a4;
- (const)keyAsCString;
- (const)valAsCString;
- (id)deepCopyUsingBufferBuilder:(id)a3;
- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4;
- (id)initVerifiedRootObjectFromData:(id)a3;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4;
- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6;
- (unint64_t)hash;
@end

@implementation TRIFBFactorMetadataKeyValue

- (NSString)key
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2600, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)keyAsCString
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2606, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)keyAsData
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
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2612, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (NSString)val
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (uint64_t v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2621, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  NSStringFromSelector(a2);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v10 = makeNSString(v9, self->_br, (const char *)&v7[4]);

  return (NSString *)v10;
}

- (const)valAsCString
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (uint64_t v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    v7 = &ptr[v6 + *(unsigned int *)ptr[v6].var0];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2627, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    v7 = 0;
  }
  return (const char *)&v7[4];
}

- (NSData)valAsData
{
  ptr = self->_ptr;
  v5 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v5->var0 >= 7u && (uint64_t v6 = *(unsigned __int16 *)v5[6].var0) != 0)
  {
    var0 = (unsigned int *)ptr[v6 + *(unsigned int *)ptr[v6].var0].var0;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2633, @"Invalid parameter not satisfying: %@", @"fbs" object file lineNumber description];

    var0 = 0;
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  id v10 = [(AFBBufRef *)self->_br data];
  uint64_t v11 = (uint64_t)var0 - [v10 bytes] + 4;

  v12 = [(AFBBufRef *)self->_br data];
  v13 = objc_msgSend(v12, "subdataWithRange:", v11, *var0);

  return (NSData *)v13;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  v3 = [(TRIFBFactorMetadataKeyValue *)self deepCopyUsingBufferBuilder:a3 changes:0];
  return v3;
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2646, @"Invalid parameter not satisfying: %@", @"bufferBuilder" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  if (!v8) {
    goto LABEL_6;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 3)];
    goto LABEL_13;
  }
  if (v8[8])
  {
    v12 = 0;
  }
  else
  {
LABEL_6:
    id v10 = (void *)MEMORY[0x19F3AD060]();
    uint64_t v11 = [(TRIFBFactorMetadataKeyValue *)self keyAsCString];
    if (v11)
    {
      v12 = [v7 createStringWithCString:v11];
    }
    else
    {
      v12 = 0;
    }
    if (!v8) {
      goto LABEL_15;
    }
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v8 + 5)];
  }
  else
  {
    if (!v8[16])
    {
LABEL_15:
      v13 = (void *)MEMORY[0x19F3AD060]();
      v14 = [(TRIFBFactorMetadataKeyValue *)self valAsCString];
      if (v14)
      {
        v15 = [v7 createStringWithCString:v14];
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_21;
    }
    v15 = 0;
  }
LABEL_21:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__TRIFBFactorMetadataKeyValue_deepCopyUsingBufferBuilder_changes___block_invoke;
  v21[3] = &unk_1E596A5A0;
  id v16 = v12;
  id v22 = v16;
  id v23 = v15;
  id v17 = v15;
  v18 = [v7 trifbCreateFactorMetadataKeyValueUsingBlock:v21];

  return v18;
}

void __66__TRIFBFactorMetadataKeyValue_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "setKey:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "setVal:");
  }
}

- (TRIFBFactorMetadataKeyValue)initWithBufRef:(id)a3 cppPointer:(const FactorMetadataKeyValue *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIFBFactorMetadataKeyValue;
  v8 = [(TRIFBFactorMetadataKeyValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return [(TRIFBFactorMetadataKeyValue *)self initVerifiedRootObjectFromData:a3 requireUTF8:1];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return [(TRIFBFactorMetadataKeyValue *)self initVerifiedRootObjectFromData:a3 requireUTF8:a4 maxDepth:64 maxTables:1000000];
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10 = a3;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  if (v13) {
    v14 = (FactorMetadataKeyValue *)v13;
  }
  else {
    v14 = (FactorMetadataKeyValue *)&emptyCArrayStorage;
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
        v17 && FactorMetadataKeyValue::Verify(&v14[v16], (apple::aiml::flatbuffers2::Verifier *)&v24)))
  {
    uint64_t v18 = *(unsigned int *)v14->var0;
    id v19 = objc_alloc(MEMORY[0x1E4F4D8A0]);
    v20 = objc_msgSend(v19, "initWithData:", v12, v24, v25, v26, v27, v28, v29);
    self = [(TRIFBFactorMetadataKeyValue *)self initWithBufRef:v20 cppPointer:&v14[v18]];

    v21 = self;
    if (a4)
    {
      if ([(TRIFBFactorMetadataKeyValue *)self verifyUTF8Fields]) {
        v21 = self;
      }
      else {
        v21 = 0;
      }
    }
    id v22 = v21;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (BOOL)verifyUTF8Fields
{
  ptr = self->_ptr;
  uint64_t v3 = *(int *)ptr->var0;
  unsigned int v4 = *(unsigned __int16 *)ptr[-v3].var0;
  if (v4 < 5) {
    goto LABEL_11;
  }
  if (*(_WORD *)ptr[-v3 + 4].var0)
  {
    int valid = AFBIsValidUTF8();
    if (!valid) {
      return valid;
    }
    ptr = self->_ptr;
    uint64_t v7 = *(int *)ptr->var0;
    uint64_t v8 = -v7;
    unsigned int v4 = *(unsigned __int16 *)ptr[-v7].var0;
  }
  else
  {
    uint64_t v8 = -v3;
  }
  if (v4 < 7 || !*(_WORD *)ptr[v8 + 6].var0)
  {
LABEL_11:
    LOBYTE(valid) = 1;
    return valid;
  }
  LOBYTE(valid) = AFBIsValidUTF8();
  return valid;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  unsigned int v4 = [(TRIFBFactorMetadataKeyValue *)self key];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(TRIFBFactorMetadataKeyValue *)self val];
  unint64_t v7 = [v6 hash] + 37 * v5;

  return v7;
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
      unint64_t v7 = (void *)MEMORY[0x19F3AD060]();
      uint64_t v8 = [(TRIFBFactorMetadataKeyValue *)self key];
      uint64_t v9 = [v6 key];
      if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
      {
        char v13 = 0;
      }
      else
      {
        uint64_t v11 = [(TRIFBFactorMetadataKeyValue *)self val];
        uint64_t v12 = [v6 val];
        if (v11 | v12) {
          char v13 = [(id)v11 isEqual:v12];
        }
        else {
          char v13 = 1;
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end