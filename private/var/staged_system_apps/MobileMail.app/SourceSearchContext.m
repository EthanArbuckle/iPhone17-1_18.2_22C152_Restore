@interface SourceSearchContext
- (BOOL)isEqual:(id)a3;
- (BOOL)useLocalIndex;
- (EDRemoteSearchDelegate)delegate;
- (EMQuery)query;
- (MFMessageCriterion)criterion;
- (NSArray)referencedMailboxes;
- (NSDate)offset;
- (SourceSearchContext)initWithQuery:(id)a3 criterion:(id)a4 delegate:(id)a5 offset:(id)a6 useLocalIndex:(BOOL)a7 sessionID:(unint64_t)a8;
- (SourceSearchContext)initWithQuery:(id)a3 criterion:(id)a4 delegate:(id)a5 useLocalIndex:(BOOL)a6 sessionID:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)referencedConversations;
- (unint64_t)hash;
- (unint64_t)sessionID;
- (void)setCriterion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOffset:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation SourceSearchContext

- (SourceSearchContext)initWithQuery:(id)a3 criterion:(id)a4 delegate:(id)a5 useLocalIndex:(BOOL)a6 sessionID:(unint64_t)a7
{
  return [(SourceSearchContext *)self initWithQuery:a3 criterion:a4 delegate:a5 offset:0 useLocalIndex:a6 sessionID:a7];
}

- (SourceSearchContext)initWithQuery:(id)a3 criterion:(id)a4 delegate:(id)a5 offset:(id)a6 useLocalIndex:(BOOL)a7 sessionID:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SourceSearchContext;
  v19 = [(SourceSearchContext *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_query, a3);
    objc_storeStrong((id *)&v20->_criterion, a4);
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_offset, a6);
    v20->_useLocalIndex = a7;
    v20->_sessionID = a8;
  }

  return v20;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p> useLocalIndex:%{BOOL}d criterion=%@", objc_opt_class(), self, [(SourceSearchContext *)self useLocalIndex], self->_criterion];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(SourceSearchContext *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    v4 = [SourceSearchContext alloc];
    criterion = self->_criterion;
    query = self->_query;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = [(SourceSearchContext *)v4 initWithQuery:query criterion:criterion delegate:WeakRetained offset:self->_offset useLocalIndex:self->_useLocalIndex sessionID:self->_sessionID];

    return v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SourceSearchContext *)a3;
  if (v4 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = [(SourceSearchContext *)v5 criterion];
  if (![v6 isEqual:self->_criterion])
  {
LABEL_8:

    goto LABEL_9;
  }
  v7 = [(SourceSearchContext *)v5 delegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![v7 isEqual:WeakRetained])
  {

    goto LABEL_8;
  }
  v9 = [(SourceSearchContext *)v5 query];
  unsigned __int8 v10 = [v9 isEqual:self->_query];

  if ((v10 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)[(EMQuery *)self->_query hash];
}

- (NSArray)referencedMailboxes
{
  v2 = [(SourceSearchContext *)self criterion];
  v3 = [v2 referencedMailboxes];

  return (NSArray *)v3;
}

- (id)referencedConversations
{
  v2 = [(SourceSearchContext *)self criterion];
  v3 = [v2 referencedConversations];

  return v3;
}

- (MFMessageCriterion)criterion
{
  return self->_criterion;
}

- (void)setCriterion:(id)a3
{
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (EDRemoteSearchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDRemoteSearchDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (BOOL)useLocalIndex
{
  return self->_useLocalIndex;
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_criterion, 0);
}

@end