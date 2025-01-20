@interface SHSheetActivityPerformerResult
- (NSArray)returnedItems;
- (NSError)error;
- (SHSheetActivityPerformerResult)initWithActivity:(id)a3 completedState:(int64_t)a4 returnedItems:(id)a5 error:(id)a6;
- (UIActivity)activity;
- (id)description;
- (int64_t)completedState;
- (void)setCompletedState:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setReturnedItems:(id)a3;
@end

@implementation SHSheetActivityPerformerResult

- (SHSheetActivityPerformerResult)initWithActivity:(id)a3 completedState:(int64_t)a4 returnedItems:(id)a5 error:(id)a6
{
  NSArray *returnedItems;
  objc_super v19;

  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SHSheetActivityPerformerResult;
  v14 = [(SHSheetActivityPerformerResult *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activity, a3);
    v15->_completedState = a4;
    uint64_t v16 = [v12 copy];
    returnedItems = v15->_returnedItems;
    v15->_returnedItems = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_error, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SHSheetActivityPerformerResult;
  v4 = [(SHSheetActivityPerformerResult *)&v12 description];
  v5 = [(SHSheetActivityPerformerResult *)self activity];
  unint64_t v6 = [(SHSheetActivityPerformerResult *)self completedState];
  if (v6 > 5) {
    v7 = 0;
  }
  else {
    v7 = off_1E5A23108[v6];
  }
  v8 = [(SHSheetActivityPerformerResult *)self returnedItems];
  v9 = [(SHSheetActivityPerformerResult *)self error];
  v10 = [v3 stringWithFormat:@"<%@ activity:%@ completedState:%@ returnedItems:%@ error:%@>", v4, v5, v7, v8, v9];

  return v10;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (int64_t)completedState
{
  return self->_completedState;
}

- (void)setCompletedState:(int64_t)a3
{
  self->_completedState = a3;
}

- (NSArray)returnedItems
{
  return self->_returnedItems;
}

- (void)setReturnedItems:(id)a3
{
  objc_storeStrong((id *)&self->_returnedItems, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_returnedItems, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end