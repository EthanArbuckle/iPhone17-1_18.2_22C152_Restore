@interface WBSAutoFillInternalFeedbackDiagnosticsData
- (NSArray)formMetadata;
- (NSSet)sensitiveValuesForRedaction;
- (NSString)creationDateString;
- (NSURL)url;
- (WBSAutoFillInternalFeedbackDiagnosticsData)init;
- (id)writeTemporaryFileWithFormMetadata;
- (void)setFormMetadata:(id)a3;
- (void)setSensitiveValuesForRedaction:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTemporaryFileWithFormMetadata;
@end

@implementation WBSAutoFillInternalFeedbackDiagnosticsData

- (WBSAutoFillInternalFeedbackDiagnosticsData)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSAutoFillInternalFeedbackDiagnosticsData;
  v2 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v4 = objc_msgSend(v3, "safari_filenameFormattedString");
    creationDateString = v2->_creationDateString;
    v2->_creationDateString = (NSString *)v4;

    v6 = v2;
  }

  return v2;
}

- (id)writeTemporaryFileWithFormMetadata
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)self formMetadata];

  if (v3)
  {
    uint64_t v4 = (void *)[(NSSet *)self->_sensitiveValuesForRedaction mutableCopy];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA80] set];
    }
    objc_super v8 = v6;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v51 = 0u;
    long long v50 = 0u;
    v40 = self;
    obuint64_t j = self->_formMetadata;
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v14 = [v13 controls];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v47 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                v20 = [v19 value];

                if (v20)
                {
                  v21 = [v19 value];
                  [v8 addObject:v21];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v56 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v10);
    }

    v22 = [(WBSAutoFillInternalFeedbackDiagnosticsData *)v40 formMetadata];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __80__WBSAutoFillInternalFeedbackDiagnosticsData_writeTemporaryFileWithFormMetadata__block_invoke;
    v44[3] = &unk_1E5C8C4F8;
    id v23 = v8;
    id v45 = v23;
    v24 = objc_msgSend(v22, "safari_mapObjectsUsingBlock:", v44);

    id v43 = 0;
    v25 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v24 options:1 error:&v43];
    id v26 = v43;
    if (v25)
    {
      v27 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v28 = NSTemporaryDirectory();
      v29 = NSString;
      v30 = [(NSURL *)v40->_url host];
      v31 = [v29 stringWithFormat:@"form-metadata-%@-%@.json", v30, v40->_creationDateString];
      v32 = [(id)v28 stringByAppendingPathComponent:v31];
      v33 = [v27 fileURLWithPath:v32 isDirectory:0];

      id v42 = v26;
      LOBYTE(v28) = [v25 writeToURL:v33 options:0 error:&v42];
      id v34 = v42;

      if (v28)
      {
        id v7 = v33;
      }
      else
      {
        v36 = WBS_LOG_CHANNEL_PREFIXAutoFill();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v36;
          v38 = objc_msgSend(v34, "safari_privacyPreservingDescription");
          *(_DWORD *)buf = 138543362;
          v55 = v38;
          _os_log_impl(&dword_1A6B5F000, v37, OS_LOG_TYPE_DEFAULT, "Encountered error writing temporary file with form metadata: %{public}@", buf, 0xCu);
        }
        id v7 = 0;
      }
    }
    else
    {
      v35 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        [(WBSAutoFillInternalFeedbackDiagnosticsData *)v35 writeTemporaryFileWithFormMetadata];
      }
      id v7 = 0;
      id v34 = v26;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

id __80__WBSAutoFillInternalFeedbackDiagnosticsData_writeTemporaryFileWithFormMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 dictionaryRepresentationRedactingSensitiveValues:1 withKnownSensitiveValues:v2];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v3 type];
  id v7 = WBSStringFromAutoFillFormType(v6);
  [v5 setObject:v7 forKeyedSubscript:@"AutoFillFormType"];

  return v5;
}

- (NSString)creationDateString
{
  return self->_creationDateString;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSArray)formMetadata
{
  return self->_formMetadata;
}

- (void)setFormMetadata:(id)a3
{
}

- (NSSet)sensitiveValuesForRedaction
{
  return self->_sensitiveValuesForRedaction;
}

- (void)setSensitiveValuesForRedaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveValuesForRedaction, 0);
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_creationDateString, 0);
}

- (void)writeTemporaryFileWithFormMetadata
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Encountered error generating JSON data with form metadata: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end