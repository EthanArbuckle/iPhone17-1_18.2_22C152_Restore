@interface SPCachedResult
- (NSData)encodedNormalizedTopic;
- (NSDate)engagementTime;
- (NSString)searchString;
- (NSString)title;
- (SPCachedResult)initWithContactName:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6;
- (SPCachedResult)initWithEngagedResult:(id)a3;
- (SPCachedResult)initWithPersonName:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6;
- (SPCachedResult)initWithResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7;
- (SPCachedResult)initWithResult:(id)a3 topic:(id)a4 title:(id)a5 searchString:(id)a6;
- (SPCachedResult)initWithTitle:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6;
- (double)freshnessScore;
- (double)score;
- (id)recentTopic;
- (id)searchResult;
- (int)type;
- (void)recentTopic;
- (void)setEncodedNormalizedTopic:(id)a3;
@end

@implementation SPCachedResult

- (SPCachedResult)initWithResult:(id)a3 topic:(id)a4 title:(id)a5 searchString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)SPCachedResult;
  v14 = [(SPCachedResult *)&v31 init];
  if (v14)
  {
    uint64_t v15 = truncatedTitle(v12);
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = truncatedSearchString(v13);
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v17;

    v14->_type = [v10 type];
    [v10 rankingScore];
    v14->_score = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    engagementTime = v14->_engagementTime;
    v14->_engagementTime = (NSDate *)v20;

    id v22 = v11;
    if (v22)
    {
LABEL_8:
      id v30 = 0;
      uint64_t v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v30];
      id v26 = v30;
      encodedNormalizedTopic = v14->_encodedNormalizedTopic;
      v14->_encodedNormalizedTopic = (NSData *)v25;

      if (!v26)
      {
LABEL_13:

        goto LABEL_14;
      }
      p_super = logForSPLogCategoryCaching();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[SPCachedResult initWithResult:topic:title:searchString:](v10);
      }
LABEL_12:

      goto LABEL_13;
    }
    int v23 = [v10 type];
    if ((v23 - 28) >= 2)
    {
      if (v23 != 8) {
        goto LABEL_11;
      }
      uint64_t v24 = +[SPLocalTopic localTopicWithDictionaryResult:v10];
    }
    else
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F9A300]) initWithType:8 query:v14->_title identifier:&stru_1F0CB2300];
    }
    id v22 = (id)v24;
    if (v24) {
      goto LABEL_8;
    }
LABEL_11:
    id v22 = 0;
    id v26 = 0;
    p_super = &v14->_encodedNormalizedTopic->super;
    v14->_encodedNormalizedTopic = 0;
    goto LABEL_12;
  }
LABEL_14:

  return v14;
}

- (SPCachedResult)initWithResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v35.receiver = self;
  v35.super_class = (Class)SPCachedResult;
  uint64_t v17 = [(SPCachedResult *)&v35 init];
  if (v17)
  {
    uint64_t v18 = truncatedTitle(v14);
    title = v17->_title;
    v17->_title = (NSString *)v18;

    uint64_t v20 = truncatedSearchString(v16);
    searchString = v17->_searchString;
    v17->_searchString = (NSString *)v20;

    v17->_type = [v12 type];
    [v12 rankingScore];
    v17->_score = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    engagementTime = v17->_engagementTime;
    v17->_engagementTime = (NSDate *)v23;

    id v33 = v13;
    uint64_t v25 = topicIdentifierWithIdentifierAndDetail(v13, v14, v15, 0, v17->_type, 1u);
    id v26 = searchResultWithTopicIdentifier(v25, v17->_score);
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F9A1C0]) initWithResult:v26 identifier:v25];
    id v34 = 0;
    uint64_t v28 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v34];
    id v29 = v34;
    encodedNormalizedTopic = v17->_encodedNormalizedTopic;
    v17->_encodedNormalizedTopic = (NSData *)v28;

    if (v29)
    {
      objc_super v31 = logForSPLogCategoryCaching();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[SPCachedResult initWithResult:identifier:bundleIdentifier:protectionClass:searchString:](v12);
      }
    }
    id v13 = v33;
  }

  return v17;
}

- (SPCachedResult)initWithPersonName:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SPCachedResult;
  id v14 = [(SPCachedResult *)&v37 init];
  if (v14)
  {
    uint64_t v15 = truncatedTitle(v10);
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = truncatedSearchString(v13);
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v17;

    v14->_type = 38;
    [v12 doubleValue];
    v14->_score = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    engagementTime = v14->_engagementTime;
    v14->_engagementTime = (NSDate *)v20;

    double v22 = topicIdentifierWithPersonQueryIdentifierAndDetail(v11, 0, v14->_type, 1u);
    uint64_t v23 = +[SPLocalTopic localTopicWithTopicIdentifier:v22];
    id v36 = 0;
    uint64_t v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v23 requiringSecureCoding:1 error:&v36];
    id v25 = v36;
    encodedNormalizedTopic = v14->_encodedNormalizedTopic;
    v14->_encodedNormalizedTopic = (NSData *)v24;

    if (v25)
    {
      v27 = logForSPLogCategoryCaching();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SPCachedResult initWithPersonName:personQueryIdentifier:score:searchString:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }

  return v14;
}

- (SPCachedResult)initWithContactName:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SPCachedResult;
  id v14 = [(SPCachedResult *)&v38 init];
  if (v14)
  {
    uint64_t v15 = truncatedTitle(v10);
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = truncatedSearchString(v13);
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v17;

    v14->_type = 32;
    [v12 doubleValue];
    v14->_score = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    engagementTime = v14->_engagementTime;
    v14->_engagementTime = (NSDate *)v20;

    if (![v11 length] || v10 && (objc_msgSend(v11, "isEqualToString:", v10) & 1) != 0)
    {
      v14->_type = 38;
      uint64_t v22 = topicIdentifierWithContactInfoAndDetail(v10, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0, 0x26u, 1u);
    }
    else
    {
      uint64_t v22 = topicIdentifierWithContactIdentifierAndDetail(v10, v11, 0, v14->_type, 1u);
    }
    uint64_t v23 = (void *)v22;
    uint64_t v24 = +[SPLocalTopic localTopicWithTopicIdentifier:v22];
    id v37 = 0;
    uint64_t v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v37];
    id v26 = v37;
    encodedNormalizedTopic = v14->_encodedNormalizedTopic;
    v14->_encodedNormalizedTopic = (NSData *)v25;

    if (v26)
    {
      uint64_t v28 = logForSPLogCategoryCaching();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[SPCachedResult initWithContactName:contactIdentifier:score:searchString:](v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }
  }

  return v14;
}

- (SPCachedResult)initWithTitle:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SPCachedResult;
  id v13 = [(SPCachedResult *)&v37 init];
  if (v13)
  {
    uint64_t v14 = truncatedTitle(v10);
    title = v13->_title;
    v13->_title = (NSString *)v14;

    uint64_t v16 = truncatedSearchString(v12);
    searchString = v13->_searchString;
    v13->_searchString = (NSString *)v16;

    v13->_uint64_t type = a4;
    [v11 doubleValue];
    v13->_score = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
    engagementTime = v13->_engagementTime;
    v13->_engagementTime = (NSDate *)v19;

    if (a4 <= 0x1F && ((1 << a4) & 0xF0018000) != 0)
    {
      uint64_t type = v13->_type;
      uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13->_score];
      uint64_t v23 = +[SPLocalTopic localTopicWithTitle:v10 type:type score:v22 isCached:1];
    }
    else
    {
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F9A300]) initWithType:7 query:v13->_title identifier:&stru_1F0CB2300];
    }
    id v36 = 0;
    uint64_t v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v23 requiringSecureCoding:1 error:&v36];
    id v25 = v36;
    encodedNormalizedTopic = v13->_encodedNormalizedTopic;
    v13->_encodedNormalizedTopic = (NSData *)v24;

    if (v25)
    {
      v27 = logForSPLogCategoryCaching();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SPCachedResult initWithTitle:type:score:searchString:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }

  return v13;
}

- (SPCachedResult)initWithEngagedResult:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SPCachedResult;
  v5 = [(SPCachedResult *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_uint64_t type = [v4 type];
    [v4 score];
    v5->_score = v8;
    [v4 freshnessScore];
    v5->_freshnessScore = v9;
    uint64_t v10 = [v4 engagementTime];
    engagementTime = v5->_engagementTime;
    v5->_engagementTime = (NSDate *)v10;

    uint64_t v12 = [v4 encodedNormalizedTopic];
    encodedNormalizedTopic = v5->_encodedNormalizedTopic;
    v5->_encodedNormalizedTopic = (NSData *)v12;
  }
  return v5;
}

- (id)recentTopic
{
  if (self->_encodedNormalizedTopic)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v4 = objc_opt_class();
    encodedNormalizedTopic = self->_encodedNormalizedTopic;
    id v18 = 0;
    uint64_t v6 = [v3 unarchivedObjectOfClass:v4 fromData:encodedNormalizedTopic error:&v18];
    id v7 = v18;
    BOOL v8 = v6 == 0;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      uint64_t v10 = 0;
      goto LABEL_13;
    }
    uint64_t v10 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v10 = 0;
    BOOL v8 = 1;
  }
  id v11 = logForSPLogCategoryCaching();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    [(SPCachedResult *)(uint64_t)v10 recentTopic];
  }

  if (v8)
  {
    uint64_t v12 = 0;
    goto LABEL_14;
  }
LABEL_13:
  id v13 = [SPRecentTopic alloc];
  uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
  [(SPCachedResult *)self freshnessScore];
  objc_super v15 = objc_msgSend(v14, "numberWithDouble:");
  uint64_t v16 = [(SPCachedResult *)self engagementTime];
  uint64_t v12 = [(SPRecentTopic *)v13 initWithTopic:v6 score:v15 engagementDate:v16];

LABEL_14:
  return v12;
}

- (id)searchResult
{
  v2 = [(SPCachedResult *)self recentTopic];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [v2 topic];
    uint64_t v4 = [v3 result];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (int)type
{
  return self->_type;
}

- (NSDate)engagementTime
{
  return self->_engagementTime;
}

- (double)score
{
  return self->_score;
}

- (double)freshnessScore
{
  return self->_freshnessScore;
}

- (NSData)encodedNormalizedTopic
{
  return self->_encodedNormalizedTopic;
}

- (void)setEncodedNormalizedTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedNormalizedTopic, 0);
  objc_storeStrong((id *)&self->_engagementTime, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithResult:(void *)a1 topic:title:searchString:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_2(&dword_1B3DE9000, v1, v2, "spotlight cache: could not encode cached topic: %d", v3, v4, v5, v6, 0);
}

- (void)initWithResult:(void *)a1 identifier:bundleIdentifier:protectionClass:searchString:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_2(&dword_1B3DE9000, v1, v2, "spotlight cache: could not encode local cached topic: %d", v3, v4, v5, v6, 0);
}

- (void)initWithPersonName:(uint64_t)a3 personQueryIdentifier:(uint64_t)a4 score:(uint64_t)a5 searchString:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContactName:(uint64_t)a3 contactIdentifier:(uint64_t)a4 score:(uint64_t)a5 searchString:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTitle:(uint64_t)a3 type:(uint64_t)a4 score:(uint64_t)a5 searchString:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)recentTopic
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3DE9000, a2, OS_LOG_TYPE_ERROR, "spotlight cache: could not encode generic topic. error: %@", (uint8_t *)&v2, 0xCu);
}

@end