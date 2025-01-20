@interface ICASFastSyncMessageData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFastSyncMessageData)initWithCountOfMessagesSent:(id)a3 countOfMessagesReceived:(id)a4 avgMessageSizeInBytes:(id)a5 maxMessageSizeInBytes:(id)a6;
- (NSNumber)avgMessageSizeInBytes;
- (NSNumber)countOfMessagesReceived;
- (NSNumber)countOfMessagesSent;
- (NSNumber)maxMessageSizeInBytes;
- (id)toDict;
@end

@implementation ICASFastSyncMessageData

- (ICASFastSyncMessageData)initWithCountOfMessagesSent:(id)a3 countOfMessagesReceived:(id)a4 avgMessageSizeInBytes:(id)a5 maxMessageSizeInBytes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASFastSyncMessageData;
  v15 = [(ICASFastSyncMessageData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_countOfMessagesSent, a3);
    objc_storeStrong((id *)&v16->_countOfMessagesReceived, a4);
    objc_storeStrong((id *)&v16->_avgMessageSizeInBytes, a5);
    objc_storeStrong((id *)&v16->_maxMessageSizeInBytes, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"FastSyncMessageData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"countOfMessagesSent";
  v3 = [(ICASFastSyncMessageData *)self countOfMessagesSent];
  if (v3)
  {
    uint64_t v4 = [(ICASFastSyncMessageData *)self countOfMessagesSent];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"countOfMessagesReceived";
  v6 = [(ICASFastSyncMessageData *)self countOfMessagesReceived];
  if (v6)
  {
    uint64_t v7 = [(ICASFastSyncMessageData *)self countOfMessagesReceived];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"avgMessageSizeInBytes";
  v9 = [(ICASFastSyncMessageData *)self avgMessageSizeInBytes];
  if (v9)
  {
    uint64_t v10 = [(ICASFastSyncMessageData *)self avgMessageSizeInBytes];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"maxMessageSizeInBytes";
  id v12 = [(ICASFastSyncMessageData *)self maxMessageSizeInBytes];
  if (v12)
  {
    uint64_t v13 = [(ICASFastSyncMessageData *)self maxMessageSizeInBytes];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSNumber)countOfMessagesSent
{
  return self->_countOfMessagesSent;
}

- (NSNumber)countOfMessagesReceived
{
  return self->_countOfMessagesReceived;
}

- (NSNumber)avgMessageSizeInBytes
{
  return self->_avgMessageSizeInBytes;
}

- (NSNumber)maxMessageSizeInBytes
{
  return self->_maxMessageSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxMessageSizeInBytes, 0);
  objc_storeStrong((id *)&self->_avgMessageSizeInBytes, 0);
  objc_storeStrong((id *)&self->_countOfMessagesReceived, 0);
  objc_storeStrong((id *)&self->_countOfMessagesSent, 0);
}

@end