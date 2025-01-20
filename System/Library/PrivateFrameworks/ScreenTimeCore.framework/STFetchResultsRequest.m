@interface STFetchResultsRequest
+ (id)requestWithFetchRequest:(id)a3;
- (NSFetchRequest)fetchRequest;
- (STFetchResultsRequest)initWithEntity:(id)a3;
- (STFetchResultsRequest)initWithEntity:(id)a3 predicate:(id)a4;
- (STFetchResultsRequest)initWithEntity:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (STFetchResultsRequest)initWithFetchRequest:(id)a3;
- (id)description;
@end

@implementation STFetchResultsRequest

+ (id)requestWithFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFetchRequest:v4];

  return v5;
}

- (STFetchResultsRequest)initWithFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 entity];
  v6 = [v4 predicate];
  v7 = [v4 sortDescriptors];

  v8 = [(STFetchResultsRequest *)self initWithEntity:v5 predicate:v6 sortDescriptors:v7];
  return v8;
}

- (STFetchResultsRequest)initWithEntity:(id)a3
{
  return [(STFetchResultsRequest *)self initWithEntity:a3 predicate:0 sortDescriptors:0];
}

- (STFetchResultsRequest)initWithEntity:(id)a3 predicate:(id)a4
{
  return [(STFetchResultsRequest *)self initWithEntity:a3 predicate:a4 sortDescriptors:0];
}

- (STFetchResultsRequest)initWithEntity:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)STFetchResultsRequest;
  v11 = [(STFetchResultsRequest *)&v31 init];
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F1C0D0];
    v13 = [v8 name];
    uint64_t v14 = [v12 fetchRequestWithEntityName:v13];
    fetchRequest = v11->_fetchRequest;
    v11->_fetchRequest = (NSFetchRequest *)v14;

    [(NSFetchRequest *)v11->_fetchRequest setPredicate:v9];
    if (v10)
    {
      [(NSFetchRequest *)v11->_fetchRequest setSortDescriptors:v10];
    }
    else
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__9;
      v29 = __Block_byref_object_dispose__9;
      id v30 = 0;
      v16 = [v8 attributesByName];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __66__STFetchResultsRequest_initWithEntity_predicate_sortDescriptors___block_invoke;
      v24[3] = &unk_1E6BC7A00;
      v24[4] = &v25;
      [v16 enumerateKeysAndObjectsUsingBlock:v24];

      uint64_t v17 = v26[5];
      if (!v17)
      {
        v18 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          v20 = [v8 name];
          -[STFetchResultsRequest initWithEntity:predicate:sortDescriptors:](v20, buf);
        }

        uint64_t v17 = v26[5];
      }
      v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v17 ascending:1];
      v32 = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      [(NSFetchRequest *)v11->_fetchRequest setSortDescriptors:v22];

      _Block_object_dispose(&v25, 8);
    }
  }

  return v11;
}

void __66__STFetchResultsRequest_initWithEntity_predicate_sortDescriptors___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v8 = [a3 attributeType];
  if (v8 > 599)
  {
    if (v8 <= 799)
    {
      if (v8 == 600 || v8 == 700) {
        goto LABEL_17;
      }
    }
    else if (v8 == 800 || v8 == 1000 || v8 == 900)
    {
      goto LABEL_17;
    }
  }
  else
  {
    if (v8 > 299)
    {
      if (v8 != 300 && v8 != 400 && v8 != 500) {
        goto LABEL_18;
      }
LABEL_17:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
      goto LABEL_18;
    }
    if (v8 == 100 || v8 == 200) {
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (id)description
{
  v3 = [(STFetchResultsRequest *)self fetchRequest];
  id v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)STFetchResultsRequest;
  v5 = [(STFetchResultsRequest *)&v10 description];
  v6 = [v3 entityName];
  v7 = [v3 predicate];
  uint64_t v8 = [v4 stringWithFormat:@"%@ fetch %@: %@", v5, v6, v7];

  return v8;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void).cxx_destruct
{
}

- (void)initWithEntity:(void *)a1 predicate:(uint8_t *)buf sortDescriptors:.cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1DA519000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "no sort key found for %{pubic}@", buf, 0xCu);
}

@end