@interface SearchResults
- (NSMutableArray)attachmentResults;
- (NSMutableArray)noteResults;
- (NSMutableArray)suggestions;
- (NSMutableArray)topHitResults;
- (SearchResults)init;
- (void)addResult:(id)a3;
- (void)setAttachmentResults:(id)a3;
- (void)setNoteResults:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setTopHitResults:(id)a3;
@end

@implementation SearchResults

- (SearchResults)init
{
  v12.receiver = self;
  v12.super_class = (Class)SearchResults;
  v2 = [(SearchResults *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    topHitResults = v2->_topHitResults;
    v2->_topHitResults = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    suggestions = v2->_suggestions;
    v2->_suggestions = (NSMutableArray *)v5;

    uint64_t v7 = +[NSMutableArray array];
    noteResults = v2->_noteResults;
    v2->_noteResults = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    attachmentResults = v2->_attachmentResults;
    v2->_attachmentResults = (NSMutableArray *)v9;
  }
  return v2;
}

- (void)addResult:(id)a3
{
  id v13 = a3;
  v4 = [v13 object];
  uint64_t v5 = [v4 objectID];
  unsigned int v6 = [v5 ic_isNoteType];

  if (v6)
  {
    uint64_t v7 = [v13 configuration];
    unsigned int v8 = [v7 isTopHit];

    if (v8) {
      [(SearchResults *)self topHitResults];
    }
    else {
    uint64_t v9 = [(SearchResults *)self noteResults];
    }
  }
  else
  {
    v10 = [v13 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v9 = [(SearchResults *)self attachmentResults];
  }
  objc_super v12 = v9;
  [v9 addObject:v13];

LABEL_9:
}

- (NSMutableArray)topHitResults
{
  return self->_topHitResults;
}

- (void)setTopHitResults:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSMutableArray)noteResults
{
  return self->_noteResults;
}

- (void)setNoteResults:(id)a3
{
}

- (NSMutableArray)attachmentResults
{
  return self->_attachmentResults;
}

- (void)setAttachmentResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentResults, 0);
  objc_storeStrong((id *)&self->_noteResults, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);

  objc_storeStrong((id *)&self->_topHitResults, 0);
}

@end