@interface MOSuggestion
+ (BOOL)supportsSecureCoding;
- (MOEventBundle)baseBundle;
- (MOSuggestion)initWithBundle:(id)a3 isPromptElligibleForTransfer:(BOOL)a4 suggestionDeletate:(id)a5;
- (MOSuggestion)initWithBundle:(id)a3 modifiedTitle:(id)a4 isPromptElligibleForTransfer:(BOOL)a5;
- (MOSuggestion)initWithBundle:(id)a3 modifiedTitle:(id)a4 isPromptElligibleForTransfer:(BOOL)a5 assetPrototypes:(id)a6;
- (MOSuggestion)initWithCoder:(id)a3;
- (NSArray)assetPrototypes;
- (NSArray)attachments;
- (NSArray)imageAssets;
- (NSArray)promptLanguages;
- (NSArray)writingPrompts;
- (NSDate)creationDate;
- (NSDate)date;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)prompt;
- (NSString)title;
- (NSUUID)suggestionIdentifier;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)packMetadata;
@end

@implementation MOSuggestion

- (MOSuggestion)initWithBundle:(id)a3 modifiedTitle:(id)a4 isPromptElligibleForTransfer:(BOOL)a5 assetPrototypes:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MOSuggestion;
  v14 = [(MOSuggestion *)&v31 init];
  v15 = v14;
  if (v14)
  {
    v14->_isPromptElligibleForTransfer = a5;
    uint64_t v16 = [v11 bundleIdentifier];
    suggestionIdentifier = v15->_suggestionIdentifier;
    v15->_suggestionIdentifier = (NSUUID *)v16;

    uint64_t v18 = [v11 startDate];
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v18;

    uint64_t v20 = [v11 endDate];
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v20;

    uint64_t v22 = [v11 creationDate];
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v22;

    objc_storeStrong((id *)&v15->_assetPrototypes, a6);
    v24 = [v11 labels];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      v26 = [v11 labels];
      uint64_t v27 = [v26 firstObject];
      title = v15->_title;
      v15->_title = (NSString *)v27;

      if (([v12 isEqualToString:v15->_title] & 1) == 0)
      {
        v29 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v12;
          _os_log_impl(&dword_1D24AE000, v29, OS_LOG_TYPE_DEFAULT, "(MOSuggestion) Setting modifiedTitle: %@", buf, 0xCu);
        }

        objc_storeStrong((id *)&v15->_title, a4);
      }
    }
    objc_storeStrong((id *)&v15->_baseBundle, a3);
    v15->_type = [v11 interfaceType];
    [(MOSuggestion *)v15 packMetadata];
  }

  return v15;
}

- (MOSuggestion)initWithBundle:(id)a3 modifiedTitle:(id)a4 isPromptElligibleForTransfer:(BOOL)a5
{
  return [(MOSuggestion *)self initWithBundle:a3 modifiedTitle:a4 isPromptElligibleForTransfer:a5 assetPrototypes:0];
}

- (MOSuggestion)initWithBundle:(id)a3 isPromptElligibleForTransfer:(BOOL)a4 suggestionDeletate:(id)a5
{
  id v9 = a3;
  objc_initWeak(&location, a5);
  v27.receiver = self;
  v27.super_class = (Class)MOSuggestion;
  v10 = [(MOSuggestion *)&v27 init];
  id v11 = v10;
  if (v10)
  {
    v10->_isPromptElligibleForTransfer = a4;
    uint64_t v12 = [v9 bundleIdentifier];
    suggestionIdentifier = v11->_suggestionIdentifier;
    v11->_suggestionIdentifier = (NSUUID *)v12;

    uint64_t v14 = [v9 startDate];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v14;

    uint64_t v16 = [v9 endDate];
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v16;

    uint64_t v18 = [v9 creationDate];
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v18;

    uint64_t v20 = [v9 labels];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      uint64_t v22 = [v9 labels];
      uint64_t v23 = [v22 firstObject];
      title = v11->_title;
      v11->_title = (NSString *)v23;
    }
    objc_storeStrong((id *)&v11->_baseBundle, a3);
    id v25 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v11->_delegate, v25);

    v11->_type = [v9 interfaceType];
    [(MOSuggestion *)v11 packMetadata];
  }
  objc_destroyWeak(&location);

  return v11;
}

- (void)packMetadata
{
  v3 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D24AE000, v3, OS_LOG_TYPE_DEFAULT, "(MOSuggestion) Packing prompts", v7, 2u);
  }

  if (self->_isPromptElligibleForTransfer)
  {
    v4 = [(MOEventBundle *)self->_baseBundle promptLanguages];
    v5 = (NSArray *)[v4 copy];
    writingPrompts = self->_writingPrompts;
    self->_writingPrompts = v5;
  }
  else
  {
    v4 = self->_writingPrompts;
    self->_writingPrompts = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:]1();
  }

  [v4 encodeObject:self->_suggestionIdentifier forKey:@"identifier"];
  v6 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:]0();
  }

  [v4 encodeObject:self->_title forKey:@"label"];
  v7 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:].cold.9();
  }

  [v4 encodeObject:self->_startDate forKey:@"startDate"];
  v8 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:].cold.8();
  }

  [v4 encodeObject:self->_endDate forKey:@"endDate"];
  id v9 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:].cold.7();
  }

  [v4 encodeObject:self->_creationDate forKey:@"creationDate"];
  v10 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:].cold.6();
  }

  [v4 encodeObject:self->_baseBundle forKey:@"bundle"];
  id v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:].cold.5();
  }

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v4 encodeObject:v12 forKey:@"type"];

  id v13 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:].cold.4();
  }

  [v4 encodeObject:self->_writingPrompts forKey:@"promptLanguages"];
  uint64_t v14 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:]();
  }

  v15 = [NSNumber numberWithBool:self->_isPromptElligibleForTransfer];
  [v4 encodeObject:v15 forKey:@"promptElligible"];

  uint64_t v16 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:]();
  }

  [v4 encodeObject:self->_assetPrototypes forKey:@"assetPrototypes"];
  v17 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[MOSuggestion encodeWithCoder:]();
  }
}

- (MOSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MOSuggestion;
  v5 = [(MOSuggestion *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    suggestionIdentifier = v5->_suggestionIdentifier;
    v5->_suggestionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    title = v5->_title;
    v5->_title = (NSString *)v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"bundle"];
    baseBundle = v5->_baseBundle;
    v5->_baseBundle = (MOEventBundle *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"promptLanguages"];
    writingPrompts = v5->_writingPrompts;
    v5->_writingPrompts = (NSArray *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promptElligible"];
    v5->_isPromptElligibleForTransfer = v24 != 0;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = (int)[v25 intValue];

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"assetPrototypes"];
    assetPrototypes = v5->_assetPrototypes;
    v5->_assetPrototypes = (NSArray *)v29;

    objc_storeStrong((id *)&v5->_prompt, v5->_title);
    objc_storeStrong((id *)&v5->_promptLanguages, v5->_writingPrompts);
    objc_storeStrong((id *)&v5->_date, v5->_startDate);
    attachments = v5->_attachments;
    v5->_attachments = 0;

    imageAssets = v5->_imageAssets;
    v5->_imageAssets = 0;
  }
  return v5;
}

- (NSUUID)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)writingPrompts
{
  return self->_writingPrompts;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSArray)assetPrototypes
{
  return self->_assetPrototypes;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSArray)promptLanguages
{
  return self->_promptLanguages;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSArray)imageAssets
{
  return self->_imageAssets;
}

- (MOEventBundle)baseBundle
{
  return self->_baseBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseBundle, 0);
  objc_storeStrong((id *)&self->_imageAssets, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_promptLanguages, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_assetPrototypes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_writingPrompts, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding COMPLETE", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _assetTypes", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _isPromptElligibleForTransfer", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _writingPrompts", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _type", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _bundle", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.7()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _creationDate", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.8()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _endDate", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.9()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _startDate", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.10()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _title", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.11()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_9(&dword_1D24AE000, v0, v1, "encoding _suggestionIdentifier", v2, v3, v4, v5, v6);
}

@end