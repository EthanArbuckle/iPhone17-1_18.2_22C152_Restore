@interface FCJSONRecordSource
- (FCJSONRecordSource)initWithSchema:(id)a3 contentDatabase:(id)a4 contentDirectory:(id)a5 experimentationSuffix:(id)a6 activeTreatmentID:(id)a7;
- (FCJSONRecordSourceSchema)schema;
- (NFLazy)dateFormatter;
- (id)alwaysLocalizedKeys;
- (id)keyValueRepresentationOfRecord:(id)a3;
- (id)localizableKeys;
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordIDPrefixes;
- (id)recordType;
- (id)storeFilename;
- (int)pbRecordType;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
- (void)fetchRecordsWithIDs:(id)a3 cachePolicy:(id)a4 completion:(id)a5;
- (void)fetchRecordsWithIDs:(id)a3 completion:(id)a4;
- (void)setDateFormatter:(id)a3;
- (void)setSchema:(id)a3;
@end

@implementation FCJSONRecordSource

- (void)fetchRecordsWithIDs:(id)a3 cachePolicy:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(FCRecordSource *)self fetchOperationForRecordsWithIDs:a3];
  objc_msgSend(v10, "setCachePolicy:", objc_msgSend(v9, "cachePolicy"));
  [v9 maximumCachedAge];
  double v12 = v11;

  [v10 setMaximumCachedAge:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke;
  v15[3] = &unk_1E5B4CAF8;
  id v13 = v8;
  id v16 = v13;
  [v10 setFetchCompletionBlock:v15];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v14 addOperation:v10];
  }
  else
  {
    [v10 start];
  }
}

void __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 fetchedObject];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 allRecords];
    v6 = objc_msgSend(v5, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_11_5, &__block_literal_global_14_1);

    v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v6 = [v9 error];
    v7 = *(void (**)(void))(v8 + 16);
  }
  v7();
}

- (unint64_t)storeVersion
{
  return 2;
}

- (id)storeFilename
{
  v2 = NSString;
  v3 = [(FCJSONRecordSource *)self schema];
  v4 = [v3 recordType];
  v5 = [v4 lowercaseString];
  v6 = [v2 stringWithFormat:@"%@-record-source", v5];

  return v6;
}

- (id)localizableKeys
{
  v2 = [(FCJSONRecordSource *)self schema];
  v3 = [v2 localizableKeys];

  return v3;
}

- (id)alwaysLocalizedKeys
{
  v2 = [(FCJSONRecordSource *)self schema];
  v3 = [v2 alwaysLocalizedKeys];

  return v3;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  id v47 = objc_alloc_init(MEMORY[0x1E4F82A80]);
  [v47 setBase:v46];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = [v6 recordID];
  id v9 = [v8 recordName];
  [v7 setObject:v9 forKeyedSubscript:@"_recordName"];

  v10 = [(FCJSONRecordSource *)self dateFormatter];
  double v11 = [v10 value];
  double v12 = [v6 creationDate];
  id v13 = [v11 stringFromDate:v12];
  [v7 setObject:v13 forKeyedSubscript:@"_recordCreationDate"];

  v14 = [(FCJSONRecordSource *)self dateFormatter];
  v15 = [v14 value];
  v51 = v6;
  id v16 = [v6 modificationDate];
  v17 = [v15 stringFromDate:v16];
  v50 = v7;
  [v7 setObject:v17 forKeyedSubscript:@"_recordModificationDate"];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v18 = [(FCJSONRecordSource *)self schema];
  v19 = [v18 allKeys];

  id obj = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v64 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v54;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v53 + 1) + 8 * v23);
        v25 = [(FCRecordSource *)self localizedKeysByOriginalKey];
        v26 = [v25 objectForKeyedSubscript:v24];

        v27 = v24;
        v28 = [v51 objectForKeyedSubscript:v26];
        if (v28
          || ([v51 objectForKeyedSubscript:v27],
              (v28 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = [(FCJSONRecordSource *)self dateFormatter];
            v30 = [v29 value];
            v31 = [v30 stringFromDate:v28];
          }
          else
          {
            v31 = 0;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v32 = [v28 base64EncodedStringWithOptions:0];

            v31 = v32;
          }
          v33 = (void *)MEMORY[0x1E4F28D90];
          v63 = v28;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
          LODWORD(v33) = [v33 isValidJSONObject:v34];

          if (v33)
          {
            v35 = v28;

            v31 = v35;
            goto LABEL_16;
          }
          if (v31)
          {
LABEL_16:
            [v50 setObject:v31 forKeyedSubscript:v27];
            goto LABEL_17;
          }
          v36 = (void *)FCRecordSourceLog;
          if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_ERROR))
          {
            v31 = v36;
            v48 = [(FCJSONRecordSource *)self schema];
            v37 = [v48 recordType];
            v38 = (objc_class *)objc_opt_class();
            v39 = NSStringFromClass(v38);
            *(_DWORD *)buf = 138412802;
            v58 = v37;
            __int16 v59 = 2112;
            v60 = v27;
            __int16 v61 = 2112;
            v62[0] = v39;
            _os_log_error_impl(&dword_1A460D000, v31, OS_LOG_TYPE_ERROR, "dropping record value that can't be encoded as JSON: %@.%@ = %@", buf, 0x20u);

LABEL_17:
          }
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v40 = [obj countByEnumeratingWithState:&v53 objects:v64 count:16];
      uint64_t v21 = v40;
    }
    while (v40);
  }

  id v52 = 0;
  v41 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v50 options:0 error:&v52];
  id v42 = v52;
  if (v41)
  {
    v43 = v47;
    [v47 setJson:v41];
  }
  else
  {
    v43 = v47;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)[[NSString alloc] initWithFormat:@"failed to encode record as JSON with error: %@", v42];
      *(_DWORD *)buf = 136315906;
      v58 = "-[FCJSONRecordSource recordFromCKRecord:base:]";
      __int16 v59 = 2080;
      v60 = "FCJSONRecordSource.m";
      __int16 v61 = 1024;
      LODWORD(v62[0]) = 220;
      WORD2(v62[0]) = 2114;
      *(void *)((char *)v62 + 6) = v45;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }

  return v43;
}

- (NFLazy)dateFormatter
{
  return self->_dateFormatter;
}

- (FCJSONRecordSourceSchema)schema
{
  return self->_schema;
}

- (int)pbRecordType
{
  return 9;
}

- (id)nonLocalizableKeys
{
  v2 = [(FCJSONRecordSource *)self schema];
  v3 = [v2 keys];

  return v3;
}

- (id)recordType
{
  v2 = [(FCJSONRecordSource *)self schema];
  v3 = [v2 recordType];

  return v3;
}

uint64_t __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 json];
}

id __65__FCJSONRecordSource_fetchRecordsWithIDs_cachePolicy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 base];
  v3 = [v2 identifier];

  return v3;
}

id __110__FCJSONRecordSource_initWithSchema_contentDatabase_contentDirectory_experimentationSuffix_activeTreatmentID___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  [v0 setFormatOptions:3955];
  return v0;
}

- (FCJSONRecordSource)initWithSchema:(id)a3 contentDatabase:(id)a4 contentDirectory:(id)a5 experimentationSuffix:(id)a6 activeTreatmentID:(id)a7
{
  id v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCJSONRecordSource;
  id v13 = [(FCRecordSource *)&v19 initWithContentDatabase:a4 contentDirectory:a5 appActivityMonitor:0 backgroundTaskable:0 experimentalizableFieldsPostfix:a6 activeTreatmentID:a7];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    schema = v13->_schema;
    v13->_schema = (FCJSONRecordSourceSchema *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_125];
    dateFormatter = v13->_dateFormatter;
    v13->_dateFormatter = (NFLazy *)v16;
  }
  return v13;
}

- (void)fetchRecordsWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FCCachePolicy defaultCachePolicy];
  [(FCJSONRecordSource *)self fetchRecordsWithIDs:v7 cachePolicy:v8 completion:v6];
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 2000000;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 5000000;
}

- (id)recordIDPrefixes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(FCJSONRecordSource *)self schema];
  v3 = [v2 recordIDPrefix];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)keyValueRepresentationOfRecord:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = FCCheckedDynamicCast(v4, (uint64_t)v3);

  id v6 = (void *)MEMORY[0x1E4F28D90];
  id v7 = [v5 json];
  id v8 = [v6 JSONObjectWithData:v7 options:0 error:0];
  id v9 = v8;
  if (!v8) {
    id v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v10 = v8;

  return v10;
}

- (void)setSchema:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end