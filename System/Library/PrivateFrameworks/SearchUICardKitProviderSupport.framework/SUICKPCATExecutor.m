@interface SUICKPCATExecutor
- (void)responseProtoFromCATModel:(id)a3 completion:(id)a4;
@end

@implementation SUICKPCATExecutor

- (void)responseProtoFromCATModel:(id)a3 completion:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, id, id))a4;
  v24 = @"locale";
  v6 = (void *)MEMORY[0x263EFF960];
  id v7 = a3;
  v8 = [v6 currentLocale];
  v9 = [v8 languageCode];
  v25[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

  v11 = [v7 catIdentifier];
  uint64_t v12 = [v7 bundleIdentifier];
  v13 = (void *)v12;
  v14 = @"com.apple.siri.DialogEngine";
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v15 = v14;

  v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:v15];

  v17 = (void *)MEMORY[0x263F08900];
  v18 = [v7 params];

  id v23 = 0;
  v19 = [v17 JSONObjectWithData:v18 options:0 error:&v23];
  id v20 = v23;

  if (v20)
  {
    v21 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[SUICKPCATExecutor responseProtoFromCATModel:completion:](v21, v20);
    }
    id v22 = objc_alloc_init(MEMORY[0x263F3A1C0]);
    v5[2](v5, v22, v20);
  }
  else
  {
    [MEMORY[0x263F3A1A8] execute:v16 catId:v11 parameters:v19 globals:v10 callback:0 options:*MEMORY[0x263F3A1A0] completion:v5];
  }
}

- (void)responseProtoFromCATModel:(void *)a1 completion:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_22C0E8000, v3, OS_LOG_TYPE_ERROR, "Error decoding CAT Params: %@", (uint8_t *)&v5, 0xCu);
}

@end