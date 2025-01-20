@interface MKGETMigratorRouter
- (NSHashTable)migrators;
- (id)keyFromMigratorType:(int64_t)a3;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setMigrators:(id)a3;
@end

@implementation MKGETMigratorRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = objc_loadWeakRetained((id *)&self->_migrators);
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    v11 = 0;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        v11 = -[MKGETMigratorRouter keyFromMigratorType:](self, "keyFromMigratorType:", objc_msgSend(v15, "type", v23, v24, v25));

        if (v11)
        {
          v33[0] = @"import_count";
          v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "importCount"));
          v33[1] = @"import_error_count";
          v34[0] = v16;
          v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "importErrorCount"));
          v34[1] = v17;
          uint64_t v18 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

          [v27 setObject:v18 forKey:v11];
          v10 = (void *)v18;
        }
        ++v13;
        v14 = v11;
      }
      while (v9 != v13);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  id v28 = 0;
  v19 = [MEMORY[0x263F08900] dataWithJSONObject:v27 options:0 error:&v28];
  id v20 = v28;
  if (v20)
  {
    v21 = +[MKLog log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MKGETMigratorRouter server:didReceiveRequest:response:](v20, v21);
    }
  }
  v22 = v23;
  objc_msgSend(v23, "setBody:", v19, v23);
}

- (id)keyFromMigratorType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10) {
    return 0;
  }
  else {
    return off_264905D00[a3];
  }
}

- (NSHashTable)migrators
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrators);
  return (NSHashTable *)WeakRetained;
}

- (void)setMigrators:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)server:(void *)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "could not serialize data. error=%@", (uint8_t *)&v4, 0xCu);
}

@end