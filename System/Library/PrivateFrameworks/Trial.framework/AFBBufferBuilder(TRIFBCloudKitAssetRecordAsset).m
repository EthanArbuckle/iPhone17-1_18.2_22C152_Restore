@interface AFBBufferBuilder(TRIFBCloudKitAssetRecordAsset)
- (id)trifbCreateCloudKitAssetRecordAssetUsingBlock:()TRIFBCloudKitAssetRecordAsset;
- (id)trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:()TRIFBCloudKitAssetRecordAsset;
- (id)trifbFinishedBufferWithRootCloudKitAssetRecordAssetOfs:()TRIFBCloudKitAssetRecordAsset error:;
- (uint64_t)trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:()TRIFBCloudKitAssetRecordAsset;
- (uint64_t)trifbFinishBufferWithRootCloudKitAssetRecordAssetOfs:()TRIFBCloudKitAssetRecordAsset error:;
- (void)trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:()TRIFBCloudKitAssetRecordAsset;
@end

@implementation AFBBufferBuilder(TRIFBCloudKitAssetRecordAsset)

- (id)trifbCreateCloudKitAssetRecordAssetUsingBlock:()TRIFBCloudKitAssetRecordAsset
{
  v5 = a3;
  v6 = (void *)MEMORY[0x19F3AD060]();
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 980, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  [a1 throwIfFinalizedWithSelector:a2];
  v7 = [TRIFBCloudKitAssetRecordAssetBuilder alloc];
  id v8 = a1;
  if (v7)
  {
    v15.receiver = v7;
    v15.super_class = (Class)TRIFBCloudKitAssetRecordAssetBuilder;
    v9 = (TRIFBCloudKitAssetRecordAssetBuilder *)objc_msgSendSuper2(&v15, sel_init);
    v7 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_owner, a1);
      v10 = [v8 firstError];

      if (!v10) {
        operator new();
      }
    }
  }

  v5[2](v5, v7);
  if (v7)
  {
    v11 = [(AFBBufferBuilder *)v7->_owner firstError];

    if (v11) {
      v12 = &unk_1EEFCBE10;
    }
    else {
      v12 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)-[AFBBufferBuilder fbb](v7->_owner, "fbb"), v7->_bldr->var1));
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:()TRIFBCloudKitAssetRecordAsset
{
  *a2 = &unk_1EEFB6308;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (id)trifbFinishedBufferWithRootCloudKitAssetRecordAssetOfs:()TRIFBCloudKitAssetRecordAsset error:
{
  id v7 = a3;
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 1002, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
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
    v11 = [a1 path];
    if (!v11)
    {
      unsigned int v15 = [v7 unsignedIntValue];
      v16 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)[a1 fbb];
      apple::aiml::flatbuffers2::FlatBufferBuilder::Finish(v16, v15, v17);
      [a1 finalizeWithSelector:a2];
      operator new();
    }
    id v21 = 0;
    int v12 = [a1 trifbFinishBufferWithRootCloudKitAssetRecordAssetOfs:v7 error:&v21];
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

- (uint64_t)trifbFinishBufferWithRootCloudKitAssetRecordAssetOfs:()TRIFBCloudKitAssetRecordAsset error:
{
  id v7 = a3;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"TRIFBFastFactorLevels_generated.mm", 1036, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
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

- (uint64_t)trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:()TRIFBCloudKitAssetRecordAsset
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z106-[AFBBufferBuilder(TRIFBCloudKitAssetRecordAsset) trifbCreateVectorOfCloudKitAssetRecordAssetWi"
                     "thOffsets:]E3$_1"
    || ((v3 & (unint64_t)"Z106-[AFBBufferBuilder(TRIFBCloudKitAssetRecordAsset) trifbCreateVectorOfCloudKitAssetRe"
                                "cordAssetWithOffsets:]E3$_1" & 0x8000000000000000) != 0) != __OFSUB__(v3, "Z106-[AFBBufferBuilder(TRIFBCloudKitAssetRecordAsset) trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:]E3$_1")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z106-[AFBBufferBuilder(TRIFBCloudKitAssetRecordAsset) trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:]E3$_1" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)trifbCreateVectorOfCloudKitAssetRecordAssetWithOffsets:()TRIFBCloudKitAssetRecordAsset
{
}

@end