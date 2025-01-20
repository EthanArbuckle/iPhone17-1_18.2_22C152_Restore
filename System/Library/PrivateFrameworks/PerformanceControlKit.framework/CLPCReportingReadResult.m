@interface CLPCReportingReadResult
- (CLPCReportingReadResult)init;
- (id).cxx_construct;
- (id)debugDescription;
- (id)rowsForSchemaID:(unint64_t)a3 error:(id *)a4;
- (unint64_t)hasRowsForSchemaID:(unint64_t)a3 error:(id *)a4;
- (void)enumerate:(id)a3;
- (void)setStatRows:(unsigned int)a3 forIndex:;
@end

@implementation CLPCReportingReadResult

- (void)enumerate:(id)a3
{
  uint64_t v3 = 0;
  p_rows_by_schema = &self->rows_by_schema;
  v9 = (uint64_t (**)(id, void, void *))a3;
  while (1)
  {
    v5 = p_rows_by_schema->__elems_[v3];
    v6 = v5;
    if (v5)
    {
      v7 = [(CLPCReportingRows *)v5 rows];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        if ((v9[2](v9, v3, v6) & 1) == 0) {
          break;
        }
      }
    }

    if (++v3 == 8) {
      goto LABEL_8;
    }
  }

LABEL_8:
}

- (void)setStatRows:(unsigned int)a3 forIndex:
{
  id v6 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 8 * a3 + 8), a2);
  }
}

- (CLPCReportingReadResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLPCReportingReadResult;
  v2 = [(CLPCReportingReadResult *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    id v6 = 0;
    std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100]((uint64_t)&v2->rows_by_schema, &v6);

    v4 = v3;
  }

  return v3;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  uint64_t v3 = 64;
  do
  {

    v3 -= 8;
  }
  while (v3);
}

- (unint64_t)hasRowsForSchemaID:(unint64_t)a3 error:(id *)a4
{
  if (a3 >= 8)
  {
    return 0;
  }
  else if (self->rows_by_schema.__elems_[a3])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (id)rowsForSchemaID:(unint64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a3 >= 8)
  {
    objc_super v7 = 0;
  }
  else
  {
    id v6 = self->rows_by_schema.__elems_[a3];
    objc_super v7 = v6;
    if (!v6
      || ([(CLPCReportingRows *)v6 rows],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          !v9))
    {
      if (a4)
      {
        v10 = objc_msgSend(NSString, "stringWithFormat:", @"There are no rows for schema ID %lu.", a3);
        uint64_t v13 = *MEMORY[0x263F07F80];
        v14[0] = v10;
        v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
        *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v11];
      }
    }
  }
  return v7;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__CLPCReportingReadResult_debugDescription__block_invoke;
  v7[3] = &unk_265447118;
  id v4 = v3;
  id v8 = v4;
  [(CLPCReportingReadResult *)self enumerate:v7];
  v5 = [v4 description];

  return v5;
}

uint64_t __43__CLPCReportingReadResult_debugDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFF980];
  objc_super v7 = [v5 schema];
  id v8 = [v7 columns];
  uint64_t v9 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = objc_msgSend(v5, "schema", 0);
  v11 = [v10 columns];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = -[CLPCReportingSchemaColumn dictionaryRepresentation](*(id *)(*((void *)&v21 + 1) + 8 * v14));
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v12);
  }

  v16 = *(void **)(a1 + 32);
  v25[0] = @"SchemaID";
  v17 = [NSNumber numberWithUnsignedInteger:a2];
  v26[0] = v17;
  v26[1] = v9;
  v25[1] = @"Columns";
  v25[2] = @"Rows";
  v18 = [v5 rows];
  v26[2] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v16 addObject:v19];

  return 1;
}

@end