@interface AFBBufferBuilder(TRIFBMobileAssetReference)
- (id)trifbCreateMobileAssetReferenceUsingBlock:()TRIFBMobileAssetReference;
- (id)trifbCreateVectorOfMobileAssetReferenceWithOffsets:()TRIFBMobileAssetReference;
- (id)trifbFinishedBufferWithRootMobileAssetReferenceOfs:()TRIFBMobileAssetReference error:;
- (uint64_t)trifbCreateVectorOfMobileAssetReferenceWithOffsets:()TRIFBMobileAssetReference;
- (uint64_t)trifbFinishBufferWithRootMobileAssetReferenceOfs:()TRIFBMobileAssetReference error:;
- (void)trifbCreateVectorOfMobileAssetReferenceWithOffsets:()TRIFBMobileAssetReference;
@end

@implementation AFBBufferBuilder(TRIFBMobileAssetReference)

- (id)trifbCreateMobileAssetReferenceUsingBlock:()TRIFBMobileAssetReference
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = (void *)MEMORY[0x19F3AD060]();
  if (!v5)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 2346, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v7 = [TRIFBMobileAssetReferenceBuilder alloc];
  id v8 = a1;
  if (v7)
  {
    v30.receiver = v7;
    v30.super_class = (Class)TRIFBMobileAssetReferenceBuilder;
    v9 = (TRIFBMobileAssetReferenceBuilder *)objc_msgSendSuper2(&v30, sel_init);
    v7 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_owner, a1);
      v10 = [v8 firstError];
      BOOL v11 = v10 == 0;

      if (v11) {
        operator new();
      }
    }
  }

  v5[2](v5, v7);
  if (v7)
  {
    v12 = [(AFBBufferBuilder *)v7->_owner firstError];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      v14 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)[(AFBBufferBuilder *)v7->_owner fbb];
      uint64_t v15 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v14, v7->_bldr->var1);
      v16 = (int *)(*((void *)v14 + 5) + *((void *)v14 + 4) - v15);
      v17 = (unsigned __int16 *)((char *)v16 - *v16);
      unsigned int v18 = *v17;
      if (v18 >= 5 && v17[2])
      {
        if (v18 >= 7 && v17[3])
        {
          if (v18 >= 9 && v17[4])
          {
            v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v15];
            goto LABEL_21;
          }
          v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:sel__finish, v7, @"TRIFBFastFactorLevels_generated.mm", 2260, @"%@", @"Failed to set required field \"version\" on a table of type: TRIFBMobileAssetReferenceBuilder" object file lineNumber description];

          v31[0] = *MEMORY[0x1E4F28568];
          v30.receiver = @"Failed to set required field \"version\" on a table of type: TRIFBMobileAssetReferenceBuilder";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:v31 count:1];
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          v23 = (void *)[v27 initWithDomain:*MEMORY[0x1E4F4D888] code:4 userInfo:v21];
          [(AFBBufferBuilder *)v7->_owner setError:v23];
        }
        else
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:sel__finish, v7, @"TRIFBFastFactorLevels_generated.mm", 2249, @"%@", @"Failed to set required field \"specifier\" on a table of type: TRIFBMobileAssetReferenceBuilder" object file lineNumber description];

          v31[0] = *MEMORY[0x1E4F28568];
          v30.receiver = @"Failed to set required field \"specifier\" on a table of type: TRIFBMobileAssetReferenceBuilder";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:v31 count:1];
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          v23 = (void *)[v25 initWithDomain:*MEMORY[0x1E4F4D888] code:4 userInfo:v21];
          [(AFBBufferBuilder *)v7->_owner setError:v23];
        }
      }
      else
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:sel__finish, v7, @"TRIFBFastFactorLevels_generated.mm", 2238, @"%@", @"Failed to set required field \"type\" on a table of type: TRIFBMobileAssetReferenceBuilder" object file lineNumber description];

        v31[0] = *MEMORY[0x1E4F28568];
        v30.receiver = @"Failed to set required field \"type\" on a table of type: TRIFBMobileAssetReferenceBuilder";
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:v31 count:1];
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v23 = (void *)[v22 initWithDomain:*MEMORY[0x1E4F4D888] code:4 userInfo:v21];
        [(AFBBufferBuilder *)v7->_owner setError:v23];
      }
    }
    v19 = &unk_1EEFCBE10;
  }
  else
  {
    v19 = 0;
  }
LABEL_21:

  return v19;
}

- (id)trifbCreateVectorOfMobileAssetReferenceWithOffsets:()TRIFBMobileAssetReference
{
  *a2 = &unk_1EEFB6678;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbFinishedBufferWithRootMobileAssetReferenceOfs:()TRIFBMobileAssetReference error:
{
  id v7 = a3;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 2368, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  id v8 = [a1 firstError];

  if (v8)
  {
    if (a4)
    {
      [a1 firstError];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3AD060]();
    BOOL v11 = [a1 path];
    if (!v11)
    {
      unsigned int v15 = [v7 unsignedIntValue];
      v16 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb];
      apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(v16, v15, v17);
      [a1 finalizeWithSelector:a2];
      operator new();
    }
    id v21 = 0;
    int v12 = [a1 trifbFinishBufferWithRootMobileAssetReferenceOfs:v7 error:&v21];
    id v13 = v21;
    if (v12)
    {
      id v20 = v13;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v11 options:8 error:&v20];
      id v14 = v20;

      id v13 = v14;
    }
    else
    {
      v9 = 0;
    }

    if (a4) {
      *a4 = v13;
    }
  }
  return v9;
}

- (uint64_t)trifbFinishBufferWithRootMobileAssetReferenceOfs:()TRIFBMobileAssetReference error:
{
  id v7 = a3;
  if (!v7)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 2402, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  id v8 = [a1 firstError];

  if (v8)
  {
    if (a4)
    {
      [a1 firstError];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3AD060]();
    id v11 = v7;
    unsigned int v12 = [v11 unsignedIntValue];
    id v13 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb];
    apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(v13, v12, v14);
    uint64_t BufferPointer = apple::aiml::flatbuffers2::FlatBufferBuilder::GetBufferPointer((apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb]);
    v16 = (_DWORD *)[a1 fbb];
    int v17 = v16[8];
    int v18 = v16[12];
    int v19 = v16[10];
    apple::aiml::flatbuffers2::FlatBufferBuilder::Release((apple::aiml::flatbuffers2::FlatBufferBuilder *)v24, [a1 fbb]);
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer((apple::aiml::flatbuffers2::DetachedBuffer *)v24);
    id v23 = 0;
    uint64_t v9 = [a1 finalizeWithSelector:a2 allocatorBufferAddr:BufferPointer size:(v17 - v18 + v19) error:&v23];
    id v20 = v23;

    if (a4) {
      *a4 = v20;
    }
  }
  return v9;
}

- (uint64_t)trifbCreateVectorOfMobileAssetReferenceWithOffsets:()TRIFBMobileAssetReference
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z98-[AFBBufferBuilder(TRIFBMobileAssetReference) trifbCreateVectorOfMobileAssetReferenceWithOffsets:]E3$_3"
    || ((v3 & (unint64_t)"Z98-[AFBBufferBuilder(TRIFBMobileAssetReference) trifbCreateVectorOfMobileAssetReference"
                                "WithOffsets:]E3$_3" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z98-[AFBBufferBuilder(TRIFBMobileAssetReference) trifbCreateVectorOfMobileAssetReferenceWithOffsets:]E3$_3")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z98-[AFBBufferBuilder(TRIFBMobileAssetReference) trifbCreateVectorOfMobileAssetReferenceWithOffsets:]E3$_3" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfMobileAssetReferenceWithOffsets:()TRIFBMobileAssetReference
{
}

@end