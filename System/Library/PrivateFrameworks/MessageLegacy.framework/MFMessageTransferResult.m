@interface MFMessageTransferResult
- (MFMessageTransferResult)initWithResultCode:(unint64_t)a3 failedMessages:(id)a4 transferedMessage:(id)a5;
- (NSArray)failedMessages;
- (NSArray)transferedMessages;
- (id)debugDescription;
- (unint64_t)resultCode;
- (void)dealloc;
@end

@implementation MFMessageTransferResult

- (MFMessageTransferResult)initWithResultCode:(unint64_t)a3 failedMessages:(id)a4 transferedMessage:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MFMessageTransferResult;
  v8 = [(MFMessageTransferResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_resultCode = a3;
    v8->_failedMessages = (NSArray *)[a4 copy];
    v9->_transferedMessages = (NSArray *)[a5 copy];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageTransferResult;
  [(MFMessageTransferResult *)&v3 dealloc];
}

- (id)debugDescription
{
  unint64_t v3 = [(MFMessageTransferResult *)self resultCode];
  if (v3 > 2) {
    v4 = 0;
  }
  else {
    v4 = off_1E6866A00[v3];
  }
  return (id)[NSString stringWithFormat:@"<%@:%p (\n\tresult:%@\n\ttransfered:%@\n\tfailed:%@)>", objc_opt_class(), self, v4, -[MFMessageTransferResult transferedMessages](self, "transferedMessages"), -[MFMessageTransferResult failedMessages](self, "failedMessages")];
}

- (unint64_t)resultCode
{
  return self->_resultCode;
}

- (NSArray)failedMessages
{
  return self->_failedMessages;
}

- (NSArray)transferedMessages
{
  return self->_transferedMessages;
}

@end