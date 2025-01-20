@interface DirectUploadProgress
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesSent;
- (int64_t)uploadDatabaseIdentifier;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setUploadDatabaseIdentifier:(int64_t)a3;
@end

@implementation DirectUploadProgress

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setCountOfBytesExpectedToSend:self->_countOfBytesExpectedToSend];
  [v4 setCountOfBytesSent:self->_countOfBytesSent];
  [v4 setUploadDatabaseIdentifier:self->_uploadDatabaseIdentifier];
  return v4;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (int64_t)uploadDatabaseIdentifier
{
  return self->_uploadDatabaseIdentifier;
}

- (void)setUploadDatabaseIdentifier:(int64_t)a3
{
  self->_uploadDatabaseIdentifier = a3;
}

@end