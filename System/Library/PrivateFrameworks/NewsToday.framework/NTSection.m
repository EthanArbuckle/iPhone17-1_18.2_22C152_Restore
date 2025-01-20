@interface NTSection
+ (BOOL)supportsSecureCoding;
+ (id)_itemClassesByType;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)items;
- (NSString)actionTitle;
- (NSString)backgroundColorDark;
- (NSString)backgroundColorLight;
- (NSString)backingTagID;
- (NSString)identifier;
- (NSString)name;
- (NSString)nameColorDark;
- (NSString)nameColorLight;
- (NSString)personalizationFeatureID;
- (NSString)referralBarName;
- (NSString)subidentifier;
- (NSURL)actionURL;
- (NSURL)nameActionURL;
- (NTPBSectionDisplayDescriptor)displayDescriptor;
- (NTSection)init;
- (NTSection)initWithCoder:(id)a3;
- (NTSection)initWithIdentifier:(id)a3 subidentifier:(id)a4 actionTitle:(id)a5 actionURL:(id)a6 personalizationFeatureID:(id)a7 items:(id)a8 rankingFeedback:(id)a9 displayDescriptor:(id)a10 referralBarName:(id)a11 backingTagID:(id)a12;
- (SFRankingFeedback)rankingFeedback;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setBackingTagID:(id)a3;
- (void)setDisplayDescriptor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItems:(id)a3;
- (void)setRankingFeedback:(id)a3;
- (void)setReferralBarName:(id)a3;
- (void)setSubidentifier:(id)a3;
@end

@implementation NTSection

- (NTSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subidentifier"];
  v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionTitle"];
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
  v35 = (void *)v5;
  if (v5)
  {
    v34 = [NSURL URLWithString:v5];
  }
  else
  {
    v34 = 0;
  }
  v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
  v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rankingFeedback"];
  v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayDescriptor"];
  v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referralBarName"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v27 = [v4 decodeObjectOfClasses:v8 forKey:@"feedItemIDs"];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"allItemTypesByID"];

  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v29 = [v4 decodeObjectOfClasses:v17 forKey:@"allItemDataByID"];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __27__NTSection_initWithCoder___block_invoke;
  v39[3] = &unk_26475C5C0;
  id v40 = v13;
  v18 = self;
  v41 = v18;
  id v28 = v13;
  v19 = objc_msgSend(v29, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:", v39);
  v20 = (void *)MEMORY[0x263EFF9D8];
  v21 = [v27 array];
  v22 = objc_msgSend(v19, "nf_objectsForKeysWithoutMarker:", v21);
  v23 = [v20 orderedSetWithArray:v22];

  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"btid"];
  v26 = [(NTSection *)v18 initWithIdentifier:v38 subidentifier:v37 actionTitle:v36 actionURL:v34 personalizationFeatureID:v33 items:v23 rankingFeedback:v32 displayDescriptor:v31 referralBarName:v30 backingTagID:v24];

  return v26;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v3 = [(NTSection *)self identifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NTSection *)self subidentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NTSection *)self items];
  uint64_t v8 = [v7 hash];
  v9 = [(NTSection *)self rankingFeedback];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(NTSection *)self displayDescriptor];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = FCDynamicCast();

  if (v5)
  {
    uint64_t v6 = [(NTSection *)self identifier];
    uint64_t v7 = [v5 identifier];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = (void *)MEMORY[0x263F8C6D0];
      v9 = [(NTSection *)self subidentifier];
      uint64_t v10 = [v5 subidentifier];
      if (objc_msgSend(v8, "nf_object:isEqualToObject:", v9, v10))
      {
        uint64_t v11 = [(NTSection *)self items];
        unint64_t v12 = [v5 items];
        if ([v11 isEqual:v12])
        {
          v13 = (void *)MEMORY[0x263F8C6D0];
          uint64_t v14 = [(NTSection *)self rankingFeedback];
          uint64_t v15 = [v5 rankingFeedback];
          v22 = (void *)v14;
          uint64_t v16 = v14;
          v17 = (void *)v15;
          if (objc_msgSend(v13, "nf_object:isEqualToObject:", v16, v15))
          {
            v21 = [(NTSection *)self displayDescriptor];
            v18 = [v5 displayDescriptor];
            char v19 = [v21 isEqual:v18];
          }
          else
          {
            char v19 = 0;
          }
        }
        else
        {
          char v19 = 0;
        }
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (NTPBSectionDisplayDescriptor)displayDescriptor
{
  return self->_displayDescriptor;
}

- (NSString)name
{
  v2 = [(NTSection *)self displayDescriptor];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)nameColorDark
{
  v2 = [(NTSection *)self displayDescriptor];
  v3 = [v2 nameColorDark];

  return (NSString *)v3;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (NSOrderedSet)items
{
  return self->_items;
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTSection *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(NTSection *)self subidentifier];

  if (v6)
  {
    uint64_t v7 = [(NTSection *)self subidentifier];
    [v4 encodeObject:v7 forKey:@"subidentifier"];
  }
  uint64_t v8 = [(NTSection *)self personalizationFeatureID];
  [v4 encodeObject:v8 forKey:@"p"];

  v9 = [(NTSection *)self displayDescriptor];
  [v4 encodeObject:v9 forKey:@"displayDescriptor"];

  uint64_t v10 = [(NTSection *)self actionTitle];

  if (v10)
  {
    uint64_t v11 = [(NTSection *)self actionTitle];
    [v4 encodeObject:v11 forKey:@"actionTitle"];
  }
  unint64_t v12 = [(NTSection *)self actionURL];

  if (v12)
  {
    v13 = [(NTSection *)self actionURL];
    uint64_t v14 = [v13 absoluteString];
    [v4 encodeObject:v14 forKey:@"actionURL"];
  }
  uint64_t v15 = [(NTSection *)self rankingFeedback];
  if (v15) {
    [v4 encodeObject:v15 forKey:@"rankingFeedback"];
  }
  uint64_t v16 = [(NTSection *)self referralBarName];
  if (v16) {
    [v4 encodeObject:v16 forKey:@"referralBarName"];
  }
  v17 = [(NTSection *)self backingTagID];
  if (v17) {
    [v4 encodeObject:v17 forKey:@"btid"];
  }
  v18 = objc_opt_new();
  char v19 = objc_opt_new();
  v20 = objc_opt_new();
  v21 = [(NTSection *)self items];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __29__NTSection_encodeWithCoder___block_invoke;
  v36[3] = &unk_26475C570;
  id v37 = v18;
  id v38 = v19;
  id v22 = v19;
  id v23 = v18;
  [v21 enumerateObjectsUsingBlock:v36];

  v24 = [(NTSection *)self items];
  uint64_t v25 = [v24 count];

  v26 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v25];
  v27 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v25];
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __29__NTSection_encodeWithCoder___block_invoke_2;
  v33 = &unk_26475C598;
  id v34 = v27;
  id v35 = v26;
  id v28 = v26;
  id v29 = v27;
  [v23 enumerateKeysAndObjectsUsingBlock:&v30];
  objc_msgSend(v4, "encodeObject:forKey:", v22, @"feedItemIDs", v30, v31, v32, v33);
  [v4 encodeObject:v20 forKey:@"videoPlaylistHeadlineIDs"];
  [v4 encodeObject:v28 forKey:@"allItemTypesByID"];
  [v4 encodeObject:v29 forKey:@"allItemDataByID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDescriptor, 0);
  objc_storeStrong((id *)&self->_backingTagID, 0);
  objc_storeStrong((id *)&self->_referralBarName, 0);
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_personalizationFeatureID, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_subidentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)nameColorLight
{
  v2 = [(NTSection *)self displayDescriptor];
  v3 = [v2 nameColorLight];

  return (NSString *)v3;
}

- (NSString)backingTagID
{
  return self->_backingTagID;
}

- (NTSection)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[NTSection init]";
    __int16 v9 = 2080;
    uint64_t v10 = "NTTodayResults.m";
    __int16 v11 = 1024;
    int v12 = 181;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSection init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTSection)initWithIdentifier:(id)a3 subidentifier:(id)a4 actionTitle:(id)a5 actionURL:(id)a6 personalizationFeatureID:(id)a7 items:(id)a8 rankingFeedback:(id)a9 displayDescriptor:(id)a10 referralBarName:(id)a11 backingTagID:(id)a12
{
  id v17 = a3;
  id v51 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v52 = v17;
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:]();
  }
  v26 = v25;
  if (!v21 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:]();
  }
  v27 = v22;
  if (!v23 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSection initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:]();
  }
  v53.receiver = self;
  v53.super_class = (Class)NTSection;
  id v28 = [(NTSection *)&v53 init];
  if (v28)
  {
    uint64_t v29 = [v52 copy];
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v29;

    uint64_t v31 = [v51 copy];
    subidentifier = v28->_subidentifier;
    v28->_subidentifier = (NSString *)v31;

    uint64_t v33 = [v18 copy];
    actionTitle = v28->_actionTitle;
    v28->_actionTitle = (NSString *)v33;

    uint64_t v35 = [v19 copy];
    actionURL = v28->_actionURL;
    v28->_actionURL = (NSURL *)v35;

    uint64_t v37 = [v20 copy];
    personalizationFeatureID = v28->_personalizationFeatureID;
    v28->_personalizationFeatureID = (NSString *)v37;

    uint64_t v39 = [v21 copy];
    items = v28->_items;
    v28->_items = (NSOrderedSet *)v39;

    uint64_t v41 = [v27 copy];
    rankingFeedback = v28->_rankingFeedback;
    v28->_rankingFeedback = (SFRankingFeedback *)v41;

    uint64_t v43 = [v23 copy];
    displayDescriptor = v28->_displayDescriptor;
    v28->_displayDescriptor = (NTPBSectionDisplayDescriptor *)v43;

    uint64_t v45 = [v24 copy];
    referralBarName = v28->_referralBarName;
    v28->_referralBarName = (NSString *)v45;

    uint64_t v47 = [v26 copy];
    backingTagID = v28->_backingTagID;
    v28->_backingTagID = (NSString *)v47;
  }
  return v28;
}

+ (id)_itemClassesByType
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = &unk_26D922540;
  v5[0] = objc_opt_class();
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x263F59420] descriptionWithObject:self];
  uint64_t v4 = [(NTSection *)self identifier];
  [v3 addField:@"identifier" object:v4];

  uint64_t v5 = [(NTSection *)self name];
  [v3 addField:@"name" object:v5];

  id v6 = [(NTSection *)self actionTitle];
  [v3 addField:@"actionTitle" object:v6];

  uint64_t v7 = [(NTSection *)self actionURL];
  uint64_t v8 = [v7 absoluteString];
  [v3 addField:@"actionURL" object:v8];

  __int16 v9 = [(NTSection *)self items];
  [v3 addField:@"items" object:v9];

  uint64_t v10 = [v3 descriptionString];

  return v10;
}

void __29__NTSection_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];

  [*(id *)(a1 + 40) addObject:v4];
}

void __29__NTSection_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v8];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "itemType"));
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
  }
}

id __27__NTSection_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 objectForKeyedSubscript:a2];
  uint64_t v7 = [(id)objc_opt_class() _itemClassesByType];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  __int16 v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:v8 fromData:v5 error:0];

  return v9;
}

- (NSString)actionTitle
{
  v2 = [(NTSection *)self displayDescriptor];
  id v3 = [v2 actionTitle];

  return (NSString *)v3;
}

- (NSURL)actionURL
{
  v2 = [(NTSection *)self displayDescriptor];
  id v3 = [v2 actionURL];

  return (NSURL *)v3;
}

- (NSURL)nameActionURL
{
  v2 = [(NTSection *)self displayDescriptor];
  id v3 = [v2 nameActionURL];

  return (NSURL *)v3;
}

- (NSString)backgroundColorLight
{
  v2 = [(NTSection *)self displayDescriptor];
  id v3 = [v2 backgroundColorLight];

  return (NSString *)v3;
}

- (NSString)backgroundColorDark
{
  v2 = [(NTSection *)self displayDescriptor];
  id v3 = [v2 backgroundColorDark];

  return (NSString *)v3;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (void)setSubidentifier:(id)a3
{
}

- (void)setActionTitle:(id)a3
{
}

- (void)setActionURL:(id)a3
{
}

- (void)setItems:(id)a3
{
}

- (void)setRankingFeedback:(id)a3
{
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (void)setReferralBarName:(id)a3
{
}

- (void)setBackingTagID:(id)a3
{
}

- (void)setDisplayDescriptor:(id)a3
{
}

- (void)initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"displayDescriptor", v6, 2u);
}

- (void)initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

- (void)initWithIdentifier:subidentifier:actionTitle:actionURL:personalizationFeatureID:items:rankingFeedback:displayDescriptor:referralBarName:backingTagID:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);
}

@end