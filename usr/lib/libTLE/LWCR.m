@interface LWCR
+ (id)withData:(id)a3 withError:(id *)a4;
+ (id)withVersion:(int64_t)a3 withConstraintCategory:(int64_t)a4 withRequirements:(id)a5 withError:(id *)a6;
- (BOOL)hasRequirements;
- (LWCR)init;
- (NSDictionary)dictionary;
- (id).cxx_construct;
- (id)externalRepresentation;
- (int64_t)constraintCategory;
- (int64_t)version;
- (void)dealloc;
@end

@implementation LWCR

- (id).cxx_construct
{
  *((unsigned char *)self + 112) = 0;
  *((unsigned char *)self + 89) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 3, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (id)externalRepresentation
{
  return *((id *)self + 1);
}

- (NSDictionary)dictionary
{
  v2 = (void *)[*((id *)self + 3) copy];

  return (NSDictionary *)v2;
}

- (BOOL)hasRequirements
{
  return der_vm_context_is_valid();
}

- (int64_t)constraintCategory
{
  return *((void *)self + 6);
}

- (int64_t)version
{
  return *((void *)self + 4);
}

- (void)dealloc
{
  if (*((void *)self + 2)) {
    CEReleaseManagedContext();
  }
  v3.receiver = self;
  v3.super_class = (Class)LWCR;
  [(LWCR *)&v3 dealloc];
}

- (LWCR)init
{
  v6.receiver = self;
  v6.super_class = (Class)LWCR;
  v2 = [(LWCR *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = 0;

    *((void *)v3 + 2) = 0;
  }
  return v3;
}

+ (id)withVersion:(int64_t)a3 withConstraintCategory:(int64_t)a4 withRequirements:(id)a5 withError:(id *)a6
{
  v20[3] = *MEMORY[0x263EF8340];
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFF9A0];
  v19[0] = @"vers";
  v12 = [NSNumber numberWithLongLong:a3];
  v20[0] = v12;
  v19[1] = @"comp";
  v13 = [NSNumber numberWithLongLong:a3 == 1];
  v20[1] = v13;
  v19[2] = @"ccat";
  v14 = [NSNumber numberWithLongLong:a4];
  v20[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  v16 = [v11 dictionaryWithDictionary:v15];

  if (v10) {
    [v16 setObject:v10 forKeyedSubscript:@"reqs"];
  }
  if (CESerializeCFDictionaryWithOptions() == *MEMORY[0x263F8BAF0])
  {
    v17 = [a1 withData:0 withError:a6];
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"LWCRError" code:2 userInfo:0];
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)withData:(id)a3 withError:(id *)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v23 = 0;
  char v22 = 1;
  uint64_t v7 = CEManagedContextFromCFDataWithOptions();
  v8 = (void *)MEMORY[0x263F8BAF0];
  if (v7 == *MEMORY[0x263F8BAF0])
  {
    id v10 = objc_alloc_init(LWCR);
    objc_storeStrong((id *)v10 + 1, a3);
    v11 = v23;
    *((void *)v10 + 2) = v23;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    TLE::LWCR::loadFromCE((TLE::LWCR *)((char *)v10 + 32), v11, (uint64_t)&v19);
    if (v19)
    {
      if (a4)
      {
        v12 = (void *)MEMORY[0x263F087E8];
        v24[0] = *MEMORY[0x263F08608];
        v13 = [NSNumber numberWithInt:];
        v25[0] = v13;
        v24[1] = *MEMORY[0x263F07F80];
        id v14 = [NSString alloc];
        v15 = (void *)[v14 initWithBytes:v20 length:v21 encoding:4];
        v25[1] = v15;
        v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
        *a4 = [v12 errorWithDomain:@"LWCRError" code:1 userInfo:v16];
      }
    }
    else
    {
      if (CEQueryContextToCFDictionary() == *v8)
      {
        v18 = (void *)*((void *)v10 + 3);
        *((void *)v10 + 3) = 0;

        v9 = v10;
        goto LABEL_8;
      }
      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"LWCRError" code:2 userInfo:0];
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v9 = 0;
LABEL_8:

    goto LABEL_10;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"LWCRError" code:2 userInfo:0];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_10:

  return v9;
}

@end