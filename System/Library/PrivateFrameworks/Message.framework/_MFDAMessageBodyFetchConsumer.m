@interface _MFDAMessageBodyFetchConsumer
- (BOOL)hasLocalCopyOfData;
- (BOOL)succeeded;
- (BOOL)wantsData;
- (MFDAStreamingContentConsumer)streamConsumer;
- (MFError)error;
- (NSData)data;
- (void)handleResponse:(id)a3 error:(id)a4;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setHasLocalCopyOfData:(BOOL)a3;
- (void)setStreamConsumer:(id)a3;
@end

@implementation _MFDAMessageBodyFetchConsumer

- (BOOL)wantsData
{
  return 1;
}

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)&self->_error, a4);
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }
  self->_succeeded = v9;
  id v10 = v7;
  if (v10)
  {
    if (self->_error)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:1940 description:@"should not have error and response"];
    }
    if ([v10 streaming])
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"MFDAMessageStore.m" lineNumber:1942 description:@"should not get streaming responses"];
    }
    v12 = [v10 data];
    [(_MFDAMessageBodyFetchConsumer *)self setData:v12];
  }
  [(_MFDAMessageBodyFetchConsumer *)self setHasLocalCopyOfData:v10 != 0];
}

- (BOOL)succeeded
{
  if (self->_succeeded) {
    return 1;
  }
  v3 = [(_MFDAMessageBodyFetchConsumer *)self streamConsumer];
  char v2 = [v3 succeeded];

  return v2;
}

- (NSData)data
{
  v3 = [(_MFDAMessageBodyFetchConsumer *)self streamConsumer];
  v4 = [v3 data];

  if (!v4) {
    v4 = self->_data;
  }
  return v4;
}

- (MFDAStreamingContentConsumer)streamConsumer
{
  return self->_streamConsumer;
}

- (void)setStreamConsumer:(id)a3
{
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

- (BOOL)hasLocalCopyOfData
{
  return self->_hasLocalCopyOfData;
}

- (void)setHasLocalCopyOfData:(BOOL)a3
{
  self->_hasLocalCopyOfData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_streamConsumer, 0);
}

@end