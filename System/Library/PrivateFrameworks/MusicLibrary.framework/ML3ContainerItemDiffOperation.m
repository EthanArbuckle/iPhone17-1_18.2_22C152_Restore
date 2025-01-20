@interface ML3ContainerItemDiffOperation
- (ML3ContainerItemDiffOperation)initWithContainerPersistentID:(int64_t)a3 updatedItemsPersistentIDs:(id)a4 connection:(id)a5;
- (ML3ContainerItemDiffOperation)initWithContainerPersistentID:(int64_t)a3 updatedItemsPersistentIDs:(id)a4 updatedItemsProperties:(id)a5 connection:(id)a6;
- (NSArray)containerItemsToDelete;
- (NSArray)containerItemsToUpdate;
- (void)main;
- (void)setContainerItemsToDelete:(id)a3;
- (void)setContainerItemsToUpdate:(id)a3;
@end

@implementation ML3ContainerItemDiffOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerItemsToDelete, 0);
  objc_storeStrong((id *)&self->_containerItemsToUpdate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_updatedItemsProperties, 0);

  objc_storeStrong((id *)&self->_updatedItemsPersistentIDs, 0);
}

- (void)setContainerItemsToDelete:(id)a3
{
}

- (NSArray)containerItemsToDelete
{
  return self->_containerItemsToDelete;
}

- (void)setContainerItemsToUpdate:(id)a3
{
}

- (NSArray)containerItemsToUpdate
{
  return self->_containerItemsToUpdate;
}

- (void)main
{
  v122[1] = *MEMORY[0x1E4F143B8];
  v82 = [MEMORY[0x1E4F1CA48] array];
  v81 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__9422;
  v118 = __Block_byref_object_dispose__9423;
  id v119 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__9422;
  v112 = __Block_byref_object_dispose__9423;
  id v113 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x5812000000;
  v103 = __Block_byref_object_copy__55;
  memset(v105, 0, sizeof(v105));
  v104 = __Block_byref_object_dispose__56;
  uint64_t v106 = 0;
  int v107 = 1065353216;
  connection = self->_connection;
  v3 = [NSNumber numberWithLongLong:self->_containerPersistentID];
  v122[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:1];
  v74 = [(ML3DatabaseConnection *)connection executeQuery:@"SELECT container_item_pid, item_pid, position, uuid, position_uuid, occurrence_id, subscription_store_item_id, cloud_universal_library_id, store_item_id, cloud_status, in_my_library, playback_endpoint_type FROM container_item LEFT OUTER JOIN item USING (item_pid) LEFT OUTER JOIN item_store USING (item_pid) WHERE container_pid = ? ORDER BY position" withParameters:v4];

  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __37__ML3ContainerItemDiffOperation_main__block_invoke;
  v99[3] = &unk_1E5FB4FA8;
  v99[4] = &v114;
  v99[5] = &v108;
  v99[6] = &v100;
  [v74 enumerateRowsWithBlock:v99];
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v5 = self->_updatedItemsPersistentIDs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v95 objects:v121 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v96 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v95 + 1) + 8 * i);
        v10 = [(id)v109[5] objectForKeyedSubscript:v9];
        BOOL v11 = v10 == 0;

        if (v11) {
          [v79 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v95 objects:v121 count:16];
    }
    while (v6);
  }

  v12 = self;
  v73 = (void *)[(NSDictionary *)self->_updatedItemsProperties mutableCopy];
  unint64_t v13 = [v79 count];
  if (v13)
  {
    unint64_t v14 = 0;
    while (v13 > v14)
    {
      v15 = (void *)MEMORY[0x1B3E93C70]();
      if (v13 - v14 >= 0x2710) {
        uint64_t v16 = 10000;
      }
      else {
        uint64_t v16 = v13 - v14;
      }
      v17 = +[ML3DatabaseStatementRenderer defaultRenderer];
      v18 = [v17 statementWithPrefix:@"SELECT item_pid, subscription_store_item_id, cloud_universal_library_id, store_item_id, cloud_status, in_my_library, playback_endpoint_type FROM item LEFT OUTER JOIN item_store USING (item_pid) WHERE item_pid", v16 inParameterCount];

      v19 = objc_msgSend(v79, "subarrayWithRange:", v14, v16);
      v20 = [(ML3DatabaseConnection *)self->_connection executeQuery:v18 withParameters:v19];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __37__ML3ContainerItemDiffOperation_main__block_invoke_2;
      v94[3] = &unk_1E5FB77B8;
      v94[4] = &v108;
      [v20 enumerateRowsWithBlock:v94];

      v14 += v16;
      v12 = self;
    }
  }
  v21 = [MEMORY[0x1E4F28BD0] set];
  updatedItemsPersistentIDs = v12->_updatedItemsPersistentIDs;
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __37__ML3ContainerItemDiffOperation_main__block_invoke_3;
  v90[3] = &unk_1E5FB4FD0;
  v93 = &v108;
  id v72 = v21;
  id v91 = v72;
  id v84 = v73;
  id v92 = v84;
  [(NSArray *)updatedItemsPersistentIDs enumerateObjectsUsingBlock:v90];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obj = v12->_updatedItemsPersistentIDs;
  uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v86 objects:v120 count:16];
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v83 = *(void *)v87;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v87 != v83) {
          objc_enumerationMutation(obj);
        }
        unint64_t v26 = [*(id *)(*((void *)&v86 + 1) + 8 * v25) longLongValue];
        unint64_t v27 = v26;
        int8x8_t v28 = (int8x8_t)v101[7];
        if (!*(void *)&v28) {
          goto LABEL_39;
        }
        uint8x8_t v29 = (uint8x8_t)vcnt_s8(v28);
        v29.i16[0] = vaddlv_u8(v29);
        if (v29.u32[0] > 1uLL)
        {
          unint64_t v30 = v26;
          if (v26 >= *(void *)&v28) {
            unint64_t v30 = v26 % *(void *)&v28;
          }
        }
        else
        {
          unint64_t v30 = (*(void *)&v28 - 1) & v26;
        }
        uint64_t v31 = v101[6];
        v32 = *(void **)(v31 + 8 * v30);
        if (!v32 || (v33 = (void *)*v32) == 0)
        {
LABEL_39:
          v36 = [NSNumber numberWithLongLong:v24];
          v37 = [v84 objectForKeyedSubscript:v36];
          v38 = [v37 objectForKeyedSubscript:@"occurrence_id"];

          v39 = +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:0 containerPersistentID:self->_containerPersistentID itemPersistentID:v27 newPosition:v24 previousPosition:-1 uuid:&stru_1F08D4D70 positionUUD:&stru_1F08D4D70 occurrenceID:v38];
          [v82 addObject:v39];
          goto LABEL_40;
        }
        uint64_t v34 = *(void *)&v28 - 1;
        while (1)
        {
          unint64_t v35 = v33[1];
          if (v26 == v35) {
            break;
          }
          if (v29.u32[0] > 1uLL)
          {
            if (v35 >= *(void *)&v28) {
              v35 %= *(void *)&v28;
            }
          }
          else
          {
            v35 &= v34;
          }
          if (v35 != v30) {
            goto LABEL_39;
          }
LABEL_38:
          v33 = (void *)*v33;
          if (!v33) {
            goto LABEL_39;
          }
        }
        if (v33[2] != v26) {
          goto LABEL_38;
        }
        if (v29.u32[0] > 1uLL)
        {
          unint64_t v40 = v26;
          if (v26 >= *(void *)&v28) {
            unint64_t v40 = v26 % *(void *)&v28;
          }
        }
        else
        {
          unint64_t v40 = v34 & v26;
        }
        v41 = *(void **)(v31 + 8 * v40);
        if (!v41 || (v42 = (void *)*v41) == 0) {
LABEL_87:
        }
          std::__throw_out_of_range[abi:ne180100]();
        while (2)
        {
          unint64_t v43 = v42[1];
          if (v43 != v26)
          {
            if (v29.u32[0] > 1uLL)
            {
              if (v43 >= *(void *)&v28) {
                v43 %= *(void *)&v28;
              }
            }
            else
            {
              v43 &= v34;
            }
            if (v43 != v40) {
              goto LABEL_87;
            }
LABEL_56:
            v42 = (void *)*v42;
            if (!v42) {
              goto LABEL_87;
            }
            continue;
          }
          break;
        }
        if (v42[2] != v26) {
          goto LABEL_56;
        }
        v78 = (void *)v42[3];
        if ((void *)v42[4] == v78) {
          goto LABEL_39;
        }
        v44 = (void *)v115[5];
        v45 = [NSNumber numberWithLongLong:v24];
        v38 = [v44 objectForKeyedSubscript:v45];

        v46 = [NSNumber numberWithLongLong:v24];
        v39 = [v84 objectForKeyedSubscript:v46];

        if (v39)
        {
          id v47 = v38;
          id v48 = v39;
          v76 = v47;
          if (v47 == v48) {
            char v49 = 1;
          }
          else {
            char v49 = [v47 isEqual:v48];
          }

          char v50 = v49 ^ 1;
        }
        else
        {
          char v50 = 0;
        }
        if (v78[1] != v24 || (v50 & 1) != 0)
        {
          uint64_t v51 = [v39 objectForKeyedSubscript:@"uuid"];
          v52 = (void *)v51;
          if (v51) {
            v53 = (__CFString *)v51;
          }
          else {
            v53 = &stru_1F08D4D70;
          }
          v77 = v53;

          uint64_t v54 = [v39 objectForKeyedSubscript:@"position_uuid"];
          v55 = (void *)v54;
          if (v54) {
            v56 = (__CFString *)v54;
          }
          else {
            v56 = &stru_1F08D4D70;
          }
          v75 = v56;

          uint64_t v57 = [v39 objectForKeyedSubscript:@"occurrence_id"];
          v58 = (void *)v57;
          if (v57) {
            v59 = (__CFString *)v57;
          }
          else {
            v59 = &stru_1F08D4D70;
          }
          v60 = v59;

          v61 = +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:*v78 containerPersistentID:self->_containerPersistentID itemPersistentID:v27 newPosition:v24 previousPosition:v78[1] uuid:v77 positionUUD:v75 occurrenceID:v60];
          [v82 addObject:v61];
        }
        uint64_t v62 = v42[3];
        uint64_t v63 = v42[4];
        while (1)
        {
          v64 = (void *)(v62 + 16);
          if (v62 + 16 == v63) {
            break;
          }
          v62 += 16;
          uint64_t v65 = *(void *)(v62 + 8);
          *(void *)(v62 - 16) = *v64;
          *(void *)(v62 - 8) = v65;
        }
        v42[4] = v62;
LABEL_40:

        ++v24;
        ++v25;
      }
      while (v25 != v23);
      uint64_t v66 = [(NSArray *)obj countByEnumeratingWithState:&v86 objects:v120 count:16];
      uint64_t v23 = v66;
    }
    while (v66);
  }

  v67 = (void *)v101[8];
  for (j = self; v67; v67 = (void *)*v67)
  {
    v69 = (void *)v67[3];
    for (k = (void *)v67[4]; v69 != k; j = self)
    {
      v71 = +[ML3ContainerItemDiffMetadata diffMetadataWithPersistentID:*v69];
      [v81 addObject:v71];

      v69 += 2;
    }
  }
  [(ML3ContainerItemDiffOperation *)j setContainerItemsToUpdate:v82];
  [(ML3ContainerItemDiffOperation *)j setContainerItemsToDelete:v81];

  _Block_object_dispose(&v100, 8);
  std::__hash_table<std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::vector<std::pair<long long,long long>>>>>::~__hash_table((uint64_t)&v105[8]);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(&v114, 8);
}

void __37__ML3ContainerItemDiffOperation_main__block_invoke(void *a1, void *a2, void *a3)
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v67 = a3;
  uint64_t v65 = v4;
  uint64_t v66 = [v4 int64ForColumnIndex:0];
  unint64_t v5 = [v4 int64ForColumnIndex:1];
  uint64_t v68 = [v4 int64ForColumnIndex:2];
  v69 = [v4 stringForColumnIndex:3];
  v71 = [v4 stringForColumnIndex:4];
  id v72 = [v4 stringForColumnIndex:5];
  uint64_t v6 = [v4 int64ForColumnIndex:6];
  v70 = [v4 stringForColumnIndex:7];
  uint64_t v7 = [v4 int64ForColumnIndex:8];
  uint64_t v8 = [v4 int64ForColumnIndex:9];
  uint64_t v9 = [v4 int64ForColumnIndex:10];
  uint64_t v10 = [v4 int64ForColumnIndex:11];
  v76[0] = @"uuid";
  v76[1] = @"position_uuid";
  v77[0] = v69;
  v77[1] = v71;
  v76[2] = @"occurrence_id";
  v77[2] = v72;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:3];
  v12 = *(void **)(*(void *)(a1[4] + 8) + 40);
  unint64_t v13 = 0x1E4F28000uLL;
  unint64_t v14 = [NSNumber numberWithLongLong:v68];
  [v12 setObject:v11 forKeyedSubscript:v14];

  v74[0] = @"item_store.subscription_store_item_id";
  uint64_t v15 = [NSNumber numberWithLongLong:v6];
  uint64_t v16 = (void *)v15;
  v17 = &stru_1F08D4D70;
  if (v70) {
    v17 = v70;
  }
  v75[0] = v15;
  v75[1] = v17;
  v74[1] = @"item_store.cloud_universal_library_id";
  v74[2] = @"item_store.store_item_id";
  v18 = [NSNumber numberWithLongLong:v7];
  v75[2] = v18;
  v74[3] = @"item_store.cloud_status";
  v19 = [NSNumber numberWithLongLong:v8];
  v75[3] = v19;
  v74[4] = @"in_my_library";
  v20 = [NSNumber numberWithLongLong:v9];
  v75[4] = v20;
  v74[5] = @"item_store.playback_endpoint_type";
  v21 = [NSNumber numberWithLongLong:v10];
  v75[5] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:6];
  uint64_t v23 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v24 = [NSNumber numberWithLongLong:v5];
  [v23 setObject:v22 forKeyedSubscript:v24];

  uint64_t v25 = *(void *)(a1[6] + 8);
  unint64_t v26 = *(void *)(v25 + 56);
  if (v26)
  {
    uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v26);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      unint64_t v13 = v5;
      if (v5 >= v26) {
        unint64_t v13 = v5 % v26;
      }
    }
    else
    {
      unint64_t v13 = (v26 - 1) & v5;
    }
    int8x8_t v28 = *(void ***)(*(void *)(v25 + 48) + 8 * v13);
    if (v28)
    {
      for (uint64_t i = *v28; i; uint64_t i = (void *)*i)
      {
        unint64_t v30 = i[1];
        if (v30 == v5)
        {
          if (i[2] == v5) {
            goto LABEL_76;
          }
        }
        else
        {
          if (v27.u32[0] > 1uLL)
          {
            if (v30 >= v26) {
              v30 %= v26;
            }
          }
          else
          {
            v30 &= v26 - 1;
          }
          if (v30 != v13) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x30uLL);
  uint64_t v31 = (void *)(v25 + 64);
  *uint64_t i = 0;
  i[1] = v5;
  i[2] = v5;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  float v32 = (float)(unint64_t)(*(void *)(v25 + 72) + 1);
  float v33 = *(float *)(v25 + 80);
  if (!v26 || (float)(v33 * (float)v26) < v32)
  {
    BOOL v34 = 1;
    if (v26 >= 3) {
      BOOL v34 = (v26 & (v26 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v26);
    unint64_t v36 = vcvtps_u32_f32(v32 / v33);
    if (v35 <= v36) {
      int8x8_t prime = (int8x8_t)v36;
    }
    else {
      int8x8_t prime = (int8x8_t)v35;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v26 = *(void *)(v25 + 56);
    if (*(void *)&prime > v26) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v26)
    {
      unint64_t v44 = vcvtps_u32_f32((float)*(unint64_t *)(v25 + 72) / *(float *)(v25 + 80));
      if (v26 < 3 || (uint8x8_t v45 = (uint8x8_t)vcnt_s8((int8x8_t)v26), v45.i16[0] = vaddlv_u8(v45), v45.u32[0] > 1uLL))
      {
        unint64_t v44 = std::__next_prime(v44);
      }
      else
      {
        uint64_t v46 = 1 << -(char)__clz(v44 - 1);
        if (v44 >= 2) {
          unint64_t v44 = v46;
        }
      }
      if (*(void *)&prime <= v44) {
        int8x8_t prime = (int8x8_t)v44;
      }
      if (*(void *)&prime >= v26)
      {
        unint64_t v26 = *(void *)(v25 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v38 = operator new(8 * *(void *)&prime);
          v39 = *(void **)(v25 + 48);
          *(void *)(v25 + 48) = v38;
          if (v39) {
            operator delete(v39);
          }
          uint64_t v40 = 0;
          *(int8x8_t *)(v25 + 56) = prime;
          do
            *(void *)(*(void *)(v25 + 48) + 8 * v40++) = 0;
          while (*(void *)&prime != v40);
          v41 = (void *)*v31;
          if (*v31)
          {
            unint64_t v42 = v41[1];
            uint8x8_t v43 = (uint8x8_t)vcnt_s8(prime);
            v43.i16[0] = vaddlv_u8(v43);
            if (v43.u32[0] > 1uLL)
            {
              if (v42 >= *(void *)&prime) {
                v42 %= *(void *)&prime;
              }
            }
            else
            {
              v42 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v25 + 48) + 8 * v42) = v31;
            id v47 = (void *)*v41;
            if (*v41)
            {
              do
              {
                unint64_t v48 = v47[1];
                if (v43.u32[0] > 1uLL)
                {
                  if (v48 >= *(void *)&prime) {
                    v48 %= *(void *)&prime;
                  }
                }
                else
                {
                  v48 &= *(void *)&prime - 1;
                }
                if (v48 != v42)
                {
                  uint64_t v49 = *(void *)(v25 + 48);
                  if (!*(void *)(v49 + 8 * v48))
                  {
                    *(void *)(v49 + 8 * v48) = v41;
                    goto LABEL_57;
                  }
                  void *v41 = *v47;
                  *id v47 = **(void **)(*(void *)(v25 + 48) + 8 * v48);
                  **(void **)(*(void *)(v25 + 48) + 8 * v48) = v47;
                  id v47 = v41;
                }
                unint64_t v48 = v42;
LABEL_57:
                v41 = v47;
                id v47 = (void *)*v47;
                unint64_t v42 = v48;
              }
              while (v47);
            }
          }
          unint64_t v26 = (unint64_t)prime;
          goto LABEL_61;
        }
        v64 = *(void **)(v25 + 48);
        *(void *)(v25 + 48) = 0;
        if (v64) {
          operator delete(v64);
        }
        unint64_t v26 = 0;
        *(void *)(v25 + 56) = 0;
      }
    }
LABEL_61:
    if ((v26 & (v26 - 1)) != 0)
    {
      if (v5 >= v26) {
        unint64_t v13 = v5 % v26;
      }
      else {
        unint64_t v13 = v5;
      }
    }
    else
    {
      unint64_t v13 = (v26 - 1) & v5;
    }
  }
  uint64_t v50 = *(void *)(v25 + 48);
  uint64_t v51 = *(void **)(v50 + 8 * v13);
  if (v51)
  {
    *uint64_t i = *v51;
LABEL_74:
    *uint64_t v51 = i;
    goto LABEL_75;
  }
  *uint64_t i = *v31;
  *uint64_t v31 = i;
  *(void *)(v50 + 8 * v13) = v31;
  if (*i)
  {
    unint64_t v52 = *(void *)(*i + 8);
    if ((v26 & (v26 - 1)) != 0)
    {
      if (v52 >= v26) {
        v52 %= v26;
      }
    }
    else
    {
      v52 &= v26 - 1;
    }
    uint64_t v51 = (void *)(*(void *)(v25 + 48) + 8 * v52);
    goto LABEL_74;
  }
LABEL_75:
  ++*(void *)(v25 + 72);
LABEL_76:
  uint64_t v54 = (uint64_t *)i[4];
  unint64_t v53 = i[5];
  if ((unint64_t)v54 >= v53)
  {
    v56 = (uint64_t *)i[3];
    uint64_t v57 = ((char *)v54 - (char *)v56) >> 4;
    unint64_t v58 = v57 + 1;
    if ((unint64_t)(v57 + 1) >> 60) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v59 = v53 - (void)v56;
    if (v59 >> 3 > v58) {
      unint64_t v58 = v59 >> 3;
    }
    if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v60 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v60 = v58;
    }
    if (v60)
    {
      if (v60 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v61 = (char *)operator new(16 * v60);
      v56 = (uint64_t *)i[3];
      uint64_t v54 = (uint64_t *)i[4];
    }
    else
    {
      v61 = 0;
    }
    uint64_t v62 = (uint64_t *)&v61[16 * v57];
    uint64_t v63 = &v61[16 * v60];
    *uint64_t v62 = v66;
    v62[1] = v68;
    v55 = v62 + 2;
    if (v54 != v56)
    {
      do
      {
        *((_OWORD *)v62 - 1) = *((_OWORD *)v54 - 1);
        v62 -= 2;
        v54 -= 2;
      }
      while (v54 != v56);
      v56 = (uint64_t *)i[3];
    }
    i[3] = v62;
    i[4] = v55;
    i[5] = v63;
    if (v56) {
      operator delete(v56);
    }
  }
  else
  {
    *uint64_t v54 = v66;
    v54[1] = v68;
    v55 = v54 + 2;
  }
  i[4] = v55;
}

void __37__ML3ContainerItemDiffOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  v24[6] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 int64ForColumnIndex:0];
  uint64_t v5 = [v3 int64ForColumnIndex:1];
  uint64_t v6 = [v3 stringForColumnIndex:2];
  v22 = (void *)v6;
  uint64_t v7 = [v3 int64ForColumnIndex:3];
  uint64_t v8 = [v3 int64ForColumnIndex:4];
  uint64_t v9 = [v3 int64ForColumnIndex:5];
  uint64_t v10 = [v3 int64ForColumnIndex:6];
  v23[0] = @"item_store.subscription_store_item_id";
  uint64_t v11 = [NSNumber numberWithLongLong:v5];
  v12 = (void *)v11;
  unint64_t v13 = &stru_1F08D4D70;
  if (v6) {
    unint64_t v13 = (__CFString *)v6;
  }
  v24[0] = v11;
  v24[1] = v13;
  v23[1] = @"item_store.cloud_universal_library_id";
  v23[2] = @"item_store.store_item_id";
  unint64_t v14 = [NSNumber numberWithLongLong:v7];
  v24[2] = v14;
  v23[3] = @"item_store.cloud_status";
  uint64_t v15 = [NSNumber numberWithLongLong:v8];
  v24[3] = v15;
  v23[4] = @"in_my_library";
  uint64_t v16 = [NSNumber numberWithLongLong:v9];
  uint64_t v17 = v4;
  v24[4] = v16;
  v23[5] = @"item_store.playback_endpoint_type";
  v18 = [NSNumber numberWithLongLong:v10];
  v24[5] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
  v20 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v21 = [NSNumber numberWithLongLong:v17];
  [v20 setObject:v19 forKeyedSubscript:v21];
}

void __37__ML3ContainerItemDiffOperation_main__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  int8x8_t v28 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
  unint64_t v26 = [v28 objectForKeyedSubscript:@"item_store.subscription_store_item_id"];
  uint64_t v24 = [v26 longLongValue];
  uint64_t v25 = [v28 objectForKeyedSubscript:@"item_store.cloud_universal_library_id"];
  uint64_t v4 = [v28 objectForKeyedSubscript:@"item_store.store_item_id"];
  uint64_t v5 = [v4 longLongValue];
  uint64_t v6 = [v29 longLongValue];
  uint64_t v7 = [v28 objectForKeyedSubscript:@"item_store.cloud_status"];
  uint64_t v8 = [v7 longLongValue];
  uint64_t v9 = [v28 objectForKeyedSubscript:@"in_my_library"];
  int v10 = [v9 BOOLValue];
  uint64_t v11 = [v28 objectForKeyedSubscript:@"item_store.playback_endpoint_type"];
  v12 = ML3ContainerItemOccurrencePrefix(v24, v25, v5, v6, v8, v10, [v11 longLongValue]);

  uint64_t v13 = [*(id *)(a1 + 32) countForObject:v12];
  [*(id *)(a1 + 32) addObject:v12];
  unint64_t v14 = objc_msgSend(v12, "stringByAppendingFormat:", @"_%lld", v13);
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v17 = [v15 objectForKeyedSubscript:v16];
  v18 = (void *)[v17 mutableCopy];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v21 = v20;

  [v21 setObject:v14 forKeyedSubscript:@"occurrence_id"];
  v22 = *(void **)(a1 + 40);
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:a3];
  [v22 setObject:v21 forKeyedSubscript:v23];
}

- (ML3ContainerItemDiffOperation)initWithContainerPersistentID:(int64_t)a3 updatedItemsPersistentIDs:(id)a4 updatedItemsProperties:(id)a5 connection:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ML3ContainerItemDiffOperation;
  uint64_t v13 = [(ML3ContainerItemDiffOperation *)&v20 init];
  unint64_t v14 = v13;
  if (v13)
  {
    v13->_containerPersistentID = a3;
    uint64_t v15 = [v10 copy];
    updatedItemsPersistentIDs = v14->_updatedItemsPersistentIDs;
    v14->_updatedItemsPersistentIDs = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    updatedItemsProperties = v14->_updatedItemsProperties;
    v14->_updatedItemsProperties = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_connection, a6);
  }

  return v14;
}

- (ML3ContainerItemDiffOperation)initWithContainerPersistentID:(int64_t)a3 updatedItemsPersistentIDs:(id)a4 connection:(id)a5
{
  return [(ML3ContainerItemDiffOperation *)self initWithContainerPersistentID:a3 updatedItemsPersistentIDs:a4 updatedItemsProperties:MEMORY[0x1E4F1CC08] connection:a5];
}

@end