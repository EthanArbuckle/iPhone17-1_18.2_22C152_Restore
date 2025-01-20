@interface MSVSQLConnection
@end

@implementation MSVSQLConnection

void __45___MSVSQLConnection__cloneWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v7 = *(id **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  id obj = v10;
  id v11 = a3;
  id v12 = a2;
  if (v7)
  {
    v13 = [NSString stringWithFormat:@"ATTACH %@ AS %@", v11, v12];
    if ([v7 executeStatementString:v13 error:&obj]) {
      [v7[3] setObject:v11 forKeyedSubscript:v12];
    }
  }
  objc_storeStrong(v9, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

BOOL __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = v3;
  if (v3) {
    v5 = (void *)v3[1];
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    int v9 = [v6 isEqual:v7];

    if (!v9)
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
  }
  if (v4) {
    uint64_t v11 = v4[2];
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v10 = v11 == *(void *)(a1 + 40);
LABEL_10:

  return v10;
}

BOOL __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = v3;
  if (v3) {
    v5 = (void *)v3[1];
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = *(id *)(a1 + 32);
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    int v9 = [v6 isEqual:v7];

    if (!v9)
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
  }
  if (v4) {
    uint64_t v11 = v4[2];
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v10 = v11 == *(void *)(a1 + 40);
LABEL_10:

  return v10;
}

@end