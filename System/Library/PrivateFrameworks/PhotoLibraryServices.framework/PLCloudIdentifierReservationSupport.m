@interface PLCloudIdentifierReservationSupport
- (BOOL)cancelReservedCloudIdentifiersWithEntityName:(id)a3 clientBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)takeReservedCloudIdentifierWithEntityName:(id)a3 uuid:(id)a4 clientBundleIdentifier:(id)a5 error:(id *)a6;
- (PLCloudIdentifierReservationSupport)init;
- (id)_lock_reservedIdentifiersForEntityName:(id)a3 clientBundleIdentifier:(id)a4;
- (id)reserveCloudIdentifierUUIDsWithEntityName:(id)a3 count:(unint64_t)a4 clientBundleIdentifier:(id)a5 error:(id *)a6;
- (id)reservedCloudIdentifierUUIDsWithEntityName:(id)a3 clientBundleIdentifier:(id)a4 error:(id *)a5;
- (void)invalidate;
@end

@implementation PLCloudIdentifierReservationSupport

- (void).cxx_destruct
{
}

- (void)invalidate
{
}

uint64_t __49__PLCloudIdentifierReservationSupport_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (BOOL)cancelReservedCloudIdentifiersWithEntityName:(id)a3 clientBundleIdentifier:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  if (!v7 || !v8)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    if (v8)
    {
      uint64_t v26 = *MEMORY[0x1E4F28228];
      v27[0] = @"Unsupported object type";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    }
    else
    {
      uint64_t v24 = *MEMORY[0x1E4F28228];
      v25 = @"Missing bundle identifier";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v14 = };
    v15 = [v12 errorWithDomain:v13 code:46201 userInfo:v14];

    *((unsigned char *)v21 + 24) = 0;
    id v10 = v15;
    if (!a5) {
      goto LABEL_11;
    }
LABEL_10:
    *a5 = v10;
LABEL_11:

    int v11 = *((unsigned __int8 *)v21 + 24);
    goto LABEL_12;
  }
  id v18 = v7;
  id v19 = v9;
  PLRunWithUnfairLock();

  id v10 = 0;
  int v11 = *((unsigned __int8 *)v21 + 24);
  if (!*((unsigned char *)v21 + 24))
  {
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_12:
  BOOL v16 = v11 != 0;

  _Block_object_dispose(&v20, 8);
  return v16;
}

void __113__PLCloudIdentifierReservationSupport_cancelReservedCloudIdentifiersWithEntityName_clientBundleIdentifier_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_reservedIdentifiersForEntityName:clientBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeAllObjects];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (BOOL)takeReservedCloudIdentifierWithEntityName:(id)a3 uuid:(id)a4 clientBundleIdentifier:(id)a5 error:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__17837;
  v30 = __Block_byref_object_dispose__17838;
  id v31 = 0;
  if (v9 && v11)
  {
    id v23 = v9;
    id v24 = v12;
    id v25 = v10;
    PLRunWithUnfairLock();
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    if (v11)
    {
      uint64_t v38 = *MEMORY[0x1E4F28228];
      v39[0] = @"Unsupported object type";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    }
    else
    {
      uint64_t v36 = *MEMORY[0x1E4F28228];
      v37 = @"Missing bundle identifier";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v15 = };
    uint64_t v16 = [v13 errorWithDomain:v14 code:46201 userInfo:v15];
    v17 = (void *)v27[5];
    v27[5] = v16;
  }
  int v18 = *((unsigned __int8 *)v33 + 24);
  id v19 = (id)v27[5];
  uint64_t v20 = v19;
  if (!v18 && a6) {
    *a6 = v19;
  }

  BOOL v21 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v21;
}

void __115__PLCloudIdentifierReservationSupport_takeReservedCloudIdentifierWithEntityName_uuid_clientBundleIdentifier_error___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_reservedIdentifiersForEntityName:clientBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 56)];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F8C500];
    uint64_t v11 = *MEMORY[0x1E4F28228];
    v12[0] = @"No matching reserved cloud identifier found";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v7 = [v4 errorWithDomain:v5 code:46111 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    char v10 = 0;
  }
  else
  {
    [v2 removeObjectAtIndex:v3];
    char v10 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
}

- (id)reservedCloudIdentifierUUIDsWithEntityName:(id)a3 clientBundleIdentifier:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__17837;
  id v25 = __Block_byref_object_dispose__17838;
  id v26 = 0;
  if (v7 && v8)
  {
    id v19 = v7;
    id v20 = v9;
    PLRunWithUnfairLock();

    char v10 = 0;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8C500];
    if (v8)
    {
      uint64_t v29 = *MEMORY[0x1E4F28228];
      v30[0] = @"Unsupported object type";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    }
    else
    {
      uint64_t v27 = *MEMORY[0x1E4F28228];
      uint64_t v28 = @"Missing bundle identifier";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v13 = };
    char v10 = [v11 errorWithDomain:v12 code:46201 userInfo:v13];
  }
  uint64_t v14 = v22[5];
  id v15 = v10;
  uint64_t v16 = v15;
  if (!v14 && a5) {
    *a5 = v15;
  }

  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __111__PLCloudIdentifierReservationSupport_reservedCloudIdentifierUUIDsWithEntityName_clientBundleIdentifier_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_reservedIdentifiersForEntityName:clientBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)reserveCloudIdentifierUUIDsWithEntityName:(id)a3 count:(unint64_t)a4 clientBundleIdentifier:(id)a5 error:(id *)a6
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__17837;
  v37 = __Block_byref_object_dispose__17838;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__17837;
  id v31 = __Block_byref_object_dispose__17838;
  id v32 = 0;
  if (v9 && v10)
  {
    id v25 = v9;
    id v26 = v11;
    PLRunWithUnfairLock();
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    if (v10)
    {
      uint64_t v41 = *MEMORY[0x1E4F28228];
      v42[0] = @"Unsupported object type";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    }
    else
    {
      uint64_t v39 = *MEMORY[0x1E4F28228];
      v40 = @"Missing bundle identifier";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v14 = };
    uint64_t v15 = [v12 errorWithDomain:v13 code:46201 userInfo:v14];
    uint64_t v16 = (void *)v28[5];
    v28[5] = v15;
  }
  if ([(id)v34[5] count] != a4)
  {
    id v17 = (void *)v34[5];
    v34[5] = 0;
  }
  int v18 = (void *)v28[5];
  if (v34[5])
  {
    id v19 = v18;
    goto LABEL_17;
  }
  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:0];
    uint64_t v21 = (void *)v28[5];
    v28[5] = v20;

    uint64_t v22 = v34[5];
    id v19 = (id)v28[5];
    if (v22) {
      goto LABEL_17;
    }
  }
  if (a6)
  {
    id v19 = v19;
    *a6 = v19;
  }
LABEL_17:

  id v23 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v23;
}

void __116__PLCloudIdentifierReservationSupport_reserveCloudIdentifierUUIDsWithEntityName_count_clientBundleIdentifier_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_reservedIdentifiersForEntityName:clientBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(*(void *)(a1 + 72) + [v10 count]) > 0xC350)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46202 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (*(void *)(a1 + 72))
    {
      unint64_t v5 = 0;
      do
      {
        v6 = [MEMORY[0x1E4F29128] UUID];
        [v10 addObject:v6];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];

        ++v5;
      }
      while (*(void *)(a1 + 72) > v5);
    }
  }
}

- (id)_lock_reservedIdentifiersForEntityName:(id)a3 clientBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_lock_reservedEntityIdentifiersByBundle objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_lock_reservedEntityIdentifiersByBundle setObject:v8 forKeyedSubscript:v7];
  }
  id v9 = [v8 objectForKeyedSubscript:v6];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v8 setObject:v9 forKeyedSubscript:v6];
  }

  return v9;
}

- (PLCloudIdentifierReservationSupport)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLCloudIdentifierReservationSupport;
  uint64_t v2 = [(PLCloudIdentifierReservationSupport *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_reservedEntityIdentifiersByBundle = v2->_lock_reservedEntityIdentifiersByBundle;
    v2->_lock_reservedEntityIdentifiersByBundle = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

@end