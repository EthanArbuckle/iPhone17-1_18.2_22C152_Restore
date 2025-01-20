@interface TRIFetchDateManager
+ (id)kvstoreKeyForType:(unsigned __int8)a3 container:(int)a4 teamId:(id)a5;
+ (id)managerWithKeyValueStore:(id)a3;
- (TRIFetchDateManager)initWithKeyValueStore:(id)a3;
- (id)lastFetchDateWithType:(unsigned __int8)a3 container:(int)a4 teamId:(id)a5;
- (void)setLastFetchDate:(id)a3 type:(unsigned __int8)a4 container:(int)a5 teamId:(id)a6;
@end

@implementation TRIFetchDateManager

- (TRIFetchDateManager)initWithKeyValueStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchDateManager;
  v6 = [(TRIFetchDateManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyValueStore, a3);
  }

  return v7;
}

+ (id)kvstoreKeyForType:(unsigned __int8)a3 container:(int)a4 teamId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  int v6 = a3;
  id v9 = a5;
  v10 = v9;
  if (v5 != 2 || v9)
  {
    if (v6) {
      goto LABEL_4;
    }
LABEL_7:
    v11 = (id *)MEMORY[0x1E4FB02A0];
LABEL_8:
    id v13 = *v11;
    if (v13) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:a1 file:@"TRIFetchDateManager.m" lineNumber:39 description:@"teamId required for 3P date lookup"];

  if (!v6) {
    goto LABEL_7;
  }
LABEL_4:
  if (v6 == 1)
  {
    v11 = (id *)MEMORY[0x1E4FB02A8];
    goto LABEL_8;
  }
LABEL_9:
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"TRIFetchDateManager.m", 50, @"Invalid parameter not satisfying: %@", @"baseKey" object file lineNumber description];

  id v13 = 0;
LABEL_10:
  if (v5 == 1)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"%@.%d.%@", v13, v5, v10];
  }
  v16 = v15;

  return v16;
}

+ (id)managerWithKeyValueStore:(id)a3
{
  id v3 = a3;
  v4 = [[TRIFetchDateManager alloc] initWithKeyValueStore:v3];

  return v4;
}

- (id)lastFetchDateWithType:(unsigned __int8)a3 container:(int)a4 teamId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v10 = a5;
  v11 = (void *)[[v9 alloc] initWithTimeIntervalSince1970:1581321600.0];
  keyValueStore = self->_keyValueStore;
  id v13 = +[TRIFetchDateManager kvstoreKeyForType:v6 container:v5 teamId:v10];

  v14 = [(TRIKVStore *)keyValueStore blobForKey:v13 usingTransaction:0];

  if (v14)
  {
    id v28 = 0;
    id v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v28];
    id v16 = v28;
    if (v15) {
      goto LABEL_14;
    }
  }
  else
  {
    id v16 = 0;
  }
  v17 = [MEMORY[0x1E4FB0258] sharedInstance];
  int v18 = [v17 populationType];

  if (v18 == 3)
  {
    id v15 = v11;
  }
  else
  {
    v19 = [NSString stringWithUTF8String:"Nov 10 2024"];
    if (!v19)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"TRIFetchDateManager.m", 84, @"Invalid parameter not satisfying: %@", @"compilationDateString" object file lineNumber description];
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v20 setDateFormat:@"MMM d yyyy"];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
    [v20 setLocale:v21];

    v22 = [v20 dateFromString:v19];
    v23 = v22;
    if (!v22)
    {
      v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "unable to parse compilation date, lastDateFetch is nil", buf, 2u);
      }

      v23 = v11;
    }
    id v15 = v23;
  }
LABEL_14:

  return v15;
}

- (void)setLastFetchDate:(id)a3 type:(unsigned __int8)a4 container:(int)a5 teamId:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = a4;
  id v11 = a6;
  id v17 = 0;
  v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v17];
  id v13 = v17;
  if (!v12)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIFetchDateManager.m", 108, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  keyValueStore = self->_keyValueStore;
  id v15 = +[TRIFetchDateManager kvstoreKeyForType:v7 container:v6 teamId:v11];
  [(TRIKVStore *)keyValueStore setBlob:v12 forKey:v15 usingTransaction:0];
}

- (void).cxx_destruct
{
}

@end