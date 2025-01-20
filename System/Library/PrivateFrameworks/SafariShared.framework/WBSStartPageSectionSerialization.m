@interface WBSStartPageSectionSerialization
+ (id)decodeSectionsFromData:(id)a3 expectedFormat:(int64_t)a4 allowingFallbackFormats:(BOOL)a5 error:(id *)a6;
+ (id)decodeSectionsWithData:(id)a3 format:(int64_t)a4 error:(id *)a5;
+ (id)encodeSectionsAsLocalData:(id)a3 error:(id *)a4;
+ (id)encodeSectionsAsSyncableData:(id)a3 existingSyncableData:(id)a4 error:(id *)a5;
@end

@implementation WBSStartPageSectionSerialization

+ (id)decodeSectionsFromData:(id)a3 expectedFormat:(int64_t)a4 allowingFallbackFormats:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  if (v10)
  {
    id v14 = 0;
    v11 = [a1 decodeSectionsWithData:v10 format:a4 error:&v14];
    id v12 = v14;
    if (!v11 && v7)
    {
      v11 = [a1 decodeSectionsWithData:v10 format:a4 == 0 error:0];
    }
    if (a6 && !v11) {
      *a6 = v12;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)decodeSectionsWithData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4 == 1)
  {
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:a5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 objectForKeyedSubscript:@"Sections"];
      v5 = objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_107);
    }
    else if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3840 userInfo:0];
      v5 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else if (!a4)
  {
    v5 = [MEMORY[0x1E4F28DC0] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v8 error:a5];
  }

  return v5;
}

WBSStartPageSectionDescriptor *__72__WBSStartPageSectionSerialization_decodeSectionsWithData_format_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = [[WBSStartPageSectionDescriptor alloc] initWithDictionaryRepresentation:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

+ (id)encodeSectionsAsLocalData:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)encodeSectionsAsSyncableData:(id)a3 existingSyncableData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  if ([v7 length])
  {
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:1 error:a5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
LABEL_7:
  id v10 = [v9 objectForKeyedSubscript:@"Sections"];
  v11 = [v8 valueForKey:@"identifier"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke;
  v24[3] = &unk_1E5CA0278;
  id v25 = v10;
  id v12 = v10;
  v13 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v24);

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_3;
  v22 = &unk_1E5CA02A0;
  id v23 = v11;
  id v14 = v11;
  v15 = objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", &v19);
  v16 = objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v15, v19, v20, v21, v22);
  [v9 setObject:v16 forKeyedSubscript:@"Sections"];

  v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:a5];

  return v17;
}

id __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  v5 = [v3 dictionaryRepresentation];

  v6 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_2;
  v12[3] = &unk_1E5CA0250;
  id v13 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "safari_firstObjectPassingTest:", v12);
  if (v8)
  {
    objc_msgSend(v5, "safari_dictionaryByMergingWithDictionary:", v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v5;
  }
  id v10 = v9;

  return v10;
}

uint64_t __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_msgSend(v2, "safari_stringForKey:", @"Identifier");
    uint64_t v4 = WBSIsEqual();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_msgSend(v3, "safari_stringForKey:", @"Identifier");
    if ([*(id *)(a1 + 32) containsObject:v4]) {
      v5 = 0;
    }
    else {
      v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end