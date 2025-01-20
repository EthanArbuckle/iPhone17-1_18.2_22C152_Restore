@interface SSRDESRecordWriter
+ (void)createDESRecordWithSuperVector:(id)a3 withMetaInfo:(id)a4;
+ (void)fetchMedicalDataWithCompletion:(id)a3;
@end

@implementation SSRDESRecordWriter

+ (void)fetchMedicalDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F0A410]);
  v5 = (void *)[objc_alloc(MEMORY[0x263F0A4C8]) initWithHealthStore:v4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SSRDESRecordWriter_fetchMedicalDataWithCompletion___block_invoke;
  v7[3] = &unk_264428EF8;
  id v8 = v3;
  id v6 = v3;
  [v5 fetchMedicalIDDataWithCompletion:v7];
}

void __53__SSRDESRecordWriter_fetchMedicalDataWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = [v5 gregorianBirthday];
    uint64_t v8 = [v6 name];
    v9 = (void *)v8;
    if (v7 && v8)
    {
      v10 = [MEMORY[0x263EFF8F0] currentCalendar];
      v11 = [MEMORY[0x263EFF910] date];
      v12 = [v10 components:28 fromDate:v11];
      v13 = NSNumber;
      v14 = [MEMORY[0x263EFF8F0] currentCalendar];
      v15 = [v14 components:4 fromDateComponents:v7 toDateComponents:v12 options:0];
      v16 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v15, "year"));

      v17 = [v9 componentsSeparatedByString:@" "];
      v18 = [v17 firstObject];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v10 = [NSString stringWithFormat:@"ERR: received nil dob: %@ / name: %@", v7, v8];
      v19 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[SSRDESRecordWriter fetchMedicalDataWithCompletion:]_block_invoke";
        __int16 v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x263F087E8];
      v22 = @"reason";
      v23 = v10;
      v21 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v11 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:114 userInfo:v21];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

+ (void)createDESRecordWithSuperVector:(id)a3 withMetaInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v8 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]";
    _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s SAT Supervector created", (uint8_t *)&buf, 0xCu);
  }
  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__1500;
    __int16 v26 = __Block_byref_object_dispose__1501;
    id v27 = (id)[v5 copy];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__1500;
    v19 = __Block_byref_object_dispose__1501;
    id v20 = (id)[objc_alloc(MEMORY[0x263F3A470]) initWithBundleIdentifier:@"com.apple.fides.phs"];
    if ([(id)v16[5] isPermitted]
      && ([(id)v16[5] shouldMakeRecordWithFrequency:100] & 1) != 0)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __66__SSRDESRecordWriter_createDESRecordWithSuperVector_withMetaInfo___block_invoke;
      v11[3] = &unk_264428ED0;
      id v12 = v6;
      v13 = &v15;
      p_long long buf = &buf;
      v9 = (void *)MEMORY[0x21D4B2740](v11);
      +[SSRDESRecordWriter fetchMedicalDataWithCompletion:v9];
    }
    else
    {
      v10 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315138;
        v22 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]";
        _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping PHS DES record creation", v21, 0xCu);
      }
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&buf, 8);
  }
}

void __66__SSRDESRecordWriter_createDESRecordWithSuperVector_withMetaInfo___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v15 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: failed to create PHS DES recored with error: %@", buf, 0x16u);
    }
  }
  else
  {
    v12[0] = @"Age";
    v12[1] = @"Name";
    v13[0] = v7;
    v13[1] = v8;
    v12[2] = @"MetaInfo";
    v13[2] = a1[4];
    v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    [*(id *)(*(void *)(a1[5] + 8) + 40) saveRecordWithData:*(void *)(*(void *)(a1[6] + 8) + 40) recordInfo:v11 completion:&__block_literal_global_1510];
  }
}

void __66__SSRDESRecordWriter_createDESRecordWithSuperVector_withMetaInfo___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = *MEMORY[0x263F38100];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s Failed to create PHS DES record: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 UUIDString];
    int v9 = 136315394;
    v10 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Created PHS DES record with identifier: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

@end