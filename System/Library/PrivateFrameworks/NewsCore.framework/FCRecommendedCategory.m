@interface FCRecommendedCategory
- (BOOL)isEqual:(id)a3;
- (FCRecommendedCategory)initWithIdentifier:(id)a3 name:(id)a4 curatedTagIDs:(id)a5 recommendedTopicTagIDs:(id)a6 recommendedChannelTagIDs:(id)a7 subcategories:(id)a8;
- (NSArray)channelTagIDs;
- (NSArray)curatedTagIDs;
- (NSArray)subcategories;
- (NSArray)topicTagIDs;
- (NSString)identifier;
- (NSString)name;
- (unint64_t)hash;
@end

@implementation FCRecommendedCategory

- (FCRecommendedCategory)initWithIdentifier:(id)a3 name:(id)a4 curatedTagIDs:(id)a5 recommendedTopicTagIDs:(id)a6 recommendedChannelTagIDs:(id)a7 subcategories:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)FCRecommendedCategory;
  v20 = [(FCRecommendedCategory *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    name = v20->_name;
    v20->_name = (NSString *)v23;

    if ([v16 count]) {
      v25 = v16;
    }
    else {
      v25 = v18;
    }
    uint64_t v26 = [v25 copy];
    curatedTagIDs = v20->_curatedTagIDs;
    v20->_curatedTagIDs = (NSArray *)v26;

    uint64_t v28 = [v17 copy];
    topicTagIDs = v20->_topicTagIDs;
    v20->_topicTagIDs = (NSArray *)v28;

    uint64_t v30 = [v18 copy];
    channelTagIDs = v20->_channelTagIDs;
    v20->_channelTagIDs = (NSArray *)v30;

    uint64_t v32 = [v19 copy];
    subcategories = v20->_subcategories;
    v20->_subcategories = (NSArray *)v32;
  }
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    char v14 = 0;
    goto LABEL_31;
  }
  v12 = [(FCRecommendedCategory *)self identifier];
  if (v12 || ([v11 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(FCRecommendedCategory *)self identifier];
    v5 = [v11 identifier];
    if (![v4 isEqualToString:v5])
    {
      char v14 = 0;
LABEL_27:

      goto LABEL_28;
    }
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  id v15 = [(FCRecommendedCategory *)self name];
  if (v15 || ([v11 name], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = [(FCRecommendedCategory *)self name];
    v7 = [v11 name];
    if (![v6 isEqualToString:v7])
    {
      char v14 = 0;
      goto LABEL_25;
    }
    int v26 = v13;
    v27 = v3;
    int v28 = 1;
  }
  else
  {
    int v26 = v13;
    v27 = v3;
    v25 = 0;
    int v28 = 0;
  }
  id v16 = [(FCRecommendedCategory *)self topicTagIDs];
  id v17 = [v11 topicTagIDs];
  if (![v16 isEqualToArray:v17])
  {

    char v14 = 0;
    if (!v28) {
      goto LABEL_34;
    }
    goto LABEL_24;
  }
  uint64_t v23 = v6;
  id v18 = [(FCRecommendedCategory *)self channelTagIDs];
  [v11 channelTagIDs];
  v22 = v24 = v18;
  if (objc_msgSend(v18, "isEqualToArray:"))
  {
    id v19 = [(FCRecommendedCategory *)self subcategories];
    uint64_t v21 = [v11 subcategories];
    char v14 = [v19 isEqualToArray:v21];
  }
  else
  {
    char v14 = 0;
  }
  v6 = v23;

  if (v28)
  {
LABEL_24:
    v3 = v27;
    int v13 = v26;
LABEL_25:

    if (!v15) {
      goto LABEL_35;
    }
    goto LABEL_26;
  }
LABEL_34:
  v3 = v27;
  int v13 = v26;
  if (!v15)
  {
LABEL_35:

    if ((v13 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_26:

  if (v13) {
    goto LABEL_27;
  }
LABEL_28:
  if (!v12) {

  }
LABEL_31:
  return v14;
}

- (unint64_t)hash
{
  v3 = [(FCRecommendedCategory *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(FCRecommendedCategory *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(FCRecommendedCategory *)self topicTagIDs];
  uint64_t v8 = [v7 hash];
  id v9 = [(FCRecommendedCategory *)self channelTagIDs];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(FCRecommendedCategory *)self subcategories];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)topicTagIDs
{
  return self->_topicTagIDs;
}

- (NSArray)channelTagIDs
{
  return self->_channelTagIDs;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (NSArray)curatedTagIDs
{
  return self->_curatedTagIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedTagIDs, 0);
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_channelTagIDs, 0);
  objc_storeStrong((id *)&self->_topicTagIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end