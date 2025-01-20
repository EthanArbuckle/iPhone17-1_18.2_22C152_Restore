@interface MFDAStoreDraftConsumer
- (BOOL)success;
- (MFError)error;
- (NSString)serverId;
- (void)handleResponse:(id)a3 error:(id)a4;
@end

@implementation MFDAStoreDraftConsumer

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    objc_storeStrong((id *)&self->_error, a4);
  }
  id v9 = v7;
  id v17 = v9;
  if (v9)
  {
    if (self->_error)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"MFDAStoreDraftConsumer.m" lineNumber:29 description:@"should not have error and response"];

      id v9 = v17;
    }
    if ([v9 status] != 2)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFDAStoreDraftConsumer.m", 32, @"got non-successful status code %ld for response", objc_msgSend(v17, "status"));
    }
    v10 = [v17 serverId];

    if (!v10)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"MFDAStoreDraftConsumer.m" lineNumber:33 description:@"got a successful response with no server id"];
    }
    v11 = [v17 serverId];
    v12 = (NSString *)[v11 copy];
    serverId = self->_serverId;
    self->_serverId = v12;

    self->_success = 1;
    id v9 = v17;
  }
}

- (NSString)serverId
{
  return self->_serverId;
}

- (MFError)error
{
  return self->_error;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serverId, 0);
}

@end