@interface TSTMergeRegionMap
+ (id)mergeRegionMapFromMap:(id)a3 intersectingRange:(id)a4;
- ($CA3468F20078D5D2DB35E78E73CA60DA)mergedRangeForCellID:(id)a3;
- ($CA3468F20078D5D2DB35E78E73CA60DA)unionedMergeRange;
- (BOOL)find:(id)a3;
- (BOOL)hasRangeSpanningRows;
- (BOOL)insert:(id)a3;
- (BOOL)partiallyIntersectsCellRange:(id)a3;
- (BOOL)partiallyIntersectsCellRegion:(id)a3;
- (BOOL)remove:(id)a3;
- (TSTMergeRegionMap)initWithContext:(id)a3;
- (id).cxx_construct;
- (id)description;
- (id)initRegionMapFromMap:(id)a3 intersectingRange:(id)a4;
- (id)initRegionMapFromMap:(id)a3 rowRemapping:(id)a4;
- (id)iterator;
- (id)mergedGridIndicesForDimension:(int)a3;
- (unint64_t)count;
@end

@implementation TSTMergeRegionMap

+ (id)mergeRegionMapFromMap:(id)a3 intersectingRange:(id)a4
{
  id v4 = [[TSTMergeRegionMap alloc] initRegionMapFromMap:a3 intersectingRange:a4];

  return v4;
}

- (id)initRegionMapFromMap:(id)a3 rowRemapping:(id)a4
{
  if (([a4 isVertical] & 1) == 0)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap initRegionMapFromMap:rowRemapping:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 26, @"remapping must be vertical.");
  }
  v9 = -[TSTMergeRegionMap initWithContext:](self, "initWithContext:", [a3 context]);
  v10 = v9;
  if (a3 && v9)
  {
    v11 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:a3];
    if ([(TSTMergeRegionMapIterator *)v11 hasNextMergeRegion])
    {
      do
      {
        uint64_t v12 = [(TSTMergeRegionMapIterator *)v11 nextMergeRegion];
        -[TSTMergeRegionMap insert:](v10, "insert:", v12 & 0xFFFFFFFFFFFF0000 | [a4 mapIndex:(unsigned __int16)v12]);
      }
      while ([(TSTMergeRegionMapIterator *)v11 hasNextMergeRegion]);
    }
  }
  return v10;
}

- (id)initRegionMapFromMap:(id)a3 intersectingRange:(id)a4
{
  v6 = -[TSTMergeRegionMap initWithContext:](self, "initWithContext:", [a3 context]);
  v7 = v6;
  if (!a3
    || !v6
    || a4.var0.var0 == 0xFFFF
    || (*(void *)&a4 & 0xFF0000) == 0xFF0000
    || !HIWORD(*(unint64_t *)&a4)
    || (*(void *)&a4 & 0xFFFF00000000) == 0)
  {
    return v7;
  }
  unint64_t v8 = HIDWORD(*(unint64_t *)&a4);
  if (a4.var1.var0 * *(unsigned int *)&a4.var1.var1 >= *((_DWORD *)a3 + 28))
  {
    v16 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:a3];
    if (![(TSTMergeRegionMapIterator *)v16 hasNextMergeRegion])
    {
LABEL_55:

      return v7;
    }
    while (1)
    {
      unint64_t v17 = [(TSTMergeRegionMapIterator *)v16 nextMergeRegion];
      unint64_t v18 = 0;
      if ((_WORD)v17 != 0xFFFF)
      {
        uint64_t v19 = 0xFFFFLL;
        uint64_t v20 = 16711680;
        unint64_t v21 = 0;
        if ((v17 & 0xFF0000) == 0xFF0000) {
          goto LABEL_45;
        }
        unint64_t v18 = 0;
        if (HIWORD(v17))
        {
          uint64_t v19 = 0xFFFFLL;
          uint64_t v20 = 16711680;
          unint64_t v21 = 0;
          if ((v17 & 0xFFFF00000000) != 0)
          {
            uint64_t v19 = 0;
            unsigned int var1 = BYTE2(v17);
            if (BYTE2(v17) <= a4.var0.var1) {
              unsigned int var1 = a4.var0.var1;
            }
            if ((unsigned __int16)v17 <= a4.var0.var0) {
              uint64_t var0 = a4.var0.var0;
            }
            else {
              uint64_t var0 = (unsigned __int16)v17;
            }
            if ((BYTE4(v17) + BYTE2(v17) - 1) >= (LOBYTE(a4.var1.var0)
                                                                                                 + a4.var0.var1
                                                                                                 - 1))
              unsigned int v24 = (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1);
            else {
              unsigned int v24 = (BYTE4(v17) + BYTE2(v17) - 1);
            }
            if ((unsigned __int16)(v17 + HIWORD(v17) - 1) >= (unsigned __int16)(a4.var0.var0
                                                                                             + a4.var1.var1
                                                                                             - 1))
              unsigned int v25 = (unsigned __int16)(a4.var0.var0 + a4.var1.var1 - 1);
            else {
              unsigned int v25 = (unsigned __int16)(v17 + HIWORD(v17) - 1);
            }
            uint64_t v20 = 0;
            unint64_t v18 = 0;
            unint64_t v21 = 0;
            if (var0 <= v25 && var1 <= v24)
            {
              unint64_t v21 = ((unint64_t)(v25 - var0) << 48) + 0x1000000000000;
              unint64_t v18 = (unint64_t)(unsigned __int16)(v24 - var1 + 1) << 32;
              uint64_t v20 = var1 << 16;
              uint64_t v19 = var0;
            }
          }
          goto LABEL_45;
        }
      }
      uint64_t v19 = 0xFFFFLL;
      uint64_t v20 = 16711680;
      unint64_t v21 = 0;
LABEL_45:
      unint64_t v26 = v20 | v21 | v19 | v18;
      if ((_WORD)v26 != 0xFFFF)
      {
        BOOL v14 = (v26 & 0xFF0000) == 16711680;
        uint64_t v27 = v26 & 0xFFFF00000000;
        unint64_t v28 = HIWORD(v26);
        BOOL v29 = v14 || v28 == 0;
        if (!v29 && v27 != 0) {
          -[TSTMergeRegionMap insert:](v7, "insert:");
        }
      }
      if (![(TSTMergeRegionMapIterator *)v16 hasNextMergeRegion]) {
        goto LABEL_55;
      }
    }
  }
  unsigned __int16 v9 = a4.var0.var0 + a4.var1.var1 - 1;
  if (v9 >= a4.var0.var0)
  {
    unsigned __int16 v10 = a4.var0.var0;
    do
    {
      if (a4.var0.var1 <= (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1))
      {
        unint64_t v11 = *(unint64_t *)&a4 >> 16;
        do
        {
          unint64_t v8 = v10 | ((unint64_t)v11 << 16) | v8 & 0xFFFFFFFF00000000;
          unint64_t v12 = [a3 mergedRangeForCellID:v8];
          unint64_t v13 = v12;
          if ((_WORD)v12 != 0xFFFF)
          {
            BOOL v14 = (v12 & 0xFF0000) == 0xFF0000 || HIWORD(v12) == 0;
            BOOL v15 = v14 || (v12 & 0xFFFF00000000) == 0;
            if (!v15 && ![(TSTMergeRegionMap *)v7 find:v12]) {
              [(TSTMergeRegionMap *)v7 insert:v13];
            }
          }
          LOBYTE(v11) = v11 + 1;
        }
        while (v11 <= (LOBYTE(a4.var1.var0) + a4.var0.var1 - 1));
      }
      ++v10;
    }
    while (v10 <= v9);
  }
  return v7;
}

- (TSTMergeRegionMap)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTMergeRegionMap;
  result = [(TSPObject *)&v4 initWithContext:a3];
  if (result) {
    result->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  }
  return result;
}

- (id)iterator
{
  v2 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:self];

  return v2;
}

- (unint64_t)count
{
  return self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p2_.__value_;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"TSTMergeRegionMap %p: ", self);
  objc_super v4 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:self];
  if ([(TSTMergeRegionMapIterator *)v4 hasNextMergeRegion])
  {
    do
    {
      unint64_t v5 = [(TSTMergeRegionMapIterator *)v4 nextMergeRegion];
      v6 = NSString;
      uint64_t v7 = [NSString stringWithFormat:@"(%hu, %hu)", BYTE2(v5), (unsigned __int16)v5];
      [v3 appendString:objc_msgSend(v6, "stringWithFormat:", @"(%@, %@)", v7, objc_msgSend(NSString, "stringWithFormat:", @"%hux%hu", WORD2(v5), HIWORD(v5)))];
      if ([(TSTMergeRegionMapIterator *)v4 hasNextMergeRegion]) {
        [v3 appendString:@", "];
      }
    }
    while ([(TSTMergeRegionMapIterator *)v4 hasNextMergeRegion]);
  }

  return v3;
}

- (BOOL)insert:(id)a3
{
  __int16 v5 = ~a3.var0.var0;
  unint64_t v22 = (unint64_t)a3;
  [(TSPObject *)self willModify];
  if (!v5
    || (*(void *)&a3 & 0xFF0000) == 0xFF0000
    || !HIWORD(*(unint64_t *)&a3)
    || (*(void *)&a3 & 0xFFFF00000000) == 0)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap insert:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 172, @"can't insert an invalid merge range");
  }
  unsigned __int16 v8 = a3.var0.var0 + a3.var1.var1 - 1;
  if (v8 >= a3.var0.var0)
  {
    unsigned __int16 var0 = a3.var0.var0;
    while (a3.var0.var1 > (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
    {
LABEL_15:
      if (++var0 > v8)
      {
        unsigned __int16 v16 = a3.var0.var0;
        do
        {
          if (a3.var0.var1 <= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
          {
            unint64_t v17 = *(unint64_t *)&a3 >> 16;
            do
            {
              int v21 = v16 | (v17 << 16);
              v23 = &v21;
              *((_DWORD *)std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__emplace_unique_key_args<TSUColumnRowCoordinate,std::piecewise_construct_t const&,std::tuple<TSUColumnRowCoordinate const&>,std::tuple<>>((uint64_t)&self->mCellIDToMergeRegionTopLeft, &v21, (uint64_t)&std::piecewise_construct, &v23)+ 5) = a3.var0;
              LODWORD(v17) = v17 + 1;
            }
            while (v17 <= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1));
          }
          ++v16;
        }
        while (v16 <= v8);
        goto LABEL_7;
      }
    }
    unint64_t v14 = *(unint64_t *)&a3 >> 16;
    while (1)
    {
      uint64_t v15 = v14;
      LODWORD(v23) = var0 | (v14 << 16);
      if (std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mCellIDToMergeRegionTopLeft.__table_.__bucket_list_.__ptr_.__value_, (int *)&v23))
      {
        break;
      }
      LOBYTE(v14) = v15 + 1;
      if ((v15 + 1) > (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)) {
        goto LABEL_15;
      }
    }
    unint64_t v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap insert:]"];
    uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"];
    [v18 handleFailureInFunction:v19, v20, 186, @"can't merge an already-merged cell: %@", objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", v15, var0) file lineNumber description];
    return 0;
  }
  else
  {
LABEL_7:
    if (std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v22))
    {
      unsigned __int16 v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap insert:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 204, @"merge region to be inserted already exists!");
    }
    v23 = (int *)&v22;
    unint64_t v11 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__emplace_unique_key_args<TSUColumnRowCoordinate,std::piecewise_construct_t const&,std::tuple<TSUColumnRowCoordinate const&>,std::tuple<>>((uint64_t)&self->mMergeRegionTopLeftToMergeRegionSize, &v22, (uint64_t)&std::piecewise_construct, &v23);
    *((_DWORD *)v11 + 5) = HIDWORD(v22);
    self->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)TSTCellRangeUnionCellRange(*(void *)&self->mUnionedMergeRange, v22);
    return 1;
  }
}

- (BOOL)remove:(id)a3
{
  __int16 v4 = ~a3.var0.var0;
  $CA3468F20078D5D2DB35E78E73CA60DA v23 = a3;
  [(TSPObject *)self willModify];
  $CA3468F20078D5D2DB35E78E73CA60DA v21 = a3;
  unint64_t v5 = HIWORD(*(unint64_t *)&a3);
  if (!v4 || (*(_DWORD *)&v21.var0 & 0xFF0000) == 0xFF0000 || !v5 || (*(void *)&v21 & 0xFFFF00000000) == 0)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap remove:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 217, @"can't remove an invalid merge range");
  }
  unsigned __int16 v20 = v21.var0.var0 + v5 - 1;
  if (v20 >= v21.var0.var0)
  {
    unsigned __int16 var0 = v21.var0.var0;
    do
    {
      if (v21.var0.var1 <= (LOBYTE(v21.var1.var0) + v21.var0.var1 - 1))
      {
        p_mCellIDToMergeRegionTopLeft = &self->mCellIDToMergeRegionTopLeft;
        unint64_t v10 = *(unint64_t *)&v21 >> 16;
        do
        {
          int v22 = var0 | (v10 << 16);
          if (!std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v22))
          {
            unint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v12 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap remove:]"];
            uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"];
            [v11 handleFailureInFunction:v12, v13, 222, @"can't unmerge an already-unmerged cell: %@", objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", BYTE2(v22), (unsigned __int16)v22) file lineNumber description];
          }
          std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__erase_unique<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v22);
          LOBYTE(v10) = v10 + 1;
        }
        while (v10 <= (LOBYTE(v21.var1.var0) + v21.var0.var1 - 1));
      }
      ++var0;
    }
    while (var0 <= v20);
  }
  if (!std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v23))
  {
    unint64_t v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap remove:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 228, @"merge region to be deleted doesn't exist!");
  }
  std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::__erase_unique<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v23);
  self->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  next = self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p1_.__value_.__next_;
  if (next)
  {
    uint64_t v17 = 0xFFFFFFLL;
    do
    {
      uint64_t v17 = TSTCellRangeUnionCellRange(v17, next[2]);
      self->mUnionedMergeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)v17;
      next = (void *)*next;
    }
    while (next);
  }
  return 1;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)mergedRangeForCellID:(id)a3
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v15 = a3;
  __int16 v4 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mCellIDToMergeRegionTopLeft.__table_.__bucket_list_.__ptr_.__value_, (int *)&v15);
  if (v4)
  {
    unsigned int v14 = *((_DWORD *)v4 + 5);
    unint64_t v5 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&self->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, (int *)&v14);
    if (!v5)
    {
      v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap mergedRangeForCellID:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 267, @"merge region map inconsistency found");
    }
    uint64_t v8 = *((unsigned int *)v5 + 5);
    $CA3468F20078D5D2DB35E78E73CA60DA v9 = ($CA3468F20078D5D2DB35E78E73CA60DA)(v14 | (unint64_t)(v8 << 32));
    if ((_WORD)v14 == 0xFFFF
      || (v14 & 0xFF0000) == 0xFF0000
      || ((_WORD)v8 ? (BOOL v10 = HIWORD(*(unint64_t *)&v9) == 0) : (BOOL v10 = 1), v10))
    {
      unint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap mergedRangeForCellID:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 269, @"merge region map inconsistency found");
    }
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
  return v9;
}

- (BOOL)partiallyIntersectsCellRange:(id)a3
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0 = a3.var0;
  BOOL v4 = 0;
  if (a3.var0.var0 == 0xFFFF) {
    return v4;
  }
  if ((*(void *)&a3 & 0xFF0000) == 0xFF0000) {
    return v4;
  }
  BOOL v4 = 0;
  unsigned __int16 var1 = a3.var1.var1;
  if (!a3.var1.var1 || (*(void *)&a3 & 0xFFFF00000000) == 0) {
    return v4;
  }
  p_mMergeRegionTopLeftToMergeRegionSize = &self->mMergeRegionTopLeftToMergeRegionSize;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 v7 = a3.var1;
  if (self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p2_.__value_ >= a3.var1.var0
                                                                           * (unint64_t)a3.var1.var1)
  {
    uint64_t v21 = *(_DWORD *)&a3.var0 + a3.var1.var1 - 1;
    if ((unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1) < a3.var0.var0) {
      return 0;
    }
    unint64_t v49 = *(unint64_t *)&a3 >> 16;
    uint64_t v22 = *(_DWORD *)&a3.var1 + *(unsigned __int16 *)&a3.var0.var1 + 255;
    unsigned __int16 v50 = a3.var0.var0;
    while (var0.var1 > v22)
    {
LABEL_61:
      BOOL v4 = 0;
      if (++v50 > (unsigned __int16)v21) {
        return v4;
      }
    }
    p_mCellIDToMergeRegionTopLeft = &self->mCellIDToMergeRegionTopLeft;
    uint64_t v24 = v50;
    unsigned __int8 v25 = v49;
    while (1)
    {
      int v52 = v24 & 0xFF00FFFF | (v25 << 16);
      unint64_t v26 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v52);
      if (v26) {
        break;
      }
LABEL_60:
      if (++v25 > v22) {
        goto LABEL_61;
      }
    }
    unsigned int v51 = *((_DWORD *)v26 + 5);
    uint64_t v27 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mMergeRegionTopLeftToMergeRegionSize, (int *)&v51);
    if (!v27)
    {
      uint64_t v28 = v22;
      uint64_t v29 = v24;
      v30 = p_mCellIDToMergeRegionTopLeft;
      uint64_t v31 = v21;
      uint64_t v32 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v33 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap partiallyIntersectsCellRange:]"];
      uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"];
      v35 = (void *)v32;
      uint64_t v21 = v31;
      p_mCellIDToMergeRegionTopLeft = v30;
      uint64_t v24 = v29;
      uint64_t v22 = v28;
      [v35 handleFailureInFunction:v33 file:v34 lineNumber:320 description:@"merge region map inconsistency found"];
    }
    unint64_t v36 = 0;
    uint64_t v37 = *((unsigned int *)v27 + 5);
    unint64_t v38 = v51 | (unint64_t)(v37 << 32);
    if ((_WORD)v51 == 0xFFFF) {
      goto LABEL_58;
    }
    uint64_t v39 = 0xFFFFLL;
    uint64_t v40 = 16711680;
    unint64_t v41 = 0;
    if ((v51 & 0xFF0000) == 0xFF0000) {
      goto LABEL_59;
    }
    unint64_t v36 = 0;
    if (!(unsigned __int16)*((_DWORD *)v27 + 5))
    {
LABEL_58:
      uint64_t v39 = 0xFFFFLL;
      uint64_t v40 = 16711680;
      unint64_t v41 = 0;
    }
    else
    {
      uint64_t v39 = 0xFFFFLL;
      uint64_t v40 = 16711680;
      unint64_t v41 = 0;
      if (HIWORD(v38))
      {
        uint64_t v39 = 0;
        unsigned int v42 = BYTE2(v51);
        if (BYTE2(v51) <= v49) {
          unsigned int v42 = v49;
        }
        if ((unsigned __int16)v51 <= var0.var0) {
          uint64_t v43 = var0.var0;
        }
        else {
          uint64_t v43 = (unsigned __int16)v51;
        }
        if ((v37 + BYTE2(v51) - 1) >= v22) {
          unsigned int v44 = v22;
        }
        else {
          unsigned int v44 = (v37 + BYTE2(v51) - 1);
        }
        unsigned int v45 = (unsigned __int16)(v51 + WORD1(v37) - 1);
        unsigned int v46 = (unsigned __int16)v21;
        if (v45 < (unsigned __int16)v21) {
          unsigned int v46 = v45;
        }
        uint64_t v40 = 0;
        unint64_t v36 = 0;
        unint64_t v41 = 0;
        if (v43 <= v46 && v42 <= v44)
        {
          unint64_t v41 = ((unint64_t)(v46 - v43) << 48) + 0x1000000000000;
          unint64_t v36 = (unint64_t)(unsigned __int16)(v44 - v42 + 1) << 32;
          uint64_t v40 = v42 << 16;
          uint64_t v39 = v43;
        }
      }
    }
LABEL_59:
    if ((((v40 | v41 | v39 | v36) ^ v38) & 0xFFFFFFFF00FFFFFFLL) != 0) {
      return 1;
    }
    goto LABEL_60;
  }
  uint64_t v8 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:self];
  if (![(TSTMergeRegionMapIterator *)v8 hasNextMergeRegion])
  {
LABEL_31:
    BOOL v4 = 0;
    goto LABEL_32;
  }
  int v9 = *(_DWORD *)&v7 + HIWORD(*(unsigned int *)&var0) + 255;
  unsigned __int16 v10 = var0.var0 + var1 - 1;
  while (1)
  {
    unint64_t v11 = [(TSTMergeRegionMapIterator *)v8 nextMergeRegion];
    unint64_t v12 = 0;
    if ((_WORD)v11 == 0xFFFF)
    {
LABEL_26:
      uint64_t v13 = 0xFFFFLL;
      uint64_t v14 = 16711680;
      unint64_t v15 = 0;
      goto LABEL_27;
    }
    uint64_t v13 = 0xFFFFLL;
    uint64_t v14 = 16711680;
    unint64_t v15 = 0;
    if ((v11 & 0xFF0000) != 0xFF0000)
    {
      unint64_t v12 = 0;
      if (!HIWORD(v11)) {
        goto LABEL_26;
      }
      uint64_t v13 = 0xFFFFLL;
      uint64_t v14 = 16711680;
      unint64_t v15 = 0;
      if ((v11 & 0xFFFF00000000) != 0)
      {
        uint64_t v13 = 0;
        unsigned int v16 = var0.var1;
        if (BYTE2(v11) > var0.var1) {
          unsigned int v16 = BYTE2(v11);
        }
        if ((unsigned __int16)v11 <= var0.var0) {
          uint64_t v17 = var0.var0;
        }
        else {
          uint64_t v17 = (unsigned __int16)v11;
        }
        if ((BYTE4(v11) + BYTE2(v11) - 1) >= v9) {
          unsigned int v18 = v9;
        }
        else {
          unsigned int v18 = (BYTE4(v11) + BYTE2(v11) - 1);
        }
        if ((unsigned __int16)(v11 + HIWORD(v11) - 1) >= v10) {
          unsigned int v19 = v10;
        }
        else {
          unsigned int v19 = (unsigned __int16)(v11 + HIWORD(v11) - 1);
        }
        uint64_t v14 = 0;
        unint64_t v12 = 0;
        unint64_t v15 = 0;
        if (v17 <= v19 && v16 <= v18)
        {
          unint64_t v15 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
          unint64_t v12 = (unint64_t)(unsigned __int16)(v18 - v16 + 1) << 32;
          uint64_t v14 = v16 << 16;
          uint64_t v13 = v17;
        }
      }
    }
LABEL_27:
    if (HIWORD(v15))
    {
      unint64_t v20 = v14 | v15 | v13 | v12;
      if ((v20 & 0xFFFF00000000) != 0 && ((v20 ^ v11) & 0xFFFFFFFF00FFFFFFLL) != 0) {
        break;
      }
    }
    if (![(TSTMergeRegionMapIterator *)v8 hasNextMergeRegion]) {
      goto LABEL_31;
    }
  }
  BOOL v4 = 1;
LABEL_32:

  return v4;
}

- (BOOL)partiallyIntersectsCellRegion:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 isEmpty]) {
    return 0;
  }
  p_mMergeRegionTopLeftToMergeRegionSize = &self->mMergeRegionTopLeftToMergeRegionSize;
  unint64_t value = self->mMergeRegionTopLeftToMergeRegionSize.__table_.__p2_.__value_;
  if (value < [a3 cellCount])
  {
    $201E9A47BE70A2B12CCA2F48B75AA2F7 v7 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:self];
    while ([(TSTMergeRegionMapIterator *)v7 hasNextMergeRegion])
    {
      if (objc_msgSend(a3, "partiallyIntersectsCellRange:", -[TSTMergeRegionMapIterator nextMergeRegion](v7, "nextMergeRegion")))
      {

        return 1;
      }
    }

    return 0;
  }
  int v9 = objc_msgSend((id)objc_msgSend(a3, "iterator"), "getNext");
  int v16 = v9;
  if ((_WORD)v9 == 0xFFFF || (*(void *)&v9 & 0xFF0000) == 0xFF0000) {
    return 0;
  }
  p_mCellIDToMergeRegionTopLeft = &self->mCellIDToMergeRegionTopLeft;
  while (1)
  {
    unint64_t v11 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mCellIDToMergeRegionTopLeft, &v16);
    if (v11)
    {
      unsigned int v15 = *((_DWORD *)v11 + 5);
      unint64_t v12 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(p_mMergeRegionTopLeftToMergeRegionSize, (int *)&v15);
      if (!v12)
      {
        uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v14 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap partiallyIntersectsCellRegion:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 381, @"merge region map inconsistency found");
      }
      if (![a3 containsCellRange:v15 | ((unint64_t)*((unsigned int *)v12 + 5) << 32)])break; {
    }
      }
    if ((_WORD)v16 == 0xFFFF || (v16 & 0xFF0000) == 0xFF0000) {
      return 0;
    }
  }
  return 1;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)unionedMergeRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mUnionedMergeRange;
}

- (BOOL)find:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v14 = a3;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mUnionedMergeRange = self->mUnionedMergeRange;
  if (HIWORD(*(unint64_t *)&mUnionedMergeRange)) {
    BOOL v4 = (*(void *)&mUnionedMergeRange & 0xFFFF00000000) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_13;
  }
  unint64_t v5 = self;
  LOBYTE(self) = 0;
  if (a3.var1.var1 && (*(void *)&a3 & 0xFFFF00000000) != 0)
  {
    if (mUnionedMergeRange.origin.row > a3.var0.var0
      || (unsigned __int16 v6 = mUnionedMergeRange.origin.row + mUnionedMergeRange.size.numberOfRows - 1, v6 < a3.var0.var0)
      || a3.var0.var1 < mUnionedMergeRange.origin.column
      || (unsigned int v7 = (LOBYTE(mUnionedMergeRange.size.numberOfColumns) + mUnionedMergeRange.origin.column - 1),
          v7 < a3.var0.var1)
      || v7 < (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1)
      || v6 < (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1))
    {
LABEL_13:
      LOBYTE(self) = 0;
      return (char)self;
    }
    self = (TSTMergeRegionMap *)std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&v5->mCellIDToMergeRegionTopLeft.__table_.__bucket_list_.__ptr_.__value_, (int *)&v14);
    if (self)
    {
      int modifyObjectToken_high = HIDWORD(self->super._modifyObjectToken);
      uint64_t v8 = std::__hash_table<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::__unordered_map_hasher<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,TSTCellIDHasher,std::equal_to<TSUColumnRowCoordinate>,true>,std::__unordered_map_equal<TSUColumnRowCoordinate,std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>,std::equal_to<TSUColumnRowCoordinate>,TSTCellIDHasher,true>,std::allocator<std::__hash_value_type<TSUColumnRowCoordinate,TSUColumnRowCoordinate>>>::find<TSUColumnRowCoordinate>(&v5->mMergeRegionTopLeftToMergeRegionSize.__table_.__bucket_list_.__ptr_.__value_, &modifyObjectToken_high);
      if (!v8)
      {
        int v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v10 = [NSString stringWithUTF8String:"-[TSTMergeRegionMap find:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMergeRegionMap.mm"), 413, @"merge region map inconsistency found");
      }
      LOBYTE(self) = *((unsigned __int16 *)v8 + 11) == v14.var1.var1 && *((unsigned __int16 *)v8 + 10) == v14.var1.var0;
    }
  }
  return (char)self;
}

- (id)mergedGridIndicesForDimension:(int)a3
{
  if (!a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
    unint64_t v5 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:self];
    if ([(TSTMergeRegionMapIterator *)v5 hasNextMergeRegion])
    {
      do
      {
        unint64_t v7 = [(TSTMergeRegionMapIterator *)v5 nextMergeRegion];
        objc_msgSend(v4, "addIndexesInRange:", (unsigned __int16)v7 + 1, HIWORD(v7) - 1);
      }
      while ([(TSTMergeRegionMapIterator *)v5 hasNextMergeRegion]);
    }
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
    unint64_t v5 = [[TSTMergeRegionMapIterator alloc] initWithMergeRegionMap:self];
    if ([(TSTMergeRegionMapIterator *)v5 hasNextMergeRegion])
    {
      do
      {
        uint64_t v6 = [(TSTMergeRegionMapIterator *)v5 nextMergeRegion];
        objc_msgSend(v4, "addIndexesInRange:", BYTE2(v6) + 1, WORD2(v6) - 1);
      }
      while ([(TSTMergeRegionMapIterator *)v5 hasNextMergeRegion]);
    }
LABEL_8:

    goto LABEL_10;
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

- (BOOL)hasRangeSpanningRows
{
  id v2 = [(TSTMergeRegionMap *)self iterator];
  do
    int v3 = [v2 hasNextMergeRegion];
  while (v3 && !((unint64_t)[v2 nextMergeRegion] >> 49));
  return v3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::~__hash_table((uint64_t)&self->mMergeRegionTopLeftToMergeRegionSize);

  std::__hash_table<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<EQKit::Font::STIXCollection::StretchInfo,unsigned long>>>>::~__hash_table((uint64_t)&self->mCellIDToMergeRegionTopLeft);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end