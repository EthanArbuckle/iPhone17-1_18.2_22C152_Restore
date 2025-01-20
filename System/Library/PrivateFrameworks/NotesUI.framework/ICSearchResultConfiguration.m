@interface ICSearchResultConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isTopHit;
- (ICSearchResultConfiguration)initWithSearchString:(id)a3 searchSuggestionType:(unint64_t)a4 isTopHit:(BOOL)a5 foundAttachmentObjectID:(id)a6 sortableSearchableItem:(id)a7;
- (ICSortableSearchableItem)sortableSearchableItem;
- (NSManagedObjectID)foundAttachmentObjectID;
- (NSString)searchString;
- (unint64_t)hash;
- (unint64_t)searchStringLength;
- (unint64_t)searchSuggestionType;
@end

@implementation ICSearchResultConfiguration

- (ICSearchResultConfiguration)initWithSearchString:(id)a3 searchSuggestionType:(unint64_t)a4 isTopHit:(BOOL)a5 foundAttachmentObjectID:(id)a6 sortableSearchableItem:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ICSearchResultConfiguration;
  v16 = [(ICSearchResultConfiguration *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_searchString, a3);
    v17->_searchStringLength = [v13 length];
    v17->_searchSuggestionType = a4;
    v17->_isTopHit = a5;
    objc_storeStrong((id *)&v17->_foundAttachmentObjectID, a6);
    objc_storeStrong((id *)&v17->_sortableSearchableItem, a7);
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    v4 = [(ICSearchResultConfiguration *)self searchString];
    uint64_t v5 = [v4 hash];
    char v6 = [(ICSearchResultConfiguration *)self searchSuggestionType];
    [(ICSearchResultConfiguration *)self isTopHit];
    v7 = [(ICSearchResultConfiguration *)self foundAttachmentObjectID];
    [v7 hash];
    v8 = [(ICSearchResultConfiguration *)self sortableSearchableItem];
    [v8 hash];
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v6);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)ICSearchResultConfiguration;
  id v4 = a3;
  unsigned int v5 = [(ICSearchResultConfiguration *)&v24 isEqual:v4];
  objc_opt_class();
  char v6 = ICDynamicCast();

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_8;
  }
  v8 = [(ICSearchResultConfiguration *)self searchString];
  uint64_t v9 = [v6 searchString];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_8;
  }
  unint64_t v11 = [(ICSearchResultConfiguration *)self searchSuggestionType];
  if (v11 != [v6 searchSuggestionType]) {
    goto LABEL_8;
  }
  int v12 = [(ICSearchResultConfiguration *)self isTopHit];
  if (v12 != [v6 isTopHit]) {
    goto LABEL_8;
  }
  uint64_t v15 = [(ICSearchResultConfiguration *)self foundAttachmentObjectID];
  v16 = [v6 foundAttachmentObjectID];
  v17 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v15) {
    v18 = 0;
  }
  else {
    v18 = v15;
  }
  unint64_t v19 = v18;
  if (v17 == v16) {
    v20 = 0;
  }
  else {
    v20 = v16;
  }
  unint64_t v21 = v20;
  if (!(v19 | v21))
  {

    goto LABEL_22;
  }
  v22 = (void *)v21;
  if (!v19 || !v21)
  {

    char v13 = 0;
    goto LABEL_24;
  }
  char v23 = [(id)v19 isEqual:v21];

  if (v23)
  {
LABEL_22:
    uint64_t v15 = [(ICSearchResultConfiguration *)self sortableSearchableItem];
    v16 = [v6 sortableSearchableItem];
    char v13 = [v15 isEqual:v16];
LABEL_24:

    goto LABEL_9;
  }
LABEL_8:
  char v13 = 0;
LABEL_9:

  return v13;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)searchStringLength
{
  return self->_searchStringLength;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (NSManagedObjectID)foundAttachmentObjectID
{
  return self->_foundAttachmentObjectID;
}

- (ICSortableSearchableItem)sortableSearchableItem
{
  return self->_sortableSearchableItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortableSearchableItem, 0);
  objc_storeStrong((id *)&self->_foundAttachmentObjectID, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end