@interface VCIntentDefinitionSyncState
+ (id)JSONKeyPathsByPropertyKey;
+ (id)applicationsJSONTransformer;
- (NSDictionary)applications;
- (NSNumber)sequenceNumber;
- (NSUUID)databaseUUID;
- (void)setApplications:(id)a3;
- (void)setDatabaseUUID:(id)a3;
- (void)setSequenceNumber:(id)a3;
@end

@implementation VCIntentDefinitionSyncState

+ (id)applicationsJSONTransformer
{
  return (id)[MEMORY[0x1E4FB70A8] transformerUsingForwardBlock:&__block_literal_global_6434 reverseBlock:&__block_literal_global_109];
}

id __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6435;
  v13 = __Block_byref_object_dispose__6436;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_3;
  v8[3] = &unk_1E6541B80;
  v8[4] = &v9;
  v6 = objc_msgSend(v5, "if_compactMap:", v8);
  if (a4) {
    *a4 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = 0;
  v7 = [MEMORY[0x1E4FB72B0] JSONDictionaryFromModel:a3 error:&v10];
  id v8 = v10;
  id v9 = v10;
  *a5 = v7;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
  }
}

id __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6435;
  v13 = __Block_byref_object_dispose__6436;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_104;
  v8[3] = &unk_1E6541B58;
  v8[4] = &v9;
  v6 = objc_msgSend(v5, "if_compactMap:", v8);
  if (a4) {
    *a4 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__VCIntentDefinitionSyncState_applicationsJSONTransformer__block_invoke_104(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  v7 = (void *)MEMORY[0x1E4FB72B0];
  id v8 = a3;
  id v12 = 0;
  uint64_t v9 = [v7 modelOfClass:objc_opt_class() fromJSONDictionary:v8 error:&v12];

  id v10 = v12;
  id v11 = v12;
  *a5 = v9;
  if (v11) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v10);
  }
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"databaseUUID";
  v4[1] = @"sequenceNumber";
  v5[0] = @"LSDatabaseUUID";
  v5[1] = @"LSDatabaseSequenceNumber";
  v4[2] = @"applications";
  v5[2] = @"applications";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
}

- (void)setApplications:(id)a3
{
}

- (NSDictionary)applications
{
  return self->_applications;
}

- (void)setSequenceNumber:(id)a3
{
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setDatabaseUUID:(id)a3
{
}

- (NSUUID)databaseUUID
{
  return self->_databaseUUID;
}

@end