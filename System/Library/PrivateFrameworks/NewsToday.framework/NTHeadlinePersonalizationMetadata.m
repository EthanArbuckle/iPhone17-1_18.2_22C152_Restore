@interface NTHeadlinePersonalizationMetadata
+ (BOOL)supportsSecureCoding;
- (NSDictionary)scoredTopicIDs;
- (NSString)articleID;
- (NSString)publisherID;
- (NTHeadlinePersonalizationMetadata)init;
- (NTHeadlinePersonalizationMetadata)initWithArticleID:(id)a3 publisherID:(id)a4 scoredTopicIDs:(id)a5;
- (NTHeadlinePersonalizationMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTHeadlinePersonalizationMetadata

- (NTHeadlinePersonalizationMetadata)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTHeadlinePersonalizationMetadata init]";
    __int16 v9 = 2080;
    v10 = "NTHeadlinePersonalizationMetadata.m";
    __int16 v11 = 1024;
    int v12 = 19;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTHeadlinePersonalizationMetadata init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTHeadlinePersonalizationMetadata)initWithArticleID:(id)a3 publisherID:(id)a4 scoredTopicIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:]();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)NTHeadlinePersonalizationMetadata;
  __int16 v11 = [(NTHeadlinePersonalizationMetadata *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    articleID = v11->_articleID;
    v11->_articleID = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    publisherID = v11->_publisherID;
    v11->_publisherID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    scoredTopicIDs = v11->_scoredTopicIDs;
    v11->_scoredTopicIDs = (NSDictionary *)v16;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTHeadlinePersonalizationMetadata *)self articleID];
  [v4 encodeObject:v5 forKey:@"a"];

  id v6 = [(NTHeadlinePersonalizationMetadata *)self publisherID];
  [v4 encodeObject:v6 forKey:@"b"];

  id v7 = [(NTHeadlinePersonalizationMetadata *)self scoredTopicIDs];
  [v4 encodeObject:v7 forKey:@"c"];
}

- (NTHeadlinePersonalizationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"a"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  __int16 v11 = [v4 decodeObjectOfClasses:v10 forKey:@"c"];

  uint64_t v12 = [(NTHeadlinePersonalizationMetadata *)self initWithArticleID:v5 publisherID:v6 scoredTopicIDs:v11];
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)articleID
{
  return self->_articleID;
}

- (NSString)publisherID
{
  return self->_publisherID;
}

- (NSDictionary)scoredTopicIDs
{
  return self->_scoredTopicIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredTopicIDs, 0);
  objc_storeStrong((id *)&self->_publisherID, 0);

  objc_storeStrong((id *)&self->_articleID, 0);
}

- (void)initWithArticleID:publisherID:scoredTopicIDs:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"scoredTopicIDs", v6, 2u);
}

- (void)initWithArticleID:publisherID:scoredTopicIDs:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"publisherID", v6, 2u);
}

- (void)initWithArticleID:publisherID:scoredTopicIDs:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleID", v6, 2u);
}

@end