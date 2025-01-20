@interface FCArticleList
- (FCArticleList)initWithRecord:(id)a3 interestToken:(id)a4;
- (FCArticleListEditorialMetadata)editorialMetadata;
- (FCInterestToken)interestToken;
- (NSArray)articleIDs;
- (NSDate)lastModifiedDate;
- (NSString)identifier;
- (NTPBArticleListRecord)record;
- (unint64_t)type;
@end

@implementation FCArticleList

- (FCArticleList)initWithRecord:(id)a3 interestToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FCArticleList;
  v9 = [(FCArticleList *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_interestToken, a4);
    v11 = [v7 base];
    uint64_t v12 = [v11 identifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    uint64_t v14 = [v7 articleIDs];
    articleIDs = v10->_articleIDs;
    v10->_articleIDs = (NSArray *)v14;

    int v16 = [v7 type];
    uint64_t v17 = v16 == 1;
    if (v16 == 2) {
      uint64_t v17 = 2;
    }
    v10->_type = v17;
    v18 = (void *)MEMORY[0x1E4F1C9C8];
    v19 = [v7 base];
    v20 = [v19 modificationDate];
    uint64_t v21 = [v18 dateWithPBDate:v20];
    lastModifiedDate = v10->_lastModifiedDate;
    v10->_lastModifiedDate = (NSDate *)v21;

    if ([v7 type] - 1 <= 1)
    {
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = [v7 metadata];
      v25 = objc_msgSend(v23, "fc_dictionaryFromJSON:", v24);

      v26 = [[FCArticleListEditorialMetadata alloc] initWithDictionary:v25];
      editorialMetadata = v10->_editorialMetadata;
      v10->_editorialMetadata = v26;
    }
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)articleIDs
{
  return self->_articleIDs;
}

- (unint64_t)type
{
  return self->_type;
}

- (FCArticleListEditorialMetadata)editorialMetadata
{
  return self->_editorialMetadata;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NTPBArticleListRecord)record
{
  return self->_record;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_editorialMetadata, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end