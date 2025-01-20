@interface _MFDAMessageHeaderFetchConsumer
- (BOOL)succeeded;
- (BOOL)wantsData;
- (MFDAMessageStore)store;
- (MFError)error;
- (NSData)data;
- (void)handleResponse:(id)a3 error:(id)a4;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation _MFDAMessageHeaderFetchConsumer

- (BOOL)wantsData
{
  return 1;
}

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_storeStrong((id *)&self->_error, a4);
    self->_succeeded = 0;
  }
  else
  {
    v7 = [v12 changedItem];
    v8 = [[MFDAMessage alloc] initWithDAMailMessage:v7 mailbox:0];
    [(MFDAMessage *)v8 setMessageStore:self->_store];
    v9 = [(MFDAMessage *)v8 headers];
    v10 = [v9 data];
    data = self->_data;
    self->_data = v10;

    self->_succeeded = 1;
  }
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSData)data
{
  return self->_data;
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (MFDAMessageStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end