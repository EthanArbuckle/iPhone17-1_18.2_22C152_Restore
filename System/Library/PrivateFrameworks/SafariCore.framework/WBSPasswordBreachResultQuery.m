@interface WBSPasswordBreachResultQuery
+ (id)dictionaryRepresentationsForResultQueries:(id)a3;
+ (id)resultQueriesFromDictionaryRepresentations:(id)a3;
- (NSData)persistentIdentifier;
- (NSDate)dateLastModified;
- (NSDictionary)dictionaryRepresentation;
- (WBSPasswordBreachResultQuery)initWithDictionaryRepresentation:(id)a3;
- (WBSPasswordBreachResultQuery)initWithPersistentIdentifier:(id)a3 dateLastModified:(id)a4;
- (id)description;
@end

@implementation WBSPasswordBreachResultQuery

- (WBSPasswordBreachResultQuery)initWithPersistentIdentifier:(id)a3 dateLastModified:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordBreachResultQuery;
  v9 = [(WBSPasswordBreachResultQuery *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentIdentifier, a3);
    objc_storeStrong((id *)&v10->_dateLastModified, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSPasswordBreachResultQuery)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_dataForKey:", @"PersistentIdentifier");
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_dateForKey:", @"DateLastModified");
    if (v6)
    {
      self = [(WBSPasswordBreachResultQuery *)self initWithPersistentIdentifier:v5 dateLastModified:v6];
      id v7 = self;
    }
    else
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachResultQuery initWithDictionaryRepresentation:](v9);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachResultQuery initWithDictionaryRepresentation:](v8);
    }
    id v7 = 0;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"PersistentIdentifier";
  v5[1] = @"DateLastModified";
  dateLastModified = self->_dateLastModified;
  v6[0] = self->_persistentIdentifier;
  v6[1] = dateLastModified;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return (NSDictionary *)v3;
}

+ (id)resultQueriesFromDictionaryRepresentations:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_38);
}

WBSPasswordBreachResultQuery *__75__WBSPasswordBreachResultQuery_resultQueriesFromDictionaryRepresentations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WBSPasswordBreachResultQuery alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

+ (id)dictionaryRepresentationsForResultQueries:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_8);
}

uint64_t __74__WBSPasswordBreachResultQuery_dictionaryRepresentationsForResultQueries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; persistentIdentifier = %@; dateLastModified = %@>",
               objc_opt_class(),
               self,
               self->_persistentIdentifier,
               self->_dateLastModified);
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Missing persistent identifier from result query.", v1, 2u);
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Missing date last modified from result query.", v1, 2u);
}

@end