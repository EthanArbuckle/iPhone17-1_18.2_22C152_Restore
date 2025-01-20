@interface MFMessagesMissingBodyData
- (NSArray)messagesMissingBodyData;
- (NSIndexSet)fragmentedMessages;
- (NSIndexSet)messagesNotMissingBodyData;
- (int64_t)messagesScannedInFilesystemCount;
- (void)initWithMessagesMissingBodyData:(void *)a3 messagesNotMissingBodyData:(void *)a4 fragmentedMessages:(uint64_t)a5 messagesScannedInFilesystemCount:;
@end

@implementation MFMessagesMissingBodyData

- (void)initWithMessagesMissingBodyData:(void *)a3 messagesNotMissingBodyData:(void *)a4 fragmentedMessages:(uint64_t)a5 messagesScannedInFilesystemCount:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)MFMessagesMissingBodyData;
    id v12 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v12;
    if (v12)
    {
      uint64_t v13 = [v9 copy];
      v14 = (void *)v13;
      if (v13) {
        v15 = (void *)v13;
      }
      else {
        v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)v12 + 1, v15);

      v16 = (void *)[v10 copy];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [MEMORY[0x1E4F28D60] indexSet];
      }
      v19 = (void *)a1[2];
      a1[2] = v18;

      v20 = (void *)[v11 copy];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = [MEMORY[0x1E4F28D60] indexSet];
      }
      v23 = (void *)a1[3];
      a1[3] = v22;

      a1[4] = a5;
    }
  }

  return a1;
}

- (NSArray)messagesMissingBodyData
{
  return self->_messagesMissingBodyData;
}

- (NSIndexSet)messagesNotMissingBodyData
{
  return self->_messagesNotMissingBodyData;
}

- (NSIndexSet)fragmentedMessages
{
  return self->_fragmentedMessages;
}

- (int64_t)messagesScannedInFilesystemCount
{
  return self->_messagesScannedInFilesystemCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentedMessages, 0);
  objc_storeStrong((id *)&self->_messagesNotMissingBodyData, 0);
  objc_storeStrong((id *)&self->_messagesMissingBodyData, 0);
}

@end