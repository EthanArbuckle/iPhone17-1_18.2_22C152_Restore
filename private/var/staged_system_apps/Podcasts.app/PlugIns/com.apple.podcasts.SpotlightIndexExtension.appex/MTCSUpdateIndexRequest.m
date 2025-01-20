@interface MTCSUpdateIndexRequest
- (CSSearchableIndex)searchableIndex;
- (MTCSUpdateIndexRequest)initWithReason:(id)a3 entityLoadingBlock:(id)a4 searchableIndex:(id)a5 completion:(id)a6;
- (NSString)reason;
- (id)completion;
- (id)description;
- (id)entityLoadingBlock;
@end

@implementation MTCSUpdateIndexRequest

- (MTCSUpdateIndexRequest)initWithReason:(id)a3 entityLoadingBlock:(id)a4 searchableIndex:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MTCSUpdateIndexRequest;
  v15 = [(MTCSUpdateIndexRequest *)&v24 init];
  if (v15)
  {
    v16 = +[NSUUID UUID];
    uint64_t v17 = [v16 UUIDString];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v17;

    objc_storeStrong((id *)&v15->_reason, a3);
    id v19 = objc_retainBlock(v12);
    id entityLoadingBlock = v15->_entityLoadingBlock;
    v15->_id entityLoadingBlock = v19;

    objc_storeStrong((id *)&v15->_searchableIndex, a5);
    id v21 = objc_retainBlock(v14);
    id completion = v15->_completion;
    v15->_id completion = v21;
  }
  return v15;
}

- (id)description
{
  v3 = [(MTCSUpdateIndexRequest *)self reason];
  v4 = +[NSString stringWithFormat:@"'%@', id = %@", v3, self->_identifier];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (id)entityLoadingBlock
{
  return self->_entityLoadingBlock;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_entityLoadingBlock, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end