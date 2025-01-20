@interface AFBBufferBuilder(TRIFBFactorLevel)
- (id)trifbCreateFactorLevelUsingBlock:()TRIFBFactorLevel;
- (id)trifbCreateSortedVectorOfFactorLevelWithOffsets:()TRIFBFactorLevel;
- (id)trifbFinishedBufferWithRootFactorLevelOfs:()TRIFBFactorLevel error:;
- (uint64_t)trifbFinishBufferWithRootFactorLevelOfs:()TRIFBFactorLevel error:;
@end

@implementation AFBBufferBuilder(TRIFBFactorLevel)

- (id)trifbCreateFactorLevelUsingBlock:()TRIFBFactorLevel
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = (void *)MEMORY[0x19F3AD060]();
  if (!v5)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 3809, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v7 = [TRIFBFactorLevelBuilder alloc];
  id v8 = a1;
  if (v7)
  {
    v30.receiver = v7;
    v30.super_class = (Class)TRIFBFactorLevelBuilder;
    v9 = (TRIFBFactorLevelBuilder *)objc_msgSendSuper2(&v30, sel_init);
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
        if (v18 >= 9 && v17[4])
        {
          if (v18 >= 0xB && v17[5])
          {
            v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v15];
            goto LABEL_21;
          }
          v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:sel__finish, v7, @"TRIFBFastFactorLevels_generated.mm", 3657, @"%@", @"Failed to set required field \"metadata\" on a table of type: TRIFBFactorLevelBuilder" object file lineNumber description];

          v31[0] = *MEMORY[0x1E4F28568];
          v30.receiver = @"Failed to set required field \"metadata\" on a table of type: TRIFBFactorLevelBuilder";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:v31 count:1];
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          v23 = (void *)[v27 initWithDomain:*MEMORY[0x1E4F4D888] code:4 userInfo:v21];
          [(AFBBufferBuilder *)v7->_owner setError:v23];
        }
        else
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:sel__finish, v7, @"TRIFBFastFactorLevels_generated.mm", 3646, @"%@", @"Failed to set required field \"level\" on a table of type: TRIFBFactorLevelBuilder" object file lineNumber description];

          v31[0] = *MEMORY[0x1E4F28568];
          v30.receiver = @"Failed to set required field \"level\" on a table of type: TRIFBFactorLevelBuilder";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:v31 count:1];
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          v23 = (void *)[v25 initWithDomain:*MEMORY[0x1E4F4D888] code:4 userInfo:v21];
          [(AFBBufferBuilder *)v7->_owner setError:v23];
        }
      }
      else
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:sel__finish, v7, @"TRIFBFastFactorLevels_generated.mm", 3635, @"%@", @"Failed to set required field \"name\" on a table of type: TRIFBFactorLevelBuilder" object file lineNumber description];

        v31[0] = *MEMORY[0x1E4F28568];
        v30.receiver = @"Failed to set required field \"name\" on a table of type: TRIFBFactorLevelBuilder";
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

- (id)trifbCreateSortedVectorOfFactorLevelWithOffsets:()TRIFBFactorLevel
{
  v42[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 3818, @"Invalid parameter not satisfying: %@", @"offsets" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v6 = [a1 firstError];

  if (v6)
  {
    v7 = &unk_1EEFCBE10;
  }
  else
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x4812000000;
    v36 = __Block_byref_object_copy__638;
    v37 = __Block_byref_object_dispose__639;
    v38 = &unk_19D9A1DE7;
    v40 = 0;
    v41 = 0;
    __p = 0;
    unint64_t v8 = [v5 count];
    v9 = __p;
    if (v8 > (v41 - (unsigned char *)__p) >> 2)
    {
      if (v8 >> 62) {
        std::vector<apple::aiml::flatbuffers2::Offset<void>>::__throw_length_error[abi:ne180100]();
      }
      v10 = v40;
      BOOL v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<FactorMetadataKeyValue>>>(v8);
      v12 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFFCLL];
      v14 = &v11[4 * v13];
      uint64_t v15 = (char *)__p;
      v16 = v40;
      v17 = v12;
      if (v40 != __p)
      {
        v17 = v12;
        do
        {
          int v18 = *((_DWORD *)v16 - 1);
          v16 -= 4;
          *((_DWORD *)v17 - 1) = v18;
          v17 -= 4;
        }
        while (v16 != v15);
      }
      __p = v17;
      v40 = v12;
      v41 = v14;
      if (v15) {
        operator delete(v15);
      }
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __86__AFBBufferBuilder_TRIFBFactorLevel__trifbCreateSortedVectorOfFactorLevelWithOffsets___block_invoke;
    v32[3] = &unk_1E596A6E0;
    v32[4] = &v33;
    [v5 enumerateObjectsUsingBlock:v32];
    uint64_t v19 = [a1 fbb];
    v20 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)v19;
    uint64_t v21 = v34[6];
    uint64_t v22 = v34[7];
    uint64_t v23 = (v22 - v21) >> 2;
    unint64_t v24 = 126 - 2 * __clz(v23);
    if (v22 == v21) {
      id v25 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<FactorLevel>,std::allocator<apple::aiml::flatbuffers2::Offset<FactorLevel>>>(std::vector<apple::aiml::flatbuffers2::Offset<FactorLevel>> &)::t;
    }
    else {
      id v25 = (char *)v34[6];
    }
    v42[0] = v19;
    if (v22 == v21) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = v24;
    }
    std::__introsort<std::_ClassicAlgPolicy,apple::aiml::flatbuffers2::FlatBufferBuilder::TableKeyComparator<FactorLevel> &,apple::aiml::flatbuffers2::Offset<FactorLevel> *,false>((uint64_t)v25, (unsigned int *)&v25[v22 - v21], (uint64_t)v42, v26, 1);
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v20, (v22 - v21) >> 2, 4uLL);
    if (v21 != v22)
    {
      id v27 = v25 - 4;
      uint64_t v28 = (v22 - v21) >> 2;
      do
      {
        int v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v20, *(_DWORD *)&v27[4 * v28]);
        apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v20, v29);
        --v28;
      }
      while (v28);
    }
    v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v20, v23));
    _Block_object_dispose(&v33, 8);
    if (__p)
    {
      v40 = (char *)__p;
      operator delete(__p);
    }
  }

  return v7;
}

- (id)trifbFinishedBufferWithRootFactorLevelOfs:()TRIFBFactorLevel error:
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 3835, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  unint64_t v8 = [a1 firstError];

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
    int v12 = [a1 trifbFinishBufferWithRootFactorLevelOfs:v7 error:&v21];
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

- (uint64_t)trifbFinishBufferWithRootFactorLevelOfs:()TRIFBFactorLevel error:
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 3869, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  unint64_t v8 = [a1 firstError];

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

@end