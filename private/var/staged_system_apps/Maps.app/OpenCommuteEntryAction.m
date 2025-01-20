@interface OpenCommuteEntryAction
- (NSString)entryID;
- (OpenCommuteEntryAction)initWithEntry:(id)a3;
- (void)setEntryID:(id)a3;
@end

@implementation OpenCommuteEntryAction

- (OpenCommuteEntryAction)initWithEntry:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OpenCommuteEntryAction;
  v5 = [(OpenCommuteEntryAction *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    entryID = v5->_entryID;
    v5->_entryID = v6;
  }
  return v5;
}

- (NSString)entryID
{
  return self->_entryID;
}

- (void)setEntryID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end