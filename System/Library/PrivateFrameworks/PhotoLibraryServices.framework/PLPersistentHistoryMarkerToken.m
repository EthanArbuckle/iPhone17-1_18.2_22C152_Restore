@interface PLPersistentHistoryMarkerToken
- (NSString)description;
- (PLPersistentHistoryMarkerToken)initWithToken:(id)a3;
- (id)overrride_changeRequestForFetching;
- (id)overrride_shortDescription;
@end

@implementation PLPersistentHistoryMarkerToken

- (void).cxx_destruct
{
}

- (id)overrride_shortDescription
{
  return (id)[NSString stringWithFormat:@".Token(%@)", self->_token];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PLPersistentHistoryMarkerToken(%@)", self->_token];
}

- (id)overrride_changeRequestForFetching
{
  return (id)[MEMORY[0x1E4F1C160] fetchHistoryAfterToken:self->_token];
}

- (PLPersistentHistoryMarkerToken)initWithToken:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistentHistoryMarkerToken;
  v5 = [(PLPersistentHistoryMarkerToken *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    token = v5->_token;
    v5->_token = (NSPersistentHistoryToken *)v6;

    v8 = v5;
  }

  return v5;
}

@end