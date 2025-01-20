@interface FCResourceRecordSource
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordType;
- (id)storeFilename;
- (int)pbRecordType;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
@end

@implementation FCResourceRecordSource

- (unint64_t)storeVersion
{
  return 7;
}

- (id)storeFilename
{
  return @"resource-record-source";
}

- (id)nonLocalizableKeys
{
  if (qword_1EB5D10C8 != -1) {
    dispatch_once(&qword_1EB5D10C8, &__block_literal_global_4_2);
  }
  v2 = (void *)_MergedGlobals_148;
  return v2;
}

- (id)recordType
{
  return @"Resource";
}

- (int)pbRecordType
{
  return 3;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 2000000;
}

uint64_t __44__FCResourceRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"type", @"encoding", @"data", @"asset", 0);
  uint64_t v1 = _MergedGlobals_148;
  _MergedGlobals_148 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 250000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F82BA0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setBase:v5];
  v9 = [v7 objectForKeyedSubscript:@"type"];
  [v8 setMimeType:v9];

  v10 = [v7 objectForKeyedSubscript:@"encoding"];
  [v8 setEncoding:v10];

  objc_opt_class();
  v11 = [v7 objectForKeyedSubscript:@"asset"];

  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;
  [v8 setUrl:v13];

  v14 = [v8 mimeType];
  BOOL IsFont = FCMIMETypeIsFont(v14);

  if (IsFont) {
    [v5 setCacheLifetimeHint:1];
  }

  return v8;
}

@end