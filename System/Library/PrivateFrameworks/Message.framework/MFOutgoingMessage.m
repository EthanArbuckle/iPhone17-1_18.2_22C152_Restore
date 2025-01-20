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
- (void)setMessageBody:(id)a3;
- (void)setMutableHeaders:(id)a3;
@end

@implementation MFOutgoingMessage

- (void)setMessageBody:(id)a3
{
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
  v3 = [(MFOutgoingMessage *)self headers];
  v4 = [v3 encodedHeaders];

  if (v4)
  {
    v5 = [(MFMessageBody *)self->_messageBody rawData];
    v6 = objc_msgSend(MEMORY[0x1E4F73540], "dataWithCapacity:", objc_msgSend(v5, "length") + objc_msgSend(v4, "length"));
    [v6 appendData:v4];
    if (v5) {
      [v6 appendData:v5];
    }
  }
  else
  {
    v6 = 0;
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
  v9 = [(MFOutgoingMessage *)self headers];
  v10 = [v9 encodedHeaders];

  if (v10)
  {
    v11 = [(MFMessageBody *)self->_messageBody rawData];
    uint64_t v12 = [v10 length];
    unint64_t v13 = [v11 length] + v12;
    if (a4) {
      *a4 = v13;
    }
    if (a3)
    {
      v14 = [MEMORY[0x1E4F73540] dataWithCapacity:v13];
      [v14 appendData:v10];
      if (v11) {
        [v14 appendData:v11];
      }
      objc_msgSend(v14, "mf_makeImmutable");
      id v15 = v14;
      *a3 = v15;
    }
  }

  return v10 != 0;
}

- (id)messageDataHolder
{
  v3 = [(MFOutgoingMessage *)self headers];
  v4 = [v3 encodedHeaders];

  if (v4)
  {
    v5 = [(MFMessageBody *)self->_messageBody rawData];
    v6 = [MEMORY[0x1E4F734C8] dataHolderWithData:v4];
    v7 = v6;
    if (v5) {
      [v6 addData:v5];
    }
  }
  else
  {
    v7 = 0;
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
  v9 = [(MFOutgoingMessage *)self headers];
  v10 = [v9 encodedHeaders];

  if (v10)
  {
    v11 = [(MFMessageBody *)self->_messageBody rawData];
    uint64_t v12 = [v10 length];
    uint64_t v13 = [v11 length];
    if (a4) {
      *a4 = v13 + v12;
    }
    if (a3)
    {
      v14 = [MEMORY[0x1E4F734C8] dataHolderWithData:v10];
      id v15 = v14;
      if (v11) {
        [v14 addData:v11];
      }
      id v16 = v15;
      *a3 = v16;
    }
  }

  return v10 != 0;
}

- (id)mutableHeaders
{
  messageHeaders = self->_messageHeaders;
  if (!messageHeaders)
  {
    v4 = (MFMutableMessageHeaders *)objc_alloc_init(MEMORY[0x1E4F73550]);
    v5 = self->_messageHeaders;
    self->_messageHeaders = v4;

    messageHeaders = self->_messageHeaders;
  }
  return messageHeaders;
}

- (void)setMutableHeaders:(id)a3
{
}

- (unint64_t)messageSize
{
  v3 = [(MFOutgoingMessage *)self headers];
  v4 = [v3 encodedHeaders];
  uint64_t v5 = [v4 length];
  v6 = [(MFMessageBody *)self->_messageBody rawData];
  unint64_t v7 = [v6 length] + v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHeaders, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
}

@end