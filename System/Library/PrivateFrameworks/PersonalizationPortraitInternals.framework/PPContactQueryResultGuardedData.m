@interface PPContactQueryResultGuardedData
- (BOOL)joined;
- (NSArray)cnContacts;
- (NSArray)fiaContacts;
- (NSError)latestError;
- (void)setCnContacts:(id)a3;
- (void)setFiaContacts:(id)a3;
- (void)setJoined:(BOOL)a3;
- (void)setLatestError:(id)a3;
@end

@implementation PPContactQueryResultGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_fiaContacts, 0);
  objc_storeStrong((id *)&self->_cnContacts, 0);
}

- (void)setJoined:(BOOL)a3
{
  self->_joined = a3;
}

- (BOOL)joined
{
  return self->_joined;
}

- (void)setLatestError:(id)a3
{
}

- (NSError)latestError
{
  return self->_latestError;
}

- (void)setFiaContacts:(id)a3
{
}

- (NSArray)fiaContacts
{
  return self->_fiaContacts;
}

- (void)setCnContacts:(id)a3
{
}

- (NSArray)cnContacts
{
  return self->_cnContacts;
}

@end