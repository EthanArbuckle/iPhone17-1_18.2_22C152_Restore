@interface REMReminderHashtagContextChangeItem
- (NSMutableSet)mutableHashtags;
- (NSSet)hashtags;
- (REMReminderChangeItem)reminderChangeItem;
- (REMReminderHashtagContextChangeItem)initWithReminderChangeItem:(id)a3;
- (id)addHashtagWithType:(int64_t)a3 name:(id)a4;
- (id)addHashtagWithType:(int64_t)a3 name:(id)a4 creationDate:(id)a5;
- (id)nameWithDisallowedCharactersReplaced:(id)a3;
- (void)addHashtag:(id)a3;
- (void)cancelUndeleteHashtagWithID:(id)a3;
- (void)removeAllHashtags;
- (void)removeHashtag:(id)a3;
- (void)setMutableHashtags:(id)a3;
- (void)setReminderChangeItem:(id)a3;
- (void)undeleteHashtagWithID:(id)a3;
@end

@implementation REMReminderHashtagContextChangeItem

- (REMReminderHashtagContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderHashtagContextChangeItem;
  v6 = [(REMReminderHashtagContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);
  }

  return v7;
}

- (NSSet)hashtags
{
  v2 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  v3 = [v2 hashtags];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  v6 = v5;

  return (NSSet *)v6;
}

- (void)addHashtag:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Adding hashtag {reminderChangeItem: %@, hashtag: %@}", (uint8_t *)&v11, 0x16u);
  }
  v7 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  v8 = [v7 hashtags];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  [v9 addObject:v4];
  v10 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  [v10 setHashtags:v9];
}

- (id)addHashtagWithType:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = +[REMHashtag newObjectID];
  v8 = [(REMReminderHashtagContextChangeItem *)self nameWithDisallowedCharactersReplaced:v6];

  id v9 = [REMHashtag alloc];
  v10 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  int v11 = [v10 accountID];
  v12 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  __int16 v13 = [v12 objectID];
  id v14 = [(REMHashtag *)v9 initWithObjectID:v7 accountID:v11 reminderID:v13 type:a3 name:v8];

  [(REMReminderHashtagContextChangeItem *)self addHashtag:v14];

  return v14;
}

- (id)addHashtagWithType:(int64_t)a3 name:(id)a4 creationDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[REMHashtag newObjectID];
  int v11 = [(REMReminderHashtagContextChangeItem *)self nameWithDisallowedCharactersReplaced:v9];

  v12 = [REMHashtag alloc];
  __int16 v13 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  id v14 = [v13 accountID];
  uint64_t v15 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  v16 = [v15 objectID];
  v17 = [(REMHashtag *)v12 initWithObjectID:v10 accountID:v14 reminderID:v16 type:a3 name:v11 creationDate:v8];

  [(REMReminderHashtagContextChangeItem *)self addHashtag:v17];

  return v17;
}

- (id)nameWithDisallowedCharactersReplaced:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 hashtagTokenAllowedCharacters];
  id v6 = [v5 invertedSet];

  id v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  id v8 = [v7 componentsJoinedByString:&stru_1F1339A18];

  return v8;
}

- (void)removeHashtag:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing hashtag {reminderChangeItem: %@, hashtag: %@}", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  id v8 = [v7 hashtags];
  id v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:v4];
  id v10 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  [v10 setHashtags:v9];
}

- (void)removeAllHashtags
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  id v4 = [v3 hashtags];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
      int v10 = 138412290;
      int v11 = v7;
      _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_INFO, "Removing all hashtags {reminderChangeItem: %@}", (uint8_t *)&v10, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F1CAD0] set];
    id v9 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
    [v9 setHashtags:v8];
  }
}

- (void)undeleteHashtagWithID:(id)a3
{
  id v4 = a3;
  id v8 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  uint64_t v5 = [v8 hashtagIDsToUndelete];
  id v6 = [v5 setByAddingObject:v4];

  id v7 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  [v7 setHashtagIDsToUndelete:v6];
}

- (void)cancelUndeleteHashtagWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  id v6 = [v5 hashtagIDsToUndelete];
  id v9 = (id)[v6 mutableCopy];

  [v9 removeObject:v4];
  id v7 = (void *)[v9 copy];
  id v8 = [(REMReminderHashtagContextChangeItem *)self reminderChangeItem];
  [v8 setHashtagIDsToUndelete:v7];
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
}

- (NSMutableSet)mutableHashtags
{
  return self->_mutableHashtags;
}

- (void)setMutableHashtags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableHashtags, 0);

  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

@end