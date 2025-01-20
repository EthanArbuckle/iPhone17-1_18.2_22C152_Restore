@interface TVPAsyncPlayerDelegateOperation
- (BOOL)isEqual:(id)a3;
- (NSNumber)identifier;
- (TVPAsyncPlayerDelegateOperation)init;
- (id)block;
- (unint64_t)hash;
- (void)setBlock:(id)a3;
@end

@implementation TVPAsyncPlayerDelegateOperation

- (TVPAsyncPlayerDelegateOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVPAsyncPlayerDelegateOperation;
  v2 = [(TVPAsyncPlayerDelegateOperation *)&v6 init];
  if (v2)
  {
    ++init_counter;
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:");
    identifier = v2->_identifier;
    v2->_identifier = (NSNumber *)v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    objc_super v6 = [(TVPAsyncPlayerDelegateOperation *)self identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(TVPAsyncPlayerDelegateOperation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end