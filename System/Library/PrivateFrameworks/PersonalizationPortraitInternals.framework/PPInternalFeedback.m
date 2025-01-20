@interface PPInternalFeedback
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)fromBaseFeedback:(id)a3 storeType:(unsigned __int8)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)build;
- (PPInternalFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7;
- (PPInternalFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7 storeType:(unsigned __int8)a8 build:(id)a9;
- (id)json;
- (id)serialize;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (unsigned)storeType;
- (void)setStoreType:(unsigned __int8)a3;
@end

@implementation PPInternalFeedback

- (void).cxx_destruct
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setStoreType:(unsigned __int8)a3
{
  self->_storeType = a3;
}

- (unsigned)storeType
{
  return self->_storeType;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)PPInternalFeedback;
  return [(PPBaseFeedback *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    v13.receiver = self;
    v13.super_class = (Class)PPInternalFeedback;
    if ([(PPBaseFeedback *)&v13 isEqual:v5])
    {
      unint64_t v6 = self->_build;
      unint64_t v7 = (unint64_t)v5[7];
      if (!(v6 | v7))
      {
LABEL_12:
        BOOL v10 = self->_storeType == *((unsigned __int8 *)v5 + 48);
LABEL_14:

        goto LABEL_15;
      }
      v8 = (void *)v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
      }
      else
      {
        BOOL v11 = [(id)v6 isEqualToString:v7];

        if (v11) {
          goto LABEL_12;
        }
      }
    }
    BOOL v10 = 0;
    goto LABEL_14;
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (id)json
{
  objc_super v3 = [PPStorableFeedback alloc];
  id v4 = [(PPInternalFeedback *)self serialize];
  v5 = [(PPStorableFeedback *)v3 initWithData:v4];
  unint64_t v6 = [(PPStorableFeedback *)v5 dictionaryRepresentation];

  unint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:10 error:0];

  return v7;
}

- (id)serialize
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20 = self;
  v5 = [(PPBaseFeedback *)self feedbackItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        BOOL v11 = objc_opt_new();
        v12 = [v10 itemString];
        [v11 setItemString:v12];

        objc_msgSend(v11, "setFeedbackType:", objc_msgSend(v10, "itemFeedbackType"));
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  [v3 setFeedbackItems:v4];
  objc_super v13 = [(PPBaseFeedback *)v20 timestamp];
  [v13 timeIntervalSince1970];
  objc_msgSend(v3, "setSecondsFrom1970:");

  v14 = [(PPBaseFeedback *)v20 clientIdentifier];
  [v3 setClientIdentifier:v14];

  v15 = [(PPBaseFeedback *)v20 clientBundleId];
  [v3 setClientBundleIdentifier:v15];

  v16 = [(PPBaseFeedback *)v20 mappingId];
  [v3 setMappingId:v16];

  objc_msgSend(v3, "setStoreType:", -[PPInternalFeedback storeType](v20, "storeType"));
  v17 = [(PPInternalFeedback *)v20 build];
  [v3 setBuild:v17];

  v18 = [v3 data];

  return v18;
}

- (unsigned)dataVersion
{
  return 1;
}

- (PPInternalFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7 storeType:(unsigned __int8)a8 build:(id)a9
{
  id v16 = a9;
  v20.receiver = self;
  v20.super_class = (Class)PPInternalFeedback;
  v17 = [(PPBaseFeedback *)&v20 initWithFeedbackItems:a3 timestamp:a4 clientIdentifier:a5 clientBundleId:a6 mappingId:a7];
  v18 = v17;
  if (v17)
  {
    v17->_storeType = a8;
    objc_storeStrong((id *)&v17->_build, a9);
  }

  return v18;
}

- (PPInternalFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F89FC8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [v12 osBuild];
  v19 = (void *)v18;
  objc_super v20 = @"unknown-build";
  if (v18) {
    objc_super v20 = (__CFString *)v18;
  }
  long long v21 = [(PPInternalFeedback *)self initWithFeedbackItems:v17 timestamp:v16 clientIdentifier:v15 clientBundleId:v14 mappingId:v13 storeType:0 build:v20];

  return v21;
}

+ (id)fromBaseFeedback:(id)a3 storeType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  uint64_t v6 = [PPInternalFeedback alloc];
  uint64_t v7 = [v5 feedbackItems];
  uint64_t v8 = [v5 timestamp];
  BOOL v9 = [v5 clientIdentifier];
  BOOL v10 = [v5 clientBundleId];
  BOOL v11 = [v5 mappingId];

  uint64_t v12 = [MEMORY[0x1E4F89FC8] osBuild];
  id v13 = (void *)v12;
  id v14 = @"unknown-build";
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  id v15 = [(PPInternalFeedback *)v6 initWithFeedbackItems:v7 timestamp:v8 clientIdentifier:v9 clientBundleId:v10 mappingId:v11 storeType:v4 build:v14];

  return v15;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 == 1)
  {
    id v27 = v5;
    uint64_t v6 = [[PPStorableFeedback alloc] initWithData:v5];
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(PPStorableFeedback *)v6 secondsFrom1970];
    uint64_t v26 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");
    uint64_t v8 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    BOOL v9 = [(PPStorableFeedback *)v6 feedbackItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v15 = objc_alloc(MEMORY[0x1E4F89E30]);
          id v16 = [v14 itemString];
          id v17 = objc_msgSend(v15, "initWithItemString:itemFeedbackType:", v16, objc_msgSend(v14, "feedbackType"));
          [v8 addObject:v17];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    uint64_t v18 = [PPInternalFeedback alloc];
    v19 = [(PPStorableFeedback *)v6 clientIdentifier];
    objc_super v20 = [(PPStorableFeedback *)v6 clientBundleIdentifier];
    long long v21 = [(PPStorableFeedback *)v6 mappingId];
    unsigned __int8 v22 = [(PPStorableFeedback *)v6 storeType];
    long long v23 = [(PPStorableFeedback *)v6 build];
    long long v24 = [(PPInternalFeedback *)v18 initWithFeedbackItems:v8 timestamp:v26 clientIdentifier:v19 clientBundleId:v20 mappingId:v21 storeType:v22 build:v23];

    id v5 = v27;
  }
  else
  {
    long long v24 = 0;
  }

  return v24;
}

@end