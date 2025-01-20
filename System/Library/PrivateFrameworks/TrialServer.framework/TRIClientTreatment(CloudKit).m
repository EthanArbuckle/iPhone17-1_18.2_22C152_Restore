@interface TRIClientTreatment(CloudKit)
+ (id)assetURLsFromCKRecord:()CloudKit assetIndexes:;
+ (id)treatmentFromCKRecord:()CloudKit treatmentSize:;
@end

@implementation TRIClientTreatment(CloudKit)

+ (id)treatmentFromCKRecord:()CloudKit treatmentSize:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  *a4 = 0;
  v8 = [v7 values];
  if (!v8)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"TRIClientTreatment+CloudKit.m", 30, @"Expression was unexpectedly nil/false: %@", @"record.values" object file lineNumber description];
  }
  v9 = [v8 triStringValueForField:*MEMORY[0x1E4FB04C0] isNestedValue:0];
  if (v9)
  {
    v10 = [v8 triDataForField:*MEMORY[0x1E4FB04B0]];
    *a4 = [v10 length];
    v11 = [v8 triStringValueForField:*MEMORY[0x1E4FB04B8] isNestedValue:0];
    uint64_t v12 = [v8 triDataForField:*MEMORY[0x1E4FB04A8]];
    v13 = (void *)v12;
    if (v10) {
      BOOL v14 = v11 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14 || v12 == 0)
    {
      TRILogCategory_Server();
      v17 = (TRIClientTreatmentArtifact *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_error_impl(&dword_1DA291000, &v17->super, OS_LOG_TYPE_ERROR, "could not create treatment artifact from CloudKit record for %@ due to missing fields", buf, 0xCu);
      }
      v16 = 0;
    }
    else
    {
      v17 = [[TRIClientTreatmentArtifact alloc] initWithEncodedTreatmentDefinition:v10 encodedTreatmentDefinitionSignature:v11 publicCertificate:v12];
      if ([(TRIClientTreatmentArtifact *)v17 isValidWithTreatmentId:v9])
      {
        id v25 = 0;
        v16 = [MEMORY[0x1E4FB0548] parseFromData:v10 error:&v25];
        v19 = v25;
        if (v16)
        {
          id v20 = v16;
        }
        else
        {
          v21 = TRILogCategory_Server();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v24 = [v7 recordID];
            *(_DWORD *)buf = 138412546;
            v27 = v24;
            __int16 v28 = 2114;
            v29 = v19;
            _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "could not parse TRIClientTreatment from CloudKit record %@: %{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        v19 = TRILogCategory_Server();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v9;
          _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "invalid signature for treatment id %@", buf, 0xCu);
        }
        v16 = 0;
      }
    }
  }
  else
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "could not get treatmentId from CloudKit record", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)assetURLsFromCKRecord:()CloudKit assetIndexes:
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 values];
  if (!v9)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"TRIClientTreatment+CloudKit.m", 76, @"Expression was unexpectedly nil/false: %@", @"record.values" object file lineNumber description];
  }
  v10 = [v9 triDataForField:*MEMORY[0x1E4FB04A8]];
  if (v10)
  {
    v11 = +[TRISignatureKey keyFromData:v10];
    if (v11)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      id v25 = __Block_byref_object_copy__8;
      v26 = __Block_byref_object_dispose__8;
      id v27 = (id)objc_opt_new();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__TRIClientTreatment_CloudKit__assetURLsFromCKRecord_assetIndexes___block_invoke;
      v15[3] = &unk_1E6BB9530;
      id v16 = v9;
      v19 = &v22;
      uint64_t v20 = a2;
      uint64_t v21 = a1;
      id v17 = v11;
      id v18 = v7;
      [v8 enumerateRangesUsingBlock:v15];
      id v12 = (id)v23[5];

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end