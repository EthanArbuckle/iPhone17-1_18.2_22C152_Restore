@interface MFOutgoingMessage
- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (id)messageBody;
- (id)messageBodyIfAvailable;
- (id)messageData;
- (id)messageDataHolder;
- (id)messageStore;
- (id)mutableHeaders;
- (unint64_t)messageSize;
- (void)dealloc;
- (void)setMessageBody:(id)a3;
- (void)setMutableHeaders:(id)a3;
@end

@implementation MFOutgoingMessage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingMessage;
  [(MFMailMessage *)&v3 dealloc];
}

- (void)setMessageBody:(id)a3
{
  messageBody = self->_messageBody;
  if (messageBody != a3)
  {

    self->_messageBody = (MFMessageBody *)a3;
  }
}

- (id)messageStore
{
  return 0;
}

- (id)messageBody
{
  return self->_messageBody;
}

- (id)messageBodyIfAvailable
{
  return self->_messageBody;
}

- (id)messageData
{
  uint64_t v3 = objc_msgSend(-[MFOutgoingMessage headers](self, "headers"), "encodedHeaders");
  if (!v3) {
    return 0;
  }
  v4 = (void *)v3;
  id v5 = [(MFMessageBody *)self->_messageBody rawData];
  v6 = objc_msgSend(MEMORY[0x1E4F73540], "dataWithCapacity:", objc_msgSend(v5, "length") + objc_msgSend(v4, "length"));
  [v6 appendData:v4];
  if (v5) {
    [v6 appendData:v5];
  }
  return v6;
}

- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  if (a5) {
    *a5 = 1;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v9 = objc_msgSend(-[MFOutgoingMessage headers](self, "headers"), "encodedHeaders");
  if (v9)
  {
    id v10 = [(MFMessageBody *)self->_messageBody rawData];
    uint64_t v11 = [v9 length];
    unint64_t v12 = [v10 length] + v11;
    if (a4) {
      *a4 = v12;
    }
    if (a3)
    {
      v13 = (void *)[MEMORY[0x1E4F73540] dataWithCapacity:v12];
      [v13 appendData:v9];
      if (v10) {
        [v13 appendData:v10];
      }
      objc_msgSend(v13, "mf_makeImmutable");
      *a3 = v13;
    }
  }
  return v9 != 0;
}

- (id)messageDataHolder
{
  uint64_t v3 = objc_msgSend(-[MFOutgoingMessage headers](self, "headers"), "encodedHeaders");
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = [(MFMessageBody *)self->_messageBody rawData];
  v6 = (void *)[MEMORY[0x1E4F734C8] dataHolderWithData:v4];
  v7 = v6;
  if (v5) {
    [v6 addData:v5];
  }
  return v7;
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  if (a5) {
    *a5 = 1;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v9 = objc_msgSend(-[MFOutgoingMessage headers](self, "headers"), "encodedHeaders");
  if (v9)
  {
    id v10 = [(MFMessageBody *)self->_messageBody rawData];
    uint64_t v11 = [v9 length];
    uint64_t v12 = [v10 length];
    if (a4) {
      *a4 = v12 + v11;
    }
    if (a3)
    {
      v13 = (void *)[MEMORY[0x1E4F734C8] dataHolderWithData:v9];
      v14 = v13;
      if (v10) {
        [v13 addData:v10];
      }
      *a3 = v14;
    }
  }
  return v9 != 0;
}

- (id)mutableHeaders
{
  id result = self->_messageHeaders;
  if (!result)
  {
    id result = objc_alloc_init(MEMORY[0x1E4F73550]);
    self->_messageHeaders = (MFMutableMessageHeaders *)result;
  }
  return result;
}

- (void)setMutableHeaders:(id)a3
{
  self->_messageHeaders = (MFMutableMessageHeaders *)a3;
}

- (unint64_t)messageSize
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(-[MFOutgoingMessage headers](self, "headers"), "encodedHeaders"), "length");
  return objc_msgSend(-[MFMessageBody rawData](self->_messageBody, "rawData"), "length") + v3;
}

@end